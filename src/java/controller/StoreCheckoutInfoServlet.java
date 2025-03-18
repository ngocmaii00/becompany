/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author zeryus
 */
@WebServlet(name = "StoreCheckoutInfoServlet", urlPatterns = {"/checkout_info"})
public class StoreCheckoutInfoServlet extends HttpServlet {
 

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession order = request.getSession();
            
            String purpose = request.getParameter("purpose");
            String deliveryId = request.getParameter("shippingOption");
            Double totalAmount = Double.valueOf(request.getParameter("amount"));
        
            purpose = purpose==null?"":purpose;
            deliveryId = deliveryId==null?"D1":deliveryId;
            order.setAttribute("totalAmount",totalAmount);
            order.setAttribute("purpose", purpose);
            order.setAttribute("deliveryId", deliveryId);
        

        response.sendRedirect("checkout");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
