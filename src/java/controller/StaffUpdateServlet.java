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

/**
 *
 * @author Admin
 */
@WebServlet(name = "StaffUpdateServlet", urlPatterns = {"/staffupdate"})
public class StaffUpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String staffId = req.getParameter("staffId");
        try {
            StaffDao st = new StaffDao();
            st.deleteStaff(staffId);
        } catch (Exception e) {
            System.out.println(e);
        }

        resp.sendRedirect("staff");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String staffId = req.getParameter("staffId");
            String firstname = req.getParameter("firstname");
            String lastname = req.getParameter("lastname");
            String address = req.getParameter("address");
            String email = req.getParameter("email");
            Date dob = Date.valueOf(req.getParameter("dob"));
            String position = req.getParameter("position");
            int status = Integer.parseInt(req.getParameter("status"));

            StaffDao st = new StaffDao();
            st.updateStaff(staffId, lastname, firstname, position, email, address, dob, status);
            resp.sendRedirect("staff");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
