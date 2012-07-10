require 'glot/populator'

describe "Glot" do
  describe "Populator" do
    it "populates top level primitive attributes" do
      builder_class = Java::GlotBuilders::FlatThingBuilder
      populator = Glot::Populator.new(builder_class)

      expected = Java::GlotBuilders::FlatThingBuilder.new.
          with_first_attribute("The Cat in the Hat").
          with_third_attribute("Green Eggs and Ham").
          build

      attribute_hash = {
          :firstAttribute => "The Cat in the Hat",
          :thirdAttribute => "Green Eggs and Ham"
      }

      actual = populator.builder_from(attribute_hash).build

      actual.should == expected
    end
  end
end