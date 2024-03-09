package github.developmentmachine.ssm.service.test;

import github.developmentmachine.ssm.service.UserService;
import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import github.developmentmachine.ssm.pojo.TbUsers;
import github.developmentmachine.ssm.pojo.UserSearch;
import github.developmentmachine.ssm.service.BaseTest;
import github.developmentmachine.ssm.util.ResultUtil;

public class UserTest extends BaseTest {
	@Autowired
	private UserService userServiceImpl;
	
	@Test
	public void getUserById(){
		TbUsers user=userServiceImpl.selUserByUid(27L);
		if(user!=null){
			System.out.println(user.getAddress());
		}
	}
	
	@Test
	@Rollback(false) //默认true：成功也回滚，false失败回滚，成功提交
	public void insert(){
		TbUsers user=new TbUsers();
		user.setNickname("dxd");
		user.setPassword("123456");
		user.seteMail("test@126.com");
		user.setSex("1");
		user.setBirthday("2018-07-31");
		user.setAddress("西安市高新区");
		user.seteCode("gsgetdsgsgetwrawrfgh");
		user.setCreateTime(new Date());
		try {
			userServiceImpl.insUserService(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void findList(){
		UserSearch search=new UserSearch();
		ResultUtil data = userServiceImpl.selUsers(1, 10, search);
		System.out.println(data.getData());
	}
}
