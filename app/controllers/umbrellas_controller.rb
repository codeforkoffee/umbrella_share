class UmbrellasController < ApplicationController
  before_action :authenticate_user!
  before_action :find_umbrella, only: [:edit, :show, :update, :destroy]

  def index
    @umbrellas = Umbrella.where('time>= ?', Date.today).order(:time).limit(20)
    gon.departures = Umbrella.all.pluck(:address_1, :latitude, :longitude)

  end

  def my_umbrella
    @my_umbrellas = Umbrella.where(user_id:current_user.id)
  end

  def new
    @umbrella = Umbrella.new
  end

  def create
    @umbrella = Umbrella.new(umbrella_params)

    if @umbrella.save
      redirect_to @umbrella
    else
      render 'new'
    end
  end

  def show
    @umbrella = Umbrella.find(params[:id])
    @user = User.find_by(id: @umbrella.user_id)
  end

  # def chat
    # @umbrella = Umbrella.find(params[:id])
  # end

  def edit
    if current_user.id != @umbrella.user_id
      flash[:notice] = 'Umbrella can only be edited by its creator.'
      redirect_to umbrellas_path
    end
  end

  def update
    if @umbrella.update(umbrella_params)
      flash[:notice] = 'Success!'
      redirect_to @umbrella
    else
      render :edit
    end
  end

  def destroy
    if current_user.id != @umbrella.user_id
      flash[:notice] = 'Umbrella can only be deleted by its creator.'
      redirect_to umbrellas_path
    elsif @umbrella.destroy
      redirect_to umbrellas_path
    end
  end

  private
  def umbrella_params
    whitelist = params.require(:umbrella).permit(:time, :address_1, :address_2, :zipcode)
    whitelist.merge(user_id: current_user.id)
  end

  def find_umbrella
    @umbrella = Umbrella.find(params[:id])
  end
end

