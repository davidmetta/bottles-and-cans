class PickupsController < ApplicationController
  def index
    @pickups = Pickup.geocoded

    @markers = @pickups.map do |pickup|
      {
        lat: pickup.latitude,
        lng: pickup.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pickup: pickup })
      }
    end
  end

  def show
    @pickup = Pickup.find(params[:id])
  end

  def new
    @pickup = Pickup.new
  end

  def create
    @pickup = Pickup.new(pickup_params)
    @pickup.user = current_user
    redirect_to pickup_path(@pickup) if @pickup.save
  end

  def update
    @pickup = Pickup.find(params[:id])
    redirect_to pickup_path(@pickup) if @pickup.update(pickup_params)
  end

  def destroy
  end

  def confirmation
  end

  def reserve
    @pickup = Pickup.find(params[:id])
    @pickup.update(collector_id: current_user.id, status: 'reserved')
  end

  private

  def pickup_params
    params.require(:pickup).permit(:collector_id, :longitude, :latitude, :location, :bottles, :info, :image, :status)
  end
end
