<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Balance</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #141e30, #243b55);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
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
            text-align: center;
            max-width: 450px;
            width: 90%;
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        h2 {
            font-size: 26px;
            margin-bottom: 30px;
            color: #00e676;
        }

        .balance {
            font-size: 36px;
            font-weight: bold;
            color: #00ffc8;
            text-shadow: 0 0 10px #00ffc8, 0 0 20px #00ffc8;
            margin-top: 10px;
        }

        .rupee-icon {
            font-size: 26px;
            vertical-align: middle;
        }

        @media (max-width: 500px) {
            .container {
                padding: 30px 20px;
            }

            .balance {
                font-size: 30px;
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
        <h2>Your Current Account Balance</h2>
        <div class="balance">
            ₹ <%= request.getAttribute("balance") %>
        </div>
    </div>
</body>
</html>
