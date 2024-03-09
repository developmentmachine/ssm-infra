package github.developmentmachine.ssm.mapper;

import github.developmentmachine.ssm.pojo.TbRolesMenus;
import github.developmentmachine.ssm.pojo.TbRolesMenusExample;
import github.developmentmachine.ssm.pojo.TbRolesMenusKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbRolesMenusMapper {
    int countByExample(TbRolesMenusExample example);

    int deleteByExample(TbRolesMenusExample example);

    int deleteByPrimaryKey(TbRolesMenusKey key);

    int insert(TbRolesMenus record);

    int insertSelective(TbRolesMenusKey record);

    List<TbRolesMenusKey> selectByExample(TbRolesMenusExample example);

    int updateByExampleSelective(@Param("record") TbRolesMenusKey record, @Param("example") TbRolesMenusExample example);

    int updateByExample(@Param("record") TbRolesMenusKey record, @Param("example") TbRolesMenusExample example);
    
}