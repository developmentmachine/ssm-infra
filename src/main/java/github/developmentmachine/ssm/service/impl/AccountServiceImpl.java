package github.developmentmachine.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import github.developmentmachine.ssm.mapper.TbUsersMapper;
import github.developmentmachine.ssm.pojo.TbUsers;
import github.developmentmachine.ssm.pojo.TbUsersExample;
import github.developmentmachine.ssm.pojo.TbUsersExample.Criteria;
import github.developmentmachine.ssm.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private TbUsersMapper tbUsersMapper;

	@Override
	public TbUsers selUserByCodeAndStatus(String eCode,String status) {
		TbUsersExample example=new TbUsersExample();
		Criteria criteria = example.createCriteria();
		criteria.andECodeEqualTo(eCode);
		criteria.andStatusEqualTo(status);
		List<TbUsers> users = tbUsersMapper.selectByExample(example);
		if(users!=null&&users.size()>0){
			return users.get(0);
		}
		return null;
	}

	@Override
	public void updUserStatus(TbUsers user) {
		tbUsersMapper.updateByPrimaryKey(user);
	}

}
