/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;
import dal.ProfileDao;
import dal.UserDAO;
import java.io.IOException;

import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;

import model.Customer;
import model.CustomerDetail;
import utilities.CloudinaryUtils;

/**
 *
 * @author PC
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession userSession = req.getSession(false);
        Customer user = (Customer) userSession.getAttribute("user");

        ProfileDao pd = new ProfileDao();
        if(pd.getProfile(user.getId()) != null)
            user = pd.getProfile(user.getId());

        userSession.setAttribute("user", user);

        req.getRequestDispatcher("profile.jsp").forward(req, resp);

    }

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        HttpSession userSession = req.getSession(false);

        Customer user = (Customer) userSession.getAttribute("user");
        boolean hasCustomerDetail = user.getUserDetail() != null;
        
        
        JsonObject jsonResponse = new JsonObject();
        String old_password = user.getPassword();

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String gender = req.getParameter("gender");
        String dob = req.getParameter("dob");

//************************************ Image Extraction********************************************
        // Save file temporarily
//        java.io.File file = saveTempFile(filePart, fileName);
//         String publicUrl = DriveFileUploader.uploadFile(driveService, file, fileName, "image/jpeg");
//         System.err.println("Public link: " + publicUrl);
//******************************************************************************************************
        


            
        password = password.equals("") ? user.getPassword() : password;
        firstName = firstName.equals("") ? user.getUserDetail().getFirstName() : firstName;
        lastName = lastName.equals("") ? user.getUserDetail().getLastName() : lastName;
        email = email.equals("") ? " " : email;
        phone = phone.equals("") ? " " : phone;
        address = address.equals("") ? " " : address;
        
        gender = gender.equals("") ? "1" : gender;
        Date dateofbirth;
        if(dob.equals(""))
            dateofbirth = Date.valueOf(LocalDate.now());
        else{
            dateofbirth = Date.valueOf(dob);
        }

        if (password.equals(old_password)) {
            user.setUsername(username);
            if(!hasCustomerDetail)
                user.setUserDetail(new CustomerDetail(firstName,lastName));
            else{
                user.getUserDetail().setFirstName(firstName);
                user.getUserDetail().setLastName(lastName);
            }
            user.setEmail(email);
            user.getUserDetail().setPhone(phone);
            user.getUserDetail().setAddress(address);
            user.getUserDetail().setGender(Boolean.parseBoolean(gender));
            user.getUserDetail().setDob(dateofbirth);

            UserDAO ud = new UserDAO();
            if (hasCustomerDetail) {
                ud.updateCustomerProfile(user);
            } else {
                ud.addCustomerProfile(user);
            }

            jsonResponse.addProperty("success", true);
            jsonResponse.addProperty("redirect", "profile");
            resp.getWriter().write(jsonResponse.toString());
        } else {

            if (password.equals(confirmPassword)) {

                user.setUsername(username);
                user.setPassword(password);
                if(!hasCustomerDetail)
                    user.setUserDetail(new CustomerDetail(firstName,lastName));
                else{
                    user.getUserDetail().setFirstName(firstName);
                    user.getUserDetail().setLastName(lastName);
                }
                user.setEmail(email);
                user.getUserDetail().setPhone(phone);
                user.getUserDetail().setAddress(address);
                user.getUserDetail().setGender(Boolean.parseBoolean(gender));
                user.getUserDetail().setDob(dateofbirth);

                UserDAO ud = new UserDAO();
                if (hasCustomerDetail) {
                    ud.updateCustomerProfile(user);
                } else {
                    ud.addCustomerProfile(user);
                }

                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("redirect", "profile");
                resp.getWriter().write(jsonResponse.toString());
            } else {
                jsonResponse.addProperty("error", "New Password and Confirm Password does not match!");
                resp.getWriter().write(jsonResponse.toString());
            }
        }
    }

}
