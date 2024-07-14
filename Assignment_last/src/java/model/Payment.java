/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.AccountDAO;
import dal.ProductDAO;

/**
 *
 * @author FPT SHOP
 */
public class Payment {

    private int id;
    private int pid;
    private int quantity;
    private int oid;

    public Payment() {
    }

    public Payment(int id, int pid, int quantity, int oid) {
        this.id = id;
        this.pid = pid;
        this.quantity = quantity;
        this.oid = oid;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public void addQuantity(int quantity) {
        this.quantity += quantity;
    }

    public String getNameByPid() {
        ProductDAO dao = new ProductDAO();
        return dao.getProductById(this.pid).getName();
    }

    public float getPriceByPid() {
        ProductDAO dao = new ProductDAO();
        return dao.getProductById(this.pid).getPrice();
    }

    public float getDiscountByPid() {
        ProductDAO dao = new ProductDAO();
        return dao.getProductById(this.pid).getDiscount();
    }

    public String getImgByPid() {
        ProductDAO dao = new ProductDAO();
        return dao.getProductById(this.pid).getImg();
    }
}
