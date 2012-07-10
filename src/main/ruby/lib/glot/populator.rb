require 'active_support/core_ext/string/inflections'

module Glot
  class Populator
    def initialize builder_class
      @builder_class = builder_class
    end

    def builder_from attribute_hash
      instance = @builder_class.new
      attribute_hash.each do |key, value|
        instance.send("with#{key.to_s.camelize}".to_sym, value)
      end
      instance
    end
  end
end