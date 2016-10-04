package com.ekiosquemanager.core.business.reference.init.service;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;

public interface InitializationDatabase {
	
	boolean isEmpty();
	
	void populate(String name) throws ServiceException;

}
