class BackupProfile < ActiveRecord::Base
  validates_uniqueness_of :name

  def sanitized_script
    sanitized_script = script
    Setting.all.each do |var|
      sanitized_script.gsub!("$#{var.name}", var.value)
    end
    sanitized_script
  end
end
