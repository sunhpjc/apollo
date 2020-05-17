package com.shp.web.ui.controller;

import com.shp.commons.commonsutils.HttpClientUtils;
import com.shp.commons.commonsutils.MapperUtils;
import com.shp.web.ui.api.ContenntsAPI;
import com.shp.web.ui.dto.TbContent;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

import static com.shp.web.ui.api.API.API_CONTENTS;

@Controller
public class IndexController {
    @RequestMapping(value = {"","index"},method = RequestMethod.GET)
    public String index(Model model){
        requestContentsPPT(model);
        return "index";
    }
    //请求幻灯片
    private void requestContentsPPT(Model model){
        List<TbContent> data = ContenntsAPI.findContentsByCategoryId("86");
        model.addAttribute("PPT",data);
    }
}
