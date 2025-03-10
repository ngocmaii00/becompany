/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author zeryus
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

   
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
            
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        UserDAO ud = new UserDAO();
        User newUser = ud.getAuthentication(username);
        JsonObject jsonResponse = new JsonObject();
        if(newUser == null){
            
            jsonResponse.addProperty("success",false);
            jsonResponse.addProperty("error", "Username and Password are incorrect");
            response.getWriter().write(jsonResponse.toString());
        }
        else{
            if(newUser.getPassword().equals(password)){
                HttpSession session = request.getSession();
                session.setAttribute("account",newUser);
                jsonResponse.addProperty("error",false);
                
                jsonResponse.addProperty("success",true);
                jsonResponse.addProperty("redirect","home");
                response.getWriter().write(jsonResponse.toString());
            }
            else{
                response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            jsonResponse.addProperty("success",false);
            jsonResponse.addProperty("error", "Password are incorrect");
            response.getWriter().write(jsonResponse.toString());
            }
        }
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
