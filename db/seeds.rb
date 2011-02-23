# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
BackupProfile.create(:name => "Generic tftp backup", :description => "Generic tftp backup profile, Known working with: Foundry FastIron (03.4 firmware)", :script => "copy running-config tftp $SERVER_IP $DST_FILE\r\nexit\r\nexit")
LoginProfile.create(:name => "Generic telnet login", :description => "Generic telnet login requiring en \"Super\" privileges, Known working with: Foundry FastIron switchs (03.4 firmware)", :script => "$PASSWORD\r\nen\r\n$PASSWORD")
