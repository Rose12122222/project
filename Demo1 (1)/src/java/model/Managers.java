/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author nguye
 */
public class Managers {
    public int id;
    public String username;
    public String password;
    public int roll_ID;
    public String fullName;
    public int gender;
    public String address;
    public String email;
    public String phoneNumber;
    public Date birthDate;
    public String imgProfile;

    public Managers() {
    }

    public Managers(int id, String username, String password, int roll_ID, String fullName, int gender, String address, String email, String phoneNumber, Date birthDate, String imgProfile) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.roll_ID = roll_ID;
        this.fullName = fullName;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.birthDate = birthDate;
        this.imgProfile = imgProfile;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoll_ID() {
        return roll_ID;
    }

    public void setRoll_ID(int roll_ID) {
        this.roll_ID = roll_ID;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getImgProfile() {
        return imgProfile;
    }

    public void setImgProfile(String imgProfile) {
        this.imgProfile = imgProfile;
    }

    @Override
    public String toString() {
        return "Managers{" + "username=" + username + ", password=" + password + ", roll_ID=" + roll_ID + ", fullName=" + fullName + ", gender=" + gender + ", address=" + address + ", email=" + email + ", phoneNumber=" + phoneNumber + ", birthDate=" + birthDate + ", imgProfile=" + imgProfile + '}';
    }
    
    
}
