package cn.edu.sict.mapper;

import cn.edu.sict.pojo.AppCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppCategoryMapper {

    List<AppCategory> queryLevelOne();

    List<AppCategory> queryLevelByParentId(@Param("id") Long id);

}