require_relative 'train'

class CargoTrain < Train
  attr_reader :type

  use_parent_class_validations

  def initialize(number)
    super
    @type = 'cargo'
  end
end
