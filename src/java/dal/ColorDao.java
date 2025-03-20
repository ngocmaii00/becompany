
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ColorDao extends DBConnect{
    public List<String> getAllColor() {
        List<String> colors = new ArrayList<>();
        String sql ="select distinct color from TeddyDetail";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                colors.add(rs.getString("color"));
            }
            return colors;

        } catch (SQLException e) {
            System.err.println(e);
        }

        return null;
    }
    
    public static void main(String[] args) {
        ColorDao cd = new ColorDao();
        List<String> colors = cd.getAllColor();
        System.out.println(colors.get(0));
    }
}
