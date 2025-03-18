/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.CartItem;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author zeryus
 */
@WebServlet(name = "CheckoutCompleteServlet", urlPatterns = {"/checkout-complete"})
public class CheckoutCompleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = (String)request.getAttribute("orderId");
        double totalAmount = (double)request.getAttribute("totalAmount");
        List<CartItem> cart = (List<CartItem>)request.getAttribute("cart");
        LocalDateTime datetime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String date = datetime.format(formatter);
        date = datetime.getDayOfWeek() +" " + date;
        
        
        
        request.setAttribute("orderId", orderId);
        request.setAttribute("totalAmount",totalAmount);
        request.setAttribute("order",cart);
        request.setAttribute("date", date);
//        response.sendRedirect("product");
        request.getRequestDispatcher("checkoutComplete.jsp").forward(request, response);
            
    }

     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
