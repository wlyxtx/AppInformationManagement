package cn.edu.sict.service.impl;

import cn.edu.sict.mapper.AppCategoryMapper;
import cn.edu.sict.pojo.AppCategory;
import cn.edu.sict.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AppCategoryServiceImpl implements AppCategoryService {
    @Autowired
    private AppCategoryMapper appCategoryMapper;

    @Override
    public List<AppCategory> queryLevelOne() {
        return appCategoryMapper.queryLevelOne();
    }

    @Override
    public List<AppCategory> queryLevelTwoByLevelOne(Long id) {
        return appCategoryMapper.queryLevelByParentId(id);
    }

    @Override
    public List<AppCategory> queryLevelTwoByLevelTwo(Long id) {
        return appCategoryMapper.queryLevelByParentId(id);
    }
}
