package glot.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@EqualsAndHashCode
@ToString
public class NestedThing {
    @Getter private final FlatThing flatThing;
    @Getter private final String stringThing;
    @Getter private final UnbuildableThing unbuildableThing;

    public NestedThing(FlatThing flatThing, String stringThing, UnbuildableThing unbuildableThing) {
        this.flatThing = flatThing;
        this.stringThing = stringThing;
        this.unbuildableThing = unbuildableThing;
    }
}
