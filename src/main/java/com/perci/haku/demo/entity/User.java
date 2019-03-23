package com.perci.haku.demo.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@Entity
@Table(name="user")
public class User {
    @Id
    private int id;
    private String username;
    private String password;
    private String nickname;
    private int role;

}
