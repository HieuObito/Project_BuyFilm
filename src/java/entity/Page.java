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
public class Page {
    int ProductID;
    String ProductName;
    String Imagine;
    Float price;
    int RowNum;

    public Page() {
    }

    public Page(int ProductID, String ProductName, String Imagine, Float price, int RowNum) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Imagine = Imagine;
        this.price = price;
        this.RowNum = RowNum;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getImagine() {
        return Imagine;
    }

    public void setImagine(String Imagine) {
        this.Imagine = Imagine;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public int getRowNum() {
        return RowNum;
    }

    public void setRowNum(int RowNum) {
        this.RowNum = RowNum;
    }

    @Override
    public String toString() {
        return "Page{" + "ProductID=" + ProductID + ", ProductName=" + ProductName + ", Imagine=" + Imagine + ", price=" + price + ", RowNum=" + RowNum + '}';
    }
    
}
