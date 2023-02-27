/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Customers;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class DAOCustomers extends ConnectDB {

    public int addCustomer(Customers cu) {
        int n = 0;
        String sql = "INSERT INTO [Project].[dbo].[Customers]\n"
                + "           ([CustomerName],[Country],[Gmail],[user],[password])"
                + "    VALUES(?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, cu.getCustomerName());
            pre.setString(2, cu.getCountry());
            pre.setString(3, cu.getGmail());
            pre.setString(4, cu.getUser());
            pre.setString(5, cu.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public Customers getAccount(String user, String pass) {
        String sql = "select*from Customers\n"
                + " where [user]='" + user + "' and [password]='" + pass + "'";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String cusName = rs.getString(2);
                String Country = rs.getString(3);
                String Gmail = rs.getString(4);
                String us = rs.getString(5);
                String pa = rs.getString(6);
                Customers cus = new Customers(id, cusName, Country, Gmail, us, pa);
                return cus;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Customers getRegister(String user) {
        String sql = "select*from Customers\n"
                + " where [user]='" + user + "'";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String cusName = rs.getString(2);
                String Country = rs.getString(3);
                String Gmail = rs.getString(4);
                String us = rs.getString(5);
                String pa = rs.getString(6);
                Customers cus = new Customers(id, cusName, Country, Gmail, us, pa);
                return cus;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Vector<Customers> listAllProduct(String sql) {
        Vector<Customers> vector = new Vector<Customers>();
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                String cusName = rs.getString(2);
                String Country = rs.getString(3);
                String Gmail = rs.getString(4);
                String us = rs.getString(5);
                String pa = rs.getString(6);
                Customers cus = new Customers(id, cusName, Country, Gmail, us, pa);
                vector.add(cus);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    public int updateProducts(Customers cus) {
        int n = 0;
        String sql = "UPDATE [Project].[dbo].[Customers]\n"
                + "   SET [CustomerName] = ?,[Country] = ?,[Gmail] = ?,[user] = ? ,[password] = ?\n"
                + " WHERE CustomerID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, cus.getCustomerName());
            pre.setString(2, cus.getCountry());
            pre.setString(3, cus.getGmail());
            pre.setString(4, cus.getUser());
            pre.setString(5, cus.getPassword());
            pre.setInt(6, cus.getCustomerID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeCustomers(int id) {
        int n = 0;
        String sql = "delete from Customers where CustomerID=" + id;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
}
