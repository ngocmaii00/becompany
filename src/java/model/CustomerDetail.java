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
    private String phone;
    private boolean gender;
    private String address;
    private Date dob;
    private int numberOfOrder = 0;
    private double totalMoney = 0;

    public CustomerDetail(String firstName, String lastName, String phone, boolean gender, String address, Date dob, int numberOfOrder, double totalMoney) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.dob = dob;
        this.numberOfOrder = numberOfOrder;
        this.totalMoney = totalMoney;
    }

    public CustomerDetail(String firstName, String lastName, boolean gender, String phone, String address, Date dob) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.dob = dob;
    }

    public void setNumberOfOrder(int numberOfOrder) {
        this.numberOfOrder = numberOfOrder;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getNumberOfOrder() {
        return numberOfOrder;
    }

    public double getTotalMoney() {
        return totalMoney;
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
