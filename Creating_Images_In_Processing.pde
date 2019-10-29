/*
This program was created for the students in my processing class, although feel free to share.
The intent of this program is to generate quick prototypes of drawn images in processing. 

                    How to use:
Create an image using the controls described below. While you are creating the image,
the program will generate the code needed to create that image. Copy that code into 
another processing program. Hit the play button and see your image fully created 
through Processing code.

                    Editing Images:
If you are using the program to edit an image, 
set change the variable editingImage (which is beneath this comment) from "false"
to "true" (without the quotation marks). Then put the code of the drawing into the
method called "baseDrawing" between its curly brackets.
Note: Your code cannot have any main processing functions like "setup()" or "draw()".
Note: you cannot have a size() function in your code. If you have a desired size, 
then change the screenWidth variable and the screenHeight variable accordingly.

I.E. editingImage = true;
     screenWidth = 1920;
     screenHeight = 1080;
     
        void baseDrawing(){
              your goes code here (without size() method)
            }
      
                    Controls:
Drawing Modes:
Use the number keys 1-5 to change drawing modes. The mode will show in the console
below. "1" is polygon mode. "2" is circle mode. "3" is line mode. "4" is curved polygon mode. "5" is curved line mode.

To use polygon mode click to create the points on your polygon and hit the "enter" key
to generate the polygon

To use line mode click two points and a line will be generated

To use circle mode, click at the point where you want a circle.

To use curved polygon mode, click twice at the first point then draw your polygon and click twice at the last point. 
After the points of the curved polygon have been placed, hit enter to generate it. 

To use curved line mode, click twice at the first point then draw your line and click twice at the last point. 
After the points of the curved line have been placed, hit enter to generate it. 

Changing Colors:
Use "Q" to increase red
Use "W" to increase green
Use "E" to increase blue
Use "R" to increase alpha (decrease transparency)

Use "A" to decrease red
Use "S" to decrease green
Use "D" to decrease blue
Use "F" to decrease alpha (increase transparency)

Use "V" and click to get the color at the mouse point

Note that "V" does change the drawing mode; so you will need
to change to your preferred drawing mode afterwards

Delete Drawings:
Click "backspace" once to delete drawings and creating a white background

Click "backspace" again to delete drawings and create a background of the shape color

Misc:
To separate your code into sections click "spacebar" (this can help organize code)

Code Creation Date (version 1.0): September 15th 2019
Code Author: Christopher Morel

*/
boolean editingImage = false;
int screenWidth = 640;
int screenHeight = 480;


int drawingType = 1;
boolean changeableType = true;

//variables for drawing polygon
boolean startingDrawing = true;
boolean drawing = false;
boolean endingDrawing = false;
boolean guidingDots = true;

//variables for drawing curve polygon
boolean fillCurvePolygon = true;

//variables for drawing line
int lineX1, lineX2, lineY1, lineY2; 
int timesClicked = 0;
int strokeWidthValue = 1;


//variables for drawing ellipse
int circleSize = 15; 

//variables for colors
int shapeR = 0;
int shapeG = 0;
int shapeB = 0;
int shapeAlpha = 255;
boolean adjustableColors = true;
boolean whiteBackground = true;


FloatList coordinates;

//If you have a base drawing you want to edit, then you can put it in the method below. Note: it only works on still images.
void baseDrawing(){

  //put drawing code in here. Make sure that it does not contain a "size()" method, a "setup()" method or a "draw()" method.
  

}

void settings(){
size(screenWidth, screenHeight);
}
void setup(){
if(!editingImage){
//size(640,480);
smooth();
background(255);
println("//Put this code into a setup method");
println("smooth( );");
println("size("+screenWidth+" ,"+screenHeight+");");
println("background(255);");
}



coordinates = new FloatList();

baseDrawing();

println("//Put this code into a draw method");
}

void draw(){
  drawShape(drawingType);
  if(adjustableColors){
  colorRectangle();
  }
}

void drawShape(int drawingType){
  switch(drawingType){
    case 1:
      startDrawingPolygon();
      break;
    case 2:
      drawCircle();
      break;
     case 3:
     drawLine();
      break;
      case 4:
     startDrawingCurvePolygon();
      break;
      case 5:
     startDrawingCurveLine();
      break;
      case 0:
      //Get color at mouse point
      break;
  }
  
}

void drawPolygon(){
  if(startingDrawing){
    startDrawingPolygon();
  }
  if(drawing){
    fill(shapeR,shapeG,shapeB, shapeAlpha);
  stroke(shapeR,shapeG,shapeB, shapeAlpha);
  println("fill("+shapeR+","+shapeG+","+shapeB+", "+shapeAlpha+");");
  println("stroke("+shapeR+","+shapeG+","+shapeB+", "+shapeAlpha+");");
  println("beginShape();");
    beginShape();
    for (int i =0;i<(coordinates.size()+1/2);i+=2){
      vertex(coordinates.get(i),coordinates.get(i+1));
      println("vertex("+coordinates.get(i)+","+coordinates.get(i+1)+");");
    }
    endShape(CLOSE);
    println("endShape(CLOSE);");
    }
    
}

void startDrawingPolygon(){
  startingDrawing = false;
  drawing = true;
}

void drawCurvePolygon(){
  if(startingDrawing){
    startDrawingPolygon();
  }
  if(drawing){
    
    fill(shapeR,shapeG,shapeB, shapeAlpha);
     println("fill("+shapeR+","+shapeG+","+shapeB+", "+shapeAlpha+");");
    
  stroke(shapeR,shapeG,shapeB, shapeAlpha);
 
  println("stroke("+shapeR+","+shapeG+","+shapeB+", "+shapeAlpha+");");
  println("beginShape();");
    beginShape();
    for (int i =0;i<(coordinates.size()+1/2);i+=2){
      curveVertex(coordinates.get(i),coordinates.get(i+1));
      println("curveVertex("+coordinates.get(i)+","+coordinates.get(i+1)+");");
    }
    endShape(CLOSE);
    println("endShape(CLOSE);");
    
    }
    
}

void startDrawingCurvePolygon(){
  //Make sure that you click twice on the starting and ending points
  startingDrawing = false;
  drawing = true;
}

void drawCurveLine(){
  if(startingDrawing){
    startDrawingCurveLine();
  }
  if(drawing){
    noFill();
    println("noFill();");
    
  stroke(shapeR,shapeG,shapeB, shapeAlpha);
 
  println("stroke("+shapeR+","+shapeG+","+shapeB+", "+shapeAlpha+");");
  println("beginShape();");
    beginShape();
    for (int i =0;i<(coordinates.size()+1/2);i+=2){
      curveVertex(coordinates.get(i),coordinates.get(i+1));
      println("curveVertex("+coordinates.get(i)+","+coordinates.get(i+1)+");");
    }
    endShape();
    println("endShape();");
    
    }
    
}

void startDrawingCurveLine(){
  //Make sure that you click twice on the starting and ending points
  startingDrawing = false;
  drawing = true;
}

void drawCircle(){
 if(startingDrawing){
    startDrawingCircle();
  }
}

void startDrawingCircle(){
  ellipseMode(CENTER);
  println("ellipseMode(CENTER);");
  startingDrawing = false;
  drawing = true;
}

void drawLine(){
 if(startingDrawing){
    startDrawingLine();
  }
}

void startDrawingLine(){
  /*fill(0,0,0);
  ellipseMode(CENTER);
  println("fill(0,0,0);");
  println("ellipseMode(CENTER);");*/
  startingDrawing = false;
  drawing = true;
}


void mouseClicked(){
  if((drawingType == 1) && (drawing)){
    //draw guiding circles
    if(guidingDots){
    fill(shapeR,shapeG,shapeB, shapeAlpha);
    stroke(shapeR,shapeG,shapeB, shapeAlpha);
    ellipse(mouseX, mouseY, 5, 5);
    }
    
    //add mouse coordinates to list
    coordinates.append(mouseX);
    coordinates.append(mouseY);
    
  }else if((drawingType == 4) && (drawing)){
    //draw curved polygon
    //draw guiding circles
    if(guidingDots){
    fill(shapeR,shapeG,shapeB, shapeAlpha);
    stroke(shapeR,shapeG,shapeB, shapeAlpha);
    ellipse(mouseX, mouseY, 5, 5);
    }
    
    //add mouse coordinates to list
    coordinates.append(mouseX);
    coordinates.append(mouseY);
    
  }else if((drawingType == 5) && (drawing)){
    //draw curved line
    //draw guiding circles
    if(guidingDots){
    fill(shapeR,shapeG,shapeB, shapeAlpha);
    stroke(shapeR,shapeG,shapeB, shapeAlpha);
    ellipse(mouseX, mouseY, 5, 5);
    }
    
    //add mouse coordinates to list
    coordinates.append(mouseX);
    coordinates.append(mouseY);
    
  }else if((drawingType == 0) && (drawing)){
    //get color
    color c = get(mouseX,mouseY);
    shapeR = (int)red(c);
    shapeG = (int)green(c);
    shapeB = (int)blue(c);
  } else if((drawingType == 2) && (drawing)){
    //set colors of ellipse
    fill(shapeR,shapeG,shapeB, shapeAlpha);
  stroke(shapeR,shapeG,shapeB, shapeAlpha);
  println("fill("+shapeR+","+shapeG+","+shapeB+", "+shapeAlpha+");");
  println("stroke("+shapeR+","+shapeG+","+shapeB+", "+shapeAlpha+");");
  
  //draw ellipse
  ellipse(mouseX, mouseY, circleSize,circleSize);
  println("ellipse("+mouseX+", "+mouseY+", "+circleSize+","+circleSize+");");
  
  }else if((drawingType == 3) && (drawing)){
  //set colors of line
    timesClicked +=1;
    strokeWeight(strokeWidthValue);
    stroke(shapeR, shapeG, shapeB, shapeAlpha);
    
    println("stroke("+shapeR+", "+shapeG+", "+shapeB+", " +shapeAlpha+");");
    println("strokeWeight("+strokeWidthValue+");");
  //create line
  if(!((timesClicked % 2) == 0)){ 
  //if odd set first point of line
  lineX1 = mouseX;
  lineY1 = mouseY;
  }else  {
  //if even set second point of line and draw line from first and second points
  lineX2 = mouseX;
  lineY2 = mouseY;
  line(lineX1, lineY1, lineX2, lineY2);
  println("line("+lineX1+", "+lineY1+", "+lineX2+", "+lineY2+");");
  
    }
  }else{
  //get the x and y position of the mouse
  println("Mouse X: "+mouseX+" Mouse Y: "+mouseY);

  }
  
}

void colorRectangle(){
  fill(shapeR, shapeG, shapeB);
  stroke(255);
  rectMode(CENTER);
  rect(width*0.05, height*0.05, width*0.05,height*0.05);
}
void keyPressed(){
 if(adjustableColors){
//increase and decrease rgb
  if(key == 'q'){
    shapeR += 10;
  }else if(key == 'w'){
    shapeG += 10;
  }else if(key == 'e'){
    shapeB += 10;
  }else if(key == 'a'){
    shapeR -= 10;
  }else if(key == 's'){
    shapeG -= 10;
  }else if(key == 'd'){
    shapeB -= 10;
  }
  //increase and decrease alpha
  else if(key == 'r'){
    shapeAlpha += 5;
  }else if(key == 'f'){
    shapeAlpha -= 5;
  }
  
 }
 //delete drawings by creating a background
  if (key == BACKSPACE){
    if(whiteBackground){
    background(255,255,255);
    println("background(255,255,255);");
    whiteBackground = false;
    }else{
    background(shapeR,shapeG,shapeB);
    println("background("+shapeR+","+shapeG+","+shapeB+");");
    whiteBackground = true;
    }
  }
  //create a new section
  if(key == ' '){
    println(" ");
    println("//New Section");
    println(" ");
  }
  
  if (changeableType){
  if(key == '1'){
  drawingType = 1;
  println("//switching mode to drawing polygon");
  coordinates.clear();
  }else if(key == '2'){
  drawingType = 2;
  println("//switching mode to drawing circle");
  coordinates.clear();
  }else if(key == '3'){
  drawingType = 3;
  println("//switching mode to drawing line");
  coordinates.clear();
  
  }else if(key == '4'){
  drawingType = 4;
  println("//switching mode to drawing curve polygon");
  coordinates.clear();
  
  }else if(key == '5'){
  //any number that is not 1,2, or 3 uses the mouse coordinates mode
  drawingType = 5;
  println("//switching mode to drawing curve line");
  coordinates.clear();
  
  }else if(key == 'v'){
  //any number that is not 1,2, or 3 uses the mouse coordinates mode
  drawingType = 0;
  println("//switching mode to get color");
  
  }
  }
  
  if((drawingType == 1) && (drawing) && (key == ENTER)){
    //println("coordinates: "+coordinates);
    drawPolygon();
    coordinates.clear();
    
  }
  if((drawingType == 4) && (drawing) && (key == ENTER)){
    //println("coordinates: "+coordinates);
    drawCurvePolygon();
    coordinates.clear();
    
  }
  if((drawingType == 5) && (drawing) && (key == ENTER)){
    //println("coordinates: "+coordinates);
    drawCurveLine();
    coordinates.clear();
    
  }

}
