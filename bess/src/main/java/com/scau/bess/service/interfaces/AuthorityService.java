package com.scau.bess.service.interfaces;

import java.util.List;

import com.scau.bess.dto.Page;
import com.scau.bess.entity.AuthorityEntity;

public interface AuthorityService {

	/**
	 * 添加权限信息
	 * @param authorityEntity
	 * @return
	 */
	public void insertAuthority(AuthorityEntity authorityEntity) throws Exception;
	
	/**
	 * 修改权限信息
	 * @param authorityEntity
	 * @return
	 */
	public void updateAuthority(AuthorityEntity authorityEntity) throws Exception;
	
	/**
	 * 删除权限信息
	 * @param authorityId
	 * @return
	 */
	public void deleteAuthority(int authorityId) throws Exception;
	
	/**
	 * 查看权限信息
	 * @param authorityId
	 * @return
	 */
	public AuthorityEntity viewAuthority(int authorityId) throws Exception;
	
	/**
	 * 查看权限列表
	 * @param authorityName
	 * @return
	 */
	public List<AuthorityEntity> getListLimit(String authorityName) throws Exception;
	
	/**
	 * 返回权限列表
	 * @return
	 */
	public List<AuthorityEntity> getAllList();

	/**
	 * 对权限信息列表分页显示
	 * @param page
	 * @return
	 */
	public Page<AuthorityEntity> listPage(Page<AuthorityEntity> page);

}
