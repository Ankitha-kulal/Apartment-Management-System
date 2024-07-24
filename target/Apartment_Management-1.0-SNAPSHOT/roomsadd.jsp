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
            padding: 30px; /* Reduced padding */
            width: 600px; /* Adjusted width */
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
            display: inline-block; /* Adjust label display */
            width: 120px; /* Fixed width for labels */
        }

        input, select {
            width: calc(100% - 140px); /* Adjust input width */
            padding: 8px; /* Padding for inputs */
            box-sizing: border-box;
            border: 1px solid #8b0000; /* Dark pink border for input fields */
            border-radius: 8px;
            font-size: 14px; /* Reduced font size */
            background: linear-gradient(45deg, #f9f9f9, #ffffff); /* Light gradient fill inside text boxes */
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
        <h2>Add Room Details</h2>
        <form action="addroom" method="post">
            <table>
                <tr>
                    <td class="input-group">
                        <label for="room_number">Room Number</label>
                        <input type="number" id="room_number" name="room_number" placeholder="Room Number" required>
                    </td>
                    <td class="input-group">
                        <label for="square_foot">Square Footage</label>
                        <input type="number" id="square_foot" name="square_foot" placeholder="Square Footage" required>
                    </td>
                </tr>
                <tr>
                    <td class="input-group">
                        <label for="room_type">Room Type</label>
                        <select id="room_type" name="room_type" required>
                            <option value="" disabled selected hidden>Select Type</option>
                            <option value="1BHK">1BHK</option>
                            <option value="2BHK">2BHK</option>
                            <option value="3BHK">3BHK</option>
                        </select>
                    </td>
                
                    <td class="input-group">
                        <label for="monthly_rent">Monthly Rent</label>
                        <input type="number" id="monthly_rent" name="monthly_rent" placeholder="Monthly Rent" required>
                    </td>
                </tr>

                <tr>
                    <td class="input-group">
                        <label for="room_status">Room Status</label>
                        <select id="room_status" name="room_status" required>
                            <option value="" disabled selected hidden>Select Status</option>
                            <option value="Vacant">Vacant</option>
                            <option value="Occupied">Occupied</option>
                            
                        </select>
                    </td>
                
                    <td class="input-group">
                        <label for="amenities">Amenities</label>
                        <input type="text" id="amenities" name="amenities" placeholder="Amenities"  required>
                    </td>
                </tr>
               <tr>
                    <td class="input-group">
                        <label for="unit_id">Unit Id</label>
                        <input type="number" id="unit_id" name="unit_id" placeholder="Unit Id" required>
                    </td>
                    <td class="input-group">
                        <label for="resident_id">Resident Id</label>
                        <input type="number" id="resident_id" name="resident_id" placeholder="Resident Id" required>
                    </td>
                </tr>
            </table>
            <button type="submit">Add</button>
        </form>
    </div>
</body>
</html>
