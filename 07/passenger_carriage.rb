require_relative 'carriage'

class PassengerCarriage < Carriage
  attr_reader :total_seats_count

  def initialize(seats)
    super()
    @type = 'passenger'
    @seats = Array.new(seats, false)
    @total_seats_count = @seats.count
    validate!
  end

  def take_seat
    first_empty_seat_index = @seats.find_index(false)
    raise ArgumentError, 'Все места заняты' unless first_empty_seat_index

    @seats[first_empty_seat_index] = true
  end

  def taken_seats_count
    @seats.select { |seat| seat == true }.count
  end

  def empty_seats_count
    @seats.select { |seat| seat == false }.count
  end
end
