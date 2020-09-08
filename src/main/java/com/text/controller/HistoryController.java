package com.text.controller;

import com.text.po.History;
import com.text.po.User;
import com.text.service.HistoryService;
import com.text.service.UserService;
import net.sf.json.JSON;
import net.sf.json.JsonConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.logging.Logger;

@Controller
public class HistoryController {
    static Logger logger = Logger.getLogger(HistoryController.class.getName());
    @Autowired
    private HistoryService historyService;
    @Autowired
    private UserService userService;

/*    @RequestMapping("/History")
    @ResponseBody
    public String history(String userid) {
        logger.info(String.valueOf(System.currentTimeMillis()));
        logger.info("info level");
        int userid1 = Integer.parseInt(userid);
        User user = new User();
        user.setUserid(userid1);
      return Json(historyService.selectHistory(user),JsonRequestBehavior.AllowGet);
    }*/
}
