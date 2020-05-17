package com.shp.domain;

import com.shp.commons.dominEntity.BaseEntity;
import lombok.Data;

@Data
public class TbContent extends BaseEntity {
    private Long category_id;
    private Long categoryId;
    private String title;
    private String sub_title;
    private String title_desc;
    private String subTitle;
    private String titleDesc;
    private String url;
    private String pic;
    private String pic2;
    private String content;
    private String created;
    private String updated;
}
