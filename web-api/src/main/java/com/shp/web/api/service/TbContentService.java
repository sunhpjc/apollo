package com.shp.web.api.service;


import com.shp.domain.TbContent;

import java.util.List;

public interface TbContentService {
    public List<TbContent> getTbContentById(Long categoryId);
}
