require_relative('brand')

class Carriage
  include Brand
  attr_reader :type

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  protected

  def validate!
    raise 'Не указан тип вагона' unless type
  end
end
