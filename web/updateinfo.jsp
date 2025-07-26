<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    Integer customerId = (Integer) session.getAttribute("customer_id");

    if (customerId == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String name = "", email = "", phone = "", address = "";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "vishal1234");

        PreparedStatement ps = con.prepareStatement("SELECT name, email, phone, address FROM Registers_new WHERE customer_id = ?");
        ps.setInt(1, customerId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            address = rs.getString("address");
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Info</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #141e30, #243b55);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #e0e0e0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #1e1e1e;
            padding: 35px 30px;
            border-radius: 15px;
            box-shadow: 0 0 25px rgba(0, 255, 200, 0.2);
            width: 100%;
            max-width: 500px;
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            color: #00e676;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #bbb;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        textarea {
            width: 100%;
            padding: 12px;
            background-color: #2a2a2a;
            color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            margin-bottom: 18px;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
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
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
            text-shadow: 0 0 8px #00ffc8;
        }

        @media (max-width: 500px) {
            .container {
                padding: 25px 20px;
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
        <h2>Update Your Information</h2>

        <% String message = request.getParameter("message");
           if (message != null) {
        %>
            <div class="success"><%= message %></div>
        <% } %>

        <form action="UpdateInfoServlet" method="post">
            <label>Name:</label>
            <input type="text" name="name" value="<%= name %>" required>

            <label>Email:</label>
            <input type="email" name="email" value="<%= email %>" required>

            <label>Phone:</label>
            <input type="tel" name="phone" value="<%= phone %>" required>

            <label>Address:</label>
            <textarea name="address" required><%= address %></textarea>

            <input type="submit" value="Update Info">
        </form>
    </div>
</body>
</html>
