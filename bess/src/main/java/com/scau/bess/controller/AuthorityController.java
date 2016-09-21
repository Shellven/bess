package com.scau.bess.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scau.bess.dto.Page;
import com.scau.bess.entity.AuthorityEntity;
import com.scau.bess.service.interfaces.AuthorityService;

@Controller
@RequestMapping("/Authority")
public class AuthorityController {

	@Autowired
	private AuthorityService authorityService;
	
	//����Ȩ�޹���ҳ��
	@RequestMapping("/manage")
	public String getManage() {
		 
		return "authority_manage";
	}
	
	/**
	 * ���Ȩ����Ϣ
	 * @param authorityEntity
	 * @param model
	 * @return
	 */
	@RequestMapping("/insert")
	public @ResponseBody String insertAuthority(AuthorityEntity authorityEntity,Model model){
		
		try {
			authorityService.insertAuthority(authorityEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("authorityEntity",authorityEntity);
		
		return "success";
	}
	
	/**
	 * �޸�Ȩ����Ϣ
	 * @param authorityEntity
	 * @param model
	 * @return
	 */
	public @ResponseBody String updateAuthority(AuthorityEntity authorityEntity,Model model) {
		
		try {
			authorityService.updateAuthority(authorityEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 model.addAttribute("authorityEntity",authorityEntity);
		 
		 return "success";
	}
	
	/**
	 * ɾ��Ȩ����Ϣ
	 * @param authorityId
	 * @param model
	 * @return
	 */
	@RequestMapping("/del")
	public @ResponseBody String deleteAuthority(int authorityId,Model model) {
		
		try {
			authorityService.deleteAuthority(authorityId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	/**
	 * �鿴Ȩ����Ϣ
	 * @param authorityId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/view")
	public @ResponseBody AuthorityEntity viewAuthority(int authorityId,Model model) throws Exception {

		AuthorityEntity authorityEntity = authorityService.viewAuthority(authorityId);
		
		model.addAttribute("authorityEntity",authorityEntity);
		
		//���Ҳ�����ID��Ϊ�˱�֤�ص������з���ֵ����result���óɡ�error��,������һ������ֵΪ��ʵ��
		if(authorityEntity == null ) {
			authorityEntity = new AuthorityEntity();
			authorityEntity.setResult("error");
		}
		return authorityEntity;
	}
	
	/**
	 * ����Ȩ�޹������ʱ���г����е�Ȩ����Ϣ
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public @ResponseBody List<AuthorityEntity> getList() throws Exception {
		
		List<AuthorityEntity> authorityEntityList = authorityService.getAllList();
		
		System.out.println(authorityEntityList);
		
		return authorityEntityList;
	}
	
	@RequestMapping("/page")
	public @ResponseBody Page<AuthorityEntity> listPage(int start,int current) {
		
		Page<AuthorityEntity> page = new Page<AuthorityEntity>();
		
	/*	page.setCurrent(current);
		
		page.setStart(start);*/
		Page<AuthorityEntity> result=	authorityService.listPage(page);
		System.out.println(result.getTarget());
		return result ;
		
	}
	
	@RequestMapping("/search")
	public @ResponseBody List<AuthorityEntity> getListLimit(String authorityName,Model model) throws Exception {
		
		List<AuthorityEntity> authorityEntityList = authorityService.getListLimit(authorityName);
		
		model.addAttribute("authorityEntityList", authorityEntityList);
		
		return authorityEntityList;
	}
}