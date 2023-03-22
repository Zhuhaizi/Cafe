/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author DELL
 */
public class User {
    private int u_id;
    private String u_fullname;
    private String u_username;
    private String u_pass;
    private String u_type;

    public User() {
    }

    public User(int u_id, String u_fullname, String u_username, String u_pass, String u_type) {
        this.u_id = u_id;
        this.u_fullname = u_fullname;
        this.u_username = u_username;
        this.u_pass = u_pass;
        this.u_type = u_type;
    }

    public User(String u_fullname, String u_username, String u_pass, String u_type) {
        this.u_fullname = u_fullname;
        this.u_username = u_username;
        this.u_pass = u_pass;
        this.u_type = u_type;
    }

    
    
    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getU_fullname() {
        return u_fullname;
    }

    public void setU_fullname(String u_fullname) {
        this.u_fullname = u_fullname;
    }

    public String getU_username() {
        return u_username;
    }

    public void setU_username(String u_username) {
        this.u_username = u_username;
    }

    public String getU_pass() {
        return u_pass;
    }

    public void setU_pass(String u_pass) {
        this.u_pass = u_pass;
    }

    public String getU_type() {
        return u_type;
    }

    public void setU_type(String u_type) {
        this.u_type = u_type;
    }
    
    
}
