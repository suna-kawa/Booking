class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
  @room = Room.new(room_params)
  @room.user_id = current_user.id
  if @room.save
    flash[:success] = "ホテルを登録しました"
    redirect_to room_path(@room)
  else
    render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
  end
  
  def update
  end

  def destroy
  end

  private

  def room_params
    params.require(:room).permit(:hotel_image, :hotel_name, :hotel_introduction, :price, :address, :user_id)
  end
end
