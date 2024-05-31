require_relative 'carriage'

class CargoCarriage < Carriage
  def initialize
    super
    @type = 'cargo'
    validate!
  end
end
