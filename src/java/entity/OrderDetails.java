/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class OrderDetails {
    int OrderID;
    int ProductID;
    double UnitPrice;
    int Quantity;
    double total;

    public OrderDetails() {
    }

    public OrderDetails(int ProductID, double UnitPrice, int Quantity, double total) {
        this.ProductID = ProductID;
        this.UnitPrice = UnitPrice;
        this.Quantity = Quantity;
        this.total = total;
    }

    public OrderDetails(int OrderID, int ProductID, double UnitPrice, int Quantity, double total) {
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.UnitPrice = UnitPrice;
        this.Quantity = Quantity;
        this.total = total;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public double getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(double UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "OrderID=" + OrderID + ", ProductID=" + ProductID + ", UnitPrice=" + UnitPrice + ", Quantity=" + Quantity + ", total=" + total + '}';
    }
    
}
