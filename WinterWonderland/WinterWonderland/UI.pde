abstract class UI {
    float[] locData;

    UI (float x, float y, float xSize, float ySize) {
        locData = new float [4];
        locData[0] = x;
        locData[1] = y;
        locData[2] = xSize;
        locData[3] = ySize;
    }

    boolean OnElement () {
        float[] shift = new float [2];
        shift = PosShift (shift);
        if (mouseX >= locData[0] - shift[0] && mouseX <= locData[0] + shift[0] && mouseY >= locData[1] - shift[1] && mouseY <= locData[1] + shift[1])
            return true;
        else
            return false;
    }

    void MousePress () {
        if (mouseClicked)
            if (OnElement())
                OnClick ();

        if (!mouseClicked)
            if (OnElement())
                OnRelease ();
    }

    abstract void OnClick ();
    abstract void OnRelease ();
    abstract void Display ();
    abstract float[] PosShift (float[] array);
}
