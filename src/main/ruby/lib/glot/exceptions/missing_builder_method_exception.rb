module Glot
  module Exceptions
    class MissingBuilderMethodException < StandardError
      attr_reader :builder_name, :expected_builder_method_name, :builder_methods

      def initialize builder_name, expected_builder_method_name, builder_methods
        @builder_name = builder_name
        @expected_builder_method_name = expected_builder_method_name
        @builder_methods = builder_methods
      end

      def message
        "Expected to find a method named: \"#@expected_builder_method_name\" on builder of type: \"#@builder_name\" " +
                    "but found only methods: #{@builder_methods.map(&:name).inspect}."
      end

      def inspect
        "#<Glot::Exceptions::MissingBuilderMethodException: #{message.inspect}>"
      end

      def == other
        other.class == MissingBuilderMethodException &&
            other.builder_name == @builder_name &&
            other.expected_builder_method_name == @expected_builder_method_name &&
            other.builder_methods == @builder_methods
      end
    end
  end
end