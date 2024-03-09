package github.developmentmachine.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import github.developmentmachine.ssm.mapper.MainMapper;
import github.developmentmachine.ssm.mapper.TbUsersMapper;
import github.developmentmachine.ssm.pojo.TbUsers;
import github.developmentmachine.ssm.pojo.TbUsersExample;
import github.developmentmachine.ssm.pojo.TbUsersExample.Criteria;
import github.developmentmachine.ssm.service.MainService;
@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private TbUsersMapper tbUsersMapper;
	
	@Autowired
	private MainMapper mainMapper;

	@Override
	public List<TbUsers> selUserList() {
		TbUsersExample example=new TbUsersExample();
		return tbUsersMapper.selectByExample(example);
	}
	
	@Override
	public List<TbUsers> selUsersToday() {
		return mainMapper.selUsersToday();
	}

	@Override
	public List<TbUsers> selUsersYestoday() {
		return mainMapper.selUsersYesterday();
	}


	@Override
	public List<TbUsers> selUsersYearWeek() {
		// TODO Auto-generated method stub
		return mainMapper.selUsersYearWeek();
	}
	
	@Override
	public List<TbUsers> selUsersMonth() {
		// TODO Auto-generated method stub
		return mainMapper.selUsersMonth();
	}

	@Override
	public int seUserCountBygender(int i) {
		// TODO Auto-generated method stub
		TbUsersExample example=new TbUsersExample();
		Criteria criteria = example.createCriteria();
		criteria.andSexEqualTo(i+"");
		List<TbUsers> list = tbUsersMapper.selectByExample(example);
		return list.size();
	}

}
