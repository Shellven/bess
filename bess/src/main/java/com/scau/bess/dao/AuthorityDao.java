package com.scau.bess.dao;

import java.util.List;

import com.scau.bess.dto.Page;
import com.scau.bess.entity.AuthorityEntity;

public interface AuthorityDao {

	/**
	 * 添加权限
	 * @param authorityEntity
	 * @return
	 */
	int insert(AuthorityEntity authorityEntity);
	
	/**
	 * 修改权限
	 * @param authorityEntity
	 * @return
	 */
	int update(AuthorityEntity authorityEntity);
	
	/**
	 * 删除权限
	 * @param authorityId
	 * @return
	 */
	int del(int authorityId);
	
	/**
	 * 查看权限
	 * @param authorityId
	 * @return
	 */
	AuthorityEntity view(int authorityId);
	
	/**
	 * 搜索、查看权限列表
	 * @param authorityName
	 * @return
	 */
	List<AuthorityEntity> searchListLimit(String authorityName);
	
	/**
	 * 权限列表
	 * @return
	 */
	List<AuthorityEntity> getList();
	
	/**
	 * 分页
	 * @param page
	 * @return
	 */
	List<AuthorityEntity> listByPage(Page<AuthorityEntity> page);
}
