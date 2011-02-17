class Device < ActiveRecord::Base
  validates_uniqueness_of :name
  has_one :login_profile
  has_one :backup_profile
end
