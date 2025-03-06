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
@WebServlet(name = "ResetPassWordServlet", urlPatterns = {"/reset-password"})
public class ResetPasswordServlet extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private void updatePassword(User user, String newPassword){
        UserDAO ud = new UserDAO();
        user.setPassword(newPassword);
        
        ud.update(user);
    }
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
        String token = request.getParameter("token");
        
        UserDAO ud = new UserDAO();
        
         User getUser= ud.findByResetPasswordToken(token);
        if(getUser != null){
            HttpSession session = request.getSession();
            session.setAttribute("changePwdUser", getUser);
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("error.jsp").forward(request,response);
        
        }
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
        JsonObject jsonResponse = new JsonObject();
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if(password.equals(confirmPassword)){
            HttpSession session = request.getSession(false);
            
            User getUser = (User)session.getAttribute("changePwdUser");
            
            UserDAO ud = new UserDAO();
            getUser.setPassword(password);
            ud.update(getUser);
            jsonResponse.addProperty("error", "Change password completed! You may press Return to return to Login Page");
            
            response.getWriter().write(jsonResponse.toString());
        }else{
            
            jsonResponse.addProperty("error", "Password does not match");
            response.getWriter().write(jsonResponse.toString());
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
