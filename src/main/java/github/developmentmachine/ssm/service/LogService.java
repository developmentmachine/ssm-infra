package github.developmentmachine.ssm.service;
import java.util.Date;

import github.developmentmachine.ssm.pojo.TbLog;
import github.developmentmachine.ssm.pojo.UserSearch;
import github.developmentmachine.ssm.util.ResultUtil;

public interface LogService {
	//添加日志
	public void insLog(TbLog log);
	
	//获取日志列表
	ResultUtil selLogList(Integer page, Integer limit,UserSearch search);

	//删除指定日期以前的日志
	public int delLogsByDate(Date date);
}
