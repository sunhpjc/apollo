package com.shp.web.api.service.impl;

import com.shp.domain.TbContent;
import com.shp.web.api.dao.TbContentDao;
import com.shp.web.api.service.TbContentService;
import com.shp.web.api.web.dto.TbContentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class TbContentServiceImpl implements TbContentService {
    @Autowired
    private TbContentDao tbContentDao;

    @Transactional(readOnly = true)
    @Override
    public List<TbContent> getTbContentById(Long categoryId) {
        return tbContentDao.getTbContentById(categoryId);
    }
}
