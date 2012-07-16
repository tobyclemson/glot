require 'glot/exceptions/builder_population_exception'
require 'active_support/core_ext/string/inflections'

module Glot
  class Populator
    def initialize builder_class
      @builder_class = builder_class
    end

    def builder_from attribute_hash
      @builder_class.new.tap do |builder|
        attribute_hash.each do |key, value|
          method_name = method_name_for(key)
          if builder.respond_to? method_name
            builder.send(method_name, value)
          else
            raise Exceptions::BuilderPopulationException.new(
                      "Expected to find a method named: '#{method_name}' " +
                          "on builder of type: '#{@builder_class.java_class.simple_name}' " +
                          "but found only methods: [#{builder.java_class.java_instance_methods.select{ |m| m.name =~ /^with/ }.map{ |m| "'" + m.name + "'" }.join ", "}].")
          end
        end
      end
    end

    def build_from attribute_hash
      builder_from(attribute_hash).build
    end

    def method_name_for(key)
      "with#{key.to_s.camelize}".to_sym
    end
  end
end