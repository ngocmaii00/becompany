package controller;

import dal.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.User;

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
//        HttpSession session = req.getSession();
//        User user = ((User) session.getAttribute("user"));
//        req.setAttribute("id", user.getId());
        this.list = pd.getAll();
        List<String> types = new ArrayList<>();
        for (Product p : list) {
            if(!types.contains(p.getType())) {
                types.add(p.getType());
            }
        }
        req.setAttribute("pros", list);        
        req.setAttribute("types", types);
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
