<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Amount</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #141e30, #243b55);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #1e1e1e;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
            text-align: center;
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        h2 {
            color: #00e676;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: 16px;
            color: #bbb;
            text-align: left;
        }

        input[type="number"] {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: none;
            background-color: #2a2a2a;
            color: #fff;
            font-size: 16px;
            margin-bottom: 20px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            background: linear-gradient(to right, #00e676, #1de9b6);
            border: none;
            border-radius: 10px;
            color: #000;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #69f0ae, #00ffc8);
            transform: scale(1.03);
        }

        .success {
            color: #00ffc8;
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 20px;
            text-shadow: 0 0 10px #00ffc8;
        }

        @media (max-width: 500px) {
            .container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 22px;
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
        <h2>Add Amount</h2>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <div class="success"><%= message %></div>
        <% } %>

        <form action="AddAmountServlet" method="post">
            <label for="amount">Enter Amount:</label>
            <input type="number" name="amount" id="amount" required min="1" placeholder="e.g. 500">
            <input type="submit" value="Add Amount">
        </form>
    </div>
</body>
</html>
