class Device < ActiveRecord::Base 
  include BackupMethod
  validates_uniqueness_of :name
  has_many :backup_logs
  belongs_to :login_profile
  belongs_to :backup_profile

  def backup
    init_backup("telnet", self)
  end

end
