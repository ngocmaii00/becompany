package controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dal.ProductDao;
import dal.TeddyDao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.ColorInfo;
import model.Product;
import model.Teddy;
import com.google.gson.JsonObject;
import dal.RatingDao;
import jakarta.servlet.http.HttpSession;
import model.Rating;
import model.User;
/**
 *
 * @author Admin
 */
@WebServlet(name="Product", urlPatterns={"/product"})
public class ProductServlet extends HttpServlet {
    
    
    List<Teddy> permanentList;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String id = request.getParameter("id");
        
        try{
            ProductDao pd = new ProductDao();
            TeddyDao td = new TeddyDao();
            
            Map<String, List<String>> type = new HashMap<>();
            Map<String, Boolean> colorList = new HashMap<>();
            
            Product viewProduct= pd.getProductById(id);
            List<Integer> ratingList = pd.getProductStar(id);
            List<Teddy> detailList = td.getAllTeddyOfProduct(id);
            permanentList = detailList;
            
            int overalRating = 0;
            for(int i : ratingList){
                overalRating += i;
            }   
            String strRating = "";
            if(!ratingList.isEmpty()){
                overalRating = overalRating/ratingList.size();
            }else{
                overalRating =-1;
            }
            for(Teddy i: detailList){
                if(type.containsKey(i.getColor())){
                    type.get(i.getColor()).add(i.getSize());
                }else{
                    List<String> li = new ArrayList<>();
                    li.add(i.getSize());
                    type.put(i.getColor(), li);
                }
            }
            
            int length = detailList.size();
            for(int i = 0; i < length ;i++){
                String color = detailList.get(i).getColor();
                ColorInfo c= ColorInfo.getColorByName(color);
                colorList.put (color,c.isLightColor());
            }
            request.setAttribute("product", viewProduct);
            request.setAttribute("type",type);
            //request.setAttribute("images", viewProduct.getImages());
            request.setAttribute("rating", overalRating);
            request.setAttribute("color", colorList);
            
            RatingDao rd = new RatingDao();
            List<Rating> list = rd.getAll(id);
            request.setAttribute("data", list);
      
            request.getRequestDispatcher("product.jsp").forward(request, response);
        }catch(ServletException | IOException e){
            System.err.println(e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
       response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        
        JsonObject jsonResponse = new JsonObject();
        String color = request.getParameter("color");
        String size = request.getParameter("size");

        Teddy temp = null;
        for(Teddy i : permanentList){
            if(i.getColor().equals(color) && i.getSize().equals(size)){
                temp = new Teddy(i.getTeddyId(), i.getColor(), i.getSize(), i.getQuantity(), i.getPrice(), i.getProductId());
                break;
            }
        }

        if (temp != null) {
            jsonResponse.addProperty("price", temp.getPrice());
            jsonResponse.addProperty("quantity", temp.getQuantity());
        }

        
        response.getWriter().write(jsonResponse.toString());
       
       
               
    }
}
