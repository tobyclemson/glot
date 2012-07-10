package goforthandbuild.domain;

public class FlatThing {
    private final String firstAttribute;
    private final String secondAttribute;

    public FlatThing(String firstAttribute, String secondAttribute) {
        this.firstAttribute = firstAttribute;
        this.secondAttribute = secondAttribute;
    }

    public String getFirstAttribute() {
        return firstAttribute;
    }

    public String getSecondAttribute() {
        return secondAttribute;
    }
}
