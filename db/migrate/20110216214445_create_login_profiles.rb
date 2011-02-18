class CreateLoginProfiles < ActiveRecord::Migration
  def self.up
    create_table :login_profiles do |t|
      t.string :name, :auth_type, :username, :encrypted_password, :key_path
      t.text  :description, :script
      t.timestamps
    end
  end

  def self.down
    drop_table :login_profiles
  end
end
