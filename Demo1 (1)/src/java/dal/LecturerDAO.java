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
import model.Lecturers;

/**
 *
 * @author nguye
 */
public class LecturerDAO extends DBContext{
    public List<Lecturers> getAllLecturer() {
        List<Lecturers> list = new ArrayList<>();
        String sql = "select * from Lecturers";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lecturers s = new Lecturers(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getDate("birthday"),
                        rs.getInt("status"),
                        rs.getString("img_certificates"),
                        rs.getString("img_profile"),
                        rs.getString("description"));
                list.add(s);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     public Lecturers getById(int id) {
        String sql = "select * from Lectures where ID = ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Lecturers lecture = new Lecturers(
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
                        rs.getInt("status"),
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
           LecturerDAO lecturer = new LecturerDAO();
           System.out.println(lecturer.getAllLecturer().get(0).fullName);
    }
}
