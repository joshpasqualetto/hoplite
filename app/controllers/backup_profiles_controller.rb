class BackupProfilesController < ApplicationController
  before_filter :find_backup_profile, :except => [ :index, :new, :create ]

  def index
    @backup_profiles = BackupProfile.all
  end

  def new
    @backup_profile = BackupProfile.new
  end

  def create
    @backup_profile = BackupProfile.new(params[:backup_profile])
    if @backup_profile.save
      redirect_to(@backup_profile, :notice => "Backup profile creation successful")
    else
      render(:new)
     end
  end

  def show
  end

  def edit
  end

  def update
    if @backup_profile.update_attributes(params[:backup_profile])
      redirect_to(@backup_profile, :notice => "Backup Profile successfully updated")
    else
      render(:edit)
    end 
  end 

  def destroy
    @backup_profile.destroy
    redirect_to(backup_profiles_path, :notice => "Backup Profile successfully deleted")
  end

private

  def find_backup_profile
    @backup_profile = BackupProfile.find(params[:id])
  end
end
