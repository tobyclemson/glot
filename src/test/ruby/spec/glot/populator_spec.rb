require 'glot/populator'
require 'glot/exceptions/builder_population_exception'

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

    it "throws an exception explaining that no builder method was found for an incorrect attribute" do
      builder_class = Java::GlotBuilders::FlatThingBuilder
      populator = Glot::Populator.new(builder_class)

      attribute_hash = {
          :fakeAttribute => "Look at me! Look at me now!"
      }

      expect {
        populator.builder_from(attribute_hash)
      }.to raise_error(
               Glot::Exceptions::BuilderPopulationException,
               "Expected to find a method named: 'withFakeAttribute' on builder of type: 'FlatThingBuilder' " +
                   "but found only methods: ['withFirstAttribute', 'withSecondAttribute', 'withThirdAttribute'].")
    end
  end
end