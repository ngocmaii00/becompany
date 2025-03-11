            /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author zeryus
 */
public class CustomerDetail {
   
    private String firstName;
    private String lastName;
    private String fullName;
    private String phone;
    private boolean gender;
    private String address;
    private Date dob;


    
        
    public CustomerDetail( String firstName, String lastName, boolean gender, String phone, String address, Date dob) {
        
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.phone = phone;
        this.fullName = lastName + " " + firstName;
        this.address = address;
        this.dob = dob;
    }

  

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }


    public String getPhone() {
        return phone;
    }

    public String getFullName() {
        return fullName;
    }

    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
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

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public void setAddress(String address) {
        this.address = address;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    @Override
    public String toString() {
        return "CustomerDetail{" + "firstName=" + firstName + ", lastName=" + lastName + ", phone=" + phone + ", address=" + address + ", dob=" + dob + '}';
    }
    
    
}
