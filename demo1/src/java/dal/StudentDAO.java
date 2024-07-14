/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Students;

/**
 *
 * @author nguye
 */
public class StudentDAO extends DBContext{
    public List<Students> getAllStudent() {
        List<Students> list = new ArrayList<>();
        String sql = "select * from Students";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Students s = new Students(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("birthday"),
                        rs.getInt("status"),
                        rs.getString("img_profile"));
                list.add(s);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
        public void insertStudent(String username, String password, String email) {
            
        String sql = "INSERT INTO Students(username,password,role_ID,fullName,gender,address,email,phone_number,birthday,status,img_profile) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, 5);
            st.setString(4, "not yet");
            st.setInt(5, 2);
            st.setString(6, "not yet");
            st.setString(7, email);
            st.setString(8, "0123456789");
            st.setString(9, "not yet");
            st.setInt(10, 0);
            st.setString(11, "not yet");
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void editPassword(int id, String pass) {
        String sql = "UPDATE Students SET password = ? WHERE ID = ?";
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
    
      public Students Update(Students stu) {
        String sql = " UPDATE Students SET fullName = ?, gender = ?, address = ?, email = ?, phone_number = ?, birthday = ? WHERE ID = ?";
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
                sql = "select * from Students WHERE ID = ?";
                st = connection.prepareStatement(sql);
                st.setInt(1, stu.getId());
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    Students s = new Students();
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
        StudentDAO student = new StudentDAO();
        student.editPassword(1, "123455");
    }
}
