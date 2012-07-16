module Glot
  class PopulatorStrategy
    attr_reader :builder_class

    def initialize builder_class
      @builder_class = builder_class
    end

    def == other
      other.class == PopulatorStrategy &&
          other.builder_class == @builder_class
    end
  end
end