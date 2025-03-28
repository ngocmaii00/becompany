
package dal;

import java.util.List;
import model.SlideShow;
import java.sql.*;
import java.util.ArrayList;

public class SlideShowDao extends DBConnect{
    public List<SlideShow> getSlideShow () {
        String sql = "select * from SlideShow";
        List<SlideShow> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                SlideShow s = new SlideShow(result.getString("image"), result.getString("description"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void changeSlide (List<SlideShow> list) {
        String sql = "delete from SlideShow;"
                + "insert into SlideShow(image, description) values";
        for (SlideShow slide : list) {
            sql += "('"+slide.getImage()+"', '"+slide.getDescription()+"'),";
        }
        sql = sql.substring(0, sql.length()-1);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
            System.out.println(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
