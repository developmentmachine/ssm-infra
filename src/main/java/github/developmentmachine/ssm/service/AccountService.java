package github.developmentmachine.ssm.service;

import github.developmentmachine.ssm.pojo.TbUsers;

public interface AccountService {
	
	//根据eCode和status查询用户
	public TbUsers selUserByCodeAndStatus(String eCode,String status);

	//更新用户状态
	public void updUserStatus(TbUsers user);
}
