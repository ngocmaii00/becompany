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
import java.util.ArrayList;
import java.util.List;
import model.SlideShow;
import model.Teddy;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Home", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    ProductDao pd = new ProductDao();
    List<Product> list = pd.getTop10();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SlideShowDao sld = new SlideShowDao();
        list = pd.getTop10();
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String color = req.getParameter("color");
        String size = req.getParameter("size");
        Product product = new Product();
        for (Product p : list) {
            if (p.getProductId().compareToIgnoreCase(productId) == 0) {
                product = p;
                break;
            }
        }

        PrintWriter out = resp.getWriter();
        if (color != null) { //find sizes by color
            ArrayList<String> haveSizes = new ArrayList<>();
            for (Teddy teddy : product.getTeddies()) {
                if (teddy.getColor().compareTo(color) == 0) {
                    haveSizes.add(teddy.getSize());
                }
            }

            out.println("<div class=\"home-teddy-colors\">");
            for (String c : product.getColors()) {
                if (c.compareTo(color) == 0) {
                    out.println("<span onclick=\"changeSize('" + c + "', '" + productId + "')\" class=\"home-teddy-color chosen-color\" style=\"background-color: " + c + "\">"
                            + "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 16 16\" fill=\"currentColor\" class=\"size-4 check-icon\">\n"
                            + "                                            <path fill-rule=\"evenodd\" d=\"M12.416 3.376a.75.75 0 0 1 .208 1.04l-5 7.5a.75.75 0 0 1-1.154.114l-3-3a.75.75 0 0 1 1.06-1.06l2.353 2.353 4.493-6.74a.75.75 0 0 1 1.04-.207Z\" clip-rule=\"evenodd\" />\n"
                            + "                                            </svg>"
                            + "</span>");
                } else {
                    out.println("<span onclick=\"changeSize('" + c + "', '" + productId + "')\" class=\"home-teddy-color\" style=\"background-color: " + c + "\">"
                            + "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 16 16\" fill=\"currentColor\" class=\"size-4 check-icon\">\n"
                            + "                                            <path fill-rule=\"evenodd\" d=\"M12.416 3.376a.75.75 0 0 1 .208 1.04l-5 7.5a.75.75 0 0 1-1.154.114l-3-3a.75.75 0 0 1 1.06-1.06l2.353 2.353 4.493-6.74a.75.75 0 0 1 1.04-.207Z\" clip-rule=\"evenodd\" />\n"
                            + "                                            </svg>"
                            + "</span>");
                }
            }
            out.println("</div>");

            out.println("<div class=\"home-teddy-sizes\">");
            for (String s : product.getSizes()) {
                if (haveSizes.contains(s)) {
                    out.println("<span onclick=\"changeColor('" + s + "', '" + productId + "')\" class=\"home-teddy-size chosen-size\">" + s + "</span>");
                } else {
                    out.println("<span onclick=\"changeColor('" + s + "', '" + productId + "')\" class=\"home-teddy-size\">" + s + "</span>");
                }
            }
            out.println("</div>");
        }

        if (size != null) { //finds colors by size
            List<String> haveColors = new ArrayList<>();
            for (Teddy teddy : product.getTeddies()) {
                if (teddy.getSize().compareTo(size) == 0) {
                    haveColors.add(teddy.getColor());
                }
            }

            out.println("<div class=\"home-teddy-colors\">");
            for (String c : product.getColors()) {
                if (haveColors.contains(c)) {
                    out.println("<span onclick=\"changeSize('" + c + "', '" + productId + "')\" class=\"home-teddy-color chosen-color\" style=\"background-color: " + c + "\">"
                            + "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 16 16\" fill=\"currentColor\" class=\"size-4 check-icon\">\n"
                            + "                                            <path fill-rule=\"evenodd\" d=\"M12.416 3.376a.75.75 0 0 1 .208 1.04l-5 7.5a.75.75 0 0 1-1.154.114l-3-3a.75.75 0 0 1 1.06-1.06l2.353 2.353 4.493-6.74a.75.75 0 0 1 1.04-.207Z\" clip-rule=\"evenodd\" />\n"
                            + "                                            </svg>"
                            + "</span>");
                } else {
                    out.println("<span onclick=\"changeSize('" + c + "', '" + productId + "')\" class=\"home-teddy-color\" style=\"background-color: " + c + "\">"
                            + "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 16 16\" fill=\"currentColor\" class=\"size-4 check-icon\">\n"
                            + "                                            <path fill-rule=\"evenodd\" d=\"M12.416 3.376a.75.75 0 0 1 .208 1.04l-5 7.5a.75.75 0 0 1-1.154.114l-3-3a.75.75 0 0 1 1.06-1.06l2.353 2.353 4.493-6.74a.75.75 0 0 1 1.04-.207Z\" clip-rule=\"evenodd\" />\n"
                            + "                                            </svg>"
                            + "</span>");
                }
            }
            out.println("</div>");
            out.println("<div class=\"home-teddy-sizes\">");
            for (String s : product.getSizes()) {
                if (s.compareTo(size) == 0) {
                    out.println("<span onclick=\"changeColor('" + s + "', '" + productId + "')\" class=\"home-teddy-size chosen-size\">" + s + "</span>");
                } else {
                    out.println("<span onclick=\"changeColor('" + s + "', '" + productId + "')\" class=\"home-teddy-size\">" + s + "</span>");
                }
            }
            out.println("</div>");
        }

    }
}
