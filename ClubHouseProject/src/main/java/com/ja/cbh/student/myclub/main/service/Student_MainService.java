package com.ja.cbh.student.myclub.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclub.main.mapper.Student_MainSQLMapper;
import com.ja.cbh.vo.Club_BoardVO;
import com.ja.cbh.vo.Club_ActVO;
import com.ja.cbh.vo.Club_BoardVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

@Service
public class Student_MainService {

	@Autowired
	private Student_MainSQLMapper student_MainSQLMapper;

	public HashMap<String, Object> student_MainData(String stud_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// '일반회원'의 정보가 있는가? 없는가? -> (지금 접속한 유저가 일반회원인지 아닌지 알기 위한 로직)
		map.put("IsNormalMember", student_MainSQLMapper.selectNormalMemberIs(stud_id));

		// '대표' 인지 '일반회원' 인지에 대한 구분하는 로직
		int NormalMemberIsCount = student_MainSQLMapper.selectNormalMemberIsCount(stud_id);

		if (NormalMemberIsCount == 1) {

			Club_StudVO club_StudVO = student_MainSQLMapper.selectNormalMemberIs(stud_id);

			// 내가 속해있는 'CLUB_NO'추출___
			int club_no = club_StudVO.getClub_no();
			// 내가 속해있는 동아리의 대표 정보를 가져오는 로직.
			club_StudVO = student_MainSQLMapper.selectClubBossMemberInfo(club_no);

			// 내가 속해있는 동아리 대표의 STUD_ID를 추출
			String club_boss_id = club_StudVO.getStud_id();
			// 내가 속해있는 동아리 대표의 정보를 뿌려주는 로직.
			map.put("MyClubBossInfo", student_MainSQLMapper.selectClubBossInfo(club_boss_id));

			// 내가 속해있는 동아리의 정보를 뿌려주는 로직.
			map.put("MyClubInfo", student_MainSQLMapper.selectClubInfo(club_no));

		} else {
			// '대표'의 정보가 있는가? 없는가? -> (지금 접속한 유저가 대표인지 아닌지 알기 위한 로직)
			map.put("IsBoss", student_MainSQLMapper.selectBossMemberIs(stud_id));
			// 동아리 장 정보를 가져오는 로직
			map.put("GetClubBoss", student_MainSQLMapper.selectGetClubBoss(stud_id));
			// 동아리 장이 설립한 동아리에 대한 정보를 가져오는 로직
			map.put("GetClubBossClubInfo", student_MainSQLMapper.selectGetClubBossClubInfo(stud_id));

		}

		return map;
	}

	public ArrayList<HashMap<String, Object>> student_MainBoardData(String stud_id) {

		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		Club_StudVO clVo = student_MainSQLMapper.selectClubNoIs(stud_id);

		if (clVo != null && !clVo.equals("")) {

			int club_no = clVo.getClub_no();

			// 동아리에 들가어가 있으면 동아리 넘버가 있으는지? 없는지?
			int clubNoCount = student_MainSQLMapper.selectClubNoCount(club_no);

			if (clubNoCount > 0) {
				// 자유 게시판 목록을 출력하는 로직..
				ArrayList<Club_BoardVO> club_BoardVoList = student_MainSQLMapper.selectClubBoardInfo(club_no);

				for (Club_BoardVO club_BoardVO : club_BoardVoList) {

					int club_stud_no = club_BoardVO.getClub_stud_no();
					Club_StudVO club_StudVO = student_MainSQLMapper.selectClubBoardStudByNo(club_stud_no);

					String club_stud_id = club_StudVO.getStud_id();
					StudVO studVO = student_MainSQLMapper.selectClubBoardStudInfo(club_stud_id);

					HashMap<String, Object> map = new HashMap<String, Object>();

					map.put("Club_BoardStudVoList", studVO);
					map.put("Club_BoardVoList", club_BoardVO);

					dataList.add(map);
				}
			}

		}

		return dataList;
	}

	public ArrayList<HashMap<String, Object>> student_MainActData(String stud_id) {

		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();

		Club_StudVO clVo = student_MainSQLMapper.selectClubNoIs(stud_id);

		if (clVo != null && !clVo.equals("")) {

			int club_no = clVo.getClub_no();

			// 동아리에 들가어가 있으면 동아리 넘버가 있으는지? 없는지?
			int clubNoCount = student_MainSQLMapper.selectClubNoCount(club_no);

			if (clubNoCount > 0) {

				// 활동 목록을 출력하는 로직..
				ArrayList<Club_ActVO> club_ActVoList = student_MainSQLMapper.selectClubActInfo(club_no);

				for (Club_ActVO club_ActVO : club_ActVoList) {

					String club_boss_stud_id = club_ActVO.getStud_id();
					StudVO studVO = student_MainSQLMapper.selectClubActStudInfo(club_boss_stud_id);

					HashMap<String, Object> map = new HashMap<String, Object>();

					map.put("Club_ActStudVoList", studVO);
					map.put("Club_ActVoList", club_ActVO);

					dataList.add(map);
				}
			}
		}

		return dataList;
	}

}
