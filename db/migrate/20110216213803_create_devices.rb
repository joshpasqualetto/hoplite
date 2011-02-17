class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.string  :name, :description, :location
      t.integer :backup_profile_id, :login_profile_id
      t.boolean :enabled
      t.datetime  :lastbackup_at
      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end
