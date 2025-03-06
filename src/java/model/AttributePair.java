/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author zeryus
 */
public class AttributePair<T,U> {
    private T att1;
    private U att2;
    
    public AttributePair(){
        
    }
    
    public AttributePair(T att1, U att2) {
        this.att1 = att1;
        this.att2 = att2;
    }

    public T getAtt1() {
        return att1;
    }

    public U getAtt2() {
        return att2;
    }

    public void setAtt1(T att1) {
        this.att1 = att1;
    }

    public void setAtt2(U att2) {
        this.att2 = att2;
    }
    
    
}
