/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Rating {
    private String comment;
    private String date;
    private String username;
    private String image;

    public Rating() {
    }

    public Rating(String comment, String date, String username, String image) {
        this.comment = comment;
        this.date = date;
        this.username = username;
        this.image = image.split(", ")[0];
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image.split(", ")[0];
    }
    
    
    
}
