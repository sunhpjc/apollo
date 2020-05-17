package com.shp.web.api.dao;

import com.shp.domain.TbContent;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TbContentDao {
    public List<TbContent> getTbContentById(Long categoryId);
}
