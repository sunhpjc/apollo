package com.shp.web.admin.service;

import com.shp.domain.TbContentCategory;

import java.util.List;

public interface TbContentCategoryService {
    public List<TbContentCategory> sellectAll();
    //根据父类ID查询
    public List<TbContentCategory> selectByPid(Long id);
}
