/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author PC
 */
public class Order {
    private String productName;
    private String color, size;
    private int boughtQuantity;
    private double price;
    private String image;

    public Order() {
    }

    public Order(String productName, String color, String size, int boughtQuantity, double price, String image) {
        this.productName = productName;
        this.color = color;
        this.size = size;
        this.boughtQuantity = boughtQuantity;
        this.price = price;
        this.image = image.split(", ")[0];
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
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

    public int getBoughtQuantity() {
        return boughtQuantity;
    }

    public void setBoughtQuantity(int boughtQuantity) {
        this.boughtQuantity = boughtQuantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImages(String image) {
        this.image = image.split(", ")[0];
    }
    

}
