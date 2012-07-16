require 'glot/exceptions/missing_builder_exception'

describe Glot::Exceptions::MissingBuilderException do
  subject { Glot::Exceptions::MissingBuilderException.new(builder_name, builder_module) }

  let(:builder_module) { Module.new { java_import 'glot.builders.FlatThingBuilder' } }
  let(:builder_name) { "ThingBuilder" }

  it { should == Glot::Exceptions::MissingBuilderException.new(builder_name, builder_module) }
  it { should_not == Glot::Exceptions::MissingBuilderException.new("SomeOtherThingBuilder", builder_module) }
  it { should_not == Glot::Exceptions::MissingBuilderMethodException.new("SomeOtherThingBuilder", "withStuff", []) }
  its(:message) { should == 'Expected to find a builder named: "ThingBuilder" but found only builders: ["FlatThingBuilder"].' }
end
