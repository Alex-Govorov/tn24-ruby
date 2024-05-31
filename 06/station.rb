require_relative('instance_counter')

class Station
  include InstanceCounter
  attr_reader :trains, :name

  @all = []

  class << self
    attr_accessor :all
  end

  def initialize(name)
    validate!(name)
    @name = name
    @trains = []
    self.class.all << self
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def valid?
    validate!(name)
    true
  rescue RuntimeError
    false
  end

  private

  def validate!(name)
    raise 'Название не может быть пустым' if name.nil? || name.empty?
  end
end
