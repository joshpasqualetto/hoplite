class CreateBackupProfiles < ActiveRecord::Migration
  def self.up
    create_table :backup_profiles do |t|
      t.string :name
      t.text :description
      t.text :script

      t.timestamps
    end
  end

  def self.down
    drop_table :backup_profiles
  end
end
