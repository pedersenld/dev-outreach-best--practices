class CheckBox extends UI {
    boolean clicked, changed;
    String text;
    Integer required;
    CheckBox (float x, float y, float xSize, float ySize, String t) {
        super (x, y, xSize, ySize);
        clicked = true;
        changed = false;
        text = t;
    }

    void OnClick () {
        if (!changed) {
            clicked = !clicked;
            changed = true;
        }
    }

    void OnRelease () {
        if (changed)
            changed = false;
    }

    void Display () {
        // Box
        stroke (0);
        line (locData[0] - locData[2], locData[1] - locData[3], locData[0] + locData[2], locData[1] - locData[3]);
        line (locData[0] + locData[2], locData[1] - locData[3], locData[0] + locData[2], locData[1] + locData[3]);
        line (locData[0] + locData[2], locData[1] + locData[3], locData[0] - locData[2], locData[1] + locData[3]);
        line (locData[0] - locData[2], locData[1] + locData[3], locData[0] - locData[2], locData[1] - locData[3]);
        noStroke ();

        // Text
        // comment with more understandable words eg. Setting text
        textAlign (LEFT, CENTER);
        textSize (locData[2] + locData[3]);
        text (text, locData[0] + locData[2] * 4, locData[1] - locData[3] / 3);

        // X
        if (clicked) {
            textAlign (CENTER, CENTER);
            textSize (locData[2] + locData[3]);
            text ('X', locData[0] + locData[2] / 16, locData[1] - locData[3] / 4);
        }
    }

    void SetRequired (Integer req) {
        required = req;
    }

    float[] PosShift (float[] array) {
        for (int i = 0; i < array.length; i++)
            array[i] = locData[2 + i];
        return array;
    }

    boolean SetArray () {
        if (required != null)
            if (!objectsOn[required])
                clicked = false;
        return clicked;
    }
}
