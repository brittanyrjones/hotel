require_relative 'spec_helper'


describe 'Reservation' do

  describe 'initialize' do
    it "can create an instance of reservation" do

      new_reservation = Reservation.new(Date.new(2000,1,1), Date.new(2000,1,5),1)
      new_reservation.must_be_instance_of Reservation
    end

    it 'has attributes: check in, out and room number' do
      new_reservation = Reservation.new(Date.new(2000,1,1), Date.new(2000,1,5),1)
      new_reservation.room_number.must_be_kind_of Integer
      new_reservation.room_number.must_equal 1
      new_reservation.check_in.must_be_kind_of Date
      new_reservation.check_out.must_equal Date.new(2000,1,5)
    end

    it "raises an ArgumentError if check out is before check in" do

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

      new_reservation.days_reserved.must_equal 15
    end
  end

  describe 'total_cost' do
    it "calculates the total cost of stay" do
      new_reservation = Reservation.new(Date.new(2000,1,10), Date.new(2000,1,15),10)
      new_reservation.total_cost.must_equal 800
    end

    it "calculates cost for one night stay" do
      new_reservation = Reservation.new(Date.new(2000,1,11), Date.new(2000,1,12),7)
      new_reservation.one_night.must_equal 200
    end
  end
end
