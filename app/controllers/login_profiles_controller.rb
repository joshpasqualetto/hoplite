class LoginProfilesController < ApplicationController
  def index
    @login_profiles = LoginProfile.all
  end

  def new
    @login_profile = LoginProfile.new
  end
end
