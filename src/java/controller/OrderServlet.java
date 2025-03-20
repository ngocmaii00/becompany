
package controller;

import dal.OrderDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Order;
import model.User;

/**
 *
 * @author PC
 */
@WebServlet(name="OrderServlet", urlPatterns={"/order"})
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDao od = new OrderDao();
        HttpSession ss = req.getSession();
        User user = (User) ss.getAttribute("user");
        List<Order> list = od.getAll(user.getId());
        req.setAttribute("data", list);
        req.getRequestDispatcher("order.jsp").forward(req, resp);
    }
   
}