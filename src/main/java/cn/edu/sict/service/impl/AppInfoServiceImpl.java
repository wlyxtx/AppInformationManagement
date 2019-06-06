package cn.edu.sict.service.impl;

import cn.edu.sict.constant.CommonCodeConstant;
import cn.edu.sict.dto.AppinfoDTO;
import cn.edu.sict.mapper.AppInfoMapper;
import cn.edu.sict.mapper.DataDictionaryMapper;
import cn.edu.sict.pojo.AppInfo;
import cn.edu.sict.pojo.DataDictionary;
import cn.edu.sict.pojo.DevUser;
import cn.edu.sict.service.AppInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.Appinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public class AppInfoServiceImpl implements AppInfoService {


    @Autowired
    private AppInfoMapper appInfoMapper;

    @Override
    public PageInfo<AppInfo> queryByDevUserId(Long id, PageInfo pageInfo) {
        //去第几页以及页码大小
        PageHelper.startPage(pageInfo.getPageSize(), pageInfo.getPageNum());
        AppinfoDTO appinfoDTO = new AppinfoDTO();
        appinfoDTO.setDevUserId(id);
        List<AppInfo> appInfos = appInfoMapper.query(appinfoDTO);
        //  List<AppInfo> appInfos = appInfoMapper.queryByDevUserId(id);

        PageInfo page = new PageInfo<AppInfo>(appInfos);
        return page;
    }

    @Override
    public PageInfo<AppInfo> query(AppinfoDTO appinfoDTO) {

        if (appinfoDTO.getPageNum() == null) {
            appinfoDTO.setPageNum(1);
        }
        PageHelper.startPage(appinfoDTO.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        List<AppInfo> list = appInfoMapper.query(appinfoDTO);
        PageInfo<AppInfo> page = new PageInfo<AppInfo>(list);
        return page;

    }

    @Override
    public boolean add(AppInfo appInfo, long userId) {
        //先处理信息
        appInfo.setCreationDate(new Date());
        appInfo.setDevId(userId);
        DevUser devUser = new DevUser();

        devUser.setId(userId);
        devUser.setCreatedBy(userId);
        //app状态信息
        DataDictionary dataDictionary = new DataDictionary();
        dataDictionary.setValueId(CommonCodeConstant.APP_STATUS);
        appInfo.setAppStatus(dataDictionary);
        appInfo.setDevUser(devUser);
        //app状态信息end
        int row = appInfoMapper.add(appInfo);
        return false;
    }

    @Override
    public boolean delete(Long id) {
        return appInfoMapper.delete(id);
    }

    @Override
    public AppInfo queryById(Long id) {
        return appInfoMapper.queryById(id);
    }

    @Override
    public void update(AppInfo appInfo) {
        appInfoMapper.update(appInfo);
    }

    @Override
    public AppInfo queryDetailById(Long id) {
        return appInfoMapper.queryDetailById(id);
    }
}
