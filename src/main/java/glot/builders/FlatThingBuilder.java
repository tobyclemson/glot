package glot.builders;

import glot.domain.FlatThing;

import java.lang.String;

public class FlatThingBuilder {
    private String firstAttribute = "Thing 1";
    private String secondAttribute = "Thing 2";
    private String thirdAttribute = "Thing 3";

    public static FlatThingBuilder flatThingBuilder() {
        return new FlatThingBuilder();
    }

    public FlatThing build() {
        return new FlatThing(firstAttribute, secondAttribute, thirdAttribute);
    }

    public FlatThingBuilder withFirstAttribute(String firstAttribute) {
        this.firstAttribute = firstAttribute;
        return this;
    }

    public FlatThingBuilder withSecondAttribute(String secondAttribute) {
        this.secondAttribute = secondAttribute;
        return this;
    }

    public FlatThingBuilder withThirdAttribute(String thirdAttribute) {
        this.thirdAttribute = thirdAttribute;
        return this;
    }
}