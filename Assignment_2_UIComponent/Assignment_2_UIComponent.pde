import controlP5.*;

ControlP5 cp5;
ColorPicker cp;
int sliderValue = 100;
int sliderTicks1 = 100;
int col = color(255);

boolean toggleValue = false;


Textlabel A;
ControlTimer c;
Textlabel t;
Chart myChart;
Slider abc;

    
    
float x; // Declare X
float y; // Declare Y
float easing = 0.05;
boolean drawT = false;

void setup() { // Set UI

cp5 = new ControlP5(this); // Added for UI Component
//cp5 = new ControlP5(this);
//Components Added
  size(800, 400); // Size of Gtage
  cursor (WAIT); // Mouse Cursor
  println(mouseX + " : " + mouseY);
  fill(0);
  
  
   // create a toggle                   UI 1: Toggle
  cp5.addToggle("toggleValue")
     .setPosition(40,250)
     .setSize(50,20)
     ;
  
  // create a toggle and change the default look to a (on/off) switch look
  cp5.addToggle("toggle")
     .setPosition(40,250)
     .setSize(50,20)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     ;

  
  cp5 = new ControlP5(this); //         UI 2: Color Picker
  cp = cp5.addColorPicker("picker")
          .setPosition(20, 80)
          .setColorValue(color(255, 128, 0, 128));
          

  

               
cp5 = new ControlP5(this); //             UI 3: Slider
  cp5.addSlider("Slider")                                  
     .setPosition(80,350)
     .setWidth(400)
     .setRange(0,550)
     .setValue(128)
     .setNumberOfTickMarks(4)
     .setSliderMode(Slider.FLEXIBLE);
     
     
     cp5 = new ControlP5(this);  //       UI 4: Text
  
  A = cp5.addTextlabel("label")                           
                    .setText("Hello World")
                    .setPosition(300, 240)
                    .setColorValue(000000)
                    .setFont(createFont("Arial",40));
                    
 {
  frameRate(120); //                        UI 5: Frame Rate
  cp5 = new ControlP5(this);
  cp5.addFrameRate().setInterval(10).setPosition(0,height - 10);
  
}
                    
  

 
                    
}



void draw() { 

  background(51);


  fill(sliderValue);
  rect(0,0,width,100);
  
   background(cp.getColorValue());
  fill(0, 80);
  rect(50, 90, 275, 80);

  

  
  
  if (mouseX < 400) {
    fill (237,245,22);
    rect(0, 0, 400, 400); // Left Rectangle
    } 
    
    else {
    fill(245,5,229);
    rect(400, 0, 800, 400); // Right Rectangle
  }
  
  float targetX = mouseX; // Easing
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;    
  
   float ix = mouseX;
  float y = mouseY;
  float x = width - mouseX; // Inverse X
  float iy = height - mouseY; // Inverse Y
  
  
  
  fill(sliderTicks1); //BiggerEllipse
  ellipse(x, height/2, y, y);
  fill(0, 159);
  ellipse(ix, height/2, iy, iy);
  
  
  fill(255, 150);
  ellipse(ix, height/2, y, y);
  fill(0, 159);
  ellipse(ix, height/2, iy, iy);
  
if (mousePressed==true) {
fill(255);
ellipse(x,y,80,80);
}

else {
fill(0,255,240); // If released ball stay to normal size
ellipse(x,y,60,60);
noStroke();
}

 if ((keyPressed == true) && (key == 'a')){ //Keypress A box will appear on Left.
 fill(random(255),random(255),random(255));
 rect(560,150,100,100);
 }
 
 if ((keyPressed == true) && (key == 'd')){ //Keypress A box will appear on right.
 fill(random(255),random(255),random(255)); //Random Color
 rect(160,150,100,100);
 }
 
 if (drawT == true) { // Double T Draw.
 fill(random(255),random(255),random(255));
    rect(90, 80, 220, 80);
    rect(156, 160, 88, 180);
    rect(550, 80, 88, 80);
    rect(550, 160, 88, 180);
  }
}
void keyPressed() { // T appears when keyboard clicked.
  if ((key == 'T') || (key == 't')) {
    drawT = true;
  }

 pushMatrix();
  
  if(toggleValue==true) {
    fill(255,255,220);
  } else {
    fill(128,128,110);
  }
  translate(400,100);
  ellipse(0,0,100,100);
  
  
  translate(600,150);
  fill(col);
  ellipse(0,0,40,40);
  
  popMatrix();
}



void toggle(boolean theFlag) {
  if(theFlag==true) {
    col = color(255);
  } else {
    col = color(100);
  }
  println("You Are Awesome! Have a nice Day");
}


void mouseDragged() { // When mouse clicked + dragged a tiny ball will appear 
fill(random(255),random(255),random(255));
ellipse(mouseX-10,mouseY-10,30,30); 
}

void keyReleased() {
  drawT = false;
  

}
  