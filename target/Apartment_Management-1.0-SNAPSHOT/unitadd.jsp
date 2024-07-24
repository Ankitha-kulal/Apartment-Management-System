<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regsiter Room Information</title>
    <style>
        body {
            background-color: #f6f6f6; /* Light gray background color */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow-y: auto; /* Allow vertical scrolling */
        }

        .container {
            background: linear-gradient(45deg, #ffffff, #f9f9f9); /* Light gradient fill */
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(128, 0, 0, 0.3); /* Dark pink shadow */
            padding: 20px; /* Reduced padding */
            max-width: 400px; /* Adjusted max-width */
            text-align: center;
        }

        h2 {
            color: #8b0000; /* Dark pink heading color */
        }

        table {
            width: 100%;
        }

        th, td {
            padding: 10px; /* Padding for cells */
            text-align: left; /* Align text to the left */
        }

        .input-group label {
            display: block; /* Adjust label display */
            margin-bottom: 10px; /* Add space below labels */
            text-align: left; /* Align label text to the left */
        }

        input, select {
            width: 100%; /* Full width for inputs */
            padding: 8px; /* Padding for inputs */
            box-sizing: border-box;
            border: 1px solid #8b0000; /* Dark pink border for input fields */
            border-radius: 8px;
            font-size: 14px; /* Reduced font size */
            background: linear-gradient(45deg, #f9f9f9, #ffffff); /* Light gradient fill inside text boxes */
            margin-bottom: 10px; /* Add space below inputs */
        }

        input::placeholder {
            color: #8b0000; /* Dark pink placeholder color */
        }

        button {
            background-color: #8b0000; /* Dark pink button color */
            color: #ffffff; /* White text color */
            padding: 14px 28px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease; /* Button hover effect */
            width: 100%; /* Full width for button */
        }

        button:hover {
            background-color: #b30000; /* Darker pink on hover */
        }

        .fade-in {
            opacity: 0;
            animation: fadeIn 1s ease-in-out forwards;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container fade-in">
        <h2>Add Floor Details</h2>

        <form action="addunit_servlet" method="post">
            <div class="input-group">
                <label for="floor_number">Floor Number</label>
                <input type="number" id="floor_number" name="floor_number" placeholder="Floor Number" required>
            </div>
            <div class="input-group">
                <label for="no_of_rooms">Total Rooms</label>
                <input type="number" id="no_of_rooms" name="no_of_rooms" placeholder="Total Rooms" required>
            </div>
           
            <div class="input-group">
                <label for="occupancy_status">Occupancy Status</label>
                <select id="occupancy_status" name="occupancy_status" required>
                    <option value="" disabled selected hidden>Select Status</option>
                    <option value="fully">Fully Occupied</option>
                    <option value="partially">Partially Occupied</option>
                    <option value="vacant">Vacant</option>
                </select>
            </div>
            <div class="input-group">
                <label for="unit_amenities">Amenities</label>
                <input type="text" id="unit_amenities" name="unit_amenities" placeholder="Amenities" required>
            </div>
            
            <button type="submit">Add</button>
        </form>
    </div>
</body>
</html>
