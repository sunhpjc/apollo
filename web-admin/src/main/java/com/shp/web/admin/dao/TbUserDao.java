package com.shp.web.admin.dao;

import com.shp.domain.User;

import java.util.List;
import java.util.Map;

public interface TbUserDao {
    //登录，根据email查询用户
    public User getUserByEmail(String email);
    //保存添加用户
    public void saveUser(User user);
    //编辑用户
    public void updateUser(User user);
    //通过id得到用户
    public User getUserById(Long id);
    //批量删除
    public void deleteMulti(String[] idArray);
    //搜索功能重写的代码 dataTableSearch和dataTableCount
    //dataTableSearch 多条件查询
    public List<User> dataTableSearch(Map<String,Object> params);
    //dataTableCount 查询总数
    public int dataTableCount(User user);
}
