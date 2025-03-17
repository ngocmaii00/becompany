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
import java.util.ArrayList;
import model.Customer;

@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
public class UserServlet extends HttpServlet {

    UserDAO ud = new UserDAO();
    List<Customer> list = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.list = ud.getAll();
        req.setAttribute("users", list);
        req.getRequestDispatcher("user.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        List<Customer> result = new ArrayList<>();
        list.forEach((customer) -> {
            if (customer.getUserDetail().getFirstName().toLowerCase().contains(search.toLowerCase())
                    || customer.getId().toLowerCase().contains(search.toLowerCase())
                    || customer.getUserDetail().getLastName().toLowerCase().contains(search.toLowerCase())) {
                result.add(customer);
            }
        });

        req.setAttribute("users", result);
        req.getRequestDispatcher("user.jsp").forward(req, resp);
    }
    
    

}
