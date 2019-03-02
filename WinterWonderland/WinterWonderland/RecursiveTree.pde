class RecursiveTree extends All {
    float rotateDeg;
    int num, maxBranchNum;
    RecursiveTree (float x, float y, float xSize) {
        super (x, y, xSize, xSize);
        rotateDeg = random (20, 40);
        maxBranchNum = (int)(random (15, 45));
    }

    void Display () {
        num = 0;
        fill (#C18E27);
        pushMatrix ();
        translate (width - (locData[0] * -1), height - locData[1]);
        rect (0 - locData[2] * 0.05, 0, locData[2] * 0.1, -locData[3]);
        translate (0, -locData[3]);
        Recurse (locData[3], num, maxBranchNum);
        popMatrix ();
    }

    void Recurse (float sizeNew, int num, int maxNum) {
        ////// (sizeNew *= something) SOMETHING CAN NOT BE MORE THAN 0.85 ISH A) LOOKS TERRIBLE B) TAKES WAY TO LONG TO MAKE & CRASHES AT 0.9ISH
        sizeNew *= 0.78;
        num++;
        if (sizeNew > 3 && num < maxNum) {
            pushMatrix ();
            rotate (radians (rotateDeg));
            rect (0 - sizeNew * 0.1, 0, sizeNew * 0.2, -sizeNew);
            translate (0, -sizeNew);
            Recurse (sizeNew, num, maxNum);
            popMatrix ();

            pushMatrix ();
            rotate (-radians (rotateDeg));
            rect (0 - sizeNew * 0.1, 0, sizeNew * 0.2, -sizeNew);
            translate (0, -sizeNew);
            Recurse (sizeNew, num, maxNum);
            popMatrix ();
        }
    }
}
