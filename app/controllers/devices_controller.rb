class DevicesController < ApplicationController
  before_filter :find_device, :except => [ :index, :new, :create ]

  def index
    @devices = Device.all
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(params[:device])
    if @device.save
      redirect_to(@device, :notice => "Device creation successful")
    else
      render(:new)
     end
  end

  def show
  end

  def edit
  end

  def update
    if @device.update_attributes(params[:device])
      redirect_to(@device, :notice => "Device successfully updated")
    else
      render(:edit)
    end 
  end 

  def destroy
    @device.destroy
    redirect_to(devices_path, :notice => "Device successfully deleted")
  end

private

  def find_device
    @device = Device.find(params[:id])
  end

end
