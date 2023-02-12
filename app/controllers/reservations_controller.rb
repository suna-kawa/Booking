class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # ユーザーの予約情報を取得かつ重複除去
    @reservations = current_user.reservations.distinct
    # ユーザが予約したホテル情報を取得かつ重複除去
    @reservation_rooms = current_user.reservation_rooms.all.distinct
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @reservation.room_id = @room.id
    @reservation.user_id = current_user.id
    if @reservation.check_in_out_check || @reservation.new_nil_check
      render 'rooms/show'
    end
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    session[:reservation] = @reservation
    @room = Room.find(params[:reservation][:room_id])
    @reservation.room_id = @room.id
    if @reservation.save!
    redirect_to reservations_index_path
    else
    render 'rooms/show'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guest, :room_id, :id).merge(user_id: [current_user.id])
  end
end
