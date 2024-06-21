module Brand
  require_relative 'accessors'
  extend Accessors
  strong_attr_accessor :brand, String
end
