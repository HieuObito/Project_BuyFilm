/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author admin
 */
public class Customers {
    int CustomerID;
    String CustomerName;
    String Country;
    String Gmail;
    String user;
    String password;

    public Customers() {
    }

    public Customers(int CustomerID, String CustomerName, String Country, String Gmail, String user, String password) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.Country = Country;
        this.Gmail = Gmail;
        this.user = user;
        this.password = password;
    }

    public Customers(String CustomerName, String Country, String Gmail, String user, String password) {
        this.CustomerName = CustomerName;
        this.Country = Country;
        this.Gmail = Gmail;
        this.user = user;
        this.password = password;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String Country) {
        this.Country = Country;
    }

    public String getGmail() {
        return Gmail;
    }

    public void setGmail(String Gmail) {
        this.Gmail = Gmail;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Customers{" + "CustomerID=" + CustomerID + ", CustomerName=" + CustomerName + ", Country=" + Country + ", Gmail=" + Gmail + ", user=" + user + ", password=" + password + '}';
    }

   
   
}
