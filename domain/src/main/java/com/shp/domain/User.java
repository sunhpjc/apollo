package com.shp.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shp.commons.dominEntity.BaseEntity;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
public class User extends BaseEntity {
    @Length(min = 6,max = 20,message = "用户长度应在6-20位之间")
    private String username;
    @Length(min = 6,max = 20,message = "密码的长度应在6-20位之间")
    private String password;
    private String email;
    private boolean isEmpty;

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", isEmpty=" + isEmpty +
                '}';
    }
}
