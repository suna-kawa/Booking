class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
    @reservation_rooms = current_user.reservation_rooms
    
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @reservation.room_id = @room.id
    @reservation.user_id = current_user.id
    @q = Room.ransack(params[:q])
    if @reservation.check_in_out_check || @reservation.new_nil_check
      render 'rooms/show'
    end
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @reservation.room_id = @room.id
    if @reservation.save!
      redirect_to reservations_index_path
    elsif params[:back] 
      render 'rooms/show' and return
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guest, :room_id, :id).merge(user_id: [current_user.id])
  end
end
