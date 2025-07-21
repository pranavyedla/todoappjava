<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>To-Do App - Home</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #dbfef9; /* Light blue background */
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
        }

        .box {
            background-color: white;
            padding: 2rem 3rem;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 350px;
        }

        .box h1 {
            margin-bottom: 2rem;
            color: #1e548a; /* Dark blue */
        }

        .nav a {
            display: inline-block;
            margin: 0.5rem;
            padding: 0.75rem 1.5rem;
            background-color: #3bbef6; /* Blue */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .nav a:hover {
            background-color: #c0eb25; /* Darker blue */
            transform: scale(1.05);
            color: black;
        }
    </style>
</head>
<body>

<div class="box">
    <h1>To-Do App</h1>
    <div class="nav">
        <a href="register.jsp">Register</a>
        <a href="login.jsp">Login</a>
    </div>
</div>

</body>
</html>
