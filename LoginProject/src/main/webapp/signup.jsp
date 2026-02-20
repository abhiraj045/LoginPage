<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Create Account</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .signup-container {
            background: #ffffff;
            width: 100%;
            max-width: 450px;
            padding: 40px 35px;
            border-radius: 16px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .signup-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .signup-header h1 {
            color: #1f2937;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .signup-header p {
            color: #6b7280;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #374151;
            font-size: 14px;
            font-weight: 600;
        }

        .form-group input {
            width: 100%;
            padding: 13px 15px;
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #f9fafb;
        }

        .form-group input:focus {
            outline: none;
            border-color: #11998e;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(17, 153, 142, 0.1);
        }

        .btn-signup {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            border: none;
            border-radius: 10px;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            margin-top: 10px;
        }

        .btn-signup:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px -5px rgba(17, 153, 142, 0.4);
        }

        .error-message {
            background: #fee2e2;
            color: #dc2626;
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            text-align: center;
            border: 1px solid #fecaca;
            animation: shake 0.4s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-8px); }
            75% { transform: translateX(8px); }
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            color: #6b7280;
            font-size: 14px;
        }

        .login-link a {
            color: #11998e;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .input-error {
            border-color: #dc2626 !important;
        }
    </style>
</head>
<body>

    <div class="signup-container">
        <div class="signup-header">
            <h1>Create Account</h1>
            <p>Join us today! Please fill in your details</p>
        </div>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="register" method="post">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" 
                       placeholder="Enter your full name" 
                       value="${fullName}" required>
            </div>

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" 
                       placeholder="Choose a username" 
                       value="${username}" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" 
                       placeholder="Enter your email" 
                       value="${email}" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" 
                       placeholder="Create a password (min 6 chars)" required>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" 
                       placeholder="Re-enter your password" required>
            </div>

            <button type="submit" class="btn-signup">Create Account</button>
        </form>

        <div class="login-link">
            Already have an account? <a href="login.jsp">Sign In</a>
        </div>
    </div>

</body>
</html>