/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProfileDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author PC
 */
@WebServlet(name="ProfileServlet", urlPatterns={"/profile"})
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String username = req.getParameter("username");
//        String password = req.getParameter("password");
//        String status = req.getParameter("status");
//        String address = req.getParameter("address");
//        String dob = req.getParameter("dob");
//        String email = req.getParameter("email");
        
        ProfileDao pd = new ProfileDao();
        List<User> list = pd.getProfile(req.getParameter("userId"));
        req.setAttribute("data", list);
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }
}
