package com.perci.haku.demo.service;

import com.perci.haku.demo.entity.Blog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BlogService extends JpaRepository<Blog, Long> {
}
