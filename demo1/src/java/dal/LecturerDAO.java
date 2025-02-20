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
                        rs.getDate("birthday").toString(),
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
    
     public Lecturers Update(Lecturers stu) {
        String sql = " UPDATE Lecturers SET fullName = ?, gender = ?, address = ?, email = ?, phone_number = ?, birthday = ? WHERE ID = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            // Set parameters for the prepared statement
            st.setString(1, stu.getFullName());
            st.setInt(2, stu.getGender());
            st.setString(3, stu.getAddress());
            st.setString(4, stu.getEmail());
            st.setString(5, stu.getPhoneNumber());
            st.setObject(6, stu.getBirthDate());
            st.setInt(7, stu.getId());
            int rowsUpdated = st.executeUpdate();

            // Check update result
            if (rowsUpdated > 0) {
                sql = "select * from Lecturers WHERE ID = ?";
                st = connection.prepareStatement(sql);
                st.setInt(1, stu.getId());
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    Lecturers s = new Lecturers();
                    s.setId(rs.getInt("id"));
                    s.setAddress(rs.getString("address"));
                    s.setBirthDate(rs.getDate("birthday").toString());
                    s.setGender(rs.getInt("gender"));
                    s.setEmail(rs.getString("email"));
                    s.setImgProfile(rs.getString("img_profile"));
                    return s;
                }
            } else {
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }
    
    
    public static void main(String[] args) {
           LecturerDAO lecturer = new LecturerDAO();
           System.out.println(lecturer.getAllLecturer().get(0).fullName);
    }
}
