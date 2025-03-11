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
import java.util.stream.Collectors;
import model.Product;

@WebServlet(name="Search", urlPatterns={"/search"})
public class SearchServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        ProductDao pd = new ProductDao();
        List<Product> list = pd.getAll();
        List<Product> result = list.stream().filter((p) -> p.getProductName().toLowerCase().contains(search.toLowerCase())).collect(Collectors.toList());
        
        req.setAttribute("result", result);
        req.setAttribute("search", search);
        req.getRequestDispatcher("search.jsp").forward(req, resp);
    }
   
}
