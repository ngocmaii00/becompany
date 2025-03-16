
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="ProsFilterServlet", urlPatterns={"/prosfilter"})
public class ProsFilterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String types = req.getParameter("types");
        String gender_raw = req.getParameter("gender");
        int top = Integer.parseInt(req.getParameter("top"));
        
        int gender = gender_raw == null ? 2 : Integer.parseInt(gender_raw);
        
        
//        req.setAttribute("users", users);
        req.getRequestDispatcher("user.jsp").forward(req, resp);
    }
   
}
