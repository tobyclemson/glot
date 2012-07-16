package glot.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@EqualsAndHashCode
@ToString
public class NestedThing {
    @Getter private FlatThing flatThing;
    @Getter private String stringThing;

    public NestedThing(FlatThing flatThing, String stringThing) {
        this.flatThing = flatThing;
        this.stringThing = stringThing;
    }
}
