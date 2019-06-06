package cn.edu.sict.controller;


import cn.edu.sict.dto.AppinfoDTO;
import cn.edu.sict.mapper.AppInfoMapper;
import cn.edu.sict.pojo.AppCategory;
import cn.edu.sict.pojo.AppInfo;
import cn.edu.sict.pojo.DataDictionary;
import cn.edu.sict.pojo.DevUser;
import cn.edu.sict.service.AppCategoryService;
import cn.edu.sict.service.AppInfoService;
import cn.edu.sict.service.DataDictionaryService;
import cn.edu.sict.service.DevAppService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/app")
public class DevAppController {


    @Autowired
    private DevAppService devAppService;

    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private DataDictionaryService dataDictionaryService;

    @Autowired
    private AppCategoryService appCategoryService;

    @RequestMapping("/index/devId/{id}")
    public String index(@PathVariable("id") Long id, Model model, HttpSession session) {
        //保存此ID信息
        session.setAttribute("USER_ID", id);
        PageInfo<AppInfo> pageInfo = new PageInfo<>();

        pageInfo.setPageNum(5);
        pageInfo.setPageSize(1);
        pageInfo = appInfoService.queryByDevUserId(id, pageInfo);
        //查询所有APP的状态
        List<DataDictionary> appStatus = dataDictionaryService.queryAllStatus();
        //查询所有app所属平台
        List<DataDictionary> appFlatform = dataDictionaryService.queryAllFlatform();
        //查询所有一级分类
        List<AppCategory> LevelOne = appCategoryService.queryLevelOne();

        model.addAttribute("appStatus", appStatus);//app状态
        model.addAttribute("appFlatform", appFlatform);//app所属平台
        model.addAttribute("LevelOne", LevelOne);//一级分类
        model.addAttribute("page", pageInfo);
        //存储管理员开发者信息
        model.addAttribute("UserCategory", "开发者");
        return "app/index";
    }

    @RequestMapping("/query")
    public String query(AppinfoDTO appinfoDTO, Model model, HttpSession session) {
        Object obj = session.getAttribute("USER_ID");
        if (obj != null) {
            long userId = (long) obj;
            appinfoDTO.setDevUserId(userId);
            PageInfo<AppInfo> pageInfo = appInfoService.query(appinfoDTO);
            //查询所有APP的状态
            List<DataDictionary> appStatus = dataDictionaryService.queryAllStatus();
            //查询所有app所属平台
            List<DataDictionary> appFlatform = dataDictionaryService.queryAllFlatform();
            //查询所有一级分类
            List<AppCategory> LevelOne = appCategoryService.queryLevelOne();

            model.addAttribute("appStatus", appStatus);//app状态
            model.addAttribute("appFlatform", appFlatform);//app所属平台
            model.addAttribute("LevelOne", LevelOne);//一级分类
            model.addAttribute("page", pageInfo);
            model.addAttribute("appinfoDTO", appinfoDTO);
            //存储管理员开发者信息
            model.addAttribute("UserCategory","开发者");
            return "app/index";
        } else {
            return "redirect:/";
        }
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model) {
        //查询所有APP的状态
        List<DataDictionary> appStatus = dataDictionaryService.queryAllStatus();
        //查询所有app所属平台
        List<DataDictionary> appFlatform = dataDictionaryService.queryAllFlatform();
        //查询所有一级分类
        List<AppCategory> LevelOne = appCategoryService.queryLevelOne();
        model.addAttribute("appStatus", appStatus);//app状态
        model.addAttribute("appFlatform", appFlatform);//app所属平台
        model.addAttribute("LevelOne", LevelOne);//一级分类
        //存储管理员开发者信息
        model.addAttribute("UserCategory","开发者");
        return "app/add";
    }

    @RequestMapping("/add")
    public String add(AppInfo appInfo, HttpSession session) {
        //开发者
        Object id = session.getAttribute("USER_ID");
        long userId = Long.parseLong(id.toString());
        boolean flag = appInfoService.add(appInfo, userId);
        return "redirect:/app/index/devId/" + userId;

    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id, HttpSession session) {
        //开发者
        Object ido = session.getAttribute("USER_ID");
        long userId = Long.parseLong(ido.toString());
        boolean flag = appInfoService.delete(id);


        return "redirect:/app/index/devId/" + userId;
    }

    @RequestMapping("/toEdit/{id}")
    public String toEdit(@PathVariable("id") Long id, HttpSession session, Model model) {
        //先查询用户信息显示,在执行更改操作
        AppInfo appInfo = appInfoService.queryById(id);

        //查询所有APP的状态
        List<DataDictionary> appStatus = dataDictionaryService.queryAllStatus();
        //查询所有app所属平台
        List<DataDictionary> appFlatform = dataDictionaryService.queryAllFlatform();
        //查询所有一级分类
        List<AppCategory> LevelOne = appCategoryService.queryLevelOne();

        model.addAttribute("appStatus", appStatus);//app状态
        model.addAttribute("appFlatform", appFlatform);//app所属平台
        model.addAttribute("LevelOne", LevelOne);//一级分类
        //存储管理员开发者信息
        model.addAttribute("UserCategory","开发者");
        model.addAttribute("app", appInfo);
        return "app/edit";
    }

    @RequestMapping("/edit")
    public String Edit(AppInfo appInfo, HttpSession session, Model model) {

        Object uid = session.getAttribute("USER_ID");
        Long userid = Long.parseLong(uid.toString());
        DevUser devUser = new DevUser();
        devUser.setId(userid);
        appInfo.setCreateUser(devUser);
        appInfo.setModifyUser(devUser);
        appInfo.setDevUser(devUser);
        appInfoService.update(appInfo);
        //存储管理员开发者信息
        model.addAttribute("UserCategory","开发者");
        return "redirect:/app/query";
    }

    @RequestMapping("/queryById/{id}")
    public String queryById(@PathVariable("id") Long id, Model model) {
        AppInfo appInfo = appInfoService.queryDetailById(id);
        model.addAttribute("app",appInfo);
        //存储管理员开发者信息
        model.addAttribute("UserCategory","开发者");
        return "app/appDetail";
    }
}
