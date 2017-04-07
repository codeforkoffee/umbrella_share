class UmbrellasController < ApplicationController
  before_action :authenticate_user!
  before_action :find_umbrella, only: [:edit, :show, :update, :destroy]

  def index
    @umbrellas = Umbrella.where('time>= ?', Date.today).order(:time).limit(20)
    gon.departures = Umbrella.all.pluck(:address_1, :latitude, :longitude)
    @UsersUmbrella = UsersUmbrella.where(user_id:current_user.id)
  end

  def my_umbrella
    @my_umbrellas = Umbrella.where(user_id:current_user.id)
  end

  def new
    @umbrella = Umbrella.new
  end

  def create
    # @umbrella = Umbrella.new(umbrella_params)
   # if @umbrella.save
   #   UsersUmbrella.create(user_id: current_user.id, umbrella_id: @umbrella.id)
   #   redirect_to @umbrella
   # else
   #   render 'new'
   # end
    @umbrella = current_user.umbrellas.create(umbrella_params)
    if @umbrella.persisted?
      redirect_to @umbrella
    else
      render 'new'
    end
  end

  def join
    @umbrella = Umbrella.find(params[:umbrella_id])
    # UsersUmbrella.create(user_id: current_user.id, umbrella_id: @umbrella.id)
    current_user.umbrellas << @umbrella
    # current_user.save!
    redirect_to umbrellas_path

  end

  def show
    @user = User.find_by(id: @umbrella.user_id)
    @umbrella = Umbrella.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

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

