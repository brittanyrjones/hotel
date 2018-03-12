require_relative 'spec_helper'


describe 'Reservation' do

  describe 'initialize' do
    it "can create an instance of reservation" do

      new_reservation = Reservation.new(Date.new(2000,1,1), Date.new(2000,1,5),1)
      new_reservation.must_be_instance_of Reservation
    end

    it "raises and ArgumentError if check out is before check in" do

        check_in = Date.new(2000,1,5),
        check_out = Date.new(2000,1,1),
        room_number = 2

      proc {
        new_reservation = Reservation.new(check_in, check_out, room_number)
      }.must_raise ArgumentError

    end
  end

  describe 'days that room is reserved' do
    it "calculates days that room is reserved" do
      new_reservation = Reservation.new(Date.new(2000,1,10), Date.new(2000,1,25),2)

      new_reservation.days_booked.must_equal 15
    end
  end

  describe 'total_cost' do
    it "calculates the total cost of stay correctly" do
      new_reservation = Reservation.new(Date.new(2000,1,10), Date.new(2000,1,15),10)

      new_reservation.total_cost.must_equal 1000
    end
  end
end
