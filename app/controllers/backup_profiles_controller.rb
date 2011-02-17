class BackupProfilesController < ApplicationController
  def index
    @backup_profiles = BackupProfile.all
  end

  def new
    @backup_profile = BackupProfile.new
  end
end
