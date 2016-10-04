package com.ekiosquemanager.core.business.user.dao;

import java.util.List;

import com.ekiosquemanager.core.business.generic.dao.EkiosqueManagerEntityDao;
import com.ekiosquemanager.core.business.merchant.model.MerchantStore;
import com.ekiosquemanager.core.business.user.model.User;

public interface UserDao extends EkiosqueManagerEntityDao<Long, User> {

	User getByUserName(String userName);

	List<User> listUser();

	List<User> listUserByStore(MerchantStore store);



}
