package controller;

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

@WebServlet(name = "ColorSizeController", urlPatterns = {"/colorsize"})
public class ColorSizeController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String color = req.getParameter("color");
        String size = req.getParameter("size");
        String color_raw = req.getParameter("colors");
        String[] colors = color_raw.substring(1, color_raw.length() - 1).split(", ");
        String size_raw = req.getParameter("sizes");
        String[] sizes = size_raw.substring(1, size_raw.length() - 1).split(", ");
        TeddyDao td = new TeddyDao();

        PrintWriter out = resp.getWriter();
        if (color != null) {
            List<String> haveSizes = td.filterTeddyBySizeOrColor(productId, color, "");

            out.println("<div class=\"home-teddy-colors\">");
            for (String c : colors) {
                if (c.compareTo(color) == 0) {
                    out.println("<span onclick=\"changeSize('" + c + "', '" + productId + "', '" + color_raw + "', '" + size_raw + "')\" class=\"home-teddy-color chosen-color\" style=\"background-color: " + c + "\">"
                            + "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 16 16\" fill=\"currentColor\" class=\"size-4 check-icon\">\n"
                            + "                                            <path fill-rule=\"evenodd\" d=\"M12.416 3.376a.75.75 0 0 1 .208 1.04l-5 7.5a.75.75 0 0 1-1.154.114l-3-3a.75.75 0 0 1 1.06-1.06l2.353 2.353 4.493-6.74a.75.75 0 0 1 1.04-.207Z\" clip-rule=\"evenodd\" />\n"
                            + "                                            </svg>"
                            + "</span>");
                } else {
                    out.println("<span onclick=\"changeSize('" + c + "', '" + productId + "', '" + color_raw + "', '" + size_raw + "')\" class=\"home-teddy-color\" style=\"background-color: " + c + "\">"
                            + "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 16 16\" fill=\"currentColor\" class=\"size-4 check-icon\">\n"
                            + "                                            <path fill-rule=\"evenodd\" d=\"M12.416 3.376a.75.75 0 0 1 .208 1.04l-5 7.5a.75.75 0 0 1-1.154.114l-3-3a.75.75 0 0 1 1.06-1.06l2.353 2.353 4.493-6.74a.75.75 0 0 1 1.04-.207Z\" clip-rule=\"evenodd\" />\n"
                            + "                                            </svg>"
                            + "</span>");
                }
            }
            out.println("</div>");
            
            out.println("<div class=\"home-teddy-sizes\">");
            for (String s : sizes) {
                if (haveSizes.contains(s)) {
                    out.println("<span onclick=\"changeColor('" + s + "', '" + productId + "', '" + color_raw + "', '" + size_raw + "')\" class=\"home-teddy-size chosen-size\">" + s + "</span>");
                } else {
                    out.println("<span onclick=\"changeColor('" + s + "', '" + productId + "', '" + color_raw + "', '" + size_raw + "')\" class=\"home-teddy-size\">" + s + "</span>");
                }
            }
            out.println("</div>");
        }

        if (size != null) {
            List<String> haveColors = td.filterTeddyBySizeOrColor(productId, "", size);

            out.println("<div class=\"home-teddy-colors\">");
            for (String c : colors) {
                if (haveColors.contains(c)) {
                    out.println("<span onclick=\"changeSize('" + c + "', '" + productId + "', '" + color_raw + "', '" + size_raw + "')\" class=\"home-teddy-color chosen-color\" style=\"background-color: " + c + "\">"
                            + "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 16 16\" fill=\"currentColor\" class=\"size-4 check-icon\">\n"
                            + "                                            <path fill-rule=\"evenodd\" d=\"M12.416 3.376a.75.75 0 0 1 .208 1.04l-5 7.5a.75.75 0 0 1-1.154.114l-3-3a.75.75 0 0 1 1.06-1.06l2.353 2.353 4.493-6.74a.75.75 0 0 1 1.04-.207Z\" clip-rule=\"evenodd\" />\n"
                            + "                                            </svg>"
                            + "</span>");
                } else {
                    out.println("<span onclick=\"changeSize('" + c + "', '" + productId + "', '" + color_raw + "', '" + size_raw + "')\" class=\"home-teddy-color\" style=\"background-color: " + c + "\">"
                            + "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 16 16\" fill=\"currentColor\" class=\"size-4 check-icon\">\n"
                            + "                                            <path fill-rule=\"evenodd\" d=\"M12.416 3.376a.75.75 0 0 1 .208 1.04l-5 7.5a.75.75 0 0 1-1.154.114l-3-3a.75.75 0 0 1 1.06-1.06l2.353 2.353 4.493-6.74a.75.75 0 0 1 1.04-.207Z\" clip-rule=\"evenodd\" />\n"
                            + "                                            </svg>"
                            + "</span>");
                }
            }
            out.println("</div>");
            out.println("<div class=\"home-teddy-sizes\">");
            for (String s : sizes) {
                if (s.compareTo(size) == 0) {
                    out.println("<span onclick=\"changeColor('" + s + "', '" + productId + "', '" + color_raw + "', '" + size_raw + "')\" class=\"home-teddy-size chosen-size\">" + s + "</span>");
                } else {
                    out.println("<span onclick=\"changeColor('" + s + "', '" + productId + "', '" + color_raw + "', '" + size_raw + "')\" class=\"home-teddy-size\">" + s + "</span>");
                }
            }
            out.println("</div>");
        }

    }

}
