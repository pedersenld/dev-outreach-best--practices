import java.util.Arrays;

boolean[] objectsOn;
boolean mouseClicked;
StartPage starter;
Runner run;

void setup () {
    /*
    function header
    Explain what this function do always do this for functions
    */
    size (800, 800);
    // when we comment something with double back slash
    // leave atleast one space between comment and the double slash
    // surface.setResizable (true);
    frameRate (60);  // you can also comment like these with two spaces between code and comment
    noStroke ();
    smooth ();
    objectsOn = new boolean [9];
    starter = new StartPage ();
    starter.Init (new boolean[0]);
}

void draw () {
    /*
    function header
    Explain what this function do
    */
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
    // usually we don't use the same name of the function and the variable
    // this may cause confusion whether you are using the function of the variable
    float MouseOffset = 0;
    if (mouseX > width / 2) 
        MouseOffset = 100;
    else if (mouseX < width / 2) 
        MouseOffset = -100;

    return MouseOffset;
}
