require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :volume, :empty_volume

  use_parent_class_validations

  def initialize(volume)
    super()
    @type = 'cargo'
    @volume = volume
    @empty_volume = volume
    validate!
  end

  def take_volume(volume)
    if volume > empty_volume
      raise ArgumentError,
            "Указнный объём #{volume} превышает свободный объём вагона #{empty_volume}"
    end

    @empty_volume -= volume
  end

  def taken_volume
    @volume - @empty_volume
  end
end
