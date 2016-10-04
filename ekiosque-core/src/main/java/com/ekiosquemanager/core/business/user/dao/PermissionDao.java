package com.ekiosquemanager.core.business.user.dao;

import java.util.List;
import java.util.Set;

import com.ekiosquemanager.core.business.generic.dao.EkiosqueManagerEntityDao;
import com.ekiosquemanager.core.business.user.model.Permission;
import com.ekiosquemanager.core.business.user.model.PermissionCriteria;
import com.ekiosquemanager.core.business.user.model.PermissionList;

public interface PermissionDao extends EkiosqueManagerEntityDao<Integer, Permission> {

	List<Permission> listPermission();

	Permission getById(Integer permissionId);

	List<Permission> getPermissionsListByGroups(Set permissionIds);

	PermissionList listByCriteria(PermissionCriteria criteria);



}
