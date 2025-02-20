package model;

public class Teddy {
    private String teddyId, color, size;
    private int quantity;
    private double price;
    private String productId;

    public Teddy() {
    }

    public Teddy(String teddyId, String color, String size, int quantity, double price, String productId) {
        this.teddyId = teddyId;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
        this.productId = productId;
    }

    public String getTeddyId() {
        return teddyId;
    }

    public void setTeddyId(String teddyId) {
        this.teddyId = teddyId;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }
    
    
}
