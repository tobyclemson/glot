require 'glot/builder_specification'

describe Glot::BuilderSpecification do
  include Glot::Test::Matchers

  subject { Glot::BuilderSpecification.new(Java::GlotBuilders::NestedThingBuilder) }

  it { should have_method_for_key "flatThing" }

  it "should provide a population strategy for 'flatThing'" do
    subject.population_strategy_for("flatThing").should == Glot::PopulatorStrategy.new(Java::GlotBuilders::FlatThingBuilder)
  end

  it "should raise MissingBuilderException if no builder found yet required" do
    expect { subject.population_strategy_for("unbuildableThing") }.to raise_error_equal_to(
        Glot::Exceptions::MissingBuilderException.new("UnbuildableThingBuilder", Glot::BuilderSpecification::Builders))
  end

  it "should raise MissingBuilderMethodException if no builder method found yet required" do
    expect { subject.population_strategy_for("missingAttribute") }.to raise_error_equal_to(
        Glot::Exceptions::MissingBuilderMethodException.new(
            "NestedThingBuilder", "withMissingAttribute", subject.builder_methods))
  end
end
