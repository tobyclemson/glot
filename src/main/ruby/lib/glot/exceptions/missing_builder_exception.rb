module Glot
  module Exceptions
    class MissingBuilderException < StandardError
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
    end
  end
end