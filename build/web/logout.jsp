<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logout - Secure Bank</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(120deg, #0f2027, #203a43, #2c5364);
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
        }

        .card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 40px;
            max-width: 400px;
            width: 100%;
            text-align: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
            border: 1px solid rgba(255, 255, 255, 0.15);
            animation: popIn 0.6s ease;
        }

        @keyframes popIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        h2 {
            font-size: 26px;
            color: #00e5ff;
            margin-bottom: 20px;
        }

        p {
            margin-bottom: 30px;
            font-size: 16px;
            color: #ddd;
        }

        .btn {
            padding: 14px 30px;
            font-size: 16px;
            font-weight: bold;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: #fff;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            background: linear-gradient(to right, #0072ff, #00c6ff);
            transform: scale(1.05);
            box-shadow: 0 0 15px #00e5ff;
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

    <div class="card">
        <h2>You have been logged out</h2>
        <p>Thank you for using Secure Bank.</p>
        <a href="index.jsp" class="btn">Login Again</a>
    </div>

</body>
</html>
