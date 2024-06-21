require_relative('instance_counter')
require_relative('validation')
require_relative('accessors')

class Station
  include InstanceCounter
  include Validation
  extend Accessors
  attr_reader :trains

  attr_accessor_with_history :name

  validate :name, :presence

  @all = []

  class << self
    attr_accessor :all
  end

  def initialize(name)
    self.name = name
    validate!
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

  def trains_to_block(&block)
    raise 'Не указан блок' unless block_given?

    @trains.each(&block)
  end
end
