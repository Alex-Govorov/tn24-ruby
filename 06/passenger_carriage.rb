require_relative 'carriage'

class PassengerCarriage < Carriage
  def initialize
    super
    @type = 'passenger'
    validate!
  end
end
