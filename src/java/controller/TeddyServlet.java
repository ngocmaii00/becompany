package controller;

import dal.TeddyDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Teddy;

@WebServlet(name = "TeddyServlet", urlPatterns = {"/teddy"})
public class TeddyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String teddyId = req.getParameter("teddyId");
        String color = req.getParameter("color");
        String size = req.getParameter("size");
        String price_raw = req.getParameter("price");
        String quantity_raw = req.getParameter("quantity");
        try {
            int quantity = Integer.parseInt(quantity_raw);
            double price = Double.parseDouble(price_raw);
            TeddyDao td = new TeddyDao();
            td.updateTeddy(teddyId, color, size, price, quantity);
            resp.sendRedirect("pros");
        } catch (Exception e) {
            System.out.println(e);
        }

    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        add teddy
        String color = req.getParameter("color");
        String size = req.getParameter("size");
        String price_raw = req.getParameter("price");
        String quantity_raw = req.getParameter("quantity");
        String productId = req.getParameter("productId");
        try {
            int quantity = Integer.parseInt(quantity_raw);
            double price = Double.parseDouble(price_raw);
            TeddyDao td = new TeddyDao();
            
            String lastTeddyId = td.getLastTeddyId();
            String teddyId = "T" + String.format("%05d", (Integer.parseInt(lastTeddyId.substring(1)) + 1));
            
            
            td.addTeddy(teddyId, color, size, price, quantity, productId);
            resp.sendRedirect("pros");
        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
