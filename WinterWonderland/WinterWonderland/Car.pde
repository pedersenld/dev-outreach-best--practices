class Car extends All {
    float speed;
    int dir;
    Car (float x, float y, float xSize, int direction) {
        super (x, y, xSize, xSize, random (0, 255), random (0, 255), random (0, 255), random (0, 255), random (0, 255), random (0, 255));
        speed = random (2, 20);
        dir = direction;
    }

    void Move () {
        locData[0] += speed * dir;
    }

    void Display () {
        fill (colour[0], colour[1], colour[2]);

        quad (
            locData[0] - locData[2] / 2, locData[1] - locData[3] / 8, 
            locData[0] + locData[2] / 2, locData[1] - locData[3] / 8, 
            locData[0] + locData[2] / 2, locData[1] + 3 * locData[3] / 8, 
            locData[0] - locData[2] / 2, locData[1] + 3 * locData[3] / 8);

        quad (
            locData[0] - locData[2] / 4, locData[1] - locData[3] / 8, 
            locData[0] - locData[2] / 8, locData[1] - locData[3] / 4, 
            locData[0] + locData[2] / 8, locData[1] - locData[3] / 4, 
            locData[0] + locData[2] / 4, locData[1] - locData[3] / 8);

        fill (colour[3], colour[4], colour[5]);
        ellipse (locData[0] - locData[2] / 2, locData[1] + 3 * locData[3] / 8, locData[2] / 4, locData[3] / 4);
        ellipse (locData[0] + locData[2] / 2, locData[1] + 3 * locData[3] / 8, locData[2] / 4, locData[3] / 4);
    }
}
