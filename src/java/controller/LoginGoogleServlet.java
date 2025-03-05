/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import model.GooglePojo;
import model.User;
import utilities.GoogleUtils;

/**
 *
 * @author zeryus
 */
@WebServlet(name = "loginGoogleServlet", urlPatterns = {"/login-google"})
public class LoginGoogleServlet extends HttpServlet {

    
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
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        GoogleUtils gg = new GoogleUtils();
        String accessToken = gg.getToken(code);
        GooglePojo acc = gg.getUserInfo(accessToken);
        System.out.println(acc.toString());
                
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
        String error = request.getParameter("error");
        String error_subtype=request.getParameter("error_subtype");
        if ("interaction_required".equals(error) || "login_required".equals(error) ||"access_denied".equals(error_subtype) ) {
        // User is not logged in, so redirect them to normal login flow
        response.sendRedirect("https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/becompany/login-google&response_type=code&client_id=852116808382-82db8ra9hkc52bsm7dmq7utbej4d9hi3.apps.googleusercontent.com&prompt=consent"); // Force login again
        
        }else{
            
        String code = request.getParameter("code");
        GoogleUtils gg = new GoogleUtils();
        String accessToken = gg.getToken(code);
        GooglePojo googleAccountInfo = gg.getUserInfo(accessToken);
        
        UserDAO ud = new UserDAO();
        User ggUser = ud.findByEmail(googleAccountInfo.getEmail());
        
        if(ggUser!= null && ggUser.getAuth_provider().equals("GOOGLE")){
            response.sendRedirect("home");
        }else if(ggUser!= null && !ggUser.getAuth_provider().equals("GOOGLE")){
            request.setAttribute("nonLocalError", "This email has already been Sign Up");
            request.getRequestDispatcher("login").forward(request, response);
        }else{
            
            String userId;
                while (true) {
                    userId = generateUserId();
                    if (!ud.searchUserId(userId))
                        break;
                }

            String email = googleAccountInfo.getEmail();
            String username = googleAccountInfo.getEmail().split("@")[0];
            
            ud.addUserGoogleFacebook(userId, email, username,"GOOGLE");
            HttpSession session = request.getSession();
            User newUser = new User(userId,email,username,"active");
            session.setAttribute("account",newUser);
            response.sendRedirect("home");
        }
        
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
        processRequest(request, response);
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
