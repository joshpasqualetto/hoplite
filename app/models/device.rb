class Device < ActiveRecord::Base 
  include BackupMethod
  validates_uniqueness_of :name
  has_many :backup_logs
  has_one :login_profile
  has_one :backup_profile

  def backup
    init_backup("telnet", self)
  end

end
