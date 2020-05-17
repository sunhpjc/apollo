package com.shp.web.admin.dao;

import com.shp.domain.TbContent;
import com.shp.domain.User;

import java.util.List;
import java.util.Map;

public interface TbContentDao {
    //查询全部
    public List<TbContent> selectAll();
    //通过id获取
    public TbContent getById(Long id);
    //插入
    public void insert(TbContent tbContent);
    //删除
    public void delete(Long id);
    //修改
    public void update(TbContent tbContent);
    //批量删除
    public void deleteMulti(String[] idArray);
    //搜索功能重写的代码 dataTableSearch和dataTableCount
    //dataTableSearch 多条件查询
    public List<TbContent> dataTableSearch(Map<String,Object> params);
    //dataTableCount 查询总数
    public int dataTableCount(TbContent tbContent);
}
