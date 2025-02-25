package controller;

import dal.ProductDao;
import dal.TeddyDao;
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
@WebServlet(name="TypeServlet", urlPatterns={"/type"})
public class TypeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String color = req.getParameter("color");
        String size = req.getParameter("size");
        String from = req.getParameter("from");
        String to = req.getParameter("to");
        String[] status = req.getParameterValues("status");
        String[] rating = req.getParameterValues("status");
        type = (type == null || type.length() <= 0) ? "all" : type;
        ProductDao pd = new ProductDao();
        List<Product> list = pd.getProductByType(type);
        
        TeddyDao td = new TeddyDao();
        list.forEach((product) -> {
            product.addTeddy(td.getAllTeddyOfProduct(product.getProductId()));
        });
        
        req.setAttribute("title", type);
        req.setAttribute("data", list);
        req.getRequestDispatcher("type.jsp").forward(req, resp);
    }
   
}
