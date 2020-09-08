package com.text.controller;

import com.text.po.User;
import com.text.service.BalanceService;
import com.text.service.HistoryService;
import com.text.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.logging.Logger;

/**
 * @author 王元圣
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private BalanceService balanceService;
    @Autowired
    private HistoryService historyService;
    static Logger logger = Logger.getLogger(UserController.class.getName());

    @RequestMapping("/login")
    @ResponseBody
    //   @Action(value = "fixedarea_add", results = { @Result(name = "success",type="redirect", location = "./pages/base/fixed_area.html") })
    public String login(String userid, String password, HttpSession httpsession) {
        logger.info(String.valueOf(System.currentTimeMillis()));
        logger.info("info level");
        int userid1 = Integer.parseInt(userid);
        User user = new User();
        user.setUserid(userid1);
        User user1 = userService.selectUser(user);
        if (password.equals(user1.getPassword()) && user1.getIsdelete() == 0) {
            return "succes";
        } else {
            return "faild";
        }
    }

    @RequestMapping("/logout")
    @ResponseBody
    public String logout(String userid) {
        int userid1 = Integer.parseInt(userid);
        User user =new User();
        user.setUserid(userid1);
        userService.updateType(user);
        return "exit";
    }


    @RequestMapping("/succes")
    public String befor(String userid, Model model) {
        logger.info(String.valueOf(System.currentTimeMillis()));
        logger.info("info level");
        int userid1 = Integer.parseInt(userid);
        User user = new User();
        user.setUserid(userid1);
        User user1 = userService.selectUser(user);
        model.addAttribute("userid",user1.getUserid());
        return "main";
    }

    @RequestMapping("/exit")
    public String exit() {
        return "login";
    }
}