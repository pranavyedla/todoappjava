package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class TaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        String username = (String) request.getSession().getAttribute("user");

        try (Connection conn = DBConnection.getConnection()) {
            if ("add".equals(action)) {
                PreparedStatement ps = conn.prepareStatement("INSERT INTO tasks(username, name, category, status, date) VALUES(?,?,?,?,?)");
                ps.setString(1, username);
                ps.setString(2, request.getParameter("name"));
                ps.setString(3, request.getParameter("category"));
                ps.setString(4, request.getParameter("status"));
                ps.setString(5, request.getParameter("date"));
                ps.executeUpdate();
            } else if ("delete".equals(action)) {
                PreparedStatement ps = conn.prepareStatement("DELETE FROM tasks WHERE id=? AND username=?");
                ps.setInt(1, Integer.parseInt(request.getParameter("id")));
                ps.setString(2, username);
                ps.executeUpdate();
            } else if ("edit".equals(action)) {
                PreparedStatement ps = conn.prepareStatement("UPDATE tasks SET name=?, category=?, status=?, date=? WHERE id=? AND username=?");
                ps.setString(1, request.getParameter("name"));
                ps.setString(2, request.getParameter("category"));
                ps.setString(3, request.getParameter("status"));
                ps.setString(4, request.getParameter("date"));
                ps.setInt(5, Integer.parseInt(request.getParameter("id")));
                ps.setString(6, username);
                ps.executeUpdate();
            }
            response.sendRedirect("task.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
