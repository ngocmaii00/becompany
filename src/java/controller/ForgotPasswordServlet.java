/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;

import dal.UserDAO;
import jakarta.mail.MessagingException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Random;

import model.User;
import utilities.MailUtil;
import utilities.Utility;

/**
 *
 * @author zeryus
 */
@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/forgot-password"})
public class ForgotPasswordServlet extends HttpServlet {
    //private JavaMailSender
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     private String generateRandomString(int length){
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder id = new StringBuilder();
        Random random = new Random();
        for(int i = 0; i < length; i++){
            id.append(chars.charAt(random.nextInt(chars.length()-0)+0));
        }
        
        return id.toString();
        
    }
     
    protected void updateResetPassword(String token, String email,HttpServletResponse response){
         try {
             UserDAO ud = new UserDAO();
             User user = ud.findByEmail(email);
             JsonObject jsonResponse = new JsonObject();
             
             if(user != null){
                 user.updateResetPasswordToken(token);
                 ud.update(user);
             }else{
                 jsonResponse.addProperty("alert", "Sorry, no user with that email exist!");
                 response.getWriter().write(jsonResponse.toString());
             }
         } catch (IOException ex) {
             System.err.println(ex);
         }
            
        
    }
    
    private void updatePassword(User user, String newPassword){
        UserDAO ud = new UserDAO();
        user.setPassword(newPassword);
        
        ud.update(user);
    }
    
    protected void processResetPasswordForm(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        
            String email = request.getParameter("email");
            String token = generateRandomString(45);
            try{
            updateResetPassword(token, email,response);
            String resetPasswordLink = Utility.getSiteURL(request) + "/reset_password?token=" + token;
            sendEmail(email,resetPasswordLink);
            System.out.println(resetPasswordLink);
            }catch(Exception e){
                System.err.println(e);
            }
            System.out.println(email);
            System.out.println(token);
            
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
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
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
            processResetPasswordForm(request,response);
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

    private void sendEmail(String email, String resetPasswordLink) {

        try{
        MailUtil recoverPwd = new MailUtil("smtp.gmail.com", "587", "viethuy2904@gmail.com", "hxop dlac pium pyws");
     
        
        String content = "<p> Hi, <p>"
                +"<p>You have requested to reset your password<p>"
                +"<p>Click the link below to proceed changing your password<p>"
                +"<a href=\"" + resetPasswordLink +"\">Change your password<a>"
                +"<p>Ignore this email if you did not make this request<p>";
        recoverPwd.sendEmail(email, "Reset Password Request", content);
        }catch(MessagingException e){
            System.err.println(e);
        }
    }

}
