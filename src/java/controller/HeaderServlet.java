package controller;

import dal.HeaderDao;
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

/**
 *
 * @author PC
 */
@WebServlet(name = "HeaderServlet", urlPatterns = {"/header"})
public class HeaderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        try {
            HeaderDao hd = new HeaderDao();
            List<String> list = hd.getAll();
            list.forEach((name) -> {
                out.print("<button class=\"flex justify-center items-center hover:bg-[#563a2d] hover:text-white text-sm md:text-base\">\n"
                        + "<a class=\"md:px-12 px-6 \" href=\"type?type="+name+"\">"+name+"</a>\n"
                        + "</button>");
            });
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
