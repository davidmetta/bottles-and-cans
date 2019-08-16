class PickupsController < ApplicationController
  def index
    @pickups = Pickup.geocoded.where.not(user: current_user, status: 'completed')

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

  def edit
    @pickup = Pickup.find(params[:id])
  end

  def update
    @pickup = Pickup.find(params[:id])
    redirect_to pickup_path(@pickup) if @pickup.update(pickup_params)
  end

  def destroy
  end

  def reserve
    @pickup = Pickup.find(params[:id])
    redirect_to pickup_path(@pickup) if @pickup.update(collector_id: current_user.id, status: 'reserved')
  end

  def completed
    @pickup = Pickup.find(params[:id])
    redirect_to pickups_path if @pickup.update(status: 'completed')
  end

  private

  def pickup_params
    params.require(:pickup).permit(:collector_id, :longitude, :latitude, :location, :bottles, :info, :image, :status)
  end
end
