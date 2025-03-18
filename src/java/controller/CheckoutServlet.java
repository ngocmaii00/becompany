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
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.Product;
import model.ShippingOption;
import model.User;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author zeryus
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession userSession = request.getSession(false);
        User user = (User) userSession.getAttribute("user");
        String cartId = user.getUsername() + "_cart";
        
        Cookie[] cookies = request.getCookies();
        String[] items = null;
        String cartData = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cartId)) {
                    cartData = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                    break;
                }
            }
        }

        if (!cartData.isEmpty()) {
            items = cartData.split(",");

        }
//                                    String id = details[0];
//                                    String image = details[1];
//                                    String name = details[2];
//                                    String size = details[3];
//                                    String color = details[4];
//                                    String price = details[5];
//                                    String quantity = details[6];
//                                    double estimate = Double.parseDouble(price) * Integer.parseInt(quantity);

        List<CartItem> products = new ArrayList<>();
        if (items != null) {
            for (String i : items) {
                String[] details = i.split("\\$");
                CartItem ct = new CartItem(details[0], details[1], details[2], details[3], details[4], Double.parseDouble(details[5]), Integer.parseInt(details[6]));
                products.add(ct);

            }
        }
        ShippingDAO shd = new ShippingDAO();
        List<ShippingOption> shippings = shd.getAllShippingOption();
        HttpSession session = request.getSession();
        session.setAttribute("cart", products);
        request.setAttribute("products", products);
        request.setAttribute("shippings", shippings);
        request.getRequestDispatcher("buyProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
       
            
            User u = (User)session.getAttribute("user");
            
            String purpose = (String)session.getAttribute("purpose");
            String deliveryId = (String)session.getAttribute("deliveryId");
            Double totalAmount = (Double)session.getAttribute("totalAmount");
            List<CartItem> cart = (List<CartItem>)session.getAttribute("cart");
            
            
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
