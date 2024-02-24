public void setup()
{  
  size(512, 512);    
  background(0);
  
  noFill();
 
  stroke(0, 0, 255);
  ellipse(256, 400, 100, 100);
  
  noStroke();
  fill(0);
  rect(0, 512, 512, 400);
 
  stroke(0,255,0); 
  drawBranches(256, 600, 88, 3*Math.PI/2, .8, 5, 1);  //floor
}
public void draw()
{  
  //this needs to exist for everything to work despite being empty. crazy
}

public void mousePressed() {  
  stroke(255 + (400 - mouseY), 0, 0);
  if(mouseY >= 415) {
    line(mouseX, mouseY, mouseX, mouseY - 16);
    drawBranches(mouseX, mouseY - 16, 56, 3*Math.PI/2, .2, 1, .5);
  }
}

public void drawBranches(int x,int y, double branchLength, double angle, double fractionLength, int smallestBranch, double branchAngle)
{ 
  double angle1 = angle + branchAngle;  
  double angle2 = angle - branchAngle;  
 
  branchLength *= fractionLength;
 
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);  
 
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
 
  if (branchLength > smallestBranch) {drawBranches(endX1, endY1, branchLength, angle, fractionLength, smallestBranch, branchAngle);}
  if (branchLength > smallestBranch) {drawBranches(endX2, endY2, branchLength, angle, fractionLength, smallestBranch, branchAngle);}
} 
