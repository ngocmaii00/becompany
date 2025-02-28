package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import model.Product;

public class ProductDao extends DBConnect {

    public List<Product> getTop10() {
        List<Product> list = new ArrayList<>();
        TeddyDao td = new TeddyDao();
        String sql = "select top 10 * from Product order by sold desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"));
                p.addTeddy(td.getAllTeddyOfProduct(p.getProductId()));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

     public Product getProductByName(String name) {
        
        String sql = "select * from Product where ProductName = '"+ name +"'";
        
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            if(result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
     
    public List<Integer> getProductStar(String id) {
        List<Integer> list = new ArrayList<>();
        String sql = "select stars from Rating where productId = '"+ id +"'";
       
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                int p = result.getInt("stars");
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getProductByType(String type) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where type = '" + type + "'";
        TeddyDao td = new TeddyDao();
        if (type.compareTo("all") == 0) {
            sql = "select * from Product";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"));
                p.addTeddy(td.getAllTeddyOfProduct(p.getProductId()));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public List<Product> getProductByFilter(String type, String color, String size, String from, String to, String[] status, String[] rating) {
        List<Product> list = new ArrayList<>();
        TeddyDao td = new TeddyDao();
        String sql = "select distinct p.productId, p.productName, p.origin, p.description, p.image, p.manufacturer, p.sold, p.status, p.type "
                + "from product p join rating r on p.productId = r.productId join TeddyDetail td on td.productId = p.productId ";
        List<String> filters = new ArrayList<>();
        if (type.compareToIgnoreCase("all") != 0) {
            filters.add("p.type = '" + type + "'");
        }
        if (color != null && color.compareTo("") != 0) {
            filters.add("td.color='" + color + "'");
        }
        if (size != null && size.compareTo("") != 0) {
            filters.add("td.size='" + size + "'");
        }
        if (from != null && from.compareTo("") != 0 && to != null && to.compareTo("") != 0) {
            filters.add("td.price between " + from + " and " + to + "");
        }
        if (rating != null && rating.length > 0) {
            Stream<String> st = Arrays.stream(rating);
            String s = st.collect(Collectors.joining(", ", "(", ")"));
            filters.add("r.stars in " + s);
        }
        if (status != null && status.length > 0) {
            Stream<String> st = Arrays.stream(status);
            String s = st.collect(Collectors.joining("', '", "('", "')"));
            filters.add("p.status in " + s);
        }

        if (!filters.isEmpty()) {
            sql += "where " + filters.stream().collect(Collectors.joining(" and "));
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"));
                p.addTeddy(td.getAllTeddyOfProduct(p.getProductId()));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
