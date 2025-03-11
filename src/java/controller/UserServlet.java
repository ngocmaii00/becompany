package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.User;
import java.sql.Date;

@WebServlet(name="UserServlet", urlPatterns={"/user"})
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        List<User> list = ud.getAll();
        req.setAttribute("users", list);
        req.getRequestDispatcher("user.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
//            update user
            String userId = req.getParameter("userId");
            String status = req.getParameter("status");

            UserDAO st = new UserDAO();
            st.updateCustomerStatus(userId, status);
            resp.sendRedirect("user");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    
}
