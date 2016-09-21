package com.scau.bess.entity;

public class RoleEntity {
	
	private int roleId;
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	private String roleName;
	private String roleContent;
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleContent() {
		return roleContent;
	}
	public void setRoleContent(String roleContent) {
		this.roleContent = roleContent;
	}
	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", roleContent=" + roleContent + "]";
	}
	
}
