package com.shp.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.shp.commons.dominEntity.BaseEntity;

public class TbContentCategory extends BaseEntity {
    private Long parentId;
    private String name;
    private Integer status;
    private Integer sortOrder;
    @JsonProperty(value = "isParent")
    private Boolean isParent;
    private String created;
    private String updated;

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Boolean getParent() {
        return isParent;
    }

    public void setParent(Boolean parent) {
        isParent = parent;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public String getUpdated() {
        return updated;
    }

    public void setUpdated(String updated) {
        this.updated = updated;
    }
}
