package controller;

import dal.StaffDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import model.Staff;

/**
 *
 * @author Admin
 */
@WebServlet(name = "StaffUpdateServlet", urlPatterns = {"/staffupdate"})
public class StaffUpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
//            add staff
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
            String laststaffId = staffs.get(staffs.size() - 1).getId();
            String staffId = "S" + String.format("%05d", (Integer.parseInt(laststaffId.substring(1)) + 1));
            st.createStaff(staffId, lastname, firstname, username, password, position, email, address, dob);
            resp.sendRedirect("staff");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
//            update staff
            String staffId = req.getParameter("staffId");
            String firstname = req.getParameter("firstname");
            String lastname = req.getParameter("lastname");
            String address = req.getParameter("address");
            String email = req.getParameter("email");
            Date dob = Date.valueOf(req.getParameter("dob"));
            String position = req.getParameter("position");
            String status = req.getParameter("status");

            StaffDao st = new StaffDao();
            st.updateStaff(staffId, lastname, firstname, position, email, address, dob, status);
            resp.sendRedirect("staff");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
