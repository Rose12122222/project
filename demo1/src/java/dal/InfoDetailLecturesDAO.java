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
import model.InfoDetailLectures;

/**
 *
 * @author FPT SHOP
 */
public class InfoDetailLecturesDAO extends DBContext {

    public List<InfoDetailLectures> getAll() {
        List<InfoDetailLectures> list = new ArrayList<>();
        String sql = "select * from Lectures";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                InfoDetailLectures s = new InfoDetailLectures(
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
                        rs.getString("img_certificates"),
                        rs.getString("img_profile"),
                        rs.getString("description")
                );
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
 public InfoDetailLectures getById(int id) {
        String sql = "select * from Lectures where ID = ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                InfoDetailLectures lecture = new InfoDetailLectures(
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
                        rs.getString("img_certificates"),
                        rs.getString("img_profile"),
                        rs.getString("description")
                );
                return lecture;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null; // Return null if no lecture found with the given ID
    }
       
    public static void main(String[] args) {
        InfoDetailLecturesDAO pro = new InfoDetailLecturesDAO();
        System.out.println(pro.getAll().get(0).getID());

    }
}
