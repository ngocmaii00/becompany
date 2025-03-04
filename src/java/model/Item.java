
package model;

public class Item {
    private String image, name, size, color;
    private double price, estimate;
    private int quan;

    public Item() {
    }

    public Item(String image, String name, String size, String color, double price, int quan, double estimate) {
        this.image = image;
        this.name = name;
        this.size = size;
        this.color = color;
        this.price = price;
        this.quan = quan;
        this.estimate = estimate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getEstimate() {
        return estimate;
    }

    public void setEstimate(double estimate) {
        this.estimate = estimate;
    }

    public int getQuan() {
        return quan;
    }

    public void setQuan(int quan) {
        this.quan = quan;
    }
    
    

    
}
