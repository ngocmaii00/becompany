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
import java.util.Random;

/**
 *
 * @author zeryus
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/signup"})
public class SignUpServlet extends HttpServlet {

    private String generateUserId(){
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder id = new StringBuilder();
        Random random = new Random();
        for(int i = 0; i < 6; i++){
            id.append(chars.charAt(random.nextInt(chars.length()-0)+0));
        }
        
        return id.toString();
        
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
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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

        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password_re_enter = request.getParameter("password_re_enter");

        email = email != null ? email.trim() : "";
        username = username != null ? username.trim() : "";
        password = password != null ? password : "";
        password_re_enter = password_re_enter != null ? password_re_enter : "";

        JsonObject jsonResponse = new JsonObject();
        UserDAO ud = new UserDAO();

        try {
            if (email.equals("") || username.equals("") || password.equals("") || password_re_enter.equals("")) {
                jsonResponse.addProperty("error", "Please enter all field!");
            } else if (ud.getSignUpEmail(email) != null && ud.getSignUpEmail(email).equals(email) 
                    && ud.getSignUpUsername(username) != null && ud.getSignUpUsername(username).equals(username)) {
                jsonResponse.addProperty("error", "This Email and Username has already exist!");
            } else if (ud.getSignUpEmail(email) != null && ud.getSignUpEmail(email).equals(email)) {
                jsonResponse.addProperty("error", "This Email has already exist!");
            } else if (ud.getSignUpUsername(username) != null && ud.getSignUpUsername(username).equals(username)) {
                jsonResponse.addProperty("error", "This Username has already exist!");
            } else if (!password_re_enter.equals(password)) {
                jsonResponse.addProperty("error", "The password and Re-enter Password does not match");
            } else {
                String userId;
                while (true) {
                    userId = generateUserId();
                    if (!ud.searchUserId(userId))
                        break;
                }
                ud.addUser(userId, email, username, password);
                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("redirect", "login");
            }
        } catch (Exception e) {
            jsonResponse.addProperty("error", "Internal server error: " + e.getMessage());
            e.printStackTrace();
        } finally {
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
