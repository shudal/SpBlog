package com.perci.haku.demo.service;

import com.perci.haku.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserService extends JpaRepository<User, Long>{
    User findByUsername(String username);
}
