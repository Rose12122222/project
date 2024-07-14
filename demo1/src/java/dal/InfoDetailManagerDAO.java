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
import model.InfoDetailManager;

/**
 *
 * @author FPT SHOP
 */
public class InfoDetailManagerDAO extends DBContext {

    public List<InfoDetailManager> getAll() {
        List<InfoDetailManager> list = new ArrayList<>();
        String sql = "select * from Manager";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InfoDetailManager s = new InfoDetailManager(
                        rs.getInt("ID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getDate("birthday"),
                        rs.getString("img_profile")
                        
                );
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

      

    public static void main(String[] args) {
        InfoDetailManagerDAO pro = new InfoDetailManagerDAO();
        List<InfoDetailManager> proList = pro.getAll();
        System.out.println(pro.getAll().get(0).getID());
    }
}
