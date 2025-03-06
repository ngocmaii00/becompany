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
import model.Staff;

/**
 *
 * @author Admin
 */
@WebServlet(name = "StaffServlet", urlPatterns = {"/staff"})
public class StaffController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StaffDao sd = new StaffDao();
        List<Staff> list = sd.getAll();
        req.setAttribute("staffs", list);
        req.getRequestDispatcher("staff.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {                    
//            String staffId = req.getParameter("staffId");
            String firstname = req.getParameter("firstName");
            String lastname = req.getParameter("lastName");
            String address = req.getParameter("address");
            String email = req.getParameter("email");
            Date dob = Date.valueOf(req.getParameter("dob"));
            String position = req.getParameter("position");
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            StaffDao st = new StaffDao();
            List<Staff> staffs = st.getAll();
            String laststaffId = staffs.get(staffs.size() - 1).getStaffId();
            String staffId = "S"+ String.format("%05d", (Integer.parseInt(laststaffId.substring(1)) + 1));
            st.createStaff(staffId, lastname, firstname, username, password, position, email, address, dob);
            resp.sendRedirect("staff");
        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
