require_relative 'train'

class PassengerTrain < Train
  attr_reader :type

  use_parent_class_validations

  def initialize(number)
    super
    @type = 'passenger'
  end
end
