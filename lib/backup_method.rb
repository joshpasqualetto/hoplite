module BackupMethod
  def init_backup(type, device)
    self.send(type, device)
  end
private

  def telnet(device)
    login_script = device.login_profile.sanitized_script
    backup_script = device.backup_profile.sanitized_script
    node_messages = []
    node = Net::Telnet::new("Host" => device.hostname)  { |resp| node_messages << resp }
    login_script.each_line do |row|
      node.cmd(row.strip)
    end
    backup_script.each_line do |row|
      node.cmd(row.strip)
    end
    #CHECK IF FILE EXISTS HERE
    node_messages
  end

  def tftp
    "tftp"
  end
end
