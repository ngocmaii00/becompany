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
    private String teddyId;

    private String productName;
    private String color, size;
    private int boughtQuantity;
    private double price;
    private String image;
    private String orderStatus;
    private double pricePerPros;
    private String delivery;
    private String username;
    private String userAddress;
    private String purpose;
    private String orderId;

    public Order(String teddyId, String productName, String color, String size, int boughtQuantity, double price, String image, String orderStatus, double pricePerPros, String delivery, String username, String userAddress, String purpose, String orderId) {
        this.teddyId = teddyId;
        this.productName = productName;
        this.color = color;
        this.size = size;
        this.boughtQuantity = boughtQuantity;
        this.price = price;
        this.image = image;
        this.orderStatus = orderStatus;
        this.pricePerPros = pricePerPros;
        this.delivery = delivery;
        this.username = username;
        this.userAddress = userAddress;
        this.purpose = purpose;
        this.orderId = orderId;
    }

    
    

    public Order() {
    }

    public Order(String productName, String color, String size, int boughtQuantity, double price, String image, String orderStatus) {
        this.productName = productName;
        this.color = color;
        this.size = size;
        this.boughtQuantity = boughtQuantity;
        this.price = price;
        this.image = image.split(", ")[0];
        this.orderStatus = orderStatus;
    }


    public String getOrderId() {
        return orderId;
    }

    
    public String getDelivery() {
        return delivery;
    }

    public double getPricePerPros() {
        return pricePerPros;
    }

    public String getTeddyId() {
        return teddyId;
    }

    public String getPurpose() {
        return purpose;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public String getUsername() {
        return username;
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

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

}
