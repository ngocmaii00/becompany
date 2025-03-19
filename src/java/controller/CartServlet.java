/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;    
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            Cookie[] cookies = request.getCookies();
            String cartData = "";
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("cart")) {
                        cartData = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                        cookie.setMaxAge(0); // Xóa cookie cũ
                        response.addCookie(cookie);
                        break;
                    }
                }
            }

            if (!cartData.isEmpty()) {
                String[] items = cartData.split(",");
                String id = request.getParameter("id");
                String size = request.getParameter("size"); // Lấy size từ request
                String color = request.getParameter("color"); // Lấy color từ request
                StringBuilder newCart = new StringBuilder();

                if (action.equals("update")) {
                    String newQuantity = request.getParameter("quantity");
                    for (String item : items) {
                        String[] details = item.split("\\$");
                        if (details[0].equals(id) && details[3].equals(size) && details[4].equals(color)) {
                            details[6] = newQuantity; // Cập nhật số lượng
                            newCart.append(String.join("$", details));
                        } else {
                            newCart.append(item);
                        }
                        if (!newCart.toString().isEmpty()) {
                            newCart.append(",");
                        }
                    }
                } else if (action.equals("remove")) {
                    for (String item : items) {
                        String[] details = item.split("\\$");
                        // Chỉ giữ lại các sản phẩm không khớp cả id, size và color
                        if (!(details[0].equals(id) && details[3].equals(size) && details[4].equals(color))) {
                            newCart.append(item).append(",");
                        }
                    }
                }

                String updatedCart = newCart.toString();
                if (updatedCart.endsWith(",")) {
                    updatedCart = updatedCart.substring(0, updatedCart.length() - 1);
                }
                String encodedCart = URLEncoder.encode(updatedCart, StandardCharsets.UTF_8.toString());
                Cookie c = new Cookie("cart", encodedCart);
                c.setMaxAge(60 * 60 * 24 * 7);
                response.addCookie(c);
            }
            response.sendRedirect("cart");
        } else {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt = URLDecoder.decode(o.getValue(), StandardCharsets.UTF_8.toString());
                    o.setMaxAge(0); // Xóa cookie cũ
                    response.addCookie(o);
                }
            }
        }

        String id = request.getParameter("id");
        String image = request.getParameter("image");
        String name = request.getParameter("name");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");

        if (id != null && image != null && name != null && size != null && color != null && price != null && quantity != null) {
            String cartItem = id + "$" + image + "$" + name + "$" + size + "$" + color + "$" + price + "$" + quantity;

            if (txt.isEmpty()) {
                txt = cartItem;
            } else {
                String[] items = txt.split(",");
                StringBuilder newCart = new StringBuilder();
                boolean productExists = false;

                for (String item : items) {
                    String[] details = item.split("\\$");
                    if (details.length == 7) {
                        String existingId = details[0];
                        String existingSize = details[3];
                        String existingColor = details[4];

                        if (existingId.equals(id) && existingSize.equals(size) && existingColor.equals(color)) {
                            int existingQuantity = Integer.parseInt(details[6]);
                            int newQuantity = Integer.parseInt(quantity);
                            details[6] = String.valueOf(existingQuantity + newQuantity);
                            productExists = true;
                            newCart.append(String.join("$", details));
                        } else {
                            newCart.append(item);
                        }
                        newCart.append(",");
                    }
                }
                if (!productExists) {
                    newCart.append(cartItem).append(",");
                }
                txt = newCart.toString();
                if (txt.endsWith(",")) {
                    txt = txt.substring(0, txt.length() - 1);
                }
            }

            String encodedTxt = URLEncoder.encode(txt, StandardCharsets.UTF_8.toString());
            Cookie c = new Cookie("cart", encodedTxt);
            c.setMaxAge(60 * 60 * 24 * 7);
            response.addCookie(c);
        }

        response.sendRedirect("cart");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}