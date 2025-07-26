<%@ page import="java.util.*, java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            margin: 40px 0 20px;
            font-size: 28px;
            color: #00e676;
        }

        .table-container {
            width: 90%;
            max-width: 1000px;
            background-color: #1e1e1e;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            color: #fff;
        }

        th, td {
            padding: 14px;
            text-align: center;
        }

        th {
            background-color: #00c853;
            color: #fff;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #2e2e2e;
        }

        tr:nth-child(odd) {
            background-color: #252525;
        }

        tr:hover {
            background-color: #37474f;
            transition: background 0.3s ease;
        }

        .no-data {
            font-size: 18px;
            color: #eee;
            margin-top: 30px;
        }

        @media (max-width: 600px) {
            h2 {
                font-size: 22px;
            }

            .table-container {
                padding: 10px;
            }

            th, td {
                padding: 10px 6px;
                font-size: 14px;
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
    

    <h2>Your Transaction History</h2>

    <%
        List<Map<String, String>> transactions = (List<Map<String, String>>) request.getAttribute("transactions");
        if (transactions == null || transactions.isEmpty()) {
    %>
        <div class="no-data">No transactions found.</div>
    <%
        } else {
    %>
        <div class="table-container">
            <table>
                <tr>
                    <th>Transaction ID</th>
                    <th>Amount</th>
                    <th>Type</th>
                    <th>Date</th>
                </tr>
                <%
                    for (Map<String, String> txn : transactions) {
                %>
                    <tr>
                        <td><%= txn.get("id") %></td>
                        <td><%= txn.get("amount") %></td>
                        <td><%= txn.get("type") %></td>
                        <td><%= txn.get("date") %></td>
                    </tr>
                <%
                    }
                %>
            </table>
        </div>
    <%
        }
    %>

</body>
</html>
