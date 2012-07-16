package glot.builders;

import glot.domain.FlatThing;
import glot.domain.NestedThing;

public class NestedThingBuilder {
    private FlatThing flatThing;
    private String stringThing;

    public static NestedThingBuilder nestedThingBuilder() {
        return new NestedThingBuilder();
    }

    public NestedThing build() {
        return new NestedThing(flatThing, stringThing);
    }

    public NestedThingBuilder withFlatThing(FlatThing flatThing) {
        this.flatThing = flatThing;
        return this;
    }

    public NestedThingBuilder withStringThing(String stringThing) {
        this.stringThing = stringThing;
        return this;
    }
}
