package com.shp.web.api.web.controller.v1;

import com.shp.commons.dto.BaseResult;
import com.shp.domain.TbContent;
import com.shp.web.api.service.TbContentService;
import com.shp.web.api.web.dto.TbContentDTO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

//使用@RestController之后不需要再使用@ResponsBody了
@RestController
@RequestMapping(value = "${api.path.v1}/contents")
public class TbContentController {
    @Autowired
    private TbContentService tbContentService;
    @ModelAttribute
    public TbContent getTbContent(Long id){
        TbContent tbContent=null;
        if(id==null){
            tbContent= new TbContent();
        }
        return tbContent;
    }
    @RequestMapping(value = "{category_id}",method = RequestMethod.GET)
    public BaseResult findContentByCategoryId(@PathVariable(value = "category_id") Long categoryId){
        List<TbContentDTO> tbContentDTOS = null;
        List<TbContent> tbContentById = tbContentService.getTbContentById(categoryId);
        if(tbContentById!=null&&tbContentById.size()>0){
            tbContentDTOS = new ArrayList<>();
            for (TbContent tb : tbContentById
                    ) {
                TbContentDTO dto = new TbContentDTO();
                BeanUtils.copyProperties(tb,dto);
                tbContentDTOS.add(dto);
            }
        }
        return BaseResult.success("成功",tbContentDTOS);
    }
}
