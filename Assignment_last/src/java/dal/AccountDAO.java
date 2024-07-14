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
import model.Account;

/**
 *
 * @author FPT SHOP
 */
public class AccountDAO extends DBContext {

    public List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account s = new Account(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertAccount(String username, String password) {
        String sql = "INSERT INTO Account (username,password,role) VALUES (?,?,2)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAccount(int id) {
        String infoDetailSql = "DELETE FROM InfoDetail where aid = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(infoDetailSql);
            st.setInt(1, id);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
//        

//        String paymentSql = "delete from Payment where oid in (select id from Orders where aid = ?)";
//        try {
//            PreparedStatement st = connection.prepareStatement(paymentSql);
//            st.setInt(1, id);
//            st.executeUpdate();
//            st.close();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//            
//        String orderSql ="delete from Orders where aid = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(orderSql);
//            st.setInt(1, id);
//            st.executeUpdate();
//            st.close();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
        String sqlTrans = "Update Orders set aid = 1 where aid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sqlTrans);
            st.setInt(1, id);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        String sql = "DELETE FROM Account where id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Account> getNext9Account(int page) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account order by id offset ? rows fetch next ? rows only";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, 0 + 9 * (page - 1));
            st.setInt(2, 9);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account s = new Account(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public String getPasswordByID(int id) {
        String sql = "select password FROM Account where id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getString("password");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int countAccount() {
        String sql = "select count(*) as \"numberOfAccount\" from Account";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("numberOfAccount");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void editPassword(int id, String pass) {
        String sql = "UPDATE Account SET password = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setInt(2, id);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Account getAccountByAid(int aid) {
        String sql = "select * from Account where id = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account s = new Account(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void blockAccount(int id, int act) {
        String sql;
        if (act == 1) {
            sql = "UPDATE Account SET role = 3 where id = ?";
        } else {
            sql = "UPDATE Account SET role = 2 where id = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        AccountDAO pro = new AccountDAO();
        List<Account> proList = pro.getAll();
        for (Account i : proList) {
            System.out.println(i.getId());
        }
    }
}
