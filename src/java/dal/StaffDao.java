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
        String sql = """
                     select u.[userId],u.username,u.[password],u.role , ud.firstName, ud.lastname, u.email, ud.address, ud.DOB, u.[status]
                     	from [User] u JOIN UserDetail ud on u.userId = ud.userId where u.role <> 'USER'""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                list.add(new Staff(result.getString("userId"), result.getString("username"), result.getString("password"), 
                                    result.getString("role"), result.getString("firstName"), result.getString("lastname"), 
                                    result.getString("email"), result.getString("address"), result.getString("DOB"), result.getString("status")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void createStaff(String staffId, String lastName, String firstName, String username, String password, String position, String email, String address, Date dob) {
        String sql = "INSERT INTO [User] (userId, username, [password], role, email) VALUES "
                + "(?, ?, ?, ?, ?);"
                + "INSERT INTO UserDetail(userId,firstName, lastName, [address], dob) values"
                + "(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, staffId);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, position);
            st.setString(5, email);
            
            st.setString(6, staffId);
            st.setString(7, firstName);
            st.setString(8, lastName);
            
            st.setString(9, address);
            st.setDate(10, dob);

            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteStaff(String staffId) {
        String sql = "delete from UserDetail where userId = '" + staffId + "';"
        +"delete from [User] where userId = '" + staffId + "';";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            System.out.println(sql);
            st.executeUpdate();
           
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateStaff(String staffId, String lastName, String firstName, String position, String email, String address, Date dob, String status) {
         String sql = "UPDATE [User] " +
                 "SET role = ?, email = ?, [status] = ? " +
                 "WHERE userId = '" + staffId +"' ; " +
                 
                 "UPDATE UserDetail " +
                 "SET firstName = ?, lastName = ?, dob = ?, [address] = ? " +
                 "WHERE userId = '" + staffId +"' ; ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, position);
            st.setString(2, email);
            st.setString(3, status);
           

            // Updating UserDetail table
            st.setString(4, firstName);
            st.setString(5, lastName);
            st.setDate(6, dob);
            st.setString(7, address);
            
                st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String []args){
        StaffDao sd = new StaffDao();
        sd.createStaff("S00006","Super","User","sa","123","ADMIN","sa@gmail.com","Hoang van Thu",Date.valueOf("1999-9-9"));
    }
}