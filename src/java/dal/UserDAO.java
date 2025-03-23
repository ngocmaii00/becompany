/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Customer;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CustomerDetail;
import model.User;

/**
 *
 * @author zeryus
 */
public class UserDAO extends DBConnect {

    public User getAuthentication(String usr) {
        String sql = "select userId,email,username,password,status,role from [User] where username =?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, usr);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new Customer(rs.getString("userId"), rs.getString("email"), usr, rs.getString("password"), rs.getString("status"), rs.getString("role"));
                return u;
            }

        } catch (SQLException e) {
            System.err.println(e);
        }

        return null;
    }

    public Customer getCustomerAuthentication(String usr) {
        String sql = "select userId,email,username,password,status,role,auth_provider from [User] where username =?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, usr);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer u = new Customer(rs.getString("userId"), rs.getString("email"), usr, rs.getString("password"), rs.getString("status"), rs.getString("role"));
                return u;
            }

        } catch (SQLException e) {
            System.err.println(e);
        }

        return null;
    }

    public String getSignUpUsername(String usr) {
        String sql = "select username from [User] where username =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, usr);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                return rs.getString("username");
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public String getSignUpEmail(String email) {
        String sql = "select email from [User] where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                return rs.getString("email");
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public boolean searchUserId(String usrId) {
        String sql = "select userId from user where userId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, usrId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            System.err.println(e);
        }
        return false;
    }


    public void addUser(String usrId, String email, String username, String password) {
        String sql = "insert into [User] (userId,email,username,password,status,auth_provider,role) values(?,?,?,?,'active','LOCAL','USER')";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, usrId);
            st.setString(2, email);
            st.setString(3, username);
            st.setString(4, password);
            st.executeUpdate();

        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void addUserGoogleFacebook(Customer c) {
        String sql = """
                     INSERT INTO [User] (userId, email, username, [status], auth_provider,role,image) 
                     VALUES (?, ?, ?, 'active', ?,?,?);
                     INSERT INTO UserDetail (userId,firstName, lastName)
                     VALUES(?,?,?)
                     """;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getId());
            st.setString(2, c.getEmail());
            st.setString(3, c.getUsername());
            st.setString(4, c.getAuth_provider());
            st.setString(5, c.getRole());
            st.setString(6, c.getImage());

            st.setString(7, c.getId());
            st.setString(8, c.getUserDetail().getFirstName());
            st.setString(9, c.getUserDetail().getLastName());
            st.executeUpdate();

        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public Customer findByEmail(String email) {
        String sql = "select * from [User] where email =? and role = 'USER'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getString("userId"), rs.getString("email"), rs.getString("username"), rs.getString("password"), rs.getString("status"), rs.getString("role"), rs.getString("auth_provider"));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public Customer findByResetPasswordToken(String token) {
        String sql = "select * from [User] where reset_password_token =? AND role ='USER'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, token);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getString("userId"), rs.getString("email"), rs.getString("username"), rs.getString("password"), rs.getString("reset_password_token"));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }


    public void update(Customer user) {
        String sql = "update [User] set reset_password_token = ?, role = 'USER'";

        if (user.getPassword() != null) {
            sql += ", [password] = '" + user.getPassword() + "' ";
        }

        sql += "where userId = '" + user.getId() + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

                st.setString(1, user.getResetPasswordToken());

            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void addCustomerProfile(Customer c) {
        String sql = "insert into [UserDetail] (userId,firstName,lastName,gender,phone,address,dob)"
                + "values(?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getId());
            st.setString(2, c.getUserDetail().getFirstName());

            st.setString(3, c.getUserDetail().getLastName());
            st.setBoolean(4, c.getUserDetail().getGender());
            st.setString(5, c.getUserDetail().getPhone());
            st.setString(6, c.getUserDetail().getAddress());
            st.setDate(7, c.getUserDetail().getDob());

            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }

    }

    public void updateCustomerProfile(Customer c) {
        String sql = " update [User] set "
                + "password=?,"//1
                + "image=? " //1
                + "where userId = '" + c.getId() + "' ;"
                + "update UserDetail set "
                + "firstName = ?,"//3
                + "lastName = ?,"//4
                + "gender = ?,"//5
                + "address = ? ,"//6
                + "dob = ?, "//7
                + "phone = ? "//8
                + "where userId = '" + c.getId() + "' ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getPassword());
            st.setString(2, c.getImage());
            st.setString(3, c.getUserDetail().getFirstName());
            st.setString(4, c.getUserDetail().getLastName());
            st.setBoolean(5, c.getUserDetail().getGender());
            st.setString(6, c.getUserDetail().getAddress());
            st.setDate(7, c.getUserDetail().getDob());
            st.setString(8, c.getUserDetail().getPhone());
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Customer> getAll() {
        String sql = "select * from [User] u join UserDetail ud on u.userId = ud.userId";
        List<Customer> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while(result.next()) { //                       
                Customer c = new Customer(result.getString("userId"), result.getString("email"), result.getString("username"), "", result.getString("status"), result.getString("role"),"", "", "", new CustomerDetail(result.getString("firstname"), result.getString("lastname"), result.getInt("gender") == 1 , result.getString("phone"), result.getString("address"), result.getDate("dob")));
               
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void updateCustomerStatus(String userId, String status) {
        String sql = "update [User] set status='" + status + "' where userId = '" + userId + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Customer> filterCustomer(int top, int gender, String type) {
        String sql = "select top " + top + " u.userId, u.username, u.email, u.role, u.status, b.price, b.quantity, ud.firstName, ud.lastname, ud.gender, ud.address, ud.dob "
                + "from [user] u left join "
                + "(select m.userId, SUM(m.price) as [price], SUM(m.boughtQuantity) as [quantity] "
                + "from ("
                + "select od.orderId, o.userId, od.boughtQuantity,od.boughtQuantity * t.price as [price] from OrderDetail od join TeddyDetail t on od.teddyId = t.teddyId join [Order] o on o.orderId = od.orderId "
                + ") as m "
                + "group by m.userId) as b on u.userId = b.userId join UserDetail ud on ud.userId = u.userId";
        if (gender != 2) {
            sql += " where gender=" + gender;
        }
        switch (type) {
            case "mostpay":
                sql += " order by price desc";
                break;

            case "mostorder":
                sql += " order by quantity desc";
                break;

            case "notbuyyet":
                sql = "select u.userId, u.username, u.email, u.role, u.status, b.price, b.quantity, ud.firstName, ud.lastname, ud.gender, ud.address, ud.DOB\n"
                        + "from [user] u left join\n"
                        + "(select m.userId, SUM(m.price) as [price], SUM(m.boughtQuantity) as [quantity]\n"
                        + "from (\n"
                        + "select od.orderId, o.userId, od.boughtQuantity,od.boughtQuantity * t.price as [price] from OrderDetail od join TeddyDetail t on od.teddyId = t.teddyId join [Order] o on o.orderId = od.orderId\n"
                        + ") as m\n"
                        + "group by m.userId) as b on u.userId = b.userId join UserDetail ud on ud.userId = u.userId where b.price is null";
                if (gender != 2) {
                    sql += " and gender=" + gender;
                }
                break;
        }
        List<Customer> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Customer c = new Customer(result.getString("userId"),
                        result.getString("email"), 
                        result.getString("username"),
                        "",
                        result.getString("status"),
                        result.getString("role"),
                        "", "",
                        "",
                        new CustomerDetail(
                                result.getString("firstname"),
                                result.getString("lastname"),
                                "",
                                result.getInt("gender") == 1,
                                result.getString("address"),
                                result.getDate("dob"),
                                result.getInt("quantity"),
                                result.getDouble("price")));
                list.add(c);
            }
        } catch (SQLException e) {

            System.out.println(e);
        }
        return list;
    }

}
