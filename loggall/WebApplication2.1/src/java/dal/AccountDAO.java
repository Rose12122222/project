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
public class AccountDAO extends DBContext{
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
                        rs.getString("pass"),
                        rs.getInt("role"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public static void main(String[] args) {
        AccountDAO pro = new AccountDAO();
        List<Account> proList = pro.getAll();
        for (Account i : proList) {
            System.out.println(i.getId());
        }
    }
}
