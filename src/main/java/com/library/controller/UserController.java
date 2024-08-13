package com.library.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.pojo.User;
import com.library.service.UserService;
@Controller									//设置当前类为控制器类
public class UserController {
	@Autowired
	private UserService userService;				//自动装配userService对象
	/**********用户登录****************/
	@RequestMapping("/loginCheck")			//设置控制器方法的映射路径
	public String loginCheck(User user, HttpServletRequest request){
		//根据输入的用户信息查询用户记录
		User user1 = userService.queryUser(user);
		//如果查询的用户记录不为空
		if (user1!=null) {
			//将用户记录保存到Session
			request.getSession().setAttribute("USER_SESSION", user1);
			return "redirect:/main";				//重定向跳转到主页面
		}
		else {
			//设置错误提示信息
			request.setAttribute("msg","账号、密码或身份信息错误");
			return "login";						//跳转到登录页面
		}
	}
	@RequestMapping("/logout")
	public String logout( HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();						//设置Session失效
		return "redirect:/login";						//重定向跳转到登录页面
	}
	/**********用户管理****************/
	@RequestMapping("/user/query")		//设置控制器方法的映射路径
	public String queryUser(User user, HttpServletRequest request) {
		User user1= (User)request.getSession().getAttribute("USER_SESSION");
		if (user1.getIdentity().equalsIgnoreCase("学生") 
				|| user1.getIdentity().equalsIgnoreCase("教师")) {
			user = user1;
		}
		List<User> users = userService.queryAllUser(user);
		request.setAttribute("users", users);
		return "manageUser";
	}
	@ResponseBody
	@RequestMapping("/user/queryUserByNum")		//设置控制器方法的映射路径
	public User queryUserByNum(String number) {
		return userService.queryUserByNum(number);
	}
	@ResponseBody
	@RequestMapping("/user/add")		//设置控制器方法的映射路径
	public Boolean addUser(User user) {
		return userService.addUser(user);
	}
	@ResponseBody
	@RequestMapping("user/update")		//设置控制器方法的映射路径
	public Boolean updateUser(User user) {
		return userService.updateUser(user);
	}
	@ResponseBody
	@RequestMapping("user/delete")		//设置控制器方法的映射路径
	public Boolean deleteUser(String number) {
		return userService.deleteUser(number);
	}
}
