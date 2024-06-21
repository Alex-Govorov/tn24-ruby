module Validation
  def self.included(base)
    base.extend ValidationClassMethods
    base.include ValidationInstanceMethods
  end

  module ValidationClassMethods
    def validate(attr, validation_type, arg = nil)
      attr_hash = { attr: attr, validation_type: validation_type, arg: arg }
      instance_variable_set('@validations', (instance_variable_get('@validations') || []) << attr_hash)
    end

    def use_parent_class_validations
      instance_variable_set('@validations', superclass.instance_variable_get('@validations'))
    end
  end

  module ValidationInstanceMethods
    def validate!
      validations = self.class.instance_variable_get('@validations')
      validations.each do |validation|
        send("#{validation[:validation_type]}_validation", send(validation[:attr]), *validation[:arg])
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    protected

    def presence_validation(attr)
      return unless (attr.respond_to?('empty?') && attr.empty?) || attr.nil?

      raise 'Значение атрибута должно быть не nil и не пустой строкой'
    end

    def format_validation(attr, format)
      raise "Значение атрибута не соответствует формату: #{format}" if attr !~ format
    end

    def type_validation(attr, type)
      raise "Класс атрибута #{attr.class}, а должен быть #{type}" if attr.class != type
    end
  end
end

class Test
  include Validation

  attr_accessor :name, :number, :station

  NUMBER_FORMAT ||= /^[a-zа-я0-9]{3}-*[a-zа-я0-9]{2}$/i.freeze

  validate :name, :presence
  validate :name, :type, String
  validate :station, :type, Array
  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
end
