package controller;

import dal.ProductDao;
import java.io.IOException;
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
@WebServlet(name="TypeServlet", urlPatterns={"/type"})
public class TypeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        type = (type == null || type.length() <= 0) ? "all" : type;
        ProductDao pd = new ProductDao();
        List<Product> list = pd.getProductByType(type);
        
        req.setAttribute("title", type);
        req.setAttribute("data", list);
        req.getRequestDispatcher("type.jsp").forward(req, resp);
    }
    
   
}
