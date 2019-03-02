class TextBox extends UI {
    int counter;
    boolean clicked, changed;
    String text, defText;
    Integer dependency;
    TextBox (float x, float y, float xSize, float ySize, String defaultText, String definitionText) {
        super (x, y, xSize, ySize);
        clicked = false;
        changed = false;
        text = defaultText;
        defText = definitionText;
        counter = 30;
    }

    void OnClick () {
        if (!changed) {
            clicked = !clicked;
            changed = true;
        }
    }

    void OnRelease () {
        changed = false;
    }

    void Display () {
        if ((objectsOn[dependency != null ? dependency : 0] || dependency == null) && !defText.equals("")) {
            if (clicked) {
                counter--;
                if (counter <= 0) 
                    DrawBox ();

                if (counter <= -30)
                    counter = 30;
            } else {
                DrawBox ();
                counter = 30;
            }
            
            textAlign (LEFT, CENTER);
            textSize ((locData[2] + locData[3]) / 4);
            text (defText, locData[0] + locData[2] * 1.2, locData[1] - locData[3] / 4);
             
            textAlign (CENTER, CENTER);
            text (text, locData[0], locData[1] - locData[3] / 4);
        }
    }

    void DrawBox () {
        stroke (0);
        line (locData[0] - locData[2], locData[1] - locData[3], locData[0] + locData[2], locData[1] - locData[3]);
        line (locData[0] + locData[2], locData[1] - locData[3], locData[0] + locData[2], locData[1] + locData[3]);
        line (locData[0] + locData[2], locData[1] + locData[3], locData[0] - locData[2], locData[1] + locData[3]);
        line (locData[0] - locData[2], locData[1] + locData[3], locData[0] - locData[2], locData[1] - locData[3]);
        noStroke ();
    }

    void SetDependency (Integer dep) {
        dependency = dep;
    }

    float[] PosShift (float[] array) {
        for (int i = 0; i < array.length; i++)
            array[i] = locData[2 + i] * 2;
        return array;
    }
}
