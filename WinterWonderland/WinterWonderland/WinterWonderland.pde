import java.util.Arrays;

boolean[] objectsOn;
boolean mouseClicked;
StartPage starter;
Runner run;

void setup () {
    size (1600, 900);
    //surface.setResizable (true);
    frameRate (60);
    noStroke ();
    smooth ();
    objectsOn = new boolean [9];
    starter = new StartPage ();
    starter.Init (new boolean[0]);
}

void draw () {
    println (frameRate);
    noStroke ();
    smooth ();
    background (#DEDEDE); 
    if (run != null) {
        run.WindChange ();
        run.Run (objectsOn);
    } else
        starter.Run (objectsOn);
}

void mousePressed () {
    mouseClicked = true;
}

void mouseReleased () {
    mouseClicked = false;
}

float MouseOffset () {
    float MouseOffset = 0;
    if (mouseX > width / 2) 
        MouseOffset = 100;
    else if (mouseX < width / 2) 
        MouseOffset = -100;

    return MouseOffset;
}
