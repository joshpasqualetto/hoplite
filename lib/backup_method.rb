module BackupMethod
  def init_backup(type, device)
    self.send(type, device)
  end
private

  def telnet(device)
    begin
      login_script = device.login_profile.sanitized_script
      backup_script = device.backup_profile.sanitized_script
      node_messages = []
      node = Net::Telnet::new("Host" => device.hostname, "Prompt" => /[#>:]/n)  { |resp| node_messages << resp }
      login_script.each_line do |row|
        sleep(5)
        node_messages << node.cmd(row.strip) 
      end
      backup_script.each_line do |row|
        node_messages << node.cmd(row.strip)
      end
      #CHECK IF FILE EXISTS HERE
      node_messages
    rescue Exception => exc
      puts "Failed with #{exc} --- Messages from host #{node_messages}"
    end
  end

  def tftp
    "tftp"
  end
end
