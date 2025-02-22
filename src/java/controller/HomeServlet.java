package controller;

import dal.ProductDao;
import dal.SlideShowDao;
import dal.TeddyDao;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.SlideShow;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Home", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDao pd = new ProductDao();
        SlideShowDao sld = new SlideShowDao();
        List<Product> list = pd.getTop10();
        TeddyDao td = new TeddyDao();
        list.forEach((product) -> {
            product.addTeddy(td.getAllTeddyOfProduct(product.getProductId()));
        });
        
        String slides = "";
        List<SlideShow> listSlide = sld.getSlideShow();
        
        for (SlideShow slideShow : listSlide) {
            slides += slideShow.toString() + ",";
        }
        
        req.setAttribute("slide", "[" + slides + "]");
        req.setAttribute("data", list);
        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }

}
