require 'java'

class Object
  def tapp
    require 'pp'

    self.tap do |s|
      pp s
    end
  end
end

module Glot
  module Test
    module Matchers
        def raise_error_equal_to error
          raise_error(error.class) { |e| e.should == error }
        end
    end
  end
end
