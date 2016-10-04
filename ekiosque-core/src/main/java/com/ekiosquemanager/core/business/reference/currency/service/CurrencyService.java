package com.ekiosquemanager.core.business.reference.currency.service;

import com.ekiosquemanager.core.business.generic.service.EkiosqueManagerEntityService;
import com.ekiosquemanager.core.business.reference.currency.model.Currency;

public interface CurrencyService extends EkiosqueManagerEntityService<Long, Currency> {

	Currency getByCode(String code);

}
