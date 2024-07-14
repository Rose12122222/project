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
import model.Admins;
import java.sql.Date;
/**
 *
 * @author nguye
 */
public class AdminDAO extends DBContext{
    public List<Admins> getAllAdmin() {
        List<Admins> list = new ArrayList<>();
        String sql = "select * from Admins";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Admins s = new Admins(rs.getInt("id"),
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
    public Admins getByID(int ID) {
        String sql = "select * from Admins where ID = ?";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Admins s = new Admins(
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
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }public void updateAdmin(Admins admin) {
    String sql = "UPDATE Admins SET username = ?, password = ?, role_ID = ?, fullName = ?, gender = ?, address = ?, email = ?, phone_number = ?, birthday = ?, img_profile = ? WHERE ID = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, admin.getUsername());
        st.setString(2, admin.getPassword());
        st.setInt(3, admin.getRoll_ID());
        st.setString(4, admin.getFullName());
        st.setInt(5, admin.getGender());
        st.setString(6, admin.getAddress());
        st.setString(7, admin.getEmail());
        st.setString(8, admin.getPhoneNumber());
        st.setDate(9, admin.getBirthDate());
        st.setString(10, admin.getImgProfile());
        st.setInt(11, admin.getId());
        st.executeUpdate();
        st.close();
    } catch (SQLException e) {
        System.out.println("Error updating admin: " + e.getMessage());
    }
}

    
    public static void main(String[] args) {
        AdminDAO admin =  new AdminDAO();
        System.out.println(admin.getAllAdmin().get(0).id);
    }
}
