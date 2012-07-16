require 'glot/populator_strategy'
require 'glot/exceptions/missing_builder_exception'

module Glot
  class BuilderSpecification
    module Builders
      java_import "glot.builders.FlatThingBuilder"
      java_import "glot.builders.NestedThingBuilder"
    end

    def initialize builder_class
      @builder_class = builder_class
    end

    def population_strategy_for key
      if wither = wither_for(key)
        target_type = wither.parameter_types.first
        if builder = builder_for(target_type)
          PopulatorStrategy.new(builder)
        end
      end
    end

    def has_method_for_key? key
      withers.map(&:name).include?(method_name_for(key))
    end

    private

    def builder_for target_type
      Builders.const_get(builder_name_for(target_type))
    rescue NameError => e
      raise Glot::Exceptions::MissingBuilderException.new(builder_name_for(target_type), Builders)
    end


    def wither_for key
      withers.find { |w| w.name == method_name_for(key) }
    end

    def withers
      @builder_class.java_class.java_instance_methods.select { |m| m.name =~ /^with/ }
    end

    def method_name_for(key)
      "with#{key.to_s.camelize}"
    end

    def builder_name_for(type)
      "#{type.simple_name}Builder"
    end

  end
end