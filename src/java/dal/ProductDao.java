package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import model.Product;

public class ProductDao extends DBConnect {

    public List<Product> getTop10() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 10 * from Product order by sold desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    
}
