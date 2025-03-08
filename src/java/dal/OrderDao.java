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
                        result.getString("image"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDao od = new OrderDao();
        List<Order> list = od.getAll();
        System.out.println(list.get(0).getProductName());

    }
}
