/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SlideShowDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.SlideShow;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SlideServlet", urlPatterns = {"/slides"})
public class SlideServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SlideShowDao sd = new SlideShowDao();

        List<SlideShow> list = sd.getSlideShow();

        req.setAttribute("slides", list);
        req.getRequestDispatcher("slides.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] images = req.getParameterValues("image");
        String[] desc = req.getParameterValues("title");
        List<SlideShow> list = new ArrayList<>();
        for (int i = 0; i < images.length; i++) {
            if (!images[i].isBlank()) {
                list.add(new SlideShow(images[i], desc[i]));
            }
        }

        SlideShowDao sd = new SlideShowDao();
        sd.changeSlide(list);
        resp.sendRedirect("slides");
    }

}
