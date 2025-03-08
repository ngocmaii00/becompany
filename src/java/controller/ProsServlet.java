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
import java.util.List;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Pros", urlPatterns = {"/pros"})
public class ProsServlet extends HttpServlet {
    ProductDao pd = new ProductDao();
    List<Product> list = new ArrayList<>();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.list = pd.getAll();
        req.setAttribute("pros", list);
        req.getRequestDispatcher("pros.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String productName = req.getParameter("productName");
            String origin = req.getParameter("origin");
            String description = req.getParameter("description");
            String images = req.getParameter("images");
            String type = req.getParameter("type");
            String status = req.getParameter("status");
            String manufacturer = req.getParameter("manufacturer");

//            ProductDao pd = new ProductDao();
//
//            List<Product> products = pd.getAll();

            String lastProsId = this.list.get(this.list.size() - 1).getProductId();
            String productId = "P" + String.format("%05d", (Integer.parseInt(lastProsId.substring(1)) + 1));
            pd.addProduct(productId, productName, origin, description, manufacturer, images, type, status);
            resp.sendRedirect("pros");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
