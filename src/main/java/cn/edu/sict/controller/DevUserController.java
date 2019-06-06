package cn.edu.sict.controller;


import cn.edu.sict.pojo.DevUser;
import cn.edu.sict.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/dev")
public class DevUserController {


    @Autowired
    private DevUserService devUserService;

    @RequestMapping("/toLogin")
    public String toLogin(DevUser devUser) {
        return "dev/login";
    }

    @RequestMapping("/login")
    public String login(DevUser devUser, Model model,HttpSession session) {
        devUser = devUserService.login(devUser);
        if (devUser != null) {
            //登录成功  跳向成功页面
            session.setAttribute("devUser", devUser);
            session.setAttribute("USER_ID",devUser.getId());
            //存储管理员开发者信息
            model.addAttribute("UserCategory","开发者");
            return "dev/index";
        } else {
          //  model.addAttribute("errMsg", "登录失败");
            //登录失败  跳向失败页面
            return "redirect:/";
        }

    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("devUser");
        session.invalidate();

        return "redirect:/";
    }
}
