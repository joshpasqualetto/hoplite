class LoginProfilesController < ApplicationController
  before_filter :find_login_profile, :except => [ :index, :new, :create ]

  def index
    @login_profiles = LoginProfile.all
  end

  def new
    @login_profile = LoginProfile.new
  end

  def create
    @login_profile = LoginProfile.new(params[:login_profile])
    if @login_profile.save
      redirect_to(@login_profile, :notice => "Login profile creation successful")
    else
      render(:new)
     end
  end

  def show
  end

  def edit
  end

  def update
    if @login_profile.update_attributes(params[:login_profile])
      redirect_to(@login_profile, :notice => "Login Profile successfully updated")
    else
      render(:edit)
    end 
  end 

  def destroy
    @login_profile.destroy
    redirect_to(login_profiles_path, :notice => "Login Profile successfully deleted")
  end

private

  def find_login_profile
    @login_profile = LoginProfile.find(params[:id])
  end
end

