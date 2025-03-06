package dal;

import dal.DBConnect;
import java.util.List;
import model.Staff;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;

public class StaffDao extends DBConnect {

    public List<Staff> getAll() {
        List<Staff> list = new ArrayList<>();
        String sql = "select * from Staff";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                list.add(new Staff(result.getString("staffId"), result.getString("username"), result.getString("password"), result.getString("position"), result.getString("firstname"), result.getString("lastname"), result.getString("email"), result.getString("address"), result.getString("dob"), result.getInt("status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void createStaff(String staffId, String lastName, String firstName, String username, String password, String position, String email, String address, Date dob) {
        String sql = "INSERT INTO Staff (staffId, username, [password], position, firstName, lastName, email, [address], dob) VALUES "
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, staffId);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, position);
            st.setString(5, firstName);
            st.setString(6, lastName);
            st.setString(7, email);
            st.setString(8, address);
            st.setDate(9, dob);

            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteStaff(String staffId) {
        String sql = "delete from Staff where staffId = '" + staffId + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            System.out.println(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateStaff(String staffId, String lastName, String firstName, String position, String email, String address, Date dob, int status) {
        String sql = "update Staff set firstName=?, lastName=?, position=?, dob=?, email=?, [address] = ?, [status] = ? where  staffId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, firstName);
            st.setString(2, lastName);
            st.setString(3, position);
            st.setDate(4, dob);
            st.setString(5, email);
            st.setString(6, address);
            st.setInt(7, status);
            st.setString(8, staffId);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
