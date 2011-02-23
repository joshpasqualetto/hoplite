module BackupMethod
  def init_backup(type, device)
    self.send(type, device)
  end
  
private

  def telnet(device)
    begin
      destination_file = device.name.gsub(/[^0-9A-Za-z]/, '') + "-" + ((BackupLog.last.id + 1).to_s rescue "1")
      login_script = device.login_profile.sanitized_script
      backup_script = device.backup_profile.sanitized_script.gsub("$DST_FILE", destination_file)
      node_messages = []
      #TODO: Handle destination file gsub for backup script
      node = Net::Telnet::new("Host" => device.hostname, "Prompt" => /[#>:]/n)  { |resp| node_messages << resp }
      login_script.each_line do |row|
        node.cmd(row.strip) {|resp| node_messages << resp}
      end
      backup_script.each_line do |row|
        node.cmd(row.strip) {|resp| node_messages << resp}
      end
      #TODO: Implement a way so that people can demark where the return of a show running configuration is about to be displayed so the output can be used as the config
      #      this would be great for non-tftp switchs, or machines where someone has adapted for a serial connection or something along those lines
      #TODO: CHECK IF FILE EXISTS HERE
      log = BackupLog.new
      log.device_id = device.id
      log.login_profile_id = device.login_profile.id
      log.backup_profile_id = device.backup_profile.id
      
      if File::exists?("public/tftp/#{destination_file.strip}")
        node_messages << "-- Backup Success"
      else
        node_messages << "-- Backup Failure"
        #TODO: Alert on failure
        log.failed = true
      end
      log.message = node_messages.join("-------")
      log.save!
      node_messages
    rescue Exception => exc
      puts "Failed with #{exc} --- Messages from host #{node_messages}"
      #TODO: Get this log into the backup log
    end
  end

  def tftp
    "tftp"
  end
end
