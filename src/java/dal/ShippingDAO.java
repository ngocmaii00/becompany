/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.ShippingOption;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author zeryus
 */
public class ShippingDAO extends DBConnect {
    public List<ShippingOption> getAllShippingOption(){
        List<ShippingOption> list = new ArrayList<>();
        String sql="select * from Delivery";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(new ShippingOption(rs.getString("deliveryId"),rs.getString("describe"),rs.getInt("duration"),rs.getDouble("price")));
            }
            return list;
            
        }catch(SQLException e){
            System.err.println(e);
        }
        return null;
    }
    public String getDeliveryDescribe(String id){
        String sql = "select describe from Delivery where deliveryId = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,id);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                return rs.getString("describe");
            
        }catch(SQLException e){
            System.err.println(e);
        }
        return null;
    }
    public int getDeliveryDuration(String id){
        String sql = "select duration from Delivery where deliveryId = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,id);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                return rs.getInt("duration");
            
        }catch(SQLException e){
            System.err.println(e);
        }
        return 0;
    }

}
