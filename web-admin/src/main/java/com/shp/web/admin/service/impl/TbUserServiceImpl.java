package com.shp.web.admin.service.impl;

import com.shp.commons.commonsutils.RegexpUtils;
import com.shp.commons.dto.BaseResult;
import com.shp.commons.dto.PageInfo;
import com.shp.commons.validator.BeanValidator;
import com.shp.domain.User;
import com.shp.web.admin.dao.TbUserDao;
import com.shp.web.admin.service.TbUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.shp.commons.constant.ConstantUtils.STATUS_SUCCESS;

@Service
public class TbUserServiceImpl implements TbUserService {
    @Autowired
    private TbUserDao tbUserDao;
    //登录（通过邮箱登录）
    @Override
    public User login(String email, String password) {
        //数据库挂了，写死来测试
        //User user = tbUserDao.getUserByEmail(email);
        User user = new User();
        user.setEmail("1234567@qq.com");
        user.setPassword("123456");
        if(user!=null){
            /*String md5Password = DigestUtils.md5DigestAsHex(password.getBytes());
            if(md5Password.equals(user.getPassword()));{
                return user;
            }*/
            password.equals(user.getPassword());
            return user;
        }
        return null;
    }
    //保存用户
    @Override
    public BaseResult saveUser(User tbUser) {
        String beanValidator = BeanValidator.validator(tbUser);
        //验证不通过
        if(beanValidator!=null){
            return BaseResult.fail(beanValidator);
        }
        //通过验证
        else {
            tbUserDao.updateUser(tbUser);
        }
        return BaseResult.success("编辑用户信息成功");

    }/*        //通过验证
        BaseResult baseResult = check(tbUser);
        if(baseResult.getStatus()==STATUS_SUCCESS){
            //新增用户
            if(tbUser.getId()==null){
                //密码需要加密处理
                tbUser.setPassword(DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes()));
                tbUserDao.saveUser(tbUser);
            }
            //编辑用户
            else {
                tbUserDao.updateUser(tbUser);
            }
            baseResult.setMessage("编辑用户信息成功");
        }
        return baseResult;*/
    //通过id获取用户
    @Override
    public User getUserById(Long id) {
        return tbUserDao.getUserById(id);
    }
    //批量删除
    @Override
    public void deleteMulti(String[] idArray) {
        tbUserDao.deleteMulti(idArray);
    }
    //dataTableSearch 多条件查询
    @Override
    public PageInfo<User> dataTableSearch(int start, int length,int draw,User user) {
        int count=tbUserDao.dataTableCount(user);
        Map<String,Object> params = new HashMap<>();
        params.put("start",start);
        params.put("length",length);
        params.put("user",user);

        PageInfo<User> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(tbUserDao.dataTableSearch(params));
        return pageInfo;
    }
    //dataTableCount 查询总数
    @Override
    public int dataTableCount(User user) {
        return tbUserDao.dataTableCount(user);
    }

    //用户有效性验证
    public BaseResult check(User tbUser){
        BaseResult baseResult = BaseResult.success();
        //姓名非空验证
        if (StringUtils.isBlank(tbUser.getUsername())){
            baseResult=BaseResult.fail("姓名不能为空,请重新输入");
        }
        //邮箱非空验证
        else if(StringUtils.isBlank(tbUser.getEmail())){
            baseResult=BaseResult.fail("邮箱不能为空,请重新输入");
        }
        else if(RegexpUtils.checkEmail(tbUser.getEmail())==false){
            baseResult=BaseResult.fail("邮箱格式不正确,请重新输入");
        }
        //密码非空验证
        else if(StringUtils.isBlank(tbUser.getPassword())){
            baseResult=BaseResult.fail("密码不能为空,请重新输入");
        }
        return baseResult;
    }
}
