int bounce = 0;
String start = "Press any key to start";
boolean showStart = true;
float paddleWidth = 100;
float paddleHeight = 10;
float paddleX; // Paddle's x-coordinate
float ballX, ballY; // Ball's coordinates
float ballSpeedX, ballSpeedY; // Ball's speed components
float ballDia = 20;
boolean gameStarted = false;
boolean gameOver = false;

void setup() {
  size(800, 600);
  textSize(45);
  textAlign(CENTER, CENTER);
  fill(255);
  initializeGame();
}

void draw() {
  background(255);

  if (showStart && !gameStarted && !gameOver) {
    fill(0, 255, 0);
    text(start, width / 2, height / 2);
    return;
  }

  score();

  // Draw paddle
  fill(0, 0, 255);
  rect(paddleX, height - paddleHeight, paddleWidth, paddleHeight);

  // Draw ball
  fill(0);
  ellipse(ballX, ballY, ballDia, ballDia);

  if (gameStarted) {
    ballX += ballSpeedX;
    ballY += ballSpeedY;

    // Wall collisions
    if (ballX <= 0 || ballX >= width) {
      ballSpeedX *= -1;
    }
    if (ballY <= 0) {
      ballSpeedY *= -1;
    }

    // Paddle collision
    if (ballY + ballDia / 2 >= height - paddleHeight &&
        ballX >= paddleX && ballX <= paddleX + paddleWidth) {
      bounce++;
      ballSpeedY *= -1;
    }

    // Ball out of bounds
    if (ballY > height) {
      gameOver = true;
      gameStarted = false;
    }
  }

  if (gameOver) {
    fill(255, 0, 0);
    textSize(45);
    text("Game Over", width / 2, height / 2);
    textSize(32);
    text("Press any key to restart", width / 2, height / 2 + 50);
  }
}

void keyPressed() {
  if (!gameStarted && !gameOver) {
    gameStarted = true;
    showStart = false;
  } else if (gameOver) {
    bounce = 0;
    initializeGame();
  }

  // Paddle movement
  if (keyCode == LEFT && paddleX > 0) {
    paddleX -= 50;
  } else if (keyCode == RIGHT && paddleX < width - paddleWidth) {
    paddleX += 50;
  }
}

void score() {
  fill(122);
  textSize(30);
  textAlign(CENTER, CENTER);
  text("Score: " + bounce, width - 100, 20);
}

void initializeGame() {
  paddleX = width / 2 - paddleWidth / 2;
  ballX = width / 2;
  ballY = height - 50;
  ballSpeedX = random(3, 4);
  ballSpeedY = -random(3, 4);
  gameOver = false;
  gameStarted = false;
  showStart = true;
}
