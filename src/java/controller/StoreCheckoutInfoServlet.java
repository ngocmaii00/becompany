/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDao;
import dal.ShippingDAO;
import dal.TeddyDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.CartItem;
import model.User;

/**
 *
 * @author zeryus
 */
@WebServlet(name = "StoreCheckoutInfoServlet", urlPatterns = {"/checkout_info"})
public class StoreCheckoutInfoServlet extends HttpServlet {
 

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession order = request.getSession();
            
            String purpose = request.getParameter("purpose");            
            String deliveryId = request.getParameter("shippingOption");
            
            String totalAmount =request.getParameter("amount");            
            String paymentMethod = request.getParameter("bankCode");
            if(paymentMethod == null)
                totalAmount = (String)request.getAttribute("bankCode");
//            Double totalAmount = 0.0;
            switch(paymentMethod){
                case"CASH" -> paymentMethod = "Cash on Delivery";
                
                case "VNBANK" -> paymentMethod = "Domestic Payment Card";
                
                case "INTCARD" -> paymentMethod = "International Payment Card";
            }
            
            
            purpose = purpose==null?"":purpose;
            deliveryId = deliveryId==null?"D1":deliveryId;
            

            User u = (User)order.getAttribute("user");
            ShippingDAO shd = new ShippingDAO();
            String delivery = shd.getDeliveryDescribe(deliveryId);
            
//            String purpose = (String)order.getAttribute("purpose");
//            String deliveryId = (String)order.getAttribute("deliveryId");
//            Double totalAmount = (Double)session.getAttribute("totalAmount");
            List<CartItem> cart = (List<CartItem>)order.getAttribute("cart");
            
            
            OrderDao od = new OrderDao();
            LocalDate today = LocalDate.now();
        
            TeddyDao td = new TeddyDao();
            int orderId = od.addNewOrder(u.getId(),Date.valueOf(today) ,"Pending", purpose);
            for(CartItem i : cart){
                od.insertOrderDetail(orderId,td.searchTeddyId(i.id, i.color, i.size), deliveryId, i.getQuantity(), Date.valueOf(today));
            }
            Cookie[] cookies = request.getCookies();
    
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(u.getUsername() + "_cart")) {
                        // Set the cookie to an empty value
                        cookie.setValue("");

                        // Set maxAge to 0 to delete the cookie immediately
                        cookie.setMaxAge(0);

                        // Ensure the correct path (important if cookie has a path set)
                        cookie.setPath("/");

                        // Add the cookie back to the response to overwrite it
                        response.addCookie(cookie);
                        break;
                    }
                }
            }
            LocalDateTime datetime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            String date = datetime.format(formatter);
            date = datetime.getDayOfWeek() +" " + date;
            request.setAttribute("date", date);
            request.setAttribute("orderId", orderId);
            request.setAttribute("paymentMethod",paymentMethod);
            request.setAttribute("totalAmount",totalAmount);
            request.setAttribute("delivery",delivery);
            request.setAttribute("purpose",purpose);
            request.setAttribute("order",cart);
           
//            request.getRequestDispatcher("checkout-complete").forward(request, response);
    request.getRequestDispatcher("checkoutComplete.jsp").forward(request, response);
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
        

       User u = (User)order.getAttribute("user");
            
//            String purpose = (String)order.getAttribute("purpose");
//            String deliveryId = (String)order.getAttribute("deliveryId");
//            Double totalAmount = (Double)session.getAttribute("totalAmount");
            List<CartItem> cart = (List<CartItem>)order.getAttribute("cart");
            
            
            OrderDao od = new OrderDao();
            LocalDate today = LocalDate.now();
        
            TeddyDao td = new TeddyDao();
            int orderId = od.addNewOrder(u.getId(),Date.valueOf(today) ,"Pending", purpose);
            for(CartItem i : cart){
                od.insertOrderDetail(orderId,td.searchTeddyId(i.id, i.color, i.size), deliveryId, i.getQuantity(), Date.valueOf(today));
            }
            Cookie[] cookies = request.getCookies();
    
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(u.getUsername() + "_cart")) {
                        // Set the cookie to an empty value
                        cookie.setValue("");

                        // Set maxAge to 0 to delete the cookie immediately
                        cookie.setMaxAge(0);

                        // Ensure the correct path (important if cookie has a path set)
                        cookie.setPath("/");

                        // Add the cookie back to the response to overwrite it
                        response.addCookie(cookie);
                        break;
                    }
                }
            }
            LocalDateTime datetime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            String date = datetime.format(formatter);
            date = datetime.getDayOfWeek() +" " + date;
            request.setAttribute("date", date);
            request.setAttribute("orderId", orderId);
            request.setAttribute("totalAmount",totalAmount);
            request.setAttribute("order",cart);
           
//            request.getRequestDispatcher("checkout-complete").forward(request, response);
    request.getRequestDispatcher("checkoutComplete.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
