float angle = 0;
float radius = 100;
float centerX, centerY;
void setup() {  size(400, 400);
  centerX = width / 2;
  centerY = height / 2;
}
void draw() {
  background(0);
  // Draw the circle
  ellipse(centerX, centerY, radius * 2, radius * 2);
  // Calculate the moving point's position
  float x = centerX + radius * cos(angle);
  float y = centerY + radius * sin(angle);
  // Draw the moving point
  fill(255);
  ellipse(x, y, 10, 10);
  // Draw lines on x and y axis
  stroke(0);
  line(x, y, x, centerY); // Vertical line
  line(x, y, centerX, y); // Horizontal line
  line(width/2,0,width/2,height);
line(0,height/2,width,height/2);
  // Update the angle for the next frame
  angle += 0.02;
} 
