require_relative('brand')
require_relative('validation')

class Carriage
  include Brand
  include Validation
  attr_reader :type

  validate :type, :presence
end
