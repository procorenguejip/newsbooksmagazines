package com.ekiosquemanager.core.business.user.service;

import java.util.List;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityService;
import com.ekiosquemanager.core.business.merchant.model.MerchantStore;
import com.ekiosquemanager.core.business.user.model.User;

public interface UserService extends EkiosqueManagerEntityService<Long, User> {

	User getByUserName(String userName) throws ServiceException;

	List<User> listUser() throws ServiceException;
	
	/**
	 * Create or update a User
	 * @param user
	 * @throws ServiceException
	 */
	void saveOrUpdate(User user) throws ServiceException;

	List<User> listByStore(MerchantStore store) throws ServiceException;



}
