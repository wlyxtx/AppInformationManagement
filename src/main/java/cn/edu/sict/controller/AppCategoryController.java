package cn.edu.sict.controller;


import cn.edu.sict.pojo.AppCategory;
import cn.edu.sict.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/category")
public class AppCategoryController {

    @Autowired
    private AppCategoryService appCategoryService;

    @RequestMapping("/queryLevelTwoByLevelOne/{levelOneId}")
    @ResponseBody
    public List<AppCategory> queryLevelTwoByLevelOne(@PathVariable("levelOneId") Long id) {
        //通过查询父对象的ID返回父对象下的子标题
        // (ID为1   查询得到ID等于1的二级标题集合
        // 并向页面返回一组json数据
        // 通过JQuery内的ajax获取 )
        List<AppCategory> levelTwo = appCategoryService.queryLevelTwoByLevelOne(id);
        return levelTwo;
    }

    @RequestMapping("/queryLevelTwoByLevelTwo/{levelTwoId}")
    @ResponseBody
    public List<AppCategory> queryLevelTwoByLevelTwo(@PathVariable("levelTwoId") Long id) {
        //通过查询父对象的ID返回父对象下的子标题
        // (ID为1   查询得到ID等于1的二级标题集合
        // 并向页面返回一组json数据
        // 通过JQuery内的ajax获取 )
        List<AppCategory> levelThree = appCategoryService.queryLevelTwoByLevelTwo(id);
        return levelThree;
    }
}
