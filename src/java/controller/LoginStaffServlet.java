/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;
import dal.StaffDao;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Staff;


/**
 *
 * @author zeryus
 */
@WebServlet(name = "loginStaffServlet", urlPatterns = {"/login-staff"})
public class LoginStaffServlet extends HttpServlet {


  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       request.getRequestDispatcher("loginStaff.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
            
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberme");
        
     
        

//        StaffDao sd = new StaffDao();
//        Staff newStaff = sd.getAuthentication(username, password);
//        
//       
//        
//        
//        
//      
//        JsonObject jsonResponse = new JsonObject();
//
//
//        // if the account is not found
//        if(newStaff == null){
//          
//            jsonResponse.addProperty("success",false);
//            jsonResponse.addProperty("error", "Username and Password are incorrect");
//            response.getWriter().write(jsonResponse.toString());
//        }
//
//        //if the account is found
//        else{
//            
//            //if the Entered Password is correct
//            if(newStaff.getPassword().equals(password)){
//                Cookie cUser = new Cookie("cu",username);
//                Cookie cPass = new Cookie("cp",password);
//                Cookie cRem = new Cookie("cr",rememberMe);
//                if(rememberMe != null){
//                    cUser.setMaxAge(60*60*24*2);
//                    cPass.setMaxAge(60*60*24*2);
//                    cRem.setMaxAge(60*60*24*2);
//                }else{
//                    cUser.setMaxAge(0);
//                    cPass.setMaxAge(0);
//                    cRem.setMaxAge(0);
//                }
//                HttpSession session = request.getSession();
//                session.setAttribute("staff" + newStaff.getStaffId(),newStaff);
//                jsonResponse.addProperty("error",false);
//                
//                jsonResponse.addProperty("success",true);
//                jsonResponse.addProperty("redirect","admin.jsp"); 
//
//                response.getWriter().write(jsonResponse.toString());
//            }
//
//            //if the Entered password is not correct
//            else{
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
//            
//            jsonResponse.addProperty("success",false);
//            jsonResponse.addProperty("error", "Password are incorrect");
//            response.getWriter().write(jsonResponse.toString());
//            }
//        }
    }
    


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
