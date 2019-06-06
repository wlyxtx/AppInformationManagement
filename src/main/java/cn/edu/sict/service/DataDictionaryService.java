package cn.edu.sict.service;

import cn.edu.sict.pojo.AppInfo;
import cn.edu.sict.pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryService {
    List<DataDictionary> queryAllStatus();

    List<DataDictionary> queryAllFlatform();

    void ckeck(AppInfo appInfo);
}
