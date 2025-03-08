
package model;

public class Staff extends User{
    private String firstname, lastname;
    private String  address, dob;
    

    public Staff() {
    }

    public Staff(String staffId, String username, String password, String role, String firstname, String lastname, String email, String address, String dob, String status) {
        super(staffId,email,username,password,status,role);
        this.firstname = firstname;
        this.lastname = lastname;
        
        this.address = address;
        this.dob = dob;
        
    }
    
    public String getFirstname() {
        return firstname;
    }    

    public String getLastname() {
        return lastname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }



    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }


    
    
}
