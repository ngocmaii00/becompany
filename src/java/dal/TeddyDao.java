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

    public List<String> filterTeddyBySizeOrColor(String productId, String color, String size) {
        List<String> list = new ArrayList<>();

        try {
            if (size.length() > 0) {
                String sql = "select color from TeddyDetail where productId='" + productId + "' and size='" + size + "'";
                PreparedStatement st = connection.prepareStatement(sql);
                ResultSet result = st.executeQuery();
                while (result.next()) {
                    list.add(result.getString("color"));
                }
            }
            if (color.length() > 0) {
                String sql = "select size from TeddyDetail where productId='" + productId + "' and color='" + color + "'";
                PreparedStatement st = connection.prepareStatement(sql);
                ResultSet result = st.executeQuery();
                while (result.next()) {
                    list.add(result.getString("size"));
                }
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }   
}
