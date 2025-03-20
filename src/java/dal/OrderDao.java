/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.Product;

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
    
    public List<Order> getAllProductForStaff() {
        List<Order> list = new ArrayList<>();
        String sql = "select A.orderId, td.teddyId, p.productName, td.color, td.size,td.price as [pricePerPros], A.boughtQuantity, U.username, ud.address, d.describe, (d.price + A.boughtQuantity * td.price) as [price], p.image, o.purpose, A.orderStatus \n"
                + "from (select * from [OrderDetail] od where od.orderStatus = 'Processing') as A  join [Order] o on o.orderId = A.orderId\n"
                + "join [User] U on U.userId = o.userId join UserDetail ud on ud.userId= o.userId\n"
                + "join TeddyDetail td on td.teddyId = A.teddyId\n"
                + "join Product p on p.productId = td.productId\n"
                + "join Delivery d on d.deliveryId = A.deliveryId";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Order o = new Order(
                        result.getString("teddyId"),
                        result.getString("productName"),
                        result.getString("color"),
                        result.getString("size"),
                        result.getInt("boughtQuantity"),
                        result.getDouble("price"),
                        result.getString("image").split(", ")[0],
                        result.getString("orderStatus"),
                        result.getDouble("pricePerPros"),
                        result.getString("describe"),
                        result.getString("username"),
                        result.getString("address"),
                        result.getString("purpose"),
                        result.getString("orderId"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void checkOrder(String status, String teddyId, String staffId, String orderId) {
        String sql = "update OrderDetail set orderStatus = '"+status+"', staffId = '"+staffId+"' where teddyId= '"+teddyId+"' and orderId= "+orderId;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            System.out.println(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        OrderDao od = new OrderDao();
        od.checkOrder("ggg", "sss", "sss", "1");
        
    }
}
