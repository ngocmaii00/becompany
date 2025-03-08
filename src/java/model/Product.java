
package model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Product {
    private String productId, productName, origin, description, manufacturer;
    private int sold;
    private String[] images;
    private String type;
    private String status;
    private List<Teddy> teddies = new ArrayList<>();
    private Set<String> colors = new HashSet<>();
    private Set<String> sizes = new HashSet<>();

    public Product() {
    }

    public Product(String productId, String productName, String origin, String description, String manufacturer, int sold, String image, String type, String status) {
        this.productId = productId;
        this.productName = productName;
        this.origin = origin;
        this.description = description;
        this.manufacturer = manufacturer;
        this.sold = sold;
        this.images = image.split(", ");
        this.type = type;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void addTeddy(List<Teddy> list) {
        teddies.addAll(list);
        list.forEach((teddy) -> {
            colors.add(teddy.getColor());
            sizes.add(teddy.getSize());
        });
    }

    public Set<String> getColors() {
        return colors;
    }

    public Set<String> getSizes() {
        return sizes;
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

    public String[] getImages() {
        return images;
    }

    public void setImages(String image) {
        this.images = image.split(", ");
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
}
