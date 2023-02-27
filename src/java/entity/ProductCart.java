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
public class ProductCart {
    private int ProductID;
    private String Image;
    private String ProductName;
    private double UnitPrice;
    private int Quantity;
    private double total;

    public ProductCart() {
    }

    public ProductCart(String Image, String ProductName, double UnitPrice, int Quantity, double total) {
        this.Image = Image;
        this.ProductName = ProductName;
        this.UnitPrice = UnitPrice;
        this.Quantity = Quantity;
        this.total = total;
    }
    
    public ProductCart(int ProductID, String Image, String ProductName, double UnitPrice, int Quantity, double total) {
        this.ProductID = ProductID;
        this.Image = Image;
        this.ProductName = ProductName;
        this.UnitPrice = UnitPrice;
        this.Quantity = Quantity;
        this.total = total;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
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
        return "ProductCart{" + "ProductID=" + ProductID + ", Image=" + Image + ", ProductName=" + ProductName + ", UnitPrice=" + UnitPrice + ", Quantity=" + Quantity + ", total=" + total + '}';
    }
    
}
