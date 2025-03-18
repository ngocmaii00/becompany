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

/**
 *
 * @author PC
 */
@WebServlet(name="RatingServlet", urlPatterns={"/rating"})
public class RatingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RatingDao od = new RatingDao();
        HttpSession ss = req.getSession();
        Product product = (Product) ss.getAttribute("product");
        List<Rating> list = od.getAll(product.getProductId());
        req.setAttribute("data", list);
        req.getRequestDispatcher("product.jsp").forward(req, resp);    }
   
}
