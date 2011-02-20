class LoginProfile < ActiveRecord::Base
  validates_uniqueness_of :name
  
  def sanitized_script
    script
  end
end
