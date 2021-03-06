package join.us.GoodJob;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import join.us.GoodJob.model.mapper.CompanyMapper;
import join.us.GoodJob.model.mapper.ManagerMapper;
import join.us.GoodJob.model.mapper.MemberMapper;
import join.us.GoodJob.model.mapper.NormalMapper;
import join.us.GoodJob.model.vo.DevCatVO;
import join.us.GoodJob.model.vo.JobPostingVO;
import join.us.GoodJob.model.vo.NormalMemberVO;
import join.us.GoodJob.model.vo.PortfolioVO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})
public class DonggyuUnitTest {

	@Autowired
	NormalMapper normalMapper;
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	ManagerMapper managerMapper;	
	@Autowired
	CompanyMapper companyMapper;
	@Test
	public void test() {
		String normalId="yosep";
		System.out.println(normalMapper.selectNormalMember(normalId));
		System.out.println(normalMapper.normalDetailPortfolio(normalId));
		System.out.println(memberMapper.getDevCatVOListByNormalId(normalId));
	}
}
