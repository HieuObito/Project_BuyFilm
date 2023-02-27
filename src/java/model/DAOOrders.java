/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Orders;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class DAOOrders extends ConnectDB {

    public int addOrder(Orders or) {
        String sql = "INSERT INTO [Project].[dbo].[Orders] ([CustomerID],[CustomerName],[Phone Number],[Date],[Gmail],[Address],[Total],[status]) VALUES(?,?,?,?,?,?,?,?)";
        try {
            //        create statement: execute sql
            PreparedStatement pre = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setInt(1, or.getCustomerID());
            pre.setString(2, or.getCustomerName());
            pre.setInt(3, or.getPhone());
            pre.setDate(4, (java.sql.Date) or.getDate());
            pre.setString(5, or.getGmail());
            pre.setString(6, or.getAddress());
            pre.setDouble(7, or.getTotal());
            pre.setInt(8, or.getStatus());
            pre.executeUpdate();
            ResultSet rs = pre.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public Vector<Orders> listAllOrders(String sql) {
        Vector<Orders> vector = new Vector<Orders>();
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                int cusID = rs.getInt(2);
                String cusName = rs.getString(3);
                int phone = rs.getInt(4);
                Date date = rs.getDate(5);
                String Gmail = rs.getString(6);
                String add = rs.getString(7);
                Float total = rs.getFloat(8);
                int status = rs.getInt(9);

                Orders or = new Orders(id, cusID, cusName, phone, Gmail, add, total, status, date);
                vector.add(or);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    public Vector<Orders> listAllOrdersbyDate(String date1, String date2) {
        Vector<Orders> vector = new Vector<Orders>();
        String sql = "SELECT * from Orders\n"
                + "where date between '" + date1 + "' AND '" + date2 + "'";
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                int cusID = rs.getInt(2);
                String cusName = rs.getString(3);
                int phone = rs.getInt(4);
                Date date = rs.getDate(5);
                String Gmail = rs.getString(6);
                String add = rs.getString(7);
                Float total = rs.getFloat(8);
                int status = rs.getInt(9);

                Orders or = new Orders(id, cusID, cusName, phone, Gmail, add, total, status, date);
                vector.add(or);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    public int updateOrders(Orders ord) {
        int n = 0;
        String sql = "UPDATE [Project].[dbo].[Orders]\n"
                + "   SET [CustomerID] = ?,[CustomerName] = ?,[Phone Number] = ?,"
                + "[Gmail] = ?,[Address] =?,[Total] = ?,[status]=?"
                + " WHERE  OrderID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, ord.getCustomerID());
            pre.setString(2, ord.getCustomerName());
            pre.setInt(3, ord.getPhone());
            pre.setString(4, ord.getGmail());
            pre.setString(5, ord.getAddress());
            pre.setDouble(6, ord.getTotal());
            pre.setInt(7, ord.getStatus());
            pre.setInt(8, ord.getOrderID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeOrder(int id) {
        int n = 0;
        String sql = "DELETE FROM [Project].[dbo].[Orders]\n"
                + "WHERE OrderID=" + id;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
}
