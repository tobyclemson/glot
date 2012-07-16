require 'java'

class Object
  def tapp
    require 'pp'

    self.tap do |s|
      pp s
    end
  end
end
