package cn.edu.sict.mapper;

import cn.edu.sict.pojo.AppInfo;
import cn.edu.sict.pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryMapper {

    List<DataDictionary> queryAllStatus();

    List<DataDictionary> queryAllFlatform();

    void check(AppInfo appInfo);
}