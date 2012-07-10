package glot.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;

@EqualsAndHashCode
public class FlatThing {
    @Getter private final String firstAttribute;
    @Getter private final String secondAttribute;
    @Getter private final String thirdAttribute;

    public FlatThing(String firstAttribute, String secondAttribute, String thirdAttribute) {
        this.firstAttribute = firstAttribute;
        this.secondAttribute = secondAttribute;
        this.thirdAttribute = thirdAttribute;
    }
}
