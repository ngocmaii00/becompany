package controller;

import dal.OrderDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Order;

@WebServlet(name = "OrderManageServlet", urlPatterns = {"/ordermanage"})
public class OrderManageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDao od = new OrderDao();
        List<Order> orders = od.getAllProductForStaff();

        req.setAttribute("orders", orders);
        req.getRequestDispatcher("ordermanage.jsp").forward(req, resp);
    }


}
