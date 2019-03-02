class StartButton extends UI {
    StartButton (float x, float y, float xSize, float ySize) {
        super (x, y, xSize, ySize);
    }

    void OnClick () {
        run = new Runner ();
        run.Init (objectsOn);
    }

    void OnRelease () {
    }

    void Display () {
        fill (0);
        textAlign (CENTER, CENTER);
        textSize (locData[2]);
        text ("Start!", locData[0], locData[1]);
    }

    float[] PosShift (float[] array) {
        for (int i = 0; i < array.length; i++)
            array[i] = locData[2 + i] * 2;
        return array;
    }
}
