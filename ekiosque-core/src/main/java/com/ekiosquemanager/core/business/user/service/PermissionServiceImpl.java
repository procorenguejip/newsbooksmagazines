package com.ekiosquemanager.core.business.user.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityServiceImpl;
//import com.ekiosquemanager.core.business.merchant.service.MerchantStoreService;
import com.ekiosquemanager.core.business.reference.language.service.LanguageService;
import com.ekiosquemanager.core.business.user.dao.PermissionDao;
import com.ekiosquemanager.core.business.user.model.Group;
import com.ekiosquemanager.core.business.user.model.Permission;
import com.ekiosquemanager.core.business.user.model.PermissionCriteria;
import com.ekiosquemanager.core.business.user.model.PermissionList;

@Service("permissionService")
public class PermissionServiceImpl extends
		EkiosqueManagerEntityServiceImpl<Integer, Permission> implements
		PermissionService {

	PermissionDao permissionDao;

	@Autowired
	private LanguageService languageService;

//	@Autowired
//	private MerchantStoreService merchantService;
	
	@Autowired
	private GroupService groupService;

	@Autowired
	public PermissionServiceImpl(PermissionDao permissionDao) {
		super(permissionDao);
		this.permissionDao = permissionDao;

	}

	public List<Permission> getByName() {
		// TODO Auto-generated method stub
		return null;
	}


	public Permission getById(Integer permissionId) {
		return permissionDao.getById(permissionId);

	}

	public void saveOrUpdate(Permission permission) {
		// TODO Auto-generated method stub

	}

	public void deletePermission(Permission permission) throws ServiceException {
		permission = this.getById(permission.getId());//Prevents detached entity error
		permission.setGroups(null);
		
		this.delete(permission);
	}
	

	public List<Permission> getPermissions(List<Integer> groupIds)
			throws ServiceException {
		@SuppressWarnings({ "unchecked", "rawtypes" })
		Set ids = new HashSet(groupIds);
		return permissionDao.getPermissionsListByGroups(ids);
	}

	public PermissionList listByCriteria(PermissionCriteria criteria)
			throws ServiceException {
		return permissionDao.listByCriteria(criteria);
	}

	public void removePermission(Permission permission,Group group) throws ServiceException {
		permission = this.getById(permission.getId());//Prevents detached entity error
	
		permission.getGroups().remove(group);
		

	}

	public List<Permission> listPermission() throws ServiceException {
		return permissionDao.listPermission();
	}


}
