class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:home, :hotellist]
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

  def home
    #params[:q]には検索フォームに入力した値が入る
    @q = Room.ransack(params[:q])
  end

  def hotellist
    @q = Room.ransack(params[:q])
    # 重複データを除外=>distinct: true
    @rooms = @q.result(distinct: true)
  end

  private

  def room_params
    params.require(:room).permit(:hotel_image, :hotel_name, :hotel_introduction, :price, :address, :user_id)
  end
end
