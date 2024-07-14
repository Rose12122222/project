/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Cart;

/**
 *
 * @author FPT SHOP
 */
public class CartDAO {

    public List<Cart> getAllCart(String txt) {
        List<Cart> listCart = new ArrayList<>();
        try {
            int cnt = 0;
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                Map<Integer, Cart> cartMap = new HashMap<>();

                for (String i : s) {
                    String[] n = i.split(":");
                    int id = cnt++;

                    int pid = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);

                    if (cartMap.containsKey(pid)) {
                        Cart existingCart = cartMap.get(pid);
                        existingCart.addQuantity(quantity);
                    } else {
                        Cart cart = new Cart(id, pid,quantity);
                        cartMap.put(pid, cart);
                    }
                }

                listCart.addAll(cartMap.values());
                cnt = 0;
                for (Cart cart : listCart) {
                    cart.setId(cnt);
                    ++cnt;
                }             
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        return listCart;
    }
    
    public Cart getCartByPid(String pid, String txt) {
        CartDAO dao = new CartDAO();
        List<Cart> cartList = dao.getAllCart(txt);
        try {
            for (Cart cart : cartList) {
                if (cart.getPid() == Integer.parseInt(pid)) {
                    return cart;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public int getNumberOfCart(String txt) {
        CartDAO dao = new CartDAO();
        List<Cart> cartList = dao.getAllCart(txt);
        try {
            int cnt = 0;
            for (Cart cart : cartList) {
                ++cnt;
            }
            return cnt;
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
}
