package controller;

import dal.ColorDao;
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
@WebServlet(name="FilterServlet", urlPatterns={"/filter"})
public class FilterServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String colors[] = req.getParameterValues("color");
        String sizes[] = req.getParameterValues("size");
        String from = req.getParameter("from");
        String to = req.getParameter("to");
        String[] status = req.getParameterValues("status");
        String[] rating = req.getParameterValues("rating");
        type = (type == null || type.length() <= 0) ? "all" : type;
        ProductDao pd = new ProductDao();
        List<Product> list = pd.getProductByFilter(type, colors, sizes, from, to, status, rating);
        
        ColorDao cd = new ColorDao();
        List<String> colorsArray = cd.getAllColor();
        
        req.setAttribute("colors", colorsArray);
        req.setAttribute("title", type);
        req.setAttribute("data", list);
        req.getRequestDispatcher("type.jsp").forward(req, resp);
    }
}
