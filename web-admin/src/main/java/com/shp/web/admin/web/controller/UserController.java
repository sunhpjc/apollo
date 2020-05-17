package com.shp.web.admin.web.controller;

import com.shp.commons.dto.BaseResult;
import com.shp.commons.dto.PageInfo;
import com.shp.domain.User;
import com.shp.web.admin.service.TbUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

import static com.shp.commons.constant.ConstantUtils.STATUS_SUCCESS;

@Controller
@RequestMapping(value = "user")
public class UserController {
    @Autowired
    private TbUserService tbUserService;

    //SpringMVC的标签，详情看笔记
    //在每一个@RequestMapping之前执行
    @ModelAttribute
    public User getUser(Long id){
        User tbUser = null;
        if(id!=null){
            tbUser = tbUserService.getUserById(id);
        }
        else {
            tbUser = new User();
        }
        return tbUser;
    }

    //用户列表
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(/*Model model*/){
//        使用了dataTables中ajax请求数据，不需要再请求数据了
//        List<User> userList=tbUserService.userList();
//        model.addAttribute("userList",userList);
        return "user_list";
    }

    //获取用户编辑---新增表单
    @RequestMapping(value = "form",method =RequestMethod.GET)
    public String form(Model model){
        return "user_form";
    }

    //保存用户信息
    @RequestMapping(value = "save",method = RequestMethod.POST)
    //model是使用request跳转，一旦重定向request中的信息就会丢失
    //session也可以存属性，但是session会存一段时间，我们不能常驻内存
    //这里使用RedirectAttributes attributes
    public String saveUser(User tbUser, RedirectAttributes attributes,Model model){
        BaseResult save = tbUserService.saveUser(tbUser);
        //保存成功
        if(save.getStatus()==STATUS_SUCCESS){
            attributes.addFlashAttribute("save",save);
            return "redirect:/user/list";
        }
        //保存失败
        else {
            model.addAttribute("save",save);
            return "user_form";
        }
    }

    //搜索功能
    @RequestMapping(value = "serch",method = RequestMethod.POST)
    public String serch(/*User user,Model model*/){
        //使用dataTables，不需要
        //List<User> userList = tbUserService.serch(user);
        //model.addAttribute("userList",userList);
        return "user_list";
    }

    //批量删除功能
    @ResponseBody
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    public BaseResult delete(String idArray){
        BaseResult baseResult = null;
        if(StringUtils.isNotBlank(idArray)){
            String[] ids = idArray.split(",");
            tbUserService.deleteMulti(ids);
            baseResult=BaseResult.success("删除用户信息成功");
        }
        else {
            baseResult=BaseResult.fail("删除用户信息失败");
        }
        return baseResult;
    }

    //分页GET
    @ResponseBody
    @RequestMapping(value = "page",method = RequestMethod.GET)
    public PageInfo<User> page(HttpServletRequest request,User user){
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        //封装DataTables数据
        PageInfo<User> pageInfo = tbUserService.dataTableSearch(start,length,draw,user);

        return pageInfo;
    }
    //分页POST
    @ResponseBody
    @RequestMapping(value = "page",method = RequestMethod.POST)
    public PageInfo<User> page1(HttpServletRequest request,User user){
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");

        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        //封装DataTables数据
        PageInfo<User> pageInfo = tbUserService.dataTableSearch(start,length,draw,user);

        return pageInfo;
    }

    //查看详情
    @RequestMapping(value = "detail",method = RequestMethod.GET)
    public String detail(User user){
        return "user_detail";
    }
}
