class Train
  attr_reader :speed, :number_of_wagons, :current_station, :next_station, :prev_station

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
    route.stations.first.take_train(self)
    @current_station = route.stations.first
    current_station_index = route.stations.index(@current_station)
    @next_station = route.stations[current_station_index + 1]
    @prev_station = @current_station == route.stations.first ? nil : route.stations[current_station_index - 1]
  end

  def go_to_next_station
    return unless @next_station

    @current_station.send_train(self)
    @next_station.take_train(self)
    @current_station = @next_station
  end

  def go_to_prev_station
    return unless @prev_station

    @current_station.send_train(self)
    @prev_station.take_train(self)
    @current_station = @prev_station
  end
end
