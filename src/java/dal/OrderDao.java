/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;


/**
 *
 * @author PC
 */
public class OrderDao extends DBConnect {
    
    public List<Order> getAll() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] o left join (select od.orderId, A.productName, A.image, od.boughtQuantity, A.color, A.price, A.size from OrderDetail od join (select p.productName, p.image, td.teddyId, td.color, td.price, td.size from Product p join TeddyDetail td on p.productId = td.productId) as A on od.teddyId = A.teddyId) as B on o.orderId = B.orderId";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Order o = new Order(result.getString("productName"),
                        result.getString("color"),
                        result.getString("size"),
                        result.getInt("boughtQuantity"),
                        result.getDouble("price"),
                        result.getString("image"),
                        result.getString("orderStatus"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    
    

        public int addNewOrder(String userId, Date orderDate, String orderStatus, String purpose) {
            String sql = "INSERT INTO [Order](userId, orderDate, orderStatus, purpose) VALUES (?, ?, ?, ?);";
            try {
                // Use RETURN_GENERATED_KEYS to get the auto-generated ID
                PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

                st.setString(1, userId);
                st.setDate(2, orderDate);
                st.setString(3, orderStatus);
                st.setString(4, purpose);

                // Execute the insert
                int rowsInserted = st.executeUpdate();

                // Retrieve the generated key (orderId)
                if (rowsInserted > 0) {
                    ResultSet rs = st.getGeneratedKeys();
                    if (rs.next()) {
                        int orderId = rs.getInt(1);  // Fetch by column index (not name)
                        return orderId;  // Successfully return the order ID
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log the error
            }
            return -1; // Return -1 if something goes wrong
        }

    
    public void insertOrderDetail(int OrderId, String teddyId, String deliveryId, int quantity,Date orderDate){
        String sql = "INSERT INTO OrderDetail (orderId, teddyId, deliveryId, boughtQuantity, orderDate) values(?,?,?,?,?)";
        
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,OrderId);
            st.setString(2, teddyId);
            st.setString(3, deliveryId);
            st.setInt(4, quantity);
            st.setDate(5, orderDate);
            st.executeUpdate();
        }catch(SQLException e){
            System.err.println(e);
        }
    }
    
    //String orderId, String teddyId,String deliveryId,int quantity,Date orderDate,Date receiveDate
    
    
    public static void main(String[] args) {
        OrderDao od = new OrderDao();
        List<Order> list = od.getAll();
        System.out.println(list.get(0).getProductName());
        
    }
}
