package com.ekiosquemanager.core.business.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mysema.query.jpa.JPQLQuery;
import com.mysema.query.jpa.impl.JPAQuery;
import com.ekiosquemanager.core.business.generic.dao.EkiosqueManagerEntityDaoImpl;
import com.ekiosquemanager.core.business.merchant.model.MerchantStore;
import com.ekiosquemanager.core.business.user.model.QGroup;
import com.ekiosquemanager.core.business.user.model.QUser;
import com.ekiosquemanager.core.business.user.model.User;

@Repository("userDao")
public class UserDaoImpl extends EkiosqueManagerEntityDaoImpl<Long, User> implements
		UserDao {
	
	@Override
	public User getByUserName(String userName) {
		
		
		QUser qUser = QUser.user;
		QGroup qGroup = QGroup.group;
		
		JPQLQuery query = new JPAQuery (getEntityManager());
		
		query.from(qUser)
			.innerJoin(qUser.groups, qGroup).fetch()
			.innerJoin(qUser.merchantStore).fetch()
			.leftJoin(qUser.defaultLanguage).fetch()
			.where(qUser.adminName.eq(userName));
		
		

		User user = query.uniqueResult(qUser);
		return user;
	}
	
	@Override
	public User getById(Long id) {
		
		
		QUser qUser = QUser.user;
		QGroup qGroup = QGroup.group;
		
		JPQLQuery query = new JPAQuery (getEntityManager());
		
		query.from(qUser)
			.innerJoin(qUser.groups, qGroup).fetch()
			.innerJoin(qUser.merchantStore).fetch()
			.leftJoin(qUser.defaultLanguage).fetch()
			.where(qUser.id.eq(id));
		
		

		User user = query.uniqueResult(qUser);
		return user;
	}

	@Override
	public List<User> listUser() {
		QUser qUser = QUser.user;
		JPQLQuery query = new JPAQuery (getEntityManager());
		
		query.from(qUser)
			.innerJoin(qUser.groups).fetch()
			.innerJoin(qUser.merchantStore).fetch()
			.leftJoin(qUser.defaultLanguage).fetch()
			.orderBy(qUser.id.asc());
		
		return query.distinct().list(qUser);
				//listDistinct(qUser);
	}
	
	@Override
	public List<User> listUserByStore(MerchantStore store) {
		QUser qUser = QUser.user;
		JPQLQuery query = new JPAQuery (getEntityManager());
		
		query.from(qUser)
			.innerJoin(qUser.groups).fetch()
			.innerJoin(qUser.merchantStore).fetch()
			.leftJoin(qUser.defaultLanguage).fetch()
			.orderBy(qUser.id.asc())
			.where(qUser.merchantStore.id.eq(store.getId()));
		
		return query.distinct().list(qUser);
				//listDistinct(qUser);
	}

}
