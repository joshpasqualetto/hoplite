class BackupProfile < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :devices
end
