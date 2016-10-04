package com.ekiosquemanager.web.admin.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ekiosquemanager.core.business.user.model.Group;
import com.ekiosquemanager.core.business.user.model.GroupType;
import com.ekiosquemanager.core.business.user.service.GroupService;
import com.ekiosquemanager.web.admin.entity.web.Menu;

@Controller
public class SecurityController {
	
	@Autowired
	GroupService groupService;

	@RequestMapping(value="/admin/user/permissions.html", method=RequestMethod.GET)
	public String displayPermissions(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		setMenu(model,request);
		return "admin-user-permissions";
		
		
	}
	
	
	@RequestMapping(value="/admin/user/groups.html", method=RequestMethod.GET)
	public String displayGroups(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		setMenu(model,request);
		List<Group> groups = groupService.listGroup(GroupType.ADMIN);
		
		model.addAttribute("groups", groups);
		
		JSONArray ja = new JSONArray();
		for(Group group : groups) {
			Map entry = new HashMap();
			entry.put("groupId", group.getId());
			entry.put("groupName", group.getGroupName());
			entry.put("groupType", group.getGroupType());
			entry.put("groupName2", group.getGroupName());
			entry.put("groupType2", group.getGroupType());
			ja.add(entry);
		}
		
		model.addAttribute("groupsJSON", ja.toJSONString(groups));
		
		return "admin-user-groups";
		
		
	}
	
	private void setMenu(Model model, HttpServletRequest request) throws Exception {
		
		//display menu
		Map<String,String> activeMenus = new HashMap<String,String>();
		activeMenus.put("profile", "profile");
		activeMenus.put("security", "security");
		
		@SuppressWarnings("unchecked")
		Map<String, Menu> menus = (Map<String, Menu>)request.getAttribute("MENUMAP");
		
		Menu currentMenu = (Menu)menus.get("profile");
		model.addAttribute("currentMenu",currentMenu);
		model.addAttribute("activeMenus",activeMenus);
		//
		
	}

}
