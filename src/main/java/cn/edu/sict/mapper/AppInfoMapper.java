package cn.edu.sict.mapper;

import cn.edu.sict.dto.AppinfoDTO;
import cn.edu.sict.pojo.AppInfo;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppInfoMapper {

//    List<AppInfo> queryByDevUserId(@Param("devUserId") Long id);

    List<AppInfo> query(AppinfoDTO appinfoDTO);

    int add(AppInfo appInfo);

    boolean delete(@Param("id") Long id);

    AppInfo queryById(@Param("id") Long id);

    void update(AppInfo appInfo);

    AppInfo queryDetailById(@Param("id") Long id);
}