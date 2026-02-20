<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .home-card {
            background: #ffffff;
            width: 100%;
            max-width: 500px;
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        .avatar {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            font-size: 40px;
            color: white;
        }

        .home-card h1 {
            color: #1f2937;
            font-size: 26px;
            margin-bottom: 10px;
        }

        .home-card .username {
            color: #667eea;
            font-weight: 700;
        }

        .home-card p {
            color: #6b7280;
            margin: 20px 0 35px;
            font-size: 15px;
            line-height: 1.6;
        }

        .btn-logout {
            display: inline-block;
            padding: 14px 32px;
            background: #ef4444;
            color: #fff;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-logout:hover {
            background: #dc2626;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px rgba(239, 68, 68, 0.4);
        }

        .success-icon {
            color: #10b981;
            font-size: 50px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <div class="home-card">
        <div class="success-icon">✓</div>
        <h1>Welcome, <span class="username"><%= session.getAttribute("username") %></span>!</h1>
        <p>You have successfully logged in to the system. Enjoy your stay!</p>
        <a href="logout" class="btn-logout">Logout</a>
    </div>

</body>
</html>