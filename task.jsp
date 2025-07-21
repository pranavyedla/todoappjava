<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    String username = (String) session.getAttribute("user");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String editId = request.getParameter("editId");
%>

<!DOCTYPE html>
<html>
<head>
    <title>To-Do Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #1e3a8a;
        }

        .container {
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
        }

        .form-box, .table-box {
            background-color: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            flex: 1;
            min-width: 300px;
        }

        form label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }

        form input[type="text"],
        form input[type="date"],
        form select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        form input[type="submit"] {
            margin-top: 15px;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            background-color: #3b82f6;
            color: white;
            cursor: pointer;
            font-weight: bold;
        }

        form input[type="submit"]:hover {
            background-color: #2563eb;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
            text-align: left;
        }

        .actions form {
            display: inline;
        }

        .edit-btn {
            background-color: #10b981;
        }

        .delete-btn {
            background-color: #ef4444;
        }

        .edit-btn:hover {
            background-color: #059669;
        }

        .delete-btn:hover {
            background-color: #dc2626;
        }
    </style>
</head>
<body>

<h2>Welcome, <%= username %>!</h2>

<div class="container">

    <!-- Add Task Form -->
    <div class="form-box">
        <h3>Add New Task</h3>
        <form method="post" action="task" >
            <input type="hidden" name="action" value="add">
            <label for="name">Task:</label>
            <input type="text" name="name" id="name" required>

            <label for="category">Category:</label>
            <input type="text" name="category" id="category" required>

            <label for="status">Status:</label>
            <select name="status" id="status">
                <option value="done">Done</option>
                <option value="not">Not Done</option>
            </select>

            <label for="date">Date:</label>
            <input type="date" name="date" id="date" required>

            <input type="submit" value="Add Task">
        </form>
    </div>

    <!-- Task Table -->
    <div class="table-box">
        <h3>Your Tasks</h3>
        <table>
            <tr>
                <th>Task</th>
                <th>Category</th>
                <th>Status</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            <%
                Connection conn = servlets.DBConnection.getConnection(); 
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM tasks WHERE username=?");
                ps.setString(1, username); 
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String idStr = String.valueOf(rs.getInt("id"));
                    boolean isEditing = idStr.equals(editId);
            %>
            <tr>
                <td colspan="5">
                    <% if (isEditing) { %>
                        <form method="post" action="task">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" value="<%= idStr %>">
                            <label>Task:</label>
                            <input type="text" name="name" value="<%= rs.getString("name") %>" required>

                            <label>Category:</label>
                            <input type="text" name="category" value="<%= rs.getString("category") %>" required>

                            <label>Status:</label>
                            <select name="status">
                                <option value="done" <%= rs.getString("status").equals("done") ? "selected" : "" %>>Done</option>
                                <option value="not" <%= rs.getString("status").equals("not") ? "selected" : "" %>>Not Done</option>
                            </select>

                            <label>Date:</label>
                            <input type="date" name="date" value="<%= rs.getString("date") %>" required>

                            <input type="submit" value="Update">
                        </form>
                    <% } else { %>
                        <table style="width: 100%;">
                            <tr>
                                <td ><%= rs.getString("name") %></td>
                                <td><%= rs.getString("category") %></td>
                                <td><%= rs.getString("status") %></td>
                                <td><%= rs.getString("date") %></td>
                                <td class="actions">
                                    <form method="get" action="">
                                        <input type="hidden" name="editId" value="<%= idStr %>">
                                        <input type="submit" value="Edit" class="edit-btn">
                                    </form>
                                    <form method="post" action="task">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="<%= idStr %>">
                                        <input type="submit" value="Delete" class="delete-btn">
                                    </form>
                                </td>
                            </tr>
                        </table>
                    <% } %>
                </td>
            </tr>
            <% } %>
        </table>
    </div>

</div>

</body>
</html>
