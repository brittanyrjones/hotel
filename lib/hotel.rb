require_relative 'reservation'

class Hotel
  attr_reader :rooms, :reservations
  def initialize
    @rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    @reservations = []
  end

  def find_available_room
    if reservations.length == 0
      room_number = @rooms.sample
    else

      @rooms.each do |room|
        room_number = rooms.sample
        reservations.each do |reservation|
          if reservation_overlap?(reservation) == true
          end
        end
      end
      return room_number
    end
  end

  def create_reservation(reservation)
    check_in = reservation.check_in
    check_out = reservation.check_out
    room_number = find_available_room
    new_res = Reservation.new(check_in, check_out,room_number)
    reservations << new_res
    return new_res
  end

  def reservation_overlap?(reservation)
    check_in = reservation.check_in
    check_out = reservation.check_out
    return false if check_in >= check_out || check_out <= check_in
  end

  def list_reservations(date)
    list = []
    reservations.each do |reservation|
      if date.between?(reservation.check_in,reservation.check_out)
      list << reservation
      end
    return list
    end
  end

end
