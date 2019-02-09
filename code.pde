//DVD Screensaver
//By TheEpicPotato

import processing.sound.*;

int velX;
int velY;
int vel = 2;
PImage logo;
int x;
int y;
float hue;
int x0;
int y0;
int velX0;
int velY0;
float loop;
int cHits;
int bHits;
int frames;
SoundFile horn;

void setup() {
    
    frameRate(60);
    
    colorMode(HSB);
    
    fill(0, 0, 250);
    textSize(18);
    
    size(1280, 720);
    logo = loadImage("data/logo_b.png");
    logo.resize(240, 122);
    
    horn = new SoundFile(this, "data/horn.wav");
    
    reset();
    
}

void draw() {
    
    background(20);
    
    if (loop != 0) {
        delay(10000);
        reset();
    }
 
    //move logo
    x = x + velX;
    y = y + velY;
    tint(hue, 255, 200);
    image(logo, x, y);
    
    
    //check for corner hit
    if ((x <= 0 || x >= (width - logo.width)) && (y <= 0 || y >= (height - logo.height))) {
        velX = -velX;
        velY = -velY;
        hue = random(0, 255);
        cHits = cHits + 1;
        horn.play();
    }
    //change logo velocity if hit
    else if (x <= 0 || x >= (width - logo.width)) {
        velX = -velX;
        hue = random(0, 255);
        bHits = bHits + 1;
    }
    else if (y <= 0 || y >= (height - logo.height)) {
        velY = -velY;
        hue = random(0, 255);
        bHits = bHits + 1;
    }
    
    if (x == x0 && y == y0 && velX == velX0 && velY == velY0) {
        loop = frames/60;
        textSize(30);
        text("A loop has been detected, starting new simulation", 270, 342);
        textSize(18);
        text("Border Hits: " + bHits, 5, 20);
        text("Corner Hits: " + cHits, 5, 40);
        text("Loop: " + loop + "sec", 5, 60);
    }
    else {
        text("Border Hits: " + bHits, 5, 20);
        text("Corner Hits: " + cHits, 5, 40);
        text("Loop: [No loop detected]", 5, 60);
    }
    
    frames = frames + 1;
    
}

void reset() {

    //get starting pos for logo
    x = int(random(0, width-logo.width));
    y = int(random(0, height-logo.height));
    
    hue = random(0, 255);
    
    //get starting velocity for logo
    if (random(-1, 1) < 0) {
        velX = -vel;
    }
    else {
        velX = vel;
    }
    
    if (random(-1, 1) < 0) {
        velY = -vel;   
    }
    else {
        velY = vel;
    }
    velX0 = velX;
    velY0 = velY;
    x0 = x;
    y0 = y;
    
    frames = 0;
    loop = 0;
    
    bHits = 0;
    cHits = 0;
    
}
