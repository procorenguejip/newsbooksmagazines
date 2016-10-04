package com.ekiosquemanager.core.business.user.service;

import java.util.List;
import java.util.Set;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityService;
import com.ekiosquemanager.core.business.user.model.Group;
import com.ekiosquemanager.core.business.user.model.GroupType;

public interface GroupService extends EkiosqueManagerEntityService<Integer, Group> {


	List<Group> listGroup(GroupType groupType) throws ServiceException;
	List<Group> listGroupByIds(Set<Integer> ids) throws ServiceException;

}
