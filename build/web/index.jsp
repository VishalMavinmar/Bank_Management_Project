<%-- 
    Document   : new
    Created on : Apr 6, 2025, 9:35:13 AM
    Author     : DeLL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Welcome Page</title>
        <link
            <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                background-image: linear-gradient(rgba(115, 17, 139, 0.75), rgba(137, 50, 145, 0.55)), url(vardan-papikyan-tOfGu74zI9g-unsplash.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .container {
                background-image: url(bank.webp);
                width: 800px;
                display: flex;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                border-radius: 16px;
                overflow: hidden;
            }

            .left {
                flex: 1;
                background: linear-gradient(to bottom, #3a0ca3, #7209b7);
                color: white;
                padding: 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                position: relative;
                animation: slideInLeft 1s ease forwards;
            }

            .right {
                flex: 1;
                background: #fff;
                padding: 40px;
                animation: slideInRight 1s ease forwards;
            }

            /* Slide In Animations */
            @keyframes slideInLeft {
                from {
                    transform: translateX(-100%);
                    opacity: 0;
                }
                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }

            @keyframes slideInRight {
                from {
                    transform: translateX(100%);
                    opacity: 0;
                }
                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }

            .left h1 {
                font-size: 32px;
                margin-bottom: 10px;
            }

            .left p {
                font-size: 16px;
                margin-bottom: 20px;
            }

            .left .logo {
                font-size: 40px;
                margin-bottom: 20px;
            }

            .left a {
                position: absolute;
                bottom: 20px;
                color: white;
                text-decoration: none;
            }

            .right h2 {
                margin-bottom: 10px;
            }

            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: none;
                border-bottom: 2px solid #ccc;
                outline: none;
                transition: border 0.3s ease;
            }

            input:focus {
                border-bottom: 2px solid #a600ff;
            }

            .btn {
                width: 100%;
                background: linear-gradient(to right, #a600ff, #f000ff);
                border: none;
                color: white;
                padding: 12px;
                margin-top: 20px;
                cursor: pointer;
                border-radius: 10px;
                font-weight: bold;
            }

            .social-login {
                text-align: center;
                margin: 20px 0;
                color: #888;
            }

            .social-btn {
                display: block;
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: none;
                cursor: pointer;
                color: white;
                border-radius: 10px;
                font-weight: bold;
                text-align: center;
            }

            .twitter {
                background: #1DA1F2;
            }

            .facebook {
                background: #4267B2;
            }

            .logo {
                position: absolute;
                top: 20px;
                left: 20px;
                width: 140px;
                height: auto;
                color: white;
            }
            
            .error-msg{
                margin-left: 0px;
                color: red;
                font-size: 1.2rem;
            }
        </style>
    </head>
    <body>

<!--        <div>
            <img class="logo" src="https://zelle.jhapaycenter.com/Images/Aspire-applandscape.png" alt="Aspire Logo" />
        </div>-->
        <div class="container">
            <div class="left">
                <div class="logo">◎◎</div>
                <h1>Welcome Page</h1>
                <p>Sign in to continue access</p>
                <a href="#">www.sparkbank.com</a>
            </div>
            <div class="right">
           
                <h2>Sign In</h2>
                       <%-- Show error if exists --%>
            <%
                String error = (String) request.getAttribute("errorMessage");
                if (error != null) {
            %>
                <div class="error-msg"><%= error %></div>
            <%
                }
            %>
                <form action="LoginServlet" method="post">
                    <input type="email" name="email"  placeholder="Enter email" required />
                    <input type="password" name="password" placeholder="Password" required />
                   
                    <input type="submit" class="btn" value="Continue">
                    
                </form>
                <div class="social-login">You don't have Account ?? Then</div>

                <form action="Register.jsp" method="post">
                    <input type="submit" class="social-btn twitter" value="SignUp">
                </form>
                <!--<button class="social-btn facebook">Sign In With Facebook</button>-->
            </div>
        </div>
    </body>
</html>

</body>
</html>
