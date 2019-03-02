class Runner implements StartRun {
    float[] windSpeed;
    int[] number;
    int delayCreate;
    ArrayList <Snow> flake = new ArrayList <Snow>();
    Tree[] tree;
    Snowman[] snowman;
    RecursiveTree[] rtree;
    RandRecursiveTree[] randrtree;
    RoadLine[] line;
    Road road;
    Car car;

    Runner () {
        delayCreate = (int)(random (10, 35));
        windSpeed = new float [2];
        /*
            number index
         0: snowmen
         1: trees
         2: snowflakes
         3: Recursive trees
         4: Random Recursive trees
         5: Road Lines
         */
        number = new int [6];
        number[0] = (int)(random (10, 20));
        number[1] = (int)(random (20, 40));
        number[2] = (int)(random (20, 45));
        number[3] = (int)(random (1, 3));
        number[4] = (int)(random (1, 3));
        number[5] = (int)(random (10, 30));

        snowman = new Snowman[number[0]];
        tree = new Tree[number[1]];
        rtree = new RecursiveTree[number[3]];
        randrtree = new RandRecursiveTree[number[4]];
        line = new RoadLine[number[5]];
    }

    void WindChange () {
        if (keyPressed) {
            if (key == CODED) {
                if (keyCode == LEFT) {
                    windSpeed[0]--;
                    windSpeed[1] += 0.2;
                }

                if (keyCode == RIGHT) {
                    windSpeed[0]++;
                    windSpeed[1] += 0.2;
                }

                if (keyCode == UP) {
                    windSpeed[1]--;
                    if (windSpeed[1] < 0) 
                        windSpeed[1] = 0;
                }

                if (keyCode == DOWN) 
                    windSpeed[1]++;
            }
            if (key == 'r') {
                windSpeed[0] = 0;
                windSpeed[1] = 0;
            }
        }
        if (windSpeed[0] > 29) 
            windSpeed[0] = 29;

        if (windSpeed[0] < -29) 
            windSpeed[0] = -29;

        if (windSpeed[1] > 11) 
            windSpeed[1] = 11;
    }

    void Run (boolean[] on) {
        if (on[0])
            road.Display ();

        if (on[0] && on[1]) {
            for (int i = 0; i < number[5]; i++) {
                line[i].CameraShift (MouseOffset ());
                line[i].Display ();
            }
        }

        if (on[0] && on[2]) {
            car.Move ();
            car.CameraShift (MouseOffset ());
            car.Display ();
        }

        if (on[3]) {
            for (int i = 0; i < number[1]; i++) {
                tree[i].CameraShift (MouseOffset ());
                tree[i].Display ();
            }
        }

        if (on[4]) {
            for (int i = 0; i < number[3]; i++) {
                rtree[i].RecursiveCameraShift (MouseOffset ());
                rtree[i].Display ();
            }
        }

        if (on[5]) {
            for (int i = 0; i < number[4]; i++) {
                randrtree[i].RecursiveCameraShift (MouseOffset ());
                randrtree[i].Display ();
            }
        }

        if (on[6]) {
            for (int i = 0; i < number[0]; i++) {
                snowman[i].CameraShift (MouseOffset ());
                snowman[i].Display ();
            }
        }

        if (on[7]) {
            for (int i = 0; i < flake.size (); i++) {
                flake.get (i).Move ();
                flake.get (i).CameraShift (MouseOffset ());
                flake.get (i).WindShift (windSpeed);
                flake.get (i).Display ();
                boolean minus = flake.get (i).Kill (i);
                if (minus) 
                    i--;
            }
            if (delayCreate <= 0) {
                int oldArraySize = flake.size ();
                for (int i = 0; i < number[2]; i++) {
                    flake.add (new Snow (random (-(width / 2), width + width / 2), random (-30, -5), random ((width + height) / 600, (width + height) / 180)));
                    flake.get (i + oldArraySize).Display ();
                }
                delayCreate = (int)(random (10, 35));
            }
        }

        if (windSpeed[1] > 0) 
            delayCreate -= windSpeed[1] * 2;
        else 
        delayCreate -= 1;
    }

    /*
    on reference
     [0]: Road
     [1]: Road Lines
     [2]: Car
     [3]: Normal Trees
     [4]: Recursive Trees
     [5]: Random Recursive Trees
     [6]: Snowmen
     [7]: Snowflakes
     */
    void Init(boolean[] on) {
        float whsum = width + height;
        float roadSize = random (height / 8, height / 5.6666666666);
        float gap = ((width + width * 1.5) / (number[5] * 2));
        float[] colour = {random (200, 255), random (random (200, 255) - 10, random (200, 255) + 20), random (0, 25)};
        if (on[0]) {
            road = new Road (random (height / 1.6, height / 1.3333333333), roadSize);
            road.Display ();
        }

        if (on[0] && on[1]) {
            for (int i = 0; i < number[5]; i++) {
                line[i] = new RoadLine (-width / 2 + i * gap * 2, road.locData[1] + roadSize / 2, gap, roadSize / 10, colour[0], colour[1], colour[2]);
                line[i].Display ();
            }
        }

        if (on[0] && on[2]) {
            car = new Car (random (0 - width / 2, width * 1.5), road.locData[1] + roadSize / 2, roadSize, (int)(random (0, 2)) < 1 ? -1 : 1);
            car.Display ();
        }

        if (on[3]) {
            for (int i = 0; i < number[1]; i++) {
                float treeSize = random (whsum / 18, whsum / 7.2);
                tree[i] = new Tree (random (-width / 2, width * 1.5), random (0, height / 1.333333333 - treeSize * 1.2), treeSize, i);
                tree[i].Display ();
            }
        }

        if (on[4]) {
            for (int i = 0; i < number[3]; i++) {
                rtree[i] = new RecursiveTree (random (-width * 1.5, width / 2), random (height / 6, height / 4), random (whsum / 15, whsum / 9));
                rtree[i].Display ();
            }
        }

        if (on[5]) {
            for (int i = 0; i < number[4]; i++) {
                randrtree[i] = new RandRecursiveTree (random(-width * 1.5, width / 2), random (height / 6, height / 4), random (whsum / 15, whsum / 9));
                randrtree[i].Display ();
            }
        }

        if (on[6]) {
            for (int i = 0; i < number[0]; i++) {
                snowman[i] = new Snowman (random (-width / 2, width * 1.5), random(height / 1.3333333333, height / 1.14), random (whsum / 60, whsum / 15), i);
                snowman[i].Display ();
            }

            for (int i = 0; i < number[0]; i++)
                snowman[i].CheckCol ();
        }

        if (on[7]) {
            for (int i = 0; i < number[2] * 20; i++) {
                flake.add (new Snow (random (-width / 2, width * 1.5), random (-30, height), random (whsum / 600, whsum / 180)));
                flake.get (i).Display ();
            }
        }
    }
}
