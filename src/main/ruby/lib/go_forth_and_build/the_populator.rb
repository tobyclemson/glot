require 'active_support/core_ext/string/inflections'

module GoForthAndBuild
  class ThePopulator
    def initialize builder_class
      @builder_class = builder_class
      # Class<FlatThingBuilder>
    end

    def builder_from attribute_hash
      instance = @builder_class.new
      attribute_hash.each do |key, value|
        instance.send("with#{key.camelize}".to_sym, value)
      end
      instance
    end
  end
end