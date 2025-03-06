package controller;

import dal.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name="Pros", urlPatterns={"/pros"})
public class ProsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDao pd = new ProductDao();
        List<Product> list = pd.getAll();
        req.setAttribute("pros", list);
        req.getRequestDispatcher("pros.jsp").forward(req, resp);
    }
   
}
