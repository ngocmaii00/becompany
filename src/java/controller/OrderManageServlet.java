package controller;

import dal.OrderDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import model.Order;

@WebServlet(name = "OrderManageServlet", urlPatterns = {"/ordermanage"})
public class OrderManageServlet extends HttpServlet {

    OrderDao od = new OrderDao();
    List<Order> orders = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.orders = od.getAllProductForStaff();

        req.setAttribute("orders", orders);
        req.getRequestDispatcher("ordermanage.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search").toLowerCase().trim();
        OrderDao od = new OrderDao();
        List<Order> orders = od.getAllProductForStaff();
        if (search != null && search.length() > 0) {
            orders = orders.stream().filter((o) -> o.getOrderId().toLowerCase().contains(search) || o.getProductName().toLowerCase().contains(search) || o.getDelivery().toLowerCase().contains(search) || o.getUsername().toLowerCase().contains(search)).collect(Collectors.toList());
        }
        req.setAttribute("orders", orders);
        req.getRequestDispatcher("ordermanage.jsp").forward(req, resp);
    }

}
