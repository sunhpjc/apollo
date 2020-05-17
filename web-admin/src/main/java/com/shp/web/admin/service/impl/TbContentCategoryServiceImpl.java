package com.shp.web.admin.service.impl;

import com.shp.domain.TbContentCategory;
import com.shp.web.admin.dao.TbContentCategoryDao;
import com.shp.web.admin.service.TbContentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbContentCategoryServiceImpl implements TbContentCategoryService {
    @Autowired
    private TbContentCategoryDao tbContentCategoryDao;

    @Override
    public List<TbContentCategory> sellectAll() {
        return tbContentCategoryDao.sellectAll();
    }

    @Override
    public List<TbContentCategory> selectByPid(Long id) {
        return tbContentCategoryDao.selectByPid(id);
    }
}
