class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.distance = Distance.new(@activity.original_location, @activity.destination_location).call

    if @activity.save
      redirect_to @activity
    else
      render :new
    end
  end

  def edit; end

  def all
    @activities = Activity.all
  end

  def update
    new_distance = Distance.new(activity_params[:original_location], activity_params[:destination_location]).call
    @new_activity_params = activity_params.merge!(distance: new_distance)

    if @activity.update(@new_activity_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    set_activity.destroy

    redirect_to root_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:original_location, :destination_location, :distance)
  end
end
