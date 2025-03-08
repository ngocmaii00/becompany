/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name="ProsUpdateServlet", urlPatterns={"/prosupdate"})
public class ProsUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        update product
        try {
            String productId = req.getParameter("productId");
            String productName = req.getParameter("productName");
            String origin = req.getParameter("origin");
            String description = req.getParameter("description");
            String type = req.getParameter("type");
            String status = req.getParameter("status");
            String manufacturer = req.getParameter("manufacturer");

            ProductDao pd = new ProductDao();
            pd.updateProduct(productId, productName, origin, description, manufacturer, type, status);
            resp.sendRedirect("pros");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    
   
}
