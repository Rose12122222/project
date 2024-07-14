/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author FPT SHOP
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category s = new Category(rs.getInt("id"),
                        rs.getString("name"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int countCategory() {
        String sql = "select count(*) as numberOfCategory from Category";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("numberOfCategory");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return 0;
    }

    public String getNameByCID(int cid) {
        String sql = "select name from Category where id=?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString("name");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public Category getCategoryByCID(int cid) {
        String sql = "select * from Category where id = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category s = new Category(rs.getInt("id"),
                        rs.getString("name"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
//    public List<Product> getAllCategoryAndNumberOfProduct() {
//        List<Product> list = new ArrayList<>();
//        String sql = "select Category.id, Category.name, COUNT(Category.id) as numberOfProduct from Category join Product on Category.id = Product.cid group by Category.id, Category.name";
//        //chay lenh truy van
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Category s = new Product(rs.getString("id"),
//                        rs.getString("name"),
//                        rs.getInt("numberOfProduct"));
//                list.add(s);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//
//        return list;
//    }

    public static void main(String[] args) {
        CategoryDAO cat = new CategoryDAO();
//        List<Category> catList = cat.getAllCategory();
////        System.out.println(pro.countAfterSearchAll("1", null, null, null, null));
//        for (Category i : catList) {
//            System.out.println(i.getName());
//        }
        System.out.println(cat.getCategoryByCID(1).getName());
    }
}
