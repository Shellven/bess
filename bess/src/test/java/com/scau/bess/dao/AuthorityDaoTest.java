package com.scau.bess.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.scau.bess.dto.Page;
import com.scau.bess.entity.AuthorityEntity;
import com.scau.bess.service.interfaces.AuthorityService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-context.xml"})
public class AuthorityDaoTest {
	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private AuthorityService authorityService;
	@Test
	public void find() {
		Page<AuthorityEntity> page = new Page<AuthorityEntity>();
		Page<AuthorityEntity> result=	authorityService.listPage(page);
		System.out.println(result);
	}
	
	@Test
	public void aaa() {
		List<AuthorityEntity> authorityEntities = authorityService.getAllList();
		System.out.println(authorityEntities.size());
	}
	
	@Test
	public void bbb() {
		List<AuthorityEntity> authorityEntities = authorityDao.getList();
		System.out.println(authorityEntities);
	}

}
