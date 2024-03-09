package github.developmentmachine.ssm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import github.developmentmachine.ssm.mapper.TbUsersMapper;
import github.developmentmachine.ssm.pojo.TbUsers;
import github.developmentmachine.ssm.pojo.TbUsersExample;
import github.developmentmachine.ssm.pojo.UserSearch;
import github.developmentmachine.ssm.pojo.TbUsersExample.Criteria;
import github.developmentmachine.ssm.service.UserService;
import github.developmentmachine.ssm.util.EmailUtil;
import github.developmentmachine.ssm.util.GlobalUtil;
import github.developmentmachine.ssm.util.MyUtil;
import github.developmentmachine.ssm.util.ResultUtil;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private TbUsersMapper tbUsersMapper;
	
	@Override
	public TbUsers selUserByEmail(String eMail,Long uid) {
		TbUsersExample example=new TbUsersExample();
		Criteria criteria = example.createCriteria();
		criteria.andEMailEqualTo(eMail);
		if(uid!=null&&!"".equals(uid)){
			criteria.andUidNotEqualTo(uid);
		}
		List<TbUsers> users = tbUsersMapper.selectByExample(example);
		if(users!=null&&users.size()>0){
			return users.get(0);
		}
		return null;
	}

	@Override
	public TbUsers selUserByNickname(String nickname,Long uid) {
		TbUsersExample example=new TbUsersExample();
		Criteria criteria = example.createCriteria();
		criteria.andNicknameEqualTo(nickname);
		if(uid!=null&&!"".equals(uid)){
			criteria.andUidNotEqualTo(uid);
		}
		List<TbUsers> users = tbUsersMapper.selectByExample(example);
		if(users!=null&&users.size()>0){
			return users.get(0);
		}
		return null;
	}

	@Override
	public void insUserService(TbUsers user) throws Exception {
		user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
		String code=MyUtil.getStrUUID();
		user.seteCode(code);
		Date date=new Date();
		user.setCreateTime(date);
		if(Boolean.parseBoolean(GlobalUtil.getValue("send.email"))){
			user.setStatus(0+"");//0:未激活，1，正常，2，禁用
			EmailUtil.sendMail(user.geteMail(),code);
		}else{
			user.setStatus(1+"");//0:未激活，1，正常，2，禁用
		}
		tbUsersMapper.insert(user);
	}

	@Override
	public ResultUtil selUsers(Integer page, Integer limit,UserSearch search) {
		PageHelper.startPage(page, limit);
		TbUsersExample example=new TbUsersExample();
		//设置按创建时间降序排序
		example.setOrderByClause("create_time DESC");
		Criteria criteria = example.createCriteria();
		
		if(search.getNickname()!=null&&!"".equals(search.getNickname())){
			//注意：模糊查询需要进行拼接”%“  如下，不进行拼接是不能完成查询的哦。
			criteria.andNicknameLike("%"+search.getNickname()+"%");
		}
		if(search.getSex()!=null&&!"-1".equals(search.getSex())){
			criteria.andSexEqualTo(search.getSex());
		}
		if(search.getStatus()!=null&&!"-1".equals(search.getStatus())){
			criteria.andStatusEqualTo(search.getStatus());
		}
		if(search.getCreateTimeStart()!=null&&!"".equals(search.getCreateTimeStart())){
			criteria.andCreateTimeGreaterThanOrEqualTo(MyUtil.getDateByString(search.getCreateTimeStart()));
		}
		if(search.getCreateTimeEnd()!=null&&!"".equals(search.getCreateTimeEnd())){
			criteria.andCreateTimeLessThanOrEqualTo(MyUtil.getDateByString(search.getCreateTimeEnd()));
		}
		
		List<TbUsers> users = tbUsersMapper.selectByExample(example);
		PageInfo<TbUsers> pageInfo = new PageInfo<TbUsers>(users);
		ResultUtil resultUtil = new ResultUtil();
		resultUtil.setCode(0);
		resultUtil.setCount(pageInfo.getTotal());
		resultUtil.setData(pageInfo.getList());
		return resultUtil;
	}

	@Override
	public void delUsersService(String userStr) {
		String[] users = userStr.split(",");
		if(users!=null&&users.length>0){
			for (String uid : users) {
				tbUsersMapper.deleteByPrimaryKey(Long.parseLong(uid));
			}
		}
	}

	@Override
	public void delUserByUid(String uid) {
		tbUsersMapper.deleteByPrimaryKey(Long.parseLong(uid));
	}

	@Override
	public TbUsers selUserByUid(Long uid) {
		return tbUsersMapper.selectByPrimaryKey(uid);
	}

	@Override
	public void updUserService(TbUsers user) {
		TbUsers u = tbUsersMapper.selectByPrimaryKey(user.getUid());
		user.setPassword(u.getPassword());
		user.seteCode(u.geteCode());
		user.setCreateTime(u.getCreateTime());
		tbUsersMapper.updateByPrimaryKey(user);
	}

}
