package glot.builders;

import glot.domain.FlatThing;
import glot.domain.NestedThing;
import glot.domain.UnbuildableThing;

import static glot.builders.FlatThingBuilder.flatThingBuilder;

public class NestedThingBuilder {
    private FlatThing flatThing = flatThingBuilder().build();
    private String stringThing = "Some stringy thing";
    private UnbuildableThing unbuildableThing = new UnbuildableThing("Prisoner", 251);

    public NestedThingBuilder() {}

    public static NestedThingBuilder nestedThingBuilder() {
        return new NestedThingBuilder();
    }

    public NestedThing build() {
        return new NestedThing(flatThing, stringThing, unbuildableThing);
    }

    public NestedThingBuilder withFlatThing(FlatThing flatThing) {
        this.flatThing = flatThing;
        return this;
    }

    public NestedThingBuilder withStringThing(String stringThing) {
        this.stringThing = stringThing;
        return this;
    }

    public NestedThingBuilder withUnbuildableThing(UnbuildableThing unbuildableThing) {
        this.unbuildableThing = unbuildableThing;
        return this;
    }
}
