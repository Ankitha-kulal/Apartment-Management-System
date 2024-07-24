<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Clickable Card Buttons</title>
<style>
  body {
    background-color: #f5deb3; /* Light brown background color */
    margin: 0;
    font-family: Arial, sans-serif;
    overflow-y: hidden;
  }

  .stars {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
  }

  .star {
    position: absolute;
    background-color: #ffffff;
    border-radius: 50%;
    width: 2px;
    height: 2px;
    animation: starFall 10s linear infinite;
  }

  .star:nth-child(1) {
    top: -10%;
    left: 10%;
    animation-delay: 0s;
  }

  .star:nth-child(2) {
    top: -10%;
    left: 20%;
    animation-delay: 1s;
  }

  .star:nth-child(3) {
    top: -10%;
    left: 30%;
    animation-delay: 2s;
  }

  /* Add more stars as needed */

  @keyframes starFall {
    0% {
      transform: translateY(-100vh);
    }
    100% {
      transform: translateY(100vh);
    }
  }

  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .card {
    background: linear-gradient(45deg, #ffffff, #f9f9f9); /* Light gradient fill */
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 25px;
    margin: 10px;
    width: 200px;
    text-align: center;
    transition: all 0.3s ease;
    cursor: pointer;
    overflow: hidden;
    text-decoration: none;
    color: #8b0000; /* Dark pink heading color */
  }

  .card:hover {
    transform: scale(1.05);
    background-color: #ccffff; /* Lighter blue on hover */
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
  }

  .card h2 {
    margin-top: 0;
    font-size: 24px;
    margin-bottom: 10px;
  }

  .card p {
    color: #666;
    margin-bottom: 20px;
  }

  .card button {
    background-color: #8b0000; /* Dark pink button color */
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .card button:hover {
    background-color: #a52a2a; /* Slightly lighter shade on hover */
  }
</style>
</head>
<body>
<div class="stars">
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <!-- Add more stars as needed -->
</div>
<div class="container">
  <a class="card animated" style="animation-delay: 0.2s;">
    <form action="login_servlet" method="post">
      <!-- Your form inputs for resident-related actions -->
      <input type="hidden" name="action" value="residentAction" > <!-- Specify the action to be performed -->
      <h2>Resident</h2>
      <p>Click to view Resident details</p> 
      <button type="submit">Click here</button>
    </form>
  </a>
  <a class="card animated" style="animation-delay: 0.2s;">
    <form action="unit_servlet" method="post">
      <!-- Your form inputs for unit-related actions -->
      <input type="hidden" name="action" value="unitAction" > <!-- Specify the action to be performed -->
      <h2>Unit</h2>
      <p>Click to view Unit details</p> 
      <button type="submit">Click here</button>
    </form>
 
    </a>
  <a class="card animated" style="animation-delay: 0.2s;">
    <form action="room_servlet" method="post">
      <!-- Your form inputs for room-related actions -->
      <input type="hidden" name="action" value="roomAction" > <!-- Specify the action to be performed -->
      <h2>Room</h2>
      <p>Click to view Room details</p> 
      <button type="submit">Click here</button>
    </form>
  </a>
</div>
</body>
</html>
