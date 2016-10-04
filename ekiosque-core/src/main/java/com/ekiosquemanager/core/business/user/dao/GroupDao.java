package com.ekiosquemanager.core.business.user.dao;

import java.util.List;
import java.util.Set;

import com.ekiosquemanager.core.business.generic.dao.EkiosqueManagerEntityDao;
import com.ekiosquemanager.core.business.user.model.Group;
import com.ekiosquemanager.core.business.user.model.GroupType;

public interface GroupDao extends EkiosqueManagerEntityDao<Integer, Group> {

	List<Group> getGroupsListBypermissions(Set<Integer> ids);

	List<Group> listGroup(GroupType groupType);

	List<Group> listGroupByIds(Set<Integer> ids);
}
