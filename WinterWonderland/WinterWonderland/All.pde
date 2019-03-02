abstract class All implements AllInter {
    float[] locData, colour;

    // The basic constructor for all non-UI objects
    All (float x, float y, float xSize, float ySize) {
        locData = new float [4];
        locData[0] = x;
        locData[1] = y;
        locData[2] = xSize;
        locData[3] = ySize;
    }

    // Basic constructor with a colour array
    All (float x, float y, float xSize, float ySize, float r, float g, float b) {
        locData = new float [4];
        colour = new float [3];
        locData[0] = x;
        locData[1] = y;
        locData[2] = xSize;
        locData[3] = ySize;
        colour[0] = r;
        colour[1] = g;
        colour[2] = b;
    }

    // Basic constructor with a double size colour array for more variance
    All (float x, float y, float xSize, float ySize, float r, float g, float b, float r1, float g1, float b1) {
        locData = new float [4];
        colour = new float [6];
        locData[0] = x;
        locData[1] = y;
        locData[2] = xSize;
        locData[3] = ySize;
        colour[0] = r;
        colour[1] = g;
        colour[2] = b;
        colour[3] = r1;
        colour[4] = g1;
        colour[5] = b1;
    }

    //Shift everything other than recursive trees
    void CameraShift (float offset) {
        if (mouseClicked) 
            locData[0] -= offset * 0.1;

        if (locData[0] > width * 1.5) 
            locData[0] = width - (width * 1.5);

        if (locData[0] < width - (width * 1.5)) 
            locData[0] = width * 1.5;
    }

    //Shift the recursive trees because they're backwards for some reason
    void RecursiveCameraShift (float offset) {
        if (mouseClicked) 
            locData[0] -= offset * 0.1;

        if (locData[0] > width / 2) 
            locData[0] = -(width * 1.5);

        if (locData[0] < -(width * 1.5)) 
            locData[0] = width / 2;
    }

    abstract void Display ();
}
