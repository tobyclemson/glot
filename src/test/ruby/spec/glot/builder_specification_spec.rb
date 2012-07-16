require 'glot/builder_specification'

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Glot::BuilderSpecification do
  subject { Glot::BuilderSpecification.new(Java::GlotBuilders::NestedThingBuilder) }

  it { should have_method_for_key "flatThing" }

  it "should provide a population strategy for 'flatThing'" do
    subject.population_strategy_for("flatThing").should == Glot::PopulatorStrategy.new(Java::GlotBuilders::FlatThingBuilder)
  end

  it "should raise MissingBuilderException if no builder found yet required" do
    expect { subject.population_strategy_for("unbuildableThing") }.to raise_error(
        Glot::Exceptions::MissingBuilderException,
        'Expected to find a builder named: "UnbuildableThingBuilder" ' +
            'but found only builders: ["FlatThingBuilder", "NestedThingBuilder"].'
    )
  end
end
