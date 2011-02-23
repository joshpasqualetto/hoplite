class BackupLog < ActiveRecord::Base
  validates_presence_of :message
  has_one :device
  has_one :login_profile
  has_one :backup_profile
end
