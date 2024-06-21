require_relative('instance_counter')
require_relative('validation')
require_relative('station')

class Route
  include InstanceCounter
  include Validation
  attr_reader :stations, :first_station, :last_station

  validate :first_station, :type, Station
  validate :last_station, :type, Station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    validate!
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end
