require_relative 'hotel'

class Reservation
attr_reader :check_in, :check_out, :room_number

  ROOM_RATE_NIGHTLY = 200

  def initialize(check_in, check_out, room_number)
    @room_number = room_number
    @check_in = check_in
    @check_out = check_out

    valid_date
  end

  def valid_date
    unless @check_out == nil || @check_in == nil
      raise ArgumentError.new('Invalid date range') if @check_out < @check_in
    end
  end

  def days_booked
    check_out - check_in
  end

  def total_cost
    total_cost = (days_booked - 1) * ROOM_RATE_NIGHTLY
    return total_cost
  end

end
