class Snowman extends All {
    int id;
    Snowman (float x, float y, float xSize, int i) {
        super (x, y, xSize, xSize, random (0, 255), random (0, 255), random (0, 255), random (0, 255), random (0, 255), random (0, 255));
        id = i;
    }

    void Display () {
        ///Body
        fill (255);
        ellipse (locData[0], locData[1] + locData[3], locData[2] * 1.5, locData[3] * 1.5);
        ellipse (locData[0], locData[1], locData[2], locData[3]);
        ellipse (locData[0], locData[1] - locData[3] * .5, locData[2] * .5, locData[3] * .5);

        ///Hat
        fill (colour[0], colour[1], colour[2]);
        rect (locData[0] - locData[2] * .25, locData[1] - locData[3] * .8, locData[2] * 0.5, locData[3] * .125);
        rect (locData[0] - locData[2] * .125, locData[1] - locData[3], locData[2] * .25, locData[3] * .25);

        /////Eyes and Buttons ans Smile
        fill (colour[3], colour[4], colour[5]);
        ellipse (locData[0], locData[1] - locData[3] * .2, locData[2] * .08, locData[3] * .08);
        ellipse (locData[0], locData[1] + locData[3] * .1, locData[2] * .08, locData[3] * .08);

        ///Eyes
        ellipse (locData[0] - locData[2] * .1, locData[1] - locData[3] * .6, locData[2] * .1, locData[3] * .1);
        ellipse (locData[0] + locData[2] * .1, locData[1] - locData[3] * .6, locData[2] * .1, locData[3] * .1);

        ///Smile
        ellipse (locData[0] - locData[2] * .12, locData[1] - locData[3] * .45, locData[2] * .08, locData[3] * .08);
        ellipse (locData[0] + locData[2] * .12, locData[1] - locData[3] * .45, locData[2] * .08, locData[3] * .08);
        ellipse (locData[0] - locData[2] * .08, locData[1] - locData[3] * .38, locData[2] * .08, locData[3] * .08);
        ellipse (locData[0] + locData[2] * .08, locData[1] - locData[3] * .38, locData[2] * .08, locData[3] * .08);
        ellipse (locData[0], locData[1] - locData[3] * .35, locData[2] * .08, locData[3] * .08);
    }

    void CheckCol () {
        for (int i = 0; i < id - 1; i++) {
            if (locData[0] + locData[2] * 1.5 >= run.snowman[i].locData[0] - locData[2] * 1.5 && locData[0] + locData[2] * 1.5 <= run.snowman[i].locData[0] + locData[2] * 1.5) {
                locData[0] = random (-width/2, width * 1.5);
                CheckCol ();
            }
        }
    }
}
