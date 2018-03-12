require_relative 'spec_helper'

describe 'hotel class' do

  describe 'initialize' do
    it "can be created" do
      hotel = Hotel.new
      hotel.must_be_instance_of Hotel
    end

    it "has 20 rooms" do
      hotel = Hotel.new
      hotel.rooms.length.must_equal 20
    end

    it "has an empty list of reservations" do
      hotel = Hotel.new
      hotel.reservations.length.must_equal 0
    end
  end

  describe 'can get available rooms' do
    it "can find an available room from the list of rooms" do
      hotel = Hotel.new
      room_number = hotel.find_available_room
      room_number.must_be :>,0
      room_number.must_be :<=,20
    end

    it "can find an available room when reservation dates are overlapping with existing reservation" do

      hotel = Hotel.new
      new_reservation1 = Reservation.new(Date.new(2018,3,6),Date.new(2018,3,9),1)
      new_res1 = hotel.create_reservation(new_reservation1)

      new_reservation2 = Reservation.new(Date.new(2018,3,6),Date.new(2018,3,9),1)

      new_res2 = hotel.create_reservation(new_reservation2)

      new_res2.room_number.wont_be_same_as new_res1.room_number

    end

    it "can find an available room when there are reservations" do
      hotel = Hotel.new
      room_number = hotel.find_available_room

      new_reservation = Reservation.new(Date.new(2018,3,6),Date.new(2018,3,9),1)
      new_reservation_2 = Reservation.new(Date.new(2018,3,7),Date.new(2018,3,8),1)

      new_res = hotel.create_reservation(new_reservation_2)
      new_res_1 = hotel.create_reservation(new_reservation)

      new_res.room_number.wont_be_same_as new_res_1.room_number
    end
  end

  describe 'take reservation' do
    it "can create a reservation" do
      hotel = Hotel.new
      new_reservation = Reservation.new(Date.new(2018,3,6),Date.new(2018,3,9),3)
      hotel.create_reservation(new_reservation)

      hotel.reservations.length.must_equal 1
      hotel.reservations.length.must_be :>, 0
    end

    it "can create multiple reservations" do
      hotel = Hotel.new

      new_reservation_1 = Reservation.new(Date.new(2018,3,6),Date.new(2018,3,9),2)
      new_reservation_2 = Reservation.new(Date.new(2018,3,7),Date.new(2018,3,10),7)
      new_reservation_3 = Reservation.new(Date.new(2018,3,8),Date.new(2018,3,11),20)

      hotel.create_reservation(new_reservation_1)
      hotel.create_reservation(new_reservation_2)
      hotel.create_reservation(new_reservation_3)

      hotel.reservations.length.must_equal 3
      hotel.reservations.length.must_be :>, 2
    end
  end

  describe 'can get list of reservations' do

    it "will list all reservations during the time given" do
      hotel = Hotel.new

      new_reservation1 = Reservation.new(Date.new(2018,6,1),Date.new(2018,6,6),1)
      new_reservation = Reservation.new(Date.new(2018,9,1),Date.new(2018,9,6),1)

      hotel.create_reservation(new_reservation1)
      hotel.create_reservation(new_reservation)
      new_res = hotel.list_reservations(Date.new(2018,6,2))
      new_res.must_be_kind_of Array
      new_res.length.must_equal 1

    end

    it "will list no reservations during the time given" do
      hotel = Hotel.new

      new_reservation1 = Reservation.new(Date.new(2018,6,1),Date.new(2018,6,6),1)
      new_reservation = Reservation.new(Date.new(2018,9,1),Date.new(2018,9,6),1)

      hotel.create_reservation(new_reservation1)
      hotel.create_reservation(new_reservation)

      future_res = hotel.list_reservations(Date.new(2030,10,2))
      future_res.must_be_kind_of Array
      future_res.length.must_equal 0

    end
  end
end
