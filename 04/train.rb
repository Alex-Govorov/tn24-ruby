class Train
  attr_reader :speed, :carriages, :number

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
  end

  def speed_up(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def take_carriage(carriage)
    @carriages << carriage
  end

  def release_carriage(carriage)
    @carriages.delete(carriage)
  end

  def get_route(route)
    @route = route
    @current_station_index = route.stations.index(route.stations.first)
    current_station.take_train(self)
  end

  def move_to_next_station
    return unless next_station

    current_station.send_train(self)
    @current_station_index += 1
    current_station.take_train(self)
  end

  def move_to_previous_station
    return unless previous_station

    current_station.send_train(self)
    @current_station_index -= 1
    current_station.take_train(self)
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    @route.stations[@current_station_index - 1] unless @current_station_index.zero?
  end

  protected

  # Метод, что ниже используеся классами потомками CargoTrain и PassengerTrain, поэтому protected
  def current_station
    @route.stations[@current_station_index]
  end
end
