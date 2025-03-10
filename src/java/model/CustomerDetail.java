    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author zeryus
 */
public class CustomerDetail {
   
    private String firstName;
    private String lastName;
    private int age;
    private String phone;

    private String address;
    private Date dob;


    
        
    public CustomerDetail( String firstName, String lastName, int age, String phone, String address, Date dob) {
        
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.phone = phone;
        
        this.address = address;
        this.dob = dob;
    }

  

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public int getAge() {
        return age;
    }

    public String getPhone() {
        return phone;
    }

   

    public String getAddress() {
        return address;
    }

    public Date getDob() {
        return dob;
    }

    

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public void setAddress(String address) {
        this.address = address;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }
    
    
}
