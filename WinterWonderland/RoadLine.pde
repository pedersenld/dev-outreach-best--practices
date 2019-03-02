class RoadLine extends All {
    RoadLine (float x, float y, float xSize, float ySize, float r, float g, float b) {
        super (x, y, xSize, ySize, r, g, b);
    }

    void Display () {
        fill (colour[0], colour[1], colour[2]);
        rect (locData[0], locData[1], locData[2], locData[3]);
    }
}
