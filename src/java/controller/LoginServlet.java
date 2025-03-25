/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;
import dal.StaffDao;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Staff;
import model.Customer;
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
        String error =(String)request.getAttribute("error");
        if(error!= null)
            request.setAttribute("error", error);
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
        String rememberMe = request.getParameter("rem");
        
        Cookie cUsername = new Cookie("usr",username);
        Cookie cPassword = new Cookie("pwd",password);
        
        
        
        
            
            
        
            UserDAO ud = new UserDAO();
            User newUser = ud.getAuthentication(username);
            JsonObject jsonResponse = new JsonObject();
            if(newUser == null){
                //if username not found
                jsonResponse.addProperty("success",false);
                jsonResponse.addProperty("error", "Username and Password are incorrect");
                response.getWriter().write(jsonResponse.toString());
            }
            else{
                //if username is found
                if(newUser.getPassword().equals(password)){
                    //if the password is correct
                    Cookie cUser = new Cookie("cu",username);
                    Cookie cPass = new Cookie("cp",password);
                    Cookie cRem = new Cookie("cr",rememberMe);
                    if(rememberMe != null){
                        //save username to cookie if Remember Me is checked
                        // 
                        cUser.setMaxAge(60*60*24*2);
                        cPass.setMaxAge(60*60*24*2);
                        cRem.setMaxAge(60*60*24*2);
                    }else{
                        cUser.setMaxAge(0);
                        cPass.setMaxAge(0);
                        cRem.setMaxAge(0);
                    }
                    response.addCookie(cUser);
                    response.addCookie(cPass);
                    response.addCookie(cRem);

                   
                        
                    HttpSession session = request.getSession();
                    session.setAttribute("user",newUser);
                        
                    jsonResponse.addProperty("error",false);
                    jsonResponse.addProperty("success",true);
                    jsonResponse.addProperty("redirect","home");
                      
                    response.getWriter().write(jsonResponse.toString());
                        
                        
                        
                   
                }
                else{
                    //if the password is incorrect
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
