
package controller;

import dal.OrderDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="CheckOrderServlet", urlPatterns={"/checkorder"})
public class CheckOrderServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String teddyId = req.getParameter("teddyId");
        String status = req.getParameter("status");
        String orderId = req.getParameter("orderId");
        String staffId = req.getParameter("staffId");
        OrderDao od = new OrderDao();
        od.checkOrder(status, teddyId, staffId, orderId);
        resp.sendRedirect("ordermanage");
    }
}
