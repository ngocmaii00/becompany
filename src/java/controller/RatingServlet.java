/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDao;
import dal.RatingDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Product;
import model.Rating;
import model.User;

/**
 *
 * @author PC
 */
@WebServlet(name="RatingServlet", urlPatterns={"/rating"})
public class RatingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String comment = request.getParameter("comment");
        String stars = request.getParameter("rate");
        String id = request.getParameter("id");
        
        try {
            int star = Integer.parseInt(stars);
            HttpSession session = request.getSession();
            RatingDao rd = new RatingDao();
            rd.insertRating(((User) session.getAttribute("user")).getId(), id, comment, star);
            response.sendRedirect("product?id=" + id);
        } catch (Exception e) {
        }
    }
}
