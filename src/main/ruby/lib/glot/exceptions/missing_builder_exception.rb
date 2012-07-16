module Glot
  module Exceptions
    class MissingBuilderException < StandardError
      attr_reader :expected_builder, :builder_namespace

      def initialize expected_builder, builder_module
        @expected_builder = expected_builder
        @builder_namespace = builder_module
      end

      def message
        "Expected to find a builder named: \"#@expected_builder\" but found only builders: #{@builder_namespace.constants.sort.inspect}."
      end

      def inspect
        "#<Glot::Exceptions::MissingBuilderException: #{message.inspect}>"
      end

      def == other
        other.class == MissingBuilderException &&
            other.expected_builder == @expected_builder &&
            other.builder_namespace == @builder_namespace
      end
    end
  end
end