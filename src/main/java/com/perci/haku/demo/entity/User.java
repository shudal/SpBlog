package com.perci.haku.demo.entity;

import javax.persistence.*;

@Entity
@Table(name="user")
public class User {
    @Id
    private int id;
    private String username;
    private String password;
    private String nickname;
    private int role;

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getNickname() {
        return nickname;
    }

    public int getRole(){return role;}

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
