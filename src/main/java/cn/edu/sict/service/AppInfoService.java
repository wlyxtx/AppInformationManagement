package cn.edu.sict.service;

import cn.edu.sict.dto.AppinfoDTO;
import cn.edu.sict.pojo.AppInfo;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface AppInfoService {
    PageInfo<AppInfo> queryByDevUserId(Long id, PageInfo<AppInfo> pageInfo);

    PageInfo<AppInfo> query(AppinfoDTO appinfoDTO);

    boolean add(AppInfo appInfo, long userId);

    boolean delete(Long id);

    AppInfo queryById(Long id);

    void update(AppInfo appInfo);

    AppInfo queryDetailById(Long id);
}
