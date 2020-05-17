package com.shp.web.ui.dto;

import lombok.Data;

import java.io.Serializable;
@Data
public class TbContent implements Serializable {
    private  Long id;
    private String title;
    private String subTitle;
    private String url;
    private String pic;
}
