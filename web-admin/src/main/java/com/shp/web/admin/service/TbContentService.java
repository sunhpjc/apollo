package com.shp.web.admin.service;

import com.shp.commons.dto.BaseResult;
import com.shp.commons.dto.PageInfo;
import com.shp.domain.TbContent;
import com.shp.domain.User;

import java.util.List;
import java.util.Map;

public interface TbContentService {
    //查询全部
    public List<TbContent> selectAll();
    //通过id获取
    public TbContent getById(Long id);
    //插入
    public BaseResult save(TbContent tbContent);
    //删除
    public void delete(Long id);
    //修改
    //public void update(TbContent tbContent);
    //批量删除
    public void deleteMulti(String[] idArray);
    //搜索功能重写的代码 dataTableSearch和dataTableCount
    //dataTableSearch 多条件查询
    public PageInfo<TbContent> dataTableSearch(int start, int length,int draw,TbContent tbContent);
    //dataTableCount 查询总数
    public int dataTableCount(TbContent tbContent);
}
