/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.text.DecimalFormat;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import model.InfoDetail;
/**
 *
 * @author FPT SHOP
 */
public class InfoDetailDAO extends DBContext{

    public void editInfo(
            int aid,
            int gender,
            String email,
            String firstName,
            String lastName,
            String address,
            String birthday) {
        String sql = "UPDATE InfoDetail SET gender = ? , email = ? , firstName = ? , lastName = ? , address = ? , birthday = ?";
        DecimalFormat fomatter = new DecimalFormat("##.#");
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, gender);
            st.setString(2, fomatter.format(email));
            st.setString(3, firstName);
            st.setString(4, lastName);
            st.setString(5, address);
            st.setString(6, birthday);


            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
