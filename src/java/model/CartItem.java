/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author zeryus
 */
public class CartItem {
    public String id,image,name ,size ,color;
    public int quantity,instock;
    public double estimate, price ;

    public CartItem(String id, String image, String name, String size, String color,  double price ,int quantity,int instock) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.size = size;
        this.color = color;
        this.quantity = quantity;
        this.estimate = (double)price * quantity;
        this.price = price;
        this.instock = instock;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setEstimate(double estimate) {
        this.estimate = estimate;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getInstock() {
        return instock;
    }

    
    

    public String getId() {
        return id;
    }

    public String getImage() {
        return image;
    }

    public String getName() {
        return name;
    }

    public String getSize() {
        return size;
    }

    public String getColor() {
        return color;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getEstimate() {
        return estimate;
    }

    public double getPrice() {
        return price;
    }

    public void setInstock(int instock) {
        this.instock = instock;
    }
    
    
}

