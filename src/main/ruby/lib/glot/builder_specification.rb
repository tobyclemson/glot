require 'glot/populator_strategy'
require 'glot/exceptions/missing_builder_exception'
require 'glot/exceptions/missing_builder_method_exception'

module Glot
  class BuilderSpecification
    module Builders
      java_import "glot.builders.FlatThingBuilder"
      java_import "glot.builders.NestedThingBuilder"
    end

    def initialize builder_class
      @builder_name = builder_class
    end

    def builder_name
      @builder_name.java_class.simple_name
    end

    def builder_methods
      @builder_name.java_class.java_instance_methods.select { |m| m.name =~ /^with/ }
    end

    def population_strategy_for key
      if builder_method = builder_methods_for(key)
        target_type = builder_method.parameter_types.first
        if builder = builder_for(target_type)
          PopulatorStrategy.new(builder)
        end
      else
        raise Glot::Exceptions::MissingBuilderMethodException.new(builder_name, builder_method_name_for(key), builder_methods)
      end
    end

    def has_method_for_key? key
      builder_methods.map(&:name).include?(builder_method_name_for(key))
    end

    private

    def builder_for target_type
      Builders.const_get(builder_name_for(target_type))
    rescue NameError => e
      raise Glot::Exceptions::MissingBuilderException.new(builder_name_for(target_type), Builders)
    end


    def builder_methods_for key
      builder_methods.find { |w| w.name == builder_method_name_for(key) }
    end

    def builder_method_name_for(key)
      "with#{key.to_s.camelize}"
    end

    def builder_name_for(type)
      "#{type.simple_name}Builder"
    end

  end
end