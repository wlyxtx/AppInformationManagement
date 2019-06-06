package cn.edu.sict.controller;

import cn.edu.sict.dto.AppinfoDTO;
import cn.edu.sict.pojo.AppCategory;
import cn.edu.sict.pojo.AppInfo;
import cn.edu.sict.pojo.BackendUser;
import cn.edu.sict.pojo.DataDictionary;
import cn.edu.sict.service.AppCategoryService;
import cn.edu.sict.service.AppInfoService;
import cn.edu.sict.service.DataDictionaryService;
import cn.edu.sict.service.DevAppService;
import cn.edu.sict.service.impl.BackendUserServiceImpl;
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
@RequestMapping("/user")
public class BackendUserController {

    @Autowired
    private BackendUserServiceImpl backendUserService;


    @Autowired
    private DevAppService devAppService;

    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private DataDictionaryService dataDictionaryService;

    @Autowired
    private AppCategoryService appCategoryService;

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
            model.addAttribute("UserCategory", "管理员");
            return "app/userIndex";
        } else {
            return "redirect:/";
        }
    }

    @RequestMapping("/login")
    public String login(BackendUser backendUser, Model model, HttpSession session) {
        backendUser = backendUserService.login(backendUser);
        if (backendUser != null) {
            session.setAttribute("User", backendUser);
            session.setAttribute("USER", backendUser.getId());
            //存储管理员开发者信息
            model.addAttribute("UserCategory", "管理员");
            return "user/index";
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping("/app/index/devId/{id}")
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
        model.addAttribute("UserCategory", "管理员");

        return "app/userIndex";
    }

    @RequestMapping("/app/toCheck/{id}")
    public String toCheck(@PathVariable("id") Long id, Model model, HttpSession session) {
        //先查询用户信息显示,在执行更改操作
        AppInfo appInfo = appInfoService.queryDetailById(id);

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
        model.addAttribute("UserCategory", "管理员");
        model.addAttribute("app", appInfo);
        return "app/check";
    }

    @RequestMapping("/app/check/{id}")
    public String Check(@PathVariable("id") Long id, AppInfo appInfo, Model model, HttpSession session) {
        Object obj = session.getAttribute("USER_ID");
        long userId= (long) obj;
        dataDictionaryService.ckeck(appInfo);
        return "redirect:/app/index/devId/"+userId;
    }
}
