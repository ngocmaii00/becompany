package dal;

import java.util.ArrayList;
import java.util.List;
import model.Teddy;
import java.sql.*;

public class TeddyDao extends DBConnect {

    public List<Teddy> getAllTeddyOfProduct(String productId) {
        List<Teddy> list = new ArrayList<>();
        String sql = "select * from TeddyDetail where productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productId);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Teddy teddy = new Teddy(result.getString("productId"), result.getString("color"), result.getString("size"), result.getInt("quantity"), result.getDouble("price"), result.getString("productId"));
                list.add(teddy);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void updateTeddy(String teddyId, String color, String size, double price, int quantity) {
        String sql = "update TeddyDetail set color=?, size=?, quantity=?, price=? where teddyId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, color);
            st.setString(2, size);
            st.setInt(3, quantity);
            st.setDouble(4, price);
            st.setString(5, teddyId);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void addTeddy(String teddyId, String color, String size, double price, int quantity, String productId) {
        String sql = "insert into TeddyDetail(teddyId, color, size, quantity, price, productId) values "
                + "(?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, teddyId);
            st.setString(2, color);
            st.setString(3, size);
            st.setInt(4, quantity);
            st.setDouble(5, price);
            st.setString(6, productId);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public String getLastTeddyId() {
        String sql = "select top 1 teddyId from TeddyDetail order by teddyId desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            if(result.next()) {
                return result.getString("teddyId");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
