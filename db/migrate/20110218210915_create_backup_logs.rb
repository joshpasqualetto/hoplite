class CreateBackupLogs < ActiveRecord::Migration
  def self.up
    create_table :backup_logs do |t|
      t.integer :device_id
      t.integer :login_profile_id
      t.integer :backup_profile_id
      t.text :message
      t.boolean :failed

      t.timestamps
    end
  end

  def self.down
    drop_table :backup_logs
  end
end
