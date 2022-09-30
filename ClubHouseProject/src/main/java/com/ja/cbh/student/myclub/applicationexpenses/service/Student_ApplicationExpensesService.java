package com.ja.cbh.student.myclub.applicationexpenses.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclub.applicationexpenses.mapper.Student_ApplicationExpensesSQLMapper;
import com.ja.cbh.student.myclub.main.mapper.Student_MainSQLMapper;
import com.ja.cbh.student.myclub.membermgmt.mapper.Student_MemberMgmtSQLMapper;
import com.ja.cbh.vo.Club_ExpnsApplyVO;
import com.ja.cbh.vo.Club_StudVO;

@Service
public class Student_ApplicationExpensesService {

	 @Autowired
	 private Student_MainSQLMapper mainSQLMapper;
	 
	 @Autowired
	 private Student_MemberMgmtSQLMapper memberMgmtSQLMapper;
	
	 @Autowired
     private Student_ApplicationExpensesSQLMapper applicationExpensesSQLMapper;

	 public ArrayList<HashMap<String, Object>> getApplicationExpensesDataList(String stud_id,String searchType , String searchWord ,int pageNum){
		 
		 ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		 
		 int bossIsCount = mainSQLMapper.selectBossIsCount(stud_id);
		 
		 //대표의 정보가 있어야지만 아래의 로직 실행.
		 if(bossIsCount > 0) {
			 
			 Club_StudVO club_StudVO = mainSQLMapper.selectBossMemberIs(stud_id);
			 int club_no = club_StudVO.getClub_no();
			 
			 ArrayList<Club_ExpnsApplyVO> club_ExpnsApplyVOList = applicationExpensesSQLMapper.selectClubExpnsApplyList(club_no,searchType,searchWord,pageNum);
			 
			 for (Club_ExpnsApplyVO club_ExpnsApplyVO : club_ExpnsApplyVOList) {
				
				 HashMap<String, Object> map = new HashMap<String, Object>();
				 
				DecimalFormat decFormat = new DecimalFormat("###,###");
				String expnsApplyGrants = decFormat.format(club_ExpnsApplyVO.getClub_expns_apply_grants());

				map.put("ClubExpnsApplyVO", club_ExpnsApplyVO);
				map.put("ExpnsApplyGrants", expnsApplyGrants);
				
				dataList.add(map);
			}	
		 }
		 
		 return dataList;
	 }
	 
	 
	 public void insertClubExpnsApplyRegistration(Club_ExpnsApplyVO clubExpnsApplyVO) {
		 applicationExpensesSQLMapper.insertClubExpnsApplyRegistration(clubExpnsApplyVO);
	 }
	 
	 public int getExpnsApplySelectCount(String stud_id, String searchType , String searchWord) {
		 
		 	//동아리 대표가 있으면 1, 아니면 0
			int bossMemberCount = memberMgmtSQLMapper.selectBossMemberCount(stud_id);
			int expnsApplySelectCount = 0;
			//동아리 대표가 맞으면 아래의 로직 실행.
			if(bossMemberCount > 0) {
				Club_StudVO club_BossStudInfo = memberMgmtSQLMapper.selectBossMemberIs(stud_id);
				//동아리 대표가 속해있는 'CLUB_NO' 추출
				int club_no = club_BossStudInfo.getClub_no();
				
				expnsApplySelectCount = applicationExpensesSQLMapper.selectExpnsApplySelectCount(club_no,searchType,searchWord);
			}
		 
		 return expnsApplySelectCount;
	 }
}
