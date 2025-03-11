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
        String search = req.getParameter("search");
        List<Product> result = new ArrayList<>();
        list.forEach((product) -> {
            if (product.getProductName().toLowerCase().contains(search.toLowerCase())
                    || product.getProductId().toLowerCase().contains(search.toLowerCase())) {
                result.add(product);
            }
        });

        req.setAttribute("pros", result);
        req.getRequestDispatcher("pros.jsp").forward(req, resp);
    }

}
