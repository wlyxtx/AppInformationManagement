package cn.edu.sict.service.impl;


import cn.edu.sict.mapper.DevUserMapper;
import cn.edu.sict.pojo.DevUser;
import cn.edu.sict.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("devUserService")
public class DevUserServiceImpl implements DevUserService {

    @Autowired
    DevUserMapper devUserMapper;


    @Override
    public DevUser login(DevUser devUser) {
        List<DevUser> users = devUserMapper.queryByNamePwd(devUser);
        //查询用户不等于null  list集合大小为1
        if (users != null && users.size() == 1) {
            return users.get(0);
        }
        return null;
    }
}
