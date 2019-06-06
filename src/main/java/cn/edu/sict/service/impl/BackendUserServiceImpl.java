package cn.edu.sict.service.impl;

import cn.edu.sict.mapper.BackendUserMapper;
import cn.edu.sict.pojo.BackendUser;
import cn.edu.sict.service.BackendUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BackendUserServiceImpl implements BackendUserService {
    @Autowired
    private BackendUserMapper backendUserMapper;
    public BackendUser login(BackendUser backendUser) {
        return backendUserMapper.login(backendUser);
    }
}
