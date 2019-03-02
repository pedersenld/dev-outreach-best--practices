class Snow extends All {
    float[] shift;
    float choice;
    Snow (float x, float y, float r) {
        super (x, y, r, r);
        shift = new float [2];
        shift[0] = random (1, 6);
        shift[1] = random (1, locData[3]);
        choice = random (0, 2);
    }

    void Move () {
        locData[1] += shift[1] * 0.5;
        if (choice < 1) 
            locData[0] -= shift[0] * 0.2;
        else if (choice > 1) 
            locData[0] += shift[0] * 0.2;
    }

    void WindShift (float[] windSpeed) {
        locData[0] += windSpeed[0] * (sqrt (locData[3]) / 10);
        locData[1] += windSpeed[1] * (sqrt (locData[3]) / 8);
    }

    boolean Kill (int i) {
        if (locData[1] > height) {
            run.flake.remove (i);
            return true;
        }
        return false;
    }

    void Display () {
        fill (255);
        ellipse (locData[0], locData[1], locData[2], locData[3]);
    }
}
