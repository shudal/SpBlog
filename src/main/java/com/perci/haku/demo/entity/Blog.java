package com.perci.haku.demo.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@Entity
@Table(name="blog")
public class Blog {
    @Id
    private int id;
    private String title;
    private String content;
    private long create_time;
    private long update_time;


}
