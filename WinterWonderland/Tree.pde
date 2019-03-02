class Tree extends All {
    int id;
    Tree (float x, float y, float xSize, int i) {
        super (x, y, xSize, xSize, random (25, 50), random (75, 150), random (15, 50));
        id = i;
    }

    void Display() {
        fill (#6F3F10);
        rect (locData[0], locData[1], locData[2] * .2, locData[3]);
        fill (colour[0], colour[1], colour[2]);
        for (int i = 0; i < 5; i++) 
            triangle (locData[0] + locData[2] * .1, 
                      (locData[1] + locData[3] * .4) - (i * locData[3] * .1 + locData[3] * .2), 
                      locData[0] + locData[2] * .4, 
                      (locData[1] + locData[3] * .85) - (i * locData[3] * .1 + locData[3] * .2), 
                      locData[0] - locData[2] * .25, 
                      (locData[1] + locData[3] * .85) - (i * locData[3] * .1 + locData[3] * .2));
    }
}
