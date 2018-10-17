package join.us.GoodJob.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import join.us.GoodJob.model.mapper.NormalMapper;
import join.us.GoodJob.model.vo.NormalMemberVO;
import join.us.GoodJob.model.vo.PortfolioVO;

@Service
public class NormalServiceImpl implements NormalService {
	@Resource
	NormalMapper normalMapper;

	@Override
	public void registerNormalMember(NormalMemberVO normalMemberVO) {
		normalMapper.registerMember(normalMemberVO);
		normalMapper.registerNormalMember(normalMemberVO);
	}
	
	@Override
	public void updateNormalMember(NormalMemberVO normalMemberVO) {
		normalMapper.updateNormalMember(normalMemberVO);
		normalMapper.updateMember(normalMemberVO);
	}
	
	@Override
	public NormalMemberVO selectNormalMember(String id) {
		return normalMapper.selectNormalMember(id);
	}
	
	@Override
	public int checkNormalMemberId(String id) {
		return normalMapper.checkNormalMemberId(id);
	}

	@Override
	public void deleteNormalMember(String normalId) {
		normalMapper.deleteNormalMember(normalId);
	}

	@Override
	public NormalMemberVO myPageNormalMember(String memberId) {
		return normalMapper.myPageNormalMember(memberId);
	}

	@Override
	public PortfolioVO normalDetailPortfolio(String normalId) {
		return normalMapper.normalDetailPortfolio(normalId);
	}

}
