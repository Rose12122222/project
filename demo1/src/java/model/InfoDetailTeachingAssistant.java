/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


import java.util.Date;

/**
 *
 * @author FPT SHOP
 */
public class InfoDetailTeachingAssistant {
    int ID;
    String username;
    String password;
    int role_ID;
    String fullName;
    int gender;
    String address;
    String email;
    String phone_number;
    Date birthday;
    String img_certificates;
    String img_profile;
    String description;
    
    

    public InfoDetailTeachingAssistant() {
    }

    public InfoDetailTeachingAssistant(int ID, String username, String password, int role_ID, String fullName, int gender, String address, String email, String phone_number, Date birthday, String img_certificates, String img_profile, String description) {
        this.ID = ID;
        this.username = username;
        this.password = password;
        this.role_ID = role_ID;
        this.fullName = fullName;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phone_number = phone_number;
        this.birthday = birthday;
        this.img_certificates = img_certificates;
        this.img_profile = img_profile;
        this.description = description;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

   
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole_ID() {
        return role_ID;
    }

    public void setRole_ID(int role_ID) {
        this.role_ID = role_ID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

   

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getImg_certificates() {
        return img_certificates;
    }

    public void setImg_certificates(String img_certificates) {
        this.img_certificates = img_certificates;
    }

    public String getImg_profile() {
        return img_profile;
    }

    public void setImg_profile(String img_profile) {
        this.img_profile = img_profile;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
   
}
