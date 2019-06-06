package cn.edu.sict.mapper;

import cn.edu.sict.pojo.DevUser;

import java.util.List;

public interface DevUserMapper {

    List<DevUser> queryByNamePwd(DevUser devUser);
}