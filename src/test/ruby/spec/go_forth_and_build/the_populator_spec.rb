require 'go_forth_and_build/the_populator'

describe "ThePopulator" do
  it "populates an instance of the supplied builder class with the contents of the passed hash" do
    flat_thing_builder_class = Java::GoforthandbuildBuilders::FlatThingBuilder
    populator = GoForthAndBuild::ThePopulator.new(flat_thing_builder_class)

    attribute_hash = {
        "firstAttribute" => "The Cat in the Hat"
    }

    populated_builder = populator.builder_from(attribute_hash)

    populated_builder.build.first_attribute.should == "The Cat in the Hat"
  end
end