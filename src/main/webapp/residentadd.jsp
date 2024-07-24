<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
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
        <h2>Add Resident Details</h2>
        <form action="addresident" method="post">
            <table>
                <tr>
                    <td class="input-group">
                        <label for="resident_first_name">First Name</label>
                        <input type="text" id="resident_first_name" name="first" placeholder="First Name" required>
                    </td>
                    <td class="input-group">
                        <label for="contact">Contact Number</label>
                        <input type="tel" id="contact" name="phno" placeholder="Contact Number" required>
                    </td>
                </tr>
                <tr>
                    <td class="input-group">
                        <label for="resident_last_name">Last Name</label>
                        <input type="text" id="resident_last_name" name="second" placeholder="Last Name" required>
                    </td>
                    <td class="input-group">
                        <label for="apartment_number">Room Number</label>
                        <input type="text" id="apartment_number" name="room_no" placeholder="Room Number" required>
                    </td>
                </tr>
                <tr>
                    <td class="input-group">
                        <label for="date_of_birth">Date of Birth</label>
                        <input type="date" id="date_of_birth" name="dob" required>
                    </td>
                    <td class="input-group">
                        <label for="gender">Gender</label>
                        <select id="gender" name="gen" required>
                            <option value="" disabled selected hidden>Select Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="input-group">
                        <label for="lease_start_date">Lease Start Date</label>
                        <input type="date" id="lease_start_date" name="leasestart" required>
                    </td>
                    <td class="input-group">
                        <label for="lease_end_date">Lease End Date</label>
                        <input type="date" id="lease_end_date" name="leaseend" required>
                    </td>
                    
                </tr>
                <tr>
                    <td class="input-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Email" required>
                    </td>
                    <td class="input-group">
                        <label for="street_address">Street Address</label>
                        <input type="text" id="street_address" name="address" placeholder="Street Address" required>
                    </td>
                    
                </tr>
                <tr>
                    
                    <td class="input-group">
                        <label for="city">City</label>
                        <input type="text" id="city" name="city" placeholder="City" required>
                    </td>
                    <td class="input-group">
                        <label for="pincode">Pinocde</label>
                        <input type="number" id="pincode" name="pincode" placeholder="Pincode" required>
                    </td>
                </tr>
                
            </table>
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
