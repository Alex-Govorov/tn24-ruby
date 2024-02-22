require_relative('brand')

class Carriage
  include Brand
  attr_reader :type
end
