<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: white;
            padding: 2rem 3rem;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 350px;
        }

        .form-container h2 {
            margin-bottom: 1.5rem;
            color: #1e3a8a;
        }

        .form-container input {
            width: 100%;
            padding: 0.75rem;
            margin: 1rem 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
            box-sizing: border-box;
        }

        .form-container input[type="submit"] {
            background-color: #10b981;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .form-container input[type="submit"]:hover {
            background-color: #059669;
            transform: scale(1.05);
        }

        .form-container a {
            display: block;
            margin-top: 1rem;
            color: #3b82f6;
            text-decoration: none;
            font-weight: bold;
        }

        .form-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Login</h2>
    <form method="post" action="login">
        Username: <input name="username" type="text" required><br>
        Password: <input name="password" type="password" required><br>
        <input type="submit" value="Login">
    </form>
    <a href="register.jsp">Don't have an account? Register</a>
</div>

</body>
</html>
