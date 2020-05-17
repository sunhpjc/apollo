package com.shp.web.admin.dao;

import com.shp.domain.TbContentCategory;

import java.util.List;

public interface TbContentCategoryDao {
    //查询所有内容列表，并排序
    public List<TbContentCategory> sellectAll();
    //根据父类ID查询
    public List<TbContentCategory> selectByPid(Long id);
}
