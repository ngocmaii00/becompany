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
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
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
        if (purpose == null) {
            purpose = (String) order.getAttribute("purpose");
        }
        String deliveryId = request.getParameter("shippingOption");
        if (deliveryId == null) {
            deliveryId = (String) order.getAttribute("shippingOption");
        }

        String totalAmount = request.getParameter("amount");
        if (totalAmount == null) {
            totalAmount = (String) order.getAttribute("amount");
        }
        String paymentMethod = request.getParameter("bankCode");
        if (paymentMethod == null) {
            paymentMethod = (String) order.getAttribute("bankCode");
        }

//            Double totalAmount = 0.0;
        switch (paymentMethod) {
            case "CASH" ->
                paymentMethod = "Cash on Delivery";

            case "VNBANK" ->
                paymentMethod = "Domestic Payment Card";

            case "INTCARD" ->
                paymentMethod = "International Payment Card";
        }

        purpose = purpose == null ? "" : purpose;
        deliveryId = deliveryId == null ? "D1" : deliveryId;
        List<CartItem> totalItemCart = (List<CartItem>) order.getAttribute("allCart");//cart item
        
        
        User u = (User) order.getAttribute("user");
        ShippingDAO shd = new ShippingDAO();
        String delivery = shd.getDeliveryDescribe(deliveryId);

//            String purpose = (String)order.getAttribute("purpose");
//            String deliveryId = (String)order.getAttribute("deliveryId");
//            Double totalAmount = (Double)session.getAttribute("totalAmount");
        List<CartItem> cart = (List<CartItem>) order.getAttribute("cart"); //checkout item

        OrderDao od = new OrderDao();
        LocalDate today = LocalDate.now();

        TeddyDao td = new TeddyDao();//"Pending"
        int orderId = od.addNewOrder(u.getId(), Date.valueOf(today), purpose);
        for (CartItem i : cart) {
            LocalDate receiveDate = today.plusDays(shd.getDeliveryDuration(deliveryId));
            od.insertOrderDetail(orderId, td.searchTeddyId(i.id, i.color, i.size), deliveryId, i.getQuantity(), Date.valueOf(today), Date.valueOf(receiveDate), "Pending");
        }
//==================================== REMOVE THE ORDERED ITEM =============================================        
        
        for (Iterator<CartItem> iterator = totalItemCart.iterator(); iterator.hasNext();) {
            CartItem i = iterator.next();
            for (CartItem j : cart) {
                if (i.id.equals(j.id)) {
                    iterator.remove(); // ✅ Safely remove without exception
                    break; // Exit inner loop once match is found
                }
            }
        }
        StringBuilder cartCookie = new StringBuilder();
        for(CartItem i : totalItemCart){
            String cartItem = i.id + "$" + i.image + "$" + i.name + "$" + i.size + "$" + i.color + "$" + i.price + "$" + i.quantity + "$" + i.instock;
            cartCookie.append(cartItem).append(",");
        }
        
        String txt = cartCookie.toString();
                if (txt.endsWith(",")) {
                    txt = txt.substring(0, txt.length() - 1);
                }
        String encodedTxt = URLEncoder.encode(txt, StandardCharsets.UTF_8.toString());
        Cookie[] cookies = request.getCookies();

       
        if (cookies != null) {
            for (Cookie userCart : cookies) {
                if (userCart.getName().equals(u.getUsername() + "_cart")) {
                    userCart.setValue(encodedTxt);
                    userCart.setMaxAge(60 * 60 * 24 * 7); // xoá cookie cũ
                    response.addCookie(userCart);
                    break;
                }
            }
        }
//===========================================================================================================         
        LocalDateTime datetime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String date = datetime.format(formatter);
        date = datetime.getDayOfWeek() + " " + date;
        request.setAttribute("date", date);
        request.setAttribute("orderId", orderId);
        request.setAttribute("paymentMethod", paymentMethod);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("delivery", delivery);
        request.setAttribute("purpose", purpose);
        request.setAttribute("order", cart);

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

        purpose = purpose == null ? "" : purpose;
        deliveryId = deliveryId == null ? "D1" : deliveryId;
        order.setAttribute("totalAmount", totalAmount);
        order.setAttribute("purpose", purpose);
        order.setAttribute("deliveryId", deliveryId);
        String paymentMethod = request.getParameter("bankCode");

        switch (paymentMethod) {
            case "CASH" ->
                paymentMethod = "Cash on Delivery";

            case "VNBANK" ->
                paymentMethod = "Domestic Payment Card";

            case "INTCARD" ->
                paymentMethod = "International Payment Card";
        }
        User u = (User) order.getAttribute("user");
        String cartId = u.getUsername() + "_cart";
        List<CartItem> totalItemCart = (List<CartItem>) order.getAttribute("allCart");//cart item
//            String purpose = (String)order.getAttribute("purpose");
//            String deliveryId = (String)order.getAttribute("deliveryId");
//            Double totalAmount = (Double)session.getAttribute("totalAmount");
        List<CartItem> cart = (List<CartItem>) order.getAttribute("cart");

        ShippingDAO shd = new ShippingDAO();
        String delivery = shd.getDeliveryDescribe(deliveryId);
        OrderDao od = new OrderDao();
        LocalDate today = LocalDate.now();

        TeddyDao td = new TeddyDao();//"Pending"
        int orderId = od.addNewOrder(u.getId(), Date.valueOf(today), purpose);
        for (CartItem i : cart) {
            LocalDate receiveDate = today.plusDays(shd.getDeliveryDuration(deliveryId));
            od.insertOrderDetail(orderId, td.searchTeddyId(i.id, i.color, i.size), deliveryId, i.getQuantity(), Date.valueOf(today), Date.valueOf(receiveDate), "Pending");
        }
       //==================================== REMOVE THE ORDERED ITEM =============================================        
        
       for (Iterator<CartItem> iterator = totalItemCart.iterator(); iterator.hasNext();) {
            CartItem i = iterator.next();
            for (CartItem j : cart) {
                if (i.id.equals(j.id)) {
                    iterator.remove(); // ✅ Safely remove without exception
                    break; // Exit inner loop once match is found
                }
            }
        }
        StringBuilder cartCookie = new StringBuilder();
        for(CartItem i : totalItemCart){
            String cartItem = i.id + "$" + i.image + "$" + i.name + "$" + i.size + "$" + i.color + "$" + i.price + "$" + i.quantity + "$" + i.instock;
            cartCookie.append(cartItem).append(",");
        }
        
        String txt = cartCookie.toString();
                if (txt.endsWith(",")) {
                    txt = txt.substring(0, txt.length() - 1);
                }
        String encodedTxt = URLEncoder.encode(txt, StandardCharsets.UTF_8.toString());
        Cookie[] cookies = request.getCookies();

       
        if (cookies != null) {
            for (Cookie userCart : cookies) {
                if (userCart.getName().equals(u.getUsername() + "_cart")) {
                    userCart.setValue(encodedTxt);
                    userCart.setMaxAge(60 * 60 * 24 * 7); // xoá cookie cũ
                    response.addCookie(userCart);
                    break;
                }
            }
        }
//===========================================================================================================     
        LocalDateTime datetime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String date = datetime.format(formatter);
        date = datetime.getDayOfWeek() + " " + date;
        request.setAttribute("date", date);
        request.setAttribute("orderId", orderId);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("order", cart);
            order.removeAttribute("purpose");
            order.removeAttribute("shippingOption");
            order.removeAttribute("bankCode");
            order.removeAttribute("amount");

//            request.getRequestDispatcher("checkout-complete").forward(request, response);
        request.getRequestDispatcher("checkoutComplete.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
