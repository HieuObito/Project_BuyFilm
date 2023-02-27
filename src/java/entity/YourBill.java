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
public class YourBill {
    String imagine;
    int Quantity;
    double price;
    double Total;
    int status;

    public YourBill() {
    }

    public YourBill(String imagine, int Quantity, double price, double Total, int status) {
        this.imagine = imagine;
        this.Quantity = Quantity;
        this.price = price;
        this.Total = Total;
        this.status = status;
    }

    public String getImagine() {
        return imagine;
    }

    public void setImagine(String imagine) {
        this.imagine = imagine;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }

    public String getStatus() {
        if(status==1){
            return "New";
        }if(status==2){
            return "Process";
        }if(status==3){
            return "Done";
        }
        return "New";
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "YourBill{" + "imagine=" + imagine + ", Quantity=" + Quantity + ", price=" + price + ", Total=" + Total + ", status=" + status + '}';
    }
    
}
