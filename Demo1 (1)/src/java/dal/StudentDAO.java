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
 public int countInfoDetail() {
        String sql = "  select count(*) as numberOfInfoDetail from Students";
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
 public Students getByID(int ID) {
        String sql = "select * from Students where ID = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Students s = new Students(
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
                        rs.getInt("status"),
                        rs.getString("img_profile")
                );
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
 public void updateStudent(Students student) {
    String sql = "UPDATE Students SET username = ?, password = ?, role_ID = ?, fullName = ?, gender = ?, address = ?, email = ?, phone_number = ?, birthday = ?, status = ?, img_profile = ? WHERE ID = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, student.getUsername());
        st.setString(2, student.getPassword());
        st.setInt(3, student.getRoll_ID());
        st.setString(4, student.getFullName());
        st.setInt(5, student.getGender());
        st.setString(6, student.getAddress());
        st.setString(7, student.getEmail());
        st.setString(8, student.getPhoneNumber());
        st.setString(9, student.getBirthDate());
        st.setInt(10, student.getStatus());
        st.setString(11, student.getImgProfile());
        st.setInt(12, student.getId());
        st.executeUpdate();
        st.close();
    } catch (SQLException e) {
        System.out.println(e);
    }
}
    public static void main(String[] args) {
        StudentDAO student = new StudentDAO();
        student.editPassword(1, "123455");
    }
}
