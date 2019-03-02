class Road extends All {
    float roadCol, roadBorderSize, roadBorderCol;
    Road (float y, float ySize) {
        super (0, y, 0, ySize);
        roadCol = random (75, 130);
        roadBorderCol = random (roadCol + 20, 160);
        roadBorderSize = random (locData[3] / 9, locData[3] / 5);
    }

    void Display () {
        fill (roadCol);
        rect (0, locData[1], width, locData[3]);

        fill (roadBorderCol);
        rect (0, locData[1] - roadBorderSize, width, roadBorderSize);
        rect (0, locData[1] + locData[3], width, roadBorderSize);
    }
}
