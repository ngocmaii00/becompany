/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.JsonObject;
import dal.ProfileDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;
import model.Customer;
import utilities.CloudinaryUtils;

/**
 *
 * @author zeryus
 */
@WebServlet(name = "ProfileAvatarServlet", urlPatterns = {"/profile_avatar"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProfileAvatarServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
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
        JsonObject jsonResponse = new JsonObject();
        Part filePart = request.getPart("file");
        if (filePart == null || filePart.getSize() == 0) {
            jsonResponse.addProperty("error", "Please select an image");
            response.getWriter().write(jsonResponse.toString());
          
        }
        
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        
//        File tempFile = File.createTempFile("upload_", ".jpg");
//        Files.copy(filePart.getInputStream(), tempFile.toPath());
        InputStream fileStream = filePart.getInputStream();

// Convert to byte array for Cloudinary
        byte[] fileBytes = fileStream.readAllBytes();
        
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "diyupyilg",
            "api_key", "245387758415963",
            "api_secret", "jjvZ1ed5gQg_Cmb9iMZTRqdd2xI"));
        
        // Upload lên Cloudinary
        Map<String, Object> uploadParams = ObjectUtils.asMap("resource_type", "image");
        Map uploadResult = cloudinary.uploader().upload(fileBytes, uploadParams);
        // Xóa file tạm
//        tempFile.delete();

        // Chuyển hướng về trang JSP với link ảnh
        String imageUrl = (String) uploadResult.get("secure_url");
        System.out.println(imageUrl);
//*********************************** GET CURRENT SESSION **************************************
        HttpSession customerSession = request.getSession(false);
        Customer customer = (Customer)customerSession.getAttribute("user");
        
        customer.setImage(imageUrl);
        new ProfileDao().updateImage(customer);
        
        jsonResponse.addProperty("success", customer.getImage());
        response.getWriter().write(jsonResponse.toString());
        
//**********************************************************************************************        
       
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
