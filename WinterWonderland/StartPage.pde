class StartPage implements StartRun {
    CheckBox[] toggleBoxes;
    TextBox[] textBoxes;
    StartButton sButton;

    StartPage () {
        toggleBoxes = new CheckBox[8];
        textBoxes = new TextBox[9];
    }

    void Run (boolean[] on) {
        sButton.MousePress ();
        sButton.Display ();

        /*
        for (int i = 0; i < textBoxes.length; i++) {
            textBoxes[i].MousePress ();
            textBoxes[i].Display ();
        }
        */

        for (int i = 0; i < toggleBoxes.length; i++) {
            toggleBoxes[i].MousePress ();
            objectsOn[i] = toggleBoxes[i].SetArray ();
            toggleBoxes[i].Display ();
        }

        /*
        if (mouseClicked) 
            for (int i = 0; i < textBoxes.length; i++)
                if (!textBoxes[i].OnElement ())
                    textBoxes[i].clicked = false;
        */
    }

    void Init (boolean[] on) {
        String[] boxTexts = {"Road", "Road Lines", "Car", "Normal Trees", "Recursive Trees", "Random Recusive Trees", "Snowmen", "Snowflakes"};
        /*
        String[] inputDefaultTexts = {"", "", "", "", "", "", "", "", "1600 x 900"};
        String[] inputDefTexts = {"", "", "", "", "", "", "", "", "Window Size (w x h)"};
        */

        sButton = new StartButton (width / 2, height / 1.15, 48, 48);
        sButton.Display();

        for (int i = 0; i < toggleBoxes.length; i++) {
            /*
            previos code
            toggleBoxes[i] = new CheckBox (width / 10 + (width / 3 + width / 10) * floor (i / 5), height / 10 + (height / 6) * i - (height / 6) * (6 - i / 5) * floor (i / 5), width / 62.5, height / 50, boxTexts[i]);
            */
            toggleBoxes[i] = new CheckBox (width / 10 + (width / 3 + width / 10) * floor (i / 5),
                                           height / 10 + (height / 6) * i - (height / 6) * (6 - i / 5) * floor (i / 5),
                                           width / 62.5, height / 50, boxTexts[i]);
            toggleBoxes[i].Display ();
        }

        // Create dependencies on specific objects being enabled
        toggleBoxes[1].SetRequired (0);
        toggleBoxes[2].SetRequired (0);
        toggleBoxes[5].SetRequired (4);

        /*
        for (int i = 0; i < textBoxes.length; i++) {
            textBoxes[i] = new TextBox (width / 10 + (width / 3 + width / 10) * floor (i / 5), height / 6.5 + (height / 6) * i - (height / 6) * (6 - i / 5) * floor (i / 5), width / 25, height / 100, inputDefaultTexts[i], inputDefTexts[i]);
            textBoxes[i].Display();
            if (i < toggleBoxes.length)
                textBoxes[i].SetDependency (i);
        }
        */
    }
}
