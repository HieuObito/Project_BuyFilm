/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Categories;
import entity.Products;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class DAOCategory extends ConnectDB {

    public Vector<Categories> SelectbyCate() {
        Vector<Categories> vector = new Vector<Categories>();
        String sql = "select * from Categories";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                int cateId = rs.getInt(1);
                String cateName = rs.getString(2);
                Categories cate = new Categories(cateId, cateName);
                vector.add(cate);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    public Vector<Categories> selectCateid(int id) {
        Vector<Categories> vector = new Vector<Categories>();
        String sql = "select * from Categories c\n"
                + "join Products p on p.CategoryID=c.CategoryID\n"
                + "where c.CategoryID="+id;
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                int cateId = rs.getInt(1);
                String cateName = rs.getString(2);
                Categories cate = new Categories(cateId, cateName);
                vector.add(cate);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

}
