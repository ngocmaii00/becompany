/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author zeryus
 */
public class ShippingOption {
    private String deliveryID,description;
    int duration;
    double price;

    public ShippingOption(String deliveryID, String description, int duration, double price) {
        this.deliveryID = deliveryID;
        this.description = description;
        this.duration = duration;
        this.price = price;
    }

    public String getDeliveryID() {
        return deliveryID;
    }

    public String getDescription() {
        return description;
    }

    public int getDuration() {
        return duration;
    }

    public double getPrice() {
        return price;
    }

    public void setDeliveryID(String deliveryID) {
        this.deliveryID = deliveryID;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
