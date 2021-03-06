package join.us.GoodJob;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import join.us.GoodJob.model.mapper.CompanyMapper;
import join.us.GoodJob.model.mapper.ManagerMapper;
import join.us.GoodJob.model.mapper.MemberMapper;
import join.us.GoodJob.model.mapper.NormalMapper;
import join.us.GoodJob.model.service.PagingBean;
import join.us.GoodJob.model.vo.NormalMemberVO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})
public class YosepUnitTest {

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
		/* PortfolioVO portfolioVO = new PortfolioVO();
		 portfolioVO.setNormalId("miri");
		 portfolioVO.setTitle("포폴제목");
		 portfolioVO.setContent("포폴내용");
		 portfolioVO.setPicturePath("miri.png");
		 List<String> fileList1= new ArrayList<String>();
		 fileList1.add("프로젝트1.pdf");
		 fileList1.add("프로젝트2.pdf");
		 portfolioVO.setFileList(fileList1);		 
		 List<String> acaCatNumList = new ArrayList<String>();
		 acaCatNumList.add("401");
		 acaCatNumList.add("402");
		 portfolioVO.setAcaCatNumList(acaCatNumList);*/
		
		//포트폴리오 등록(PORTFOLIO)
		//normalMapper.insertPortfolio(portfolioVO);
		/*
		Map<String, String> map = new HashMap<String, String>();
		map.put("normalId", portfolioVO.getNormalId());
		*/
		//포트폴리오 파일등록(PORTFOLIO_FILE)
		/*List<String> fileList = portfolioVO.getFileList();
		for(String filePath : fileList) {
			map.put("filePath", filePath );
			normalMapper.insertPortfolioFile(map);
		}*/
		
		//포트폴리오 학력 분류 등록(PORTFOLIO_ACADEMIC)
	/*	for(String academicNum :portfolioVO.getAcaCatNumList()) {
			map.put("academicNum", academicNum);
			normalMapper.insertPortfolioAcademic(map);
		}*/
		/*int totalCount = companyMapper.getAllCompanyListCount();
		System.out.println("totalCount:"+totalCount);
		PagingBean pagingBean = new PagingBean(totalCount,3);
		
		for(MemberVO memberVO : companyMapper.getAllCompanyList(pagingBean)) {
			System.out.println(memberVO);
		}*/
		/*String normalId="hsj";
		//System.out.println(normalMapper.getPortfolioFileList(normalId));
		System.out.println(normalMapper.normalDetailPortfolio(normalId));*/
		String pageNum=null;
		int postCountPerPage=0;
		PagingBean pagingBean;
		int totalPostCount = normalMapper.getAllMemberListCount();
		System.out.println(totalPostCount);
		if (pageNum != null) { // 페이지 번호 주면
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNum));
		} else { // 페이지 번호 안주면 1페이지
			pagingBean = new PagingBean(totalPostCount);
		}
		//System.out.println(normalMapper.getNormalMemberId(pagingBean));
		pagingBean.setPostCountPerPage(postCountPerPage);
		for(NormalMemberVO nm : normalMapper.getNormalMemberId(pagingBean)) {
			System.out.println(nm);
		}
		
		
	}
}
