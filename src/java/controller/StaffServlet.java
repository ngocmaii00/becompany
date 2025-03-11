package controller;

import dal.StaffDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
//import java.util.Date;
import java.sql.Date;
import java.util.List;
import java.util.stream.Collectors;
import model.Product;
import model.Staff;

@WebServlet(name = "StaffServlet", urlPatterns = {"/staff"})
public class StaffServlet extends HttpServlet {

    StaffDao sd = new StaffDao();
    List<Staff> list = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        list = sd.getAll();
        req.setAttribute("staffs", list);
        req.getRequestDispatcher("staff.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        List<Staff> result = new ArrayList<>();
        list.forEach((staff) -> {
            if (staff.getFirstname().toLowerCase().contains(search.toLowerCase())
                    || staff.getLastname().toLowerCase().contains(search.toLowerCase())
                    || staff.getId().toLowerCase().contains(search.toLowerCase())) {
                result.add(staff);
            }
        });
        
        req.setAttribute("staffs", result);
        req.getRequestDispatcher("staff.jsp").forward(req, resp);
    }

}
