require 'glot/exceptions/missing_builder_exception'

describe Glot::Exceptions::MissingBuilderException do
  let(:target_exception_class) { Glot::Exceptions::MissingBuilderMethodException }

  subject { target_exception_class.new(builder_name, expected_builder_method_name, builder_methods) }

  let(:builder_name) { "ThingBuilder" }
  let(:expected_builder_method_name) { "withSomeAttribute" }
  let(:builder_methods) { Java::GlotBuilders::FlatThingBuilder.java_class.java_instance_methods.select { |m| m.name =~ /^with/ } }

  it { should == target_exception_class.new(builder_name, expected_builder_method_name, builder_methods) }
  it { should_not == target_exception_class.new("SomeOtherThingBuilder", expected_builder_method_name, builder_methods) }
  it { should_not == target_exception_class.new(builder_name, "withSomeOtherAttribute", builder_methods) }
  it { should_not == target_exception_class.new(builder_name, expected_builder_method_name, []) }
  it { should_not == Glot::Exceptions::MissingBuilderException.new("SomeOtherThingBuilder", Object) }
  its(:message) do
    should == 'Expected to find a method named: "withSomeAttribute" on builder of type: "ThingBuilder" ' +
        'but found only methods: ["withFirstAttribute", "withSecondAttribute", "withThirdAttribute"].'
  end
end
