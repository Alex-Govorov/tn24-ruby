require_relative('cargo_carriage')
require_relative('cargo_train')
require_relative('passenger_carriage')
require_relative('passenger_train')
require_relative('route')
require_relative('station')

class Railroad
  MENU_METHODS = { 'Создать станцию' => 'create_station',
                   'Создать поезд' => 'create_train',
                   'Создать маршрут и управлять станциями в нем (добавлять, удалять)' => 'create_route',
                   'Назначить маршрут поезду' => 'assign_route_to_train',
                   'Добавить вагоны к поезду' => 'add_carriages_to_train',
                   'Отцепить вагоны от поезда' => 'release_carriages_from_train',
                   'Переместить поезд по маршруту вперед и назад' => 'move_train',
                   'Просмотреть список станций и список поездов на станции' => 'station_trains',
                   'Выйти' => 'exit' }.freeze

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def menu
    MENU_METHODS.each_with_index { |(key, _value), index| puts "#{index}. #{key}" }
    send(MENU_METHODS.values[input_i])
  end

  private

  # Все методы, что ниже применяются исключительно текущим классом поэтому private
  def create_station
    puts 'Введите название станции:'
    name = gets.chomp
    @stations << Station.new(name)
    menu
  end

  def create_train
    puts '0: грузовой, 1: пассажирский'
    case input_i
    when 0
      type = 'cargo'
    when 1
      type = 'passenger'
    end
    puts 'Номер поезда:'
    number = input_str
    @trains << PassengerTrain.new(number) if type == 'passenger'
    @trains << CargoTrain.new(number) if type == 'cargo'
    puts "Создан поезд №: #{number}"
    menu
  rescue RuntimeError
    puts 'Не правильный формат номера поезда, попробуйте еще раз'
    retry
  end

  def create_route
    puts 'Начальная станция:'
    station_first = choose_station
    puts 'Конечная станция:'
    station_last = choose_station
    route = Route.new(station_first, station_last)
    @routes << route
    puts 'Управлять станциями в маршруте? 0: Да / 1: Нет'
    manage_stations_in_route(route) if input_i.zero?
    menu
  end

  def assign_route_to_train
    train = choose_train
    puts 'Выберите маршрут:'
    routes_list
    route = @routes[input_i]
    train.get_route(route)
    menu
  end

  def add_carriages_to_train
    train = choose_train
    puts 'Сколько вагонов?'
    carriages_count = input_i
    case train.type
    when 'cargo'
      carriages_count.times { train.take_carriage(CargoCarriage.new) }
    when 'passenger'
      carriages_count.times { train.take_carriage(PassenegerCarriage.new) }
    end
    menu
  end

  def release_carriages_from_train
    train = choose_train
    puts 'Сколько вагонов?'
    carriages_count = input_i
    carriages_count.times { train.release_carriage(train.carriages.last) } if carriages_count <= train.carriages.count
    menu
  end

  def move_train
    train = choose_train
    puts '0: Ехать вперед / 1: Ехать назад'
    case input_i
    when 0
      train.move_to_next_station
      puts 'Конечная' unless train.next_station
    when 1
      train.move_to_previous_station
      puts 'Конечная' unless train.previous_station
    end
    menu
  end

  def station_trains
    puts 'Выберите станцию:'
    stations_list
    station = @stations[input_i]
    station.trains.each { |train| puts "#{train.number} #{train.type}" }
    menu
  end

  def choose_train
    puts 'Выберите поезд:'
    trains_list
    @trains[input_i]
  end

  def choose_station
    puts 'Выберите станцию:'
    stations_list
    @stations[input_i]
  end

  def manage_stations_in_route(route)
    puts '0:Добавить станцию / 1: Удалить станцию'
    case input_i
    when 0
      add_station_in_route(route)
    when 1
      delete_station_from_route(route)
    end
  end

  def add_station_in_route(route)
    puts 'Какую станцию добавляем?'
    stations_list
    route.add_station(@stations[input_i])
  end

  def delete_station_from_route(route)
    puts 'Какую станцию удаляем?'
    route.stations.each_with_index(station, index) { |station, index| puts "#{index}. #{station.name}" }
    route.delete_station(@stations[input_i])
  end

  def stations_list
    @stations.each_with_index { |station, index| puts "#{index}. #{station.name}" }
  end

  def routes_list
    @routes.each_with_index { |route, index| puts "#{index}. #{route.stations}" }
  end

  def trains_list
    @trains.each_with_index { |train, index| puts "#{index}. #{train.number}" }
  end

  def input_i
    gets.chomp.to_i
  end

  def input_str
    gets.chomp
  end
end
