package goforthandbuild.builders;

import goforthandbuild.domain.FlatThing;

import java.lang.String;

public class FlatThingBuilder {
    private String firstAttribute = "Thing 1";
    private String secondAttribute = "Thing 2";

    public FlatThing build() {
        return new FlatThing(firstAttribute, secondAttribute);
    }

    public FlatThingBuilder withFirstAttribute(String firstAttribute) {
        this.firstAttribute = firstAttribute;
        return this;
    }

    public FlatThingBuilder withSecondAttribute(String secondAttribute) {
        this.secondAttribute = secondAttribute;
        return this;
    }
}