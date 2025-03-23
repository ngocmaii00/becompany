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
import model.Customer;
import model.CustomerDetail;
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
     
        private CustomerDetail nameProcessor(GooglePojo ggAccount){
            String firstName = ggAccount.getFirst_name();
            String givenName = ggAccount.getGiven_name();
            String familyName = ggAccount.getFamily_name();
            String fullName = ggAccount.getFamily_name();
            
            if(firstName !=null && givenName != null && familyName != null)
                return new CustomerDetail(firstName.concat(givenName),familyName);
            
            else if(firstName !=null && givenName == null && familyName != null)
                return new CustomerDetail(firstName,familyName);
            
            else if(firstName == null && givenName != null && familyName != null)
                return new CustomerDetail(givenName,familyName);
            else if(firstName !=null && givenName != null && familyName == null)
                return new CustomerDetail(firstName,givenName);
            else if(firstName !=null && givenName == null && familyName != null)
                return new CustomerDetail(firstName,familyName);
            else if(firstName ==null && givenName == null && familyName != null)
                return new CustomerDetail(" ",familyName);
            else if(firstName !=null && givenName == null && familyName == null)
                return new CustomerDetail(firstName," ");
            else if(firstName ==null && givenName != null && familyName == null)
                return new CustomerDetail(givenName," ");
            else
                return new CustomerDetail(" "," ");
            
        
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
        
        String accessToken = GoogleUtils.getToken(code);
        GooglePojo acc = GoogleUtils.getUserInfo(accessToken);
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
        // Customer is not logged in, so redirect them to normal login flow
        response.sendRedirect("https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:9999/becompany/login-google&response_type=code&client_id=852116808382-82db8ra9hkc52bsm7dmq7utbej4d9hi3.apps.googleusercontent.com&prompt=consent"); // Force login again
        
        }else{
            
        String code = request.getParameter("code");
        String accessToken = GoogleUtils.getToken(code);
        GooglePojo googleAccountInfo = GoogleUtils.getUserInfo(accessToken);
        System.err.println(googleAccountInfo.toString());
        
        UserDAO ud = new UserDAO();
        Customer ggUser = ud.findByEmail(googleAccountInfo.getEmail());
        
        if(ggUser!= null && ggUser.getAuth_provider().equals("GOOGLE")){
            //if user has already exist
            HttpSession session = request.getSession();
            session.setAttribute("user",ggUser);
            response.sendRedirect("home");
        }else if(ggUser!= null && !ggUser.getAuth_provider().equals("GOOGLE")){
            //check if the user is using a google acount email on local login
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
            String picture = googleAccountInfo.getPicture();
            
            
            HttpSession session = request.getSession();
            
            ggUser = new Customer(userId,email,username,null,"active","USER","GOOGLE",picture,null,nameProcessor(googleAccountInfo));
            ud.addUserGoogleFacebook(ggUser);
            session.setAttribute("user",ggUser);
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
