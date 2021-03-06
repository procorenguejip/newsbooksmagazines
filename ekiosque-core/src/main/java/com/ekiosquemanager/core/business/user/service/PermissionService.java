package com.ekiosquemanager.core.business.user.service;

import java.util.List;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityService;
import com.ekiosquemanager.core.business.user.model.Group;
import com.ekiosquemanager.core.business.user.model.Permission;
import com.ekiosquemanager.core.business.user.model.PermissionCriteria;
import com.ekiosquemanager.core.business.user.model.PermissionList;

public interface PermissionService extends EkiosqueManagerEntityService<Integer, Permission> {

	List<Permission> getByName();

	List<Permission> listPermission()  throws ServiceException;

	Permission getById(Integer permissionId);

	void saveOrUpdate(Permission permission);

//	void deletePermission(Permission permission) throws ServiceException;

	List<Permission> getPermissions(List<Integer> groupIds) throws ServiceException;

	void deletePermission(Permission permission) throws ServiceException;

	PermissionList listByCriteria(PermissionCriteria criteria) throws ServiceException ;

	void removePermission(Permission permission, Group group) throws ServiceException;

}
