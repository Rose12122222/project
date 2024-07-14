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
import model.Orders;

/**
 *
 * @author FPT SHOP
 */
public class OrderDAO extends DBContext {
    
    public void insertOrder(int aid, String date, float total, int numberOfItem, int status) {
        String sql = "INSERT INTO Orders (aid,date,total,numberOfItem,status) VALUES (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            st.setString(2, date);
            st.setFloat(3, total);
            st.setInt(4, numberOfItem);
            st.setInt(5, status);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<Orders> getAll() {
        List<Orders> list = new ArrayList<>();
        String sql = "select * from Orders";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders s = new Orders(rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getString("date"),
                        rs.getFloat("total"),
                        rs.getInt("numberOfItem"),
                        rs.getInt("status"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Orders> getOrderByAid(int aid) {
        List<Orders> list = new ArrayList<>();
        String sql = "select * from Orders where aid = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders s = new Orders(rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getString("date"),
                        rs.getFloat("total"),
                        rs.getInt("numberOfItem"),
                        rs.getInt("status"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void setStatusById(int oid) {
        String sql = "UPDATE Orders \n"
                + "SET status = '1' \n"
                + "WHERE id = ?;";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<Orders> getNext10Orders(int page) {
        List<Orders> list = new ArrayList<>();
        String sql = "select * from Orders order by id offset ? rows fetch next ? rows only";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, 0 + 10 * (page - 1));
            st.setInt(2, 10);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders s = new Orders(rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getString("date"),
                        rs.getFloat("total"),
                        rs.getInt("numberOfItem"),
                        rs.getInt("status"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public int countOrders() {
        String sql = "select count(*) as number from Orders";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("number");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return 0;
    }
    
    public List<Orders> getNext10OrdersByAid(int aid, int page) {
        List<Orders> list = new ArrayList<>();
        String sql = "select * from Orders where aid = ? order by id offset ? rows fetch next ? rows only";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            st.setInt(2, 0 + 10 * (page - 1));
            st.setInt(3, 10);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Orders s = new Orders(rs.getInt("id"),
                        rs.getInt("aid"),
                        rs.getString("date"),
                        rs.getFloat("total"),
                        rs.getInt("numberOfItem"),
                        rs.getInt("status"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public int countOrdersByAid(int aid) {
        String sql = "select count(*) as number from Orders where aid = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("number");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return 0;
    }
    
    public int getMaxId() {
        String sql = "select top 1 id from Orders order by id desc";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return 0;
    }
    
    public void updateProductByOid(int oid) {
        ProductDAO dao = new ProductDAO();
        String sql = "select pid, quantity from Orders \n"
                + "join Payment on oid = Orders.id\n"
                + "join Product on pid = Product.id\n"
                + "where status = 1 and oid = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                dao.updateAmountProduct(rs.getInt("pid"), rs.getInt("quantity"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }
    
    public boolean checkUpdateByOid(int oid) {
        ProductDAO dao = new ProductDAO();
        String sql = "select pid, quantity from Orders \n"
                + "join Payment on oid = Orders.id\n"
                + "join Product on pid = Product.id\n"
                + "where oid = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getInt("quantity") > dao.getProductById(rs.getInt("pid")).getAmount()) {
                    return false;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }
    
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
//        dao.insertOrder(1, 1, 2, 1);
//        List<Orders> list = dao.dao(1);
//        for (Orders i : list) {
//            System.out.println(i.getId());
//        }
        System.out.println(dao.checkUpdateByOid(32));
    }
}
