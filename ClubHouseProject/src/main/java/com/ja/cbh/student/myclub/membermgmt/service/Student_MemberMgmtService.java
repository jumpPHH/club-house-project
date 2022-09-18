package com.ja.cbh.student.myclub.membermgmt.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclub.membermgmt.mapper.Student_MemberMgmtSQLMapper;
import com.ja.cbh.vo.Club_ApplicantMemberInfoVO;
import com.ja.cbh.vo.Club_MemberInfoDyVO;
import com.ja.cbh.vo.Club_StudVO;

@Service
public class Student_MemberMgmtService {
	
	@Autowired
	private Student_MemberMgmtSQLMapper memberMgmtSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getActiveMemberData(String stud_id, String searchType , String searchWord ,int pageNum){
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		
		//동아리 대표가 있으면 1, 아니면 0
		int bossMemberCount = memberMgmtSQLMapper.selectBossMemberCount(stud_id);
		
		ArrayList<Club_MemberInfoDyVO> memberInfoDyVO;
		//동아리 대표가 맞으면 아래의 로직 실행.
		if(bossMemberCount > 0) {
			
			Club_StudVO club_BossStudInfo = memberMgmtSQLMapper.selectBossMemberIs(stud_id);
			//동아리 대표가 속해있는 'CLUB_NO' 추출
			int club_no = club_BossStudInfo.getClub_no();
			
			memberInfoDyVO = memberMgmtSQLMapper.selectDyClubMemberInfo(club_no,searchType,searchWord,pageNum);
			
			for (Club_MemberInfoDyVO club_MemberInfoDyVO : memberInfoDyVO) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				map.put("MemberInfoDyVO", club_MemberInfoDyVO);
				dataList.add(map);
			}
		}
		return dataList;
	}
	
	
	public int getActiveMemberCount(String stud_id) {
		//동아리 대표가 있으면 1, 아니면 0
		int bossMemberCount = memberMgmtSQLMapper.selectBossMemberCount(stud_id);
		int totalActiveMemberdCount = 0;
		//동아리 대표가 맞으면 아래의 로직 실행.
		if(bossMemberCount > 0) {
			Club_StudVO club_BossStudInfo = memberMgmtSQLMapper.selectBossMemberIs(stud_id);
			//동아리 대표가 속해있는 'CLUB_NO' 추출
			int club_no = club_BossStudInfo.getClub_no();
			totalActiveMemberdCount = memberMgmtSQLMapper.selectTotalActiveMemberdCount(club_no);
		}
		return totalActiveMemberdCount;
	}
	
	public int getActiveMemberSelectCount(String stud_id,String searchType , String searchWord) {
		//동아리 대표가 있으면 1, 아니면 0
		int bossMemberCount = memberMgmtSQLMapper.selectBossMemberCount(stud_id);
		int activeMemberSelectCount = 0;
		//동아리 대표가 맞으면 아래의 로직 실행.
		if(bossMemberCount > 0) {
			Club_StudVO club_BossStudInfo = memberMgmtSQLMapper.selectBossMemberIs(stud_id);
			//동아리 대표가 속해있는 'CLUB_NO' 추출
			int club_no = club_BossStudInfo.getClub_no();
			
			activeMemberSelectCount = memberMgmtSQLMapper.selectActiveMemberSelectCount(club_no,searchType,searchWord);
		}
		return activeMemberSelectCount;
	}
	
	public ArrayList<HashMap<String, Object>> getApplicantMemberData(String stud_id, int pageNum){
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		
		Club_StudVO club_BossStudInfo = memberMgmtSQLMapper.selectBossMemberIs(stud_id);
		//동아리 대표가 속해있는 'CLUB_NO' 추출
		int club_no = club_BossStudInfo.getClub_no();

		ArrayList<Club_ApplicantMemberInfoVO> memberInfoDyVO = memberMgmtSQLMapper.selectApplicantMemberInfo(club_no,pageNum);
		
		for (Club_ApplicantMemberInfoVO club_ApplicantMemberInfoVO : memberInfoDyVO) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("ApplicantMemberInfoVO", club_ApplicantMemberInfoVO);
			dataList.add(map);
		}

		return dataList;
	}
	
	public int getApplicantMemberCount(String stud_id) {
		Club_StudVO club_BossStudInfo = memberMgmtSQLMapper.selectBossMemberIs(stud_id);
		//동아리 대표가 속해있는 'CLUB_NO' 추출
		int club_no = club_BossStudInfo.getClub_no();
		return memberMgmtSQLMapper.selectApplicantMemberCount(club_no);
	}
	
}
