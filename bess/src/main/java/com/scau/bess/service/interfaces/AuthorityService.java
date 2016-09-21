package com.scau.bess.service.interfaces;

import java.util.List;

import com.scau.bess.dto.Page;
import com.scau.bess.entity.AuthorityEntity;

public interface AuthorityService {

	/**
	 * ���Ȩ����Ϣ
	 * @param authorityEntity
	 * @return
	 */
	public void insertAuthority(AuthorityEntity authorityEntity) throws Exception;
	
	/**
	 * �޸�Ȩ����Ϣ
	 * @param authorityEntity
	 * @return
	 */
	public void updateAuthority(AuthorityEntity authorityEntity) throws Exception;
	
	/**
	 * ɾ��Ȩ����Ϣ
	 * @param authorityId
	 * @return
	 */
	public void deleteAuthority(int authorityId) throws Exception;
	
	/**
	 * �鿴Ȩ����Ϣ
	 * @param authorityId
	 * @return
	 */
	public AuthorityEntity viewAuthority(int authorityId) throws Exception;
	
	/**
	 * �鿴Ȩ���б�
	 * @param authorityName
	 * @return
	 */
	public List<AuthorityEntity> getListLimit(String authorityName) throws Exception;
	
	/**
	 * ����Ȩ���б�
	 * @return
	 */
	public List<AuthorityEntity> getAllList();

	/**
	 * ��Ȩ����Ϣ�б��ҳ��ʾ
	 * @param page
	 * @return
	 */
	public Page<AuthorityEntity> listPage(Page<AuthorityEntity> page);

}
