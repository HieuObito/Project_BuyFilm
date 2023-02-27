/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

public class Orders{
    int OrderID;
    int CustomerID;
    String CustomerName;
    int Phone;
    String Gmail;
    String address;
    double total;
    int status;
    Date date;

    public Orders() {
    }

    public Orders(int OrderID, int CustomerID, String CustomerName, int Phone, String Gmail, String address, double total, int status, Date date) {
        this.OrderID = OrderID;
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.Phone = Phone;
        this.Gmail = Gmail;
        this.address = address;
        this.total = total;
        this.status = status;
        this.date = date;
    }

    public Orders(int CustomerID, String CustomerName, int Phone, String Gmail, String address, double total, int status, Date date) {
        this.CustomerID = CustomerID;
        this.CustomerName = CustomerName;
        this.Phone = Phone;
        this.Gmail = Gmail;
        this.address = address;
        this.total = total;
        this.status = status;
        this.date = date;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
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

    public int getPhone() {
        return Phone;
    }

    public void setPhone(int Phone) {
        this.Phone = Phone;
    }

    public String getGmail() {
        return Gmail;
    }

    public void setGmail(String Gmail) {
        this.Gmail = Gmail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Orders{" + "OrderID=" + OrderID + ", CustomerID=" + CustomerID + ", CustomerName=" + CustomerName + ", Phone=" + Phone + ", Gmail=" + Gmail + ", address=" + address + ", total=" + total + ", status=" + status + ", date=" + date + '}';
    }

   
}
