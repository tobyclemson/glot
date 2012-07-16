package glot.domain;

import lombok.Getter;

public class UnbuildableThing {
    @Getter private final String name;
    @Getter private final Integer number;

    public UnbuildableThing(String name, Integer number) {
        this.name = name;
        this.number = number;
    }
}
