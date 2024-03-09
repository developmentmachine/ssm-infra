package github.developmentmachine.ssm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import github.developmentmachine.ssm.mapper.TbLogMapper;
import github.developmentmachine.ssm.pojo.TbLog;
import github.developmentmachine.ssm.pojo.TbLogExample;
import github.developmentmachine.ssm.pojo.UserSearch;
import github.developmentmachine.ssm.pojo.TbLogExample.Criteria;
import github.developmentmachine.ssm.service.LogService;
import github.developmentmachine.ssm.util.MyUtil;
import github.developmentmachine.ssm.util.ResultUtil;

@Service
public class LogServiceImpl implements LogService {
	
	@Autowired
	private TbLogMapper tbLogMapper;

	@Override
	public void insLog(TbLog log) {
		tbLogMapper.insert(log);
	}

	@Override
	public ResultUtil selLogList(Integer page, Integer limit,UserSearch search) {
		PageHelper.startPage(page, limit);
		TbLogExample example=new TbLogExample();
		//设置按创建时间降序排序
		example.setOrderByClause("id DESC");
		Criteria criteria = example.createCriteria();
		
		if(search.getOperation()!=null&&!"".equals(search.getOperation())){
			criteria.andOperationLike("%"+search.getOperation()+"%");
		}
		
		if(search.getCreateTimeStart()!=null&&!"".equals(search.getCreateTimeStart())){
			criteria.andCreateTimeGreaterThanOrEqualTo(MyUtil.getDateByString(search.getCreateTimeStart()));
		}
		if(search.getCreateTimeEnd()!=null&&!"".equals(search.getCreateTimeEnd())){
			criteria.andCreateTimeLessThanOrEqualTo(MyUtil.getDateByString(search.getCreateTimeEnd()));
		}
		
		List<TbLog> logs = tbLogMapper.selectByExample(example);
		PageInfo<TbLog> pageInfo = new PageInfo<TbLog>(logs);
		ResultUtil resultUtil = new ResultUtil();
		resultUtil.setCode(0);
		resultUtil.setCount(pageInfo.getTotal());
		resultUtil.setData(pageInfo.getList());
		return resultUtil;
	}

	@Override
	public int delLogsByDate(Date date) {
		TbLogExample example=new TbLogExample();
		Criteria criteria = example.createCriteria();
		criteria.andCreateTimeLessThanOrEqualTo(date);
		int count = tbLogMapper.deleteByExample(example);
		return count;
	}

}
