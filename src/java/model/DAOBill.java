/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.YourBill;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class DAOBill extends ConnectDB {

    public Vector<YourBill> listAllBill(int cid) {
        Vector<YourBill> vector= new Vector<>();
        String sql = "select p.Imagine,od.Quantity,od.UnitPrice,od.Total,o.status from [Order Details]  od\n"
                + "join Orders o on od.OrderID=o.OrderID\n"
                + "join Products p on p.ProductID= od.ProductID\n"
                + "\n"
                + "where o.CustomerID="+cid+ "\n"
                +"order by o.status";
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                String image = rs.getString(1);
                int quan = rs.getInt(2);
                double price = rs.getDouble(3);
                double total = rs.getDouble(4);
                int status = rs.getInt(5);

                YourBill you= new YourBill(image, quan, price, total, status);
               vector.add(you);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }
}
