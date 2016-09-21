package com.scau.bess.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scau.bess.dao.AuthorityDao;
import com.scau.bess.dto.Page;
import com.scau.bess.entity.AuthorityEntity;
import com.scau.bess.service.interfaces.AuthorityService;

@Service
public class AuthorityImpl implements AuthorityService {

	@Autowired
	private AuthorityDao authorityDao;
	
	@Override
	public void insertAuthority(AuthorityEntity authorityEntity) throws Exception {
				
				//¥¶¿Ì
				int result = authorityDao.insert(authorityEntity);
				
				if (result != 1) {
					
					throw new RuntimeException("ÃÌº” ß∞‹");
				}
	}

	@Override
	public void updateAuthority(AuthorityEntity authorityEntity) throws Exception {
		
		//¥¶¿Ì
		int result = authorityDao.update(authorityEntity);
		if(result != 1) {
			throw new RuntimeException("–ﬁ∏ƒ ß∞‹");
		}
	}

	@Override
	public void deleteAuthority(int authorityId) {
		
		int result = authorityDao.del(authorityId);

		if (result != 1) {
			throw new RuntimeException("…æ≥˝ ß∞‹");
		}
	}

	@Override
	public AuthorityEntity viewAuthority(int authorityId) {
		return null;
	}

	@Override
	public List<AuthorityEntity> getListLimit(String authorityName) {
		
		return authorityDao.searchListLimit(authorityName);
	}

	@Override
	public List<AuthorityEntity> getAllList() {
		List<AuthorityEntity> authorityEntities = authorityDao.getList();
		return authorityEntities;
	}
	
	@Override
	public Page<AuthorityEntity> listPage(Page<AuthorityEntity> page) {
		
		page.setTarget(authorityDao.listByPage(page));
	
		return page;
	
	}

}
