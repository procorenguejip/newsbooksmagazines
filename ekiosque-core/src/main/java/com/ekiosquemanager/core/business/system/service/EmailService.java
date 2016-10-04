package com.ekiosquemanager.core.business.system.service;

import com.ekiosquemanager.core.business.generic.exception.ServiceException;
import com.ekiosquemanager.core.business.merchant.model.MerchantStore;
import com.ekiosquemanager.core.modules.email.Email;
import com.ekiosquemanager.core.modules.email.EmailConfig;


public interface EmailService {

	public void sendHtmlEmail(MerchantStore store, Email email) throws ServiceException, Exception;
	
	public EmailConfig getEmailConfiguration(MerchantStore store) throws ServiceException;
	
	public void saveEmailConfiguration(EmailConfig emailConfig, MerchantStore store) throws ServiceException;
	
}
