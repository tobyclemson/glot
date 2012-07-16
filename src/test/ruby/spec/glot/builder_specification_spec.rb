require 'glot/builder_specification'

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Glot::BuilderSpecification do
  subject { Glot::BuilderSpecification.new(Java::GlotBuilders::NestedThingBuilder) }

  it { should have_method_for_key "flatThing" }

  it "should provide a population strategy for 'flatThing'" do
    subject.population_strategy_for("flatThing").should == Glot::PopulatorStrategy.new(Java::GlotBuilders::FlatThingBuilder)
  end
end
