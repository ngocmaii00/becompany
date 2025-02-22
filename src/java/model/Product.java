
package model;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private String productId, productName, origin, description, manufacturer;
    private int sold;
    private String image, type;
    private List<Teddy> teddies = new ArrayList<>();

    public Product() {
    }

    public Product(String productId, String productName, String origin, String description, String manufacturer, int sold, String image, String type) {
        this.productId = productId;
        this.productName = productName;
        this.origin = origin;
        this.description = description;
        this.manufacturer = manufacturer;
        this.sold = sold;
        this.image = image;
        this.type = type;
    }

    public void addTeddy(List<Teddy> list) {
        teddies.addAll(list);
    }

    public List<Teddy> getTeddies() {
        return teddies;
    }
    
    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
}
