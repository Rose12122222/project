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
import model.Managers;

/**
 *
 * @author nguye
 */
public class ManagerDAO extends DBContext{
        public List<Managers> getAllManager() {
        List<Managers> list = new ArrayList<>();
        String sql = "select * from Manager";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Managers s = new Managers(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_ID"),
                        rs.getString("fullName"),
                        rs.getInt("gender"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getDate("birthday"),
                        rs.getString("img_profile"));
                list.add(s);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
       public Managers getById(int id) {
        String sql = "SELECT * FROM Manager WHERE id = ?";
        
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                return new Managers(
                    resultSet.getInt("id"),
                    resultSet.getString("username"),
                    resultSet.getString("password"),
                    resultSet.getInt("role_ID"),
                    resultSet.getString("fullName"),
                    resultSet.getInt("gender"),
                    resultSet.getString("address"),
                    resultSet.getString("email"),
                    resultSet.getString("phone_number"),
                    resultSet.getDate("birthday"),
                    resultSet.getString("img_profile")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error while fetching manager by ID: " + e.getMessage());
        }
        
        return null; // Return null if no manager found with the given ID
    }

        
     public void updateManager(Managers manager) {
    String sql = "UPDATE Manager SET username = ?, password = ?, role_ID = ?, fullName = ?, gender = ?, address = ?, email = ?, phone_number = ?, birthday = ?, img_profile = ? WHERE id = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, manager.getUsername());
        st.setString(2, manager.getPassword());
        st.setInt(3, manager.getRoll_ID());
        st.setString(4, manager.getFullName());
        st.setInt(5, manager.getGender());
        st.setString(6, manager.getAddress());
        st.setString(7, manager.getEmail());
        st.setString(8, manager.getPhoneNumber());
        st.setDate(9, manager.getBirthDate());
        st.setString(10, manager.getImgProfile());
        st.setInt(11, manager.getId());
        st.executeUpdate();
        st.close();
    } catch (SQLException e) {
        System.out.println("Error updating manager: " + e.getMessage());
    }
}


        
    public static void main(String[] args) {
        ManagerDAO manager = new ManagerDAO();
        System.out.println(manager.getAllManager().get(0).fullName);
    }
}
