 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String userName= (String) session.getAttribute("username");   
    String userEmail = (String) session.getAttribute("useremail");

//    if (userEmail== null) {
//        response.sendRedirect("index.jsp");
//        return;
//    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Spark Bank</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            /*background: linear-gradient(to right, #1e3c72, #2a5298);*/
                        background: linear-gradient(to right, #141e30, #243b55);

            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .dashboard-container {
            /*background: rgba(255, 255, 255, 0.08);*/
            padding: 40px 30px;
            border-radius: 20px;
            width: 90%;
            max-width: 1000px;
            text-align: center;
            color: #fff;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4);
            /*animation: fadeIn 1s ease-in-out;*/
            
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(25px);
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.2);
            animation: fadeIn 1s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .bank-header {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .bank-header img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
        }

        .bank-header h1 {
            font-size: 30px;
            font-weight: bold;
            animation: popIn 0.7s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .welcome-msg {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .button-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .btn {
            padding: 18px;
            border: none;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            font-size: 17px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn:hover {
            background: rgba(255, 255, 255, 0.4);
            transform: translateY(-3px);
        }

        .logout-btn {
            background-color: #ff4d4d;
            margin-top: 20px;
        }

        .logout-btn:hover {
            background-color: #ff1a1a;
        }

        .email-display {
            margin-bottom: 30px;
            font-size: 16px;
            color: #ddd;
        }

        @media (max-width: 600px) {
            .bank-header h1 {
                font-size: 24px;
            }
            .bank-header img {
                width: 45px;
                height: 45px;
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

    <div class="dashboard-container">
        <div class="bank-header">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Bank Logo">
            <h1>🏦 Spark Bank</h1>
        </div>

        <div class="welcome-msg">Welcome, <%= userName %>!</div>
        <div class="email-display">Logged in as: <strong><%= userEmail %></strong></div>

        <div class="button-grid">
            <form action="TransactionServlet" method="get">
                <button class="btn">💳 View Transactions</button>
            </form>

            <form action="ViewBalanceServlet" method="get">
                <button class="btn">💰 View Balance</button>
            </form>

            <form action="updateinfo.jsp" method="post">
                <button class="btn">✏️ Update Info</button>
            </form>

            <form action="addamount.jsp" method="post">
                <button class="btn">➕ Add Amount</button>
            </form>
        </div>

        <form action="logout.jsp" method="post">
            <button class="btn logout-btn">🚪 Logout</button>
        </form>
    </div>
</body>
</html>



