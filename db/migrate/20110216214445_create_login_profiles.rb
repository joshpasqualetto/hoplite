class CreateLoginProfiles < ActiveRecord::Migration
  def self.up
    create_table :login_profiles do |t|
      t.string :name
      t.string :auth_type
      t.string :username
      t.string :encrypted_password
      t.string :key_path

      t.timestamps
    end
  end

  def self.down
    drop_table :login_profiles
  end
end
