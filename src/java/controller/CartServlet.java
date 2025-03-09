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

/**
 *
 * @author OS
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String image = request.getParameter("image");
        String name = request.getParameter("name");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String price = request.getParameter("price");
        String quan = request.getParameter("quantity");

        if (color != null && size != null) {

            String cartData = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("cart".equals(cookie.getName())) {
                        cookie.setPath("/");
                        cartData = URLDecoder.decode(cookie.getValue(), "UTF-8");
                        break;
                    }
                }
            } else {
                String ms = "Please finish your choice !!!";
            }

            String newCartData = updateCartData(cartData, image, name, size, color, price, quan);

            Cookie cartCookie = new Cookie("cart", URLEncoder.encode(newCartData, "UTF-8"));
            cartCookie.setMaxAge(7 * 24 * 60 * 60);
            cartCookie.setPath("/");
            response.addCookie(cartCookie);
        }

        response.sendRedirect("cart.jsp");
    }

    private String updateCartData(String cartData, String image, String name, String size, String color, String price, String quan) {
        StringBuilder newCart = new StringBuilder();
        boolean found = false;

        String[] items = cartData.split(",");
        for (String item : items) {
            if (!item.isEmpty()) {
                String[] parts = item.split("-");
                if (parts[1].equals(name)) {
                    newCart.append(image).append("-")
                            .append(name).append("-")
                            .append(size).append("-")
                            .append(color).append("-")
                            .append(price).append("-")
                            .append(quan).append("-")
                            .append(",");
                    found = true;
                } else {
                    newCart.append(item).append(",");
                }
            }
        }

        if (!found) {
            //newCart.append(id).append("-").append(quantity).append(",");
        }

        return newCart.toString();
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
