/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.OrderDetails;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class DAOOrderDetails extends ConnectDB{
    public int addOrder(OrderDetails or) {
        int n=0;
        String sql = "INSERT INTO [Project].[dbo].[Order Details] ([OrderID],[ProductID],[UnitPrice],[Quantity],[Total]) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement pre= conn.prepareStatement(sql);
            pre.setInt(1, or.getOrderID());
            pre.setInt(2, or.getProductID());
            pre.setDouble(3, or.getUnitPrice());
            pre.setInt(4, or.getQuantity());
            pre.setDouble(5, or.getTotal());
            
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
}
     public Vector<OrderDetails> listAllProduct(String sql) {
        Vector<OrderDetails> vector = new Vector<OrderDetails>();
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                int oId = rs.getInt(1);
                int subid = rs.getInt(2);
                double price = rs.getDouble(3);
                int Quantity = rs.getInt(4);
                double total = rs.getDouble(5);

                OrderDetails ord= new OrderDetails(oId, subid, price, Quantity, total);
                vector.add(ord);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }
}
