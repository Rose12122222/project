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
import model.Payment;

/**
 *
 * @author FPT SHOP
 */
public class PaymentDAO extends DBContext {

    public void insertPayment(int pid, int quantity, int oid) {
        String sql = "INSERT INTO Payment (pid,quantity,oid) VALUES (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, quantity);
            st.setInt(3, oid);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Payment> getAll() {
        List<Payment> list = new ArrayList<>();
        String sql = "select * from Payment";
        //chay lenh truy van
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment s = new Payment(rs.getInt("id"),
                        rs.getInt("pid"),
                        rs.getInt("quantity"),
                        rs.getInt("oid"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        PaymentDAO dao = new PaymentDAO();
//        dao.insertPayment(1, 1, 2, 1);
//        List<Payment> list = dao.getAll();
//        for (Payment i : list) {
//            System.out.println(i.getId());
//        }
    }
}
