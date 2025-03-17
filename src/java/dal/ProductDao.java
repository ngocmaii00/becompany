package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import model.Product;

public class ProductDao extends DBConnect {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        TeddyDao td = new TeddyDao();
        String sql = "select distinct p.productId, p.productName, p.origin, p.description, p.manufacturer, p.image, p.type, p.status, iif(m.sold is null,  0, m.sold) as [sold] from Product p join TeddyDetail t on p.productId = t.productId "
                + "left join ("
                + "select td.productId ,sum(od.boughtQuantity) as [sold] from OrderDetail od join TeddyDetail td on td.teddyId = od.teddyId "
                + "group by td.productId"
                + ") as m on m.productId = p.productId ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"), result.getString("status"));
                p.addTeddy(td.getAllTeddyOfProduct(p.getProductId()));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTop10() {
        List<Product> list = new ArrayList<>();
        TeddyDao td = new TeddyDao();
        String sql = "select distinct top 10 p.productId, p.productName, p.origin, p.description, p.manufacturer, p.image, p.type, p.status, iif(m.sold is null,  0, m.sold) as [sold] from Product p join TeddyDetail t on p.productId = t.productId\n"
                + "left join (\n"
                + "select td.productId ,sum(od.boughtQuantity) as [sold] from OrderDetail od join TeddyDetail td on td.teddyId = od.teddyId\n"
                + "group by td.productId\n"
                + ") as m on m.productId = p.productId\n"
                + "order by sold desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"), result.getString("status"));
                p.addTeddy(td.getAllTeddyOfProduct(p.getProductId()));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByName(String name) {

        String sql = "select distinct p.productId, p.productName, p.origin, p.description, p.manufacturer, p.image, p.type, p.status, iif(m.sold is null,  0, m.sold) as [sold] from Product p join TeddyDetail t on p.productId = t.productId\n"
                + "left join (\n"
                + "select td.productId ,sum(od.boughtQuantity) as [sold] from OrderDetail od join TeddyDetail td on td.teddyId = od.teddyId\n"
                + "group by td.productId\n"
                + ") as m on m.productId = p.productId\n"
                + " where p.ProductName = '" + name + "'";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            if (result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"), result.getString("status"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductById(String productId) {

        String sql = "select distinct p.productId, p.productName, p.origin, p.description, p.manufacturer, p.image, p.type, p.status, iif(m.sold is null,  0, m.sold) as [sold] from Product p join TeddyDetail t on p.productId = t.productId\n"
                + "left join (\n"
                + "select td.productId ,sum(od.boughtQuantity) as [sold] from OrderDetail od join TeddyDetail td on td.teddyId = od.teddyId\n"
                + "group by td.productId\n"
                + ") as m on m.productId = p.productId\n"
                + " where p.ProductId = '" + productId + "'";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            if (result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"), result.getString("status"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Integer> getProductStar(String id) {
        List<Integer> list = new ArrayList<>();
        String sql = "select stars from Rating where productId = '" + id + "'";

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
        String sql = "select distinct p.productId, p.productName, p.origin, p.description, p.manufacturer, p.image, p.type, p.status, iif(m.sold is null,  0, m.sold) as [sold] from Product p join TeddyDetail t on p.productId = t.productId\n"
                + "left join (\n"
                + "select td.productId ,sum(od.boughtQuantity) as [sold] from OrderDetail od join TeddyDetail td on td.teddyId = od.teddyId\n"
                + "group by td.productId\n"
                + ") as m on m.productId = p.productId\n"
                + " where type = '" + type + "'";
        TeddyDao td = new TeddyDao();
        if (type.compareToIgnoreCase("all") == 0) {
            return getAll();
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"), result.getString("status"));
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
        String sql = "select distinct p.productId, p.productName, p.origin, p.description, p.image, p.manufacturer, p.status, p.type, h.sold \n"
                + "from product p join rating r on p.productId = r.productId join TeddyDetail td on td.productId = p.productId join (\n"
                + "select distinct p.productId, p.productName, p.origin, p.description, p.manufacturer, p.image, p.type, p.status, iif(m.sold is null,  0, m.sold) as [sold] from Product p join TeddyDetail t on p.productId = t.productId\n"
                + "left join (\n"
                + "select td.productId ,sum(od.boughtQuantity) as [sold] from OrderDetail od join TeddyDetail td on td.teddyId = od.teddyId\n"
                + "group by td.productId\n"
                + ") as m on m.productId = p.productId\n"
                + ") as h on h.productId = p.productId ";
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

        System.out.println(sql);

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Product p = new Product(result.getString("productId"), result.getString("productName"), result.getString("origin"), result.getString("description"), result.getString("manufacturer"), result.getInt("sold"), result.getString("image"), result.getString("type"), result.getString("status"));
                p.addTeddy(td.getAllTeddyOfProduct(p.getProductId()));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addProduct(String productId, String productName, String origin, String description, String manufacturer, String image, String type, String status) {
        String sql = "INSERT INTO Product (productId, productName, origin, [description], manufacturer, [image], [type], [status]) VALUES (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productId);
            st.setString(2, productName);
            st.setString(3, origin);
            st.setString(4, description);
            st.setString(5, manufacturer);
            st.setString(6, image);
            st.setString(7, type);
            st.setString(8, status);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateProduct(String productId, String productName, String origin, String description, String manufacturer, String type, String status) {
        String sql = "update Product set productName=?, origin=?, description=?, manufacturer=?, type=?, status=? where productId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productName);
            st.setString(2, origin);
            st.setString(3, description);
            st.setString(4, manufacturer);
            st.setString(5, type);
            st.setString(6, status);
            st.setString(7, productId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateProductImage(String productId, String images) {
        String sql = "update Product set image='" + images + "' where productId='" + productId + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(String productId) {
        String sql = "delete from Product where productId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Product> getProductByFilter(int gender, String types, String type, int top) {
        List<Product> list = new ArrayList<>();
        String sql = "select top " + top + " * from (\n"
                + "select sum(a.boughtQuantity) as [sold], a.productId from (\n"
                + "(select b.orderId, b.teddyId, b.boughtQuantity, b.userId, b.gender, td.productId from (\n"
                + "select o.orderId, od.teddyId, od.boughtQuantity, ud.userId, ud.gender from [Order] o join OrderDetail od on o.orderId = od.orderId\n"
                + "join [User] u on u.userId = o.userId \n"
                + "join [UserDetail] ud on ud.userId = u.userId where ud.gender = " + gender + ") as b join TeddyDetail td on td.teddyId = b.teddyId\n"
                + ") ) as a group by a.productId\n"
                + ") as m right join Product p on m.productId = p.productId ";

        if(gender == 2) {
            sql = "select top " + top + " * from (\n"
                + "select sum(a.boughtQuantity) as [sold], a.productId from (\n"
                + "(select b.orderId, b.teddyId, b.boughtQuantity, b.userId, b.gender, td.productId from (\n"
                + "select o.orderId, od.teddyId, od.boughtQuantity, ud.userId, ud.gender from [Order] o join OrderDetail od on o.orderId = od.orderId\n"
                + "join [User] u on u.userId = o.userId \n"
                + "join [UserDetail] ud on ud.userId = u.userId) as b join TeddyDetail td on td.teddyId = b.teddyId\n"
                + ") ) as a group by a.productId\n"
                + ") as m right join Product p on m.productId = p.productId ";
        }
        if (types.compareToIgnoreCase("all") != 0) {
            sql += " " + types;
        }
        switch (type) {
            case "mostorder":
                sql += "order by sold desc";
                break;
            case "leastorder":
                sql += "order by sold";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                Product p = new Product(
                        result.getString("productId"),
                        result.getString("productName"),
                        result.getString("origin"),
                        result.getString("description"),
                        result.getString("manufacturer"),
                        result.getInt("sold"),
                        result.getString("image"),
                        result.getString("type"),
                        result.getString("status"));
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDao pd = new ProductDao();
        List<Product> list = pd.getProductByFilter(1, "", "", 3);
        System.out.println(list.get(0).getProductName());
    }
}
