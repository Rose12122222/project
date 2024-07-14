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
import model.InfoDetailAdmin;

/**
 *
 * @author FPT SHOP
 */
public class InfoDetailAdminDAO extends DBContext {

    public List<InfoDetailAdmin> getAll() {
        List<InfoDetailAdmin> list = new ArrayList<>();
        String sql = "select * from Admins";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InfoDetailAdmin s = new InfoDetailAdmin(
                        rs.getInt("ID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("birthday"),
                        rs.getString("img_profile")
                        
                );
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }  
     public InfoDetailAdmin getByID(int ID) {
        String sql = "select * from Admins where ID = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InfoDetailAdmin s = new InfoDetailAdmin(
                        rs.getInt("ID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("birthday"),
                        rs.getString("img_profile")
                        
                        );
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
        public int countInfoDetail() {
        String sql = " select count(*) as numberOfInfoDetail from Admins";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("numberOfInfoDetail");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
            public String getPasswordByID(int id) {
        String sql = "select password FROM Admins where id = ? ";
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
             public void insertInfoDetail(int ID, String username, String password, String fullName, int gender, String address, String email, String phone_number, String birthday, String img_profile) {
        String sql = "INSERT INTO Admins (ID,username,password,fullName,gender,address,email,phone_number,birthday,img_profile) VALUES (?,?,?,?,?,?,?,?,?,?) ";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            st.setString(2, username);
            st.setString(3, password);
            st.setInt(4, gender);
            st.setString(3, email);
            
            st.setString(6, address);
            st.setString(7, birthday);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        InfoDetailAdminDAO pro = new InfoDetailAdminDAO();
//        List<InfoDetailAdmin> list = pro.getAll();
        System.out.println(pro.getAll().get(2).getEmail());

    }
}
