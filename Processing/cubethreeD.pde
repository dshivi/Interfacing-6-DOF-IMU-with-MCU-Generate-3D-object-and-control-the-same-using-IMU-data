float pitch = 0;
float roll = 0;
float yaw = 0;
void setup() {
  size(800, 600, P3D);
}
void draw() {
  background(200);
  lights();
  translate(width / 2, height / 2);
  rotateX(pitch);
  rotateY(yaw);
  rotateZ(roll);
  strokeWeight(2);
  stroke(255, 0, 0); // X-axis in red
  line(0, 0, 0, 200, 0, 0);
  stroke(0, 255, 0); // Y-axis in green
  line(0, 0, 0, 0, 200, 0);
  stroke(0, 0, 255); // Z-axis in blue
  line(0, 0, 0, 0, 0, 200);
  strokeWeight(1);
  stroke(0);
  fill(255);
  box(100);
}
void keyPressed() {
  if (keyCode == UP) {
    pitch -= 0.1;
  } else if (keyCode == DOWN) {
    pitch += 0.1;
  } else if (keyCode == LEFT) {
    roll -= 0.1;
  } else if (keyCode == RIGHT) {
    roll += 0.1;
  } else if (key == 'a' || key == 'A') {
    yaw -= 0.1;
  } else if (key == 'd' || key == 'D') {
    yaw += 0.1;
  }
}
