<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bank System - User Registration</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #e0e0e0;
        }

        .container {
            background-color: #1a1a1a;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 0 30px rgba(0, 255, 200, 0.1);
            width: 100%;
            max-width: 480px;
            animation: fadeIn 0.6s ease;
            
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            color: #00e676;
        }

        .alert {
            background-color: #ff4c4c;
            color: white;
            padding: 12px;
            text-align: center;
            border-radius: 8px;
            font-weight: bold;
            margin-bottom: 20px;
            box-shadow: 0 0 10px #ff4c4c66;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #bbb;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            background: #2a2a2a;
            border: none;
            border-radius: 10px;
            color: #fff;
            transition: border 0.3s ease;
        }

        input:focus {
            border: 2px solid #00e676;
            outline: none;
        }

        .submit-btn {
            width: 100%;
            background: linear-gradient(to right, #00e676, #1de9b6);
            color: #000;
            padding: 14px;
            font-size: 17px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .submit-btn:hover {
            background: linear-gradient(to right, #69f0ae, #00ffc8);
            transform: scale(1.03);
        }

        @media (max-width: 500px) {
            .container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 24px;
            }
        }
        
        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
        }

        .back-button button {
            background-color: transparent;
            border: none;
            font-size: 24px;
            color: #00ffff;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .back-button button:hover {
            transform: scale(1.2);
        }

    </style>
</head>
<body>
    
    
      <div class="back-button">
    <button onclick="history.back()" title="Go Back">🔙</button>
    </div>
    <div class="container">
        <h2>Register New Account</h2>

        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
            <div class="alert"><%= error %></div>
        <% } %>

        <form action="RegisterServlet" method="post">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>
            </div>
            <button type="submit" class="submit-btn">Register</button>
        </form>
    </div>
</body>
</html>
