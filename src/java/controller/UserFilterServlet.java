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
import model.Customer;

/**
 *
 * @author Admin
 */
@WebServlet(name="UserFilterServlet", urlPatterns={"/userfilter"})
public class UserFilterServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String gender_raw = req.getParameter("gender");
        int top = Integer.parseInt(req.getParameter("top"));
        
        int gender = gender_raw == null ? 2 : Integer.parseInt(gender_raw);
        
        UserDAO ud = new UserDAO();
        
        List<Customer> users = ud.filterCustomer(top, gender, type);
        req.setAttribute("users", users);
        req.getRequestDispatcher("user.jsp").forward(req, resp);
    }
    
}
