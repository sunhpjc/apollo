package com.shp.web.admin.web.controller;

import com.shp.domain.TbContentCategory;
import com.shp.web.admin.service.TbContentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "content")
public class TbContentCategoryController {
    @Autowired
    private TbContentCategoryService tbContentCategoryService;
    //内容列表
    @RequestMapping(value = "category_list",method = RequestMethod.GET)
    private String list(Model model){
        List<TbContentCategory> targetList = new ArrayList<>();
        List<TbContentCategory> sourceList = tbContentCategoryService.sellectAll();
        //排序
        sortList(sourceList,targetList,0L);
        model.addAttribute("tbContentCategoryList",targetList);
        return"content_category_list";
    }
    //内容排序（工具）
    private void sortList(List<TbContentCategory> sourceList,List<TbContentCategory> targetList,Long parentId){
        for (TbContentCategory tbContentCategory:sourceList
             ) {
            if(tbContentCategory.getParentId().equals(parentId)){
                targetList.add(tbContentCategory);
                //判断有没有子节点，有就继续追加
                if(tbContentCategory.getParent()){
                    for (TbContentCategory contentCatgory:sourceList
                         ) {
                        if(contentCatgory.getParentId().equals(tbContentCategory.getId())){
                            sortList(sourceList,targetList,tbContentCategory.getId());
                            break;
                        }
                    }
                }
            }
        }
    }
    //树形数据
    @ResponseBody
    @RequestMapping(value="category_treeData",method = RequestMethod.POST)
    private List<TbContentCategory> treeData(Long id){
        if(id==null){
            id=0L;
        }
        return tbContentCategoryService.selectByPid(id);
    }
}
