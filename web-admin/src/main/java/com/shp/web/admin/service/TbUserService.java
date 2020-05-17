package com.shp.web.admin.service;

import com.shp.commons.dto.BaseResult;
import com.shp.commons.dto.PageInfo;
import com.shp.domain.User;

public interface TbUserService {
    //登录
    public User login(String email,String password);
    //响应状态码
    public BaseResult saveUser(User user);
    //通过id查询用户信息
    public User getUserById(Long id);
    //批量删除
    public void deleteMulti(String[] idArray);
    //dataTableSearch 多条件查询
    public PageInfo<User> dataTableSearch(int start,int length,int draw,User user);
    //dataTableCount 查询总数
    public int dataTableCount(User user);

}
