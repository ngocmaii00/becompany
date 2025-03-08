
package controller;

import dal.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import model.Product;

@WebServlet(name="ImageServlet", urlPatterns={"/image"})
public class ImageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        ProductDao pd = new ProductDao();
        Product product = pd.getProductById(productId);
        String[] images = product.getImages();
        int[] count = new int[images.length];
        for (int i = 0; i < images.length; i++) {
            count[i] = i;
        }
        
        req.setAttribute("images", images);
        req.setAttribute("count", count);
        req.setAttribute("productName", product.getProductName());
        req.setAttribute("productId", productId);
        req.getRequestDispatcher("image.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String[] images = req.getParameterValues("image");
        ArrayList<String> images2 = new ArrayList<>();
        
        for (String string : images) {
            if(string.length()>0) images2.add(string);
        }
        ProductDao pd = new ProductDao();
        
        String image = String.join(", ", images2);
        pd.updateProductImage(productId, image);
        resp.sendRedirect("image?productId="+productId);
    }
   
    
}
