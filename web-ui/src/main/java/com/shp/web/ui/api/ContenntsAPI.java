package com.shp.web.ui.api;

import com.shp.commons.commonsutils.HttpClientUtils;
import com.shp.commons.commonsutils.MapperUtils;
import com.shp.web.ui.dto.TbContent;

import java.util.ArrayList;
import java.util.List;

import static com.shp.web.ui.api.API.API_CONTENTS;

/*
* 请求内容管理接口
* */
public class ContenntsAPI {
    public static List<TbContent> findContentsByCategoryId(String id){
        List<TbContent> data = new ArrayList<>();
        String result = HttpClientUtils.doGet(API_CONTENTS+id);
        try {
             data = MapperUtils.json2listByTree(result, "data", TbContent.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
}
