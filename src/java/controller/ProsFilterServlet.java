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

@WebServlet(name = "ProsFilterServlet", urlPatterns = {"/prosfilter"})
public class ProsFilterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String types = req.getParameter("types");
        String gender_raw = req.getParameter("gender");
        int top = Integer.parseInt(req.getParameter("top"));

        int gender = gender_raw == null ? 2 : Integer.parseInt(gender_raw);

        ProductDao pd = new ProductDao();
        List<Product> pros = pd.getProductByFilter(gender, types, type, top);
        List<Product> list = pd.getAll();
        List<String> typeString = new ArrayList<>();
        for (Product p : list) {
            if (!typeString.contains(p.getType())) {
                typeString.add(p.getType());
            }
        }

        req.setAttribute("types", typeString);
        req.setAttribute("pros", pros);
        req.getRequestDispatcher("pros.jsp").forward(req, resp);
    }

}
