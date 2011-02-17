class DevicesController < ApplicationController
  def index
    @devices = Device.all
  end
  def new
    @device = Device.new
  end
end
