class Train
  attr_reader :speed, :number_of_wagons

  def initialize(number, type, number_of_wagons)
    @number = number
    @type = type
    @number_of_wagons = number_of_wagons
    @speed = 0
  end

  def speed_up(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def take_wagon
    @number_of_wagons += 1 if @speed.zero?
  end

  def release_wagon
    @number_of_wagons -= 1 if @number_of_wagons.positive? && @speed.zero?
  end

  def get_route(route)
    @route = route
    @current_station_index = route.stations.index(route.stations.first)
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    @route.stations[@current_station_index - 1] unless @current_station_index.zero?
  end

  def move_to_next_station
    @current_station_index += 1 if next_station
  end

  def move_to_previous_station
    @current_station_index -= 1 if previous_station
  end
end
