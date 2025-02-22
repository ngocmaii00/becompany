
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Teddy;
import java.sql.*;

public class TeddyDao extends DBConnect{
    public List<Teddy> getAllTeddyOfProduct (String productId) {
        List<Teddy> list = new ArrayList<>();
        String sql = "select * from TeddyDetail where productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productId);
            ResultSet result = st.executeQuery();
            while(result.next()) {
                Teddy teddy = new Teddy(result.getString("productId"), result.getString("color"), result.getString("size"), result.getInt("quantity"), result.getDouble("price"), result.getString("productId"));
                list.add(teddy);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
