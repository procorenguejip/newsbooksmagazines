package com.ekiosquemanager.core.business.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityServiceImpl;
import com.ekiosquemanager.core.business.merchant.model.MerchantStore;
import com.ekiosquemanager.core.business.system.service.EmailService;
import com.ekiosquemanager.core.business.user.dao.UserDao;
import com.ekiosquemanager.core.business.user.model.User;
import com.ekiosquemanager.core.modules.email.Email;


public class UserServiceImpl extends EkiosqueManagerEntityServiceImpl<Long, User>
		implements UserService {


	private UserDao userDao;
	
	@Autowired
	public UserServiceImpl(UserDao userDao) {
		super(userDao);
		this.userDao = userDao;

	}
	
	@Autowired
	private EmailService emailService;
	
	@Override
	public User getByUserName(String userName) throws ServiceException {
		
		return userDao.getByUserName(userName);
		
	}
	
	@Override
	public void delete(User user) throws ServiceException {
		
		User u = this.getById(user.getId());
		super.delete(u);
		
	}

	@Override
	public List<User> listUser() throws ServiceException {
		try {
			return userDao.listUser();
		} catch (Exception e) {
			throw new ServiceException(e);
		}
	}
	
	@Override
	public List<User> listByStore(MerchantStore store) throws ServiceException {
		try {
			return userDao.listUserByStore(store);
		} catch (Exception e) {
			throw new ServiceException(e);
		}
	}

	
	@Override
	public void saveOrUpdate(User user) throws ServiceException {
		
		if(user.getId()==null || user.getId().longValue()==0) {
			userDao.save(user);
		} else {
			userDao.update(user);
		}
		
	}

}
