package com.scau.bess.dao;

import java.util.List;

import com.scau.bess.dto.Page;
import com.scau.bess.entity.AuthorityEntity;

public interface AuthorityDao {

	/**
	 * ���Ȩ��
	 * @param authorityEntity
	 * @return
	 */
	int insert(AuthorityEntity authorityEntity);
	
	/**
	 * �޸�Ȩ��
	 * @param authorityEntity
	 * @return
	 */
	int update(AuthorityEntity authorityEntity);
	
	/**
	 * ɾ��Ȩ��
	 * @param authorityId
	 * @return
	 */
	int del(int authorityId);
	
	/**
	 * �鿴Ȩ��
	 * @param authorityId
	 * @return
	 */
	AuthorityEntity view(int authorityId);
	
	/**
	 * �������鿴Ȩ���б�
	 * @param authorityName
	 * @return
	 */
	List<AuthorityEntity> searchListLimit(String authorityName);
	
	/**
	 * Ȩ���б�
	 * @return
	 */
	List<AuthorityEntity> getList();
	
	/**
	 * ��ҳ
	 * @param page
	 * @return
	 */
	List<AuthorityEntity> listByPage(Page<AuthorityEntity> page);
}
