module Glot
  module Exceptions
    class MissingBuilderMethodException < StandardError
      def initialize builder_class, expected_builder_method_name, builder_methods
        @builder_class = builder_class
        @expected_builder_method_name = expected_builder_method_name
        @builder_methods = builder_methods
      end

      def message
        "Expected to find a method named: \"#@expected_builder_method_name\" on builder of type: \"#@builder_class\" " +
                    "but found only methods: #{@builder_methods.map(&:name).inspect}."
      end

      def inspect
        "#<Glot::Exceptions::MissingBuilderMethodException: #{message.inspect}>"
      end
    end
  end
end