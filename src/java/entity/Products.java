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
public class Products {
    int ProductID;
    int SupplierID;
    int CategoryID;
    String ProductName;
    int Year;
    float Price;
    String Imagine;
    String  Description;
    int Quantity ;
    int Discontinued;

    public Products() {
    }

    public Products(int SupplierID, int CategoryID, String ProductName, int Year, float Price, String Imagine, String Description, int Quantity, int Discontinued) {
        this.SupplierID = SupplierID;
        this.CategoryID = CategoryID;
        this.ProductName = ProductName;
        this.Year = Year;
        this.Price = Price;
        this.Imagine = Imagine;
        this.Description = Description;
        this.Quantity = Quantity;
        this.Discontinued = Discontinued;
    }

    public Products(int ProductID, int SupplierID, int CategoryID, String ProductName, int Year, float Price, String Imagine, String Description, int Quantity, int Discontinued) {
        this.ProductID = ProductID;
        this.SupplierID = SupplierID;
        this.CategoryID = CategoryID;
        this.ProductName = ProductName;
        this.Year = Year;
        this.Price = Price;
        this.Imagine = Imagine;
        this.Description = Description;
        this.Quantity = Quantity;
        this.Discontinued = Discontinued;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getSupplierID() {
        return SupplierID;
    }

    public void setSupplierID(int SupplierID) {
        this.SupplierID = SupplierID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getYear() {
        return Year;
    }

    public void setYear(int Year) {
        this.Year = Year;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public String getImagine() {
        return Imagine;
    }

    public void setImagine(String Imagine) {
        this.Imagine = Imagine;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getDiscontinued() {
        return Discontinued;
    }

    public void setDiscontinued(int Discontinued) {
        this.Discontinued = Discontinued;
    }

    @Override
    public String toString() {
        return "Products{" + "ProductID=" + ProductID + ", SupplierID=" + SupplierID + ", CategoryID=" + CategoryID + ", ProductName=" + ProductName + ", Year=" + Year + ", Price=" + Price + ", Imagine=" + Imagine + ", Description=" + Description + ", Quantity=" + Quantity + ", Discontinued=" + Discontinued + '}';
    }
    
}
