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
public class Employees {
    int EmployeeID;
    String Name;
    String Title;
    String City;
    int ReportsTo;
    String user;
    String password;

    public Employees() {
    }

    public Employees(int EmployeeID, String Name, String Title, String City, int ReportsTo, String user, String password) {
        this.EmployeeID = EmployeeID;
        this.Name = Name;
        this.Title = Title;
        this.City = City;
        this.ReportsTo = ReportsTo;
        this.user = user;
        this.password = password;
    }

    public Employees(String Name, String Title, String City, int ReportsTo, String user, String password) {
        this.Name = Name;
        this.Title = Title;
        this.City = City;
        this.ReportsTo = ReportsTo;
        this.user = user;
        this.password = password;
    }

    public int getEmployeeID() {
        return EmployeeID;
    }

    public void setEmployeeID(int EmployeeID) {
        this.EmployeeID = EmployeeID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public int getReportsTo() {
        return ReportsTo;
    }

    public void setReportsTo(int ReportsTo) {
        this.ReportsTo = ReportsTo;
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
        return "Employees{" + "EmployeeID=" + EmployeeID + ", Name=" + Name + ", Title=" + Title + ", City=" + City + ", ReportsTo=" + ReportsTo + ", user=" + user + ", password=" + password + '}';
    }
    
}