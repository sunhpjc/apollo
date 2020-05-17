package com.shp.web.api.web.dto;

import lombok.Data;

import java.io.Serializable;
@Data
public class TbContentDTO implements Serializable {
    private  Long id;
    private String title;
    private String subTitle;
    private String url;
    private String pic;
}
