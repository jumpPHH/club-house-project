package com.ja.cbh.student.myclub.main.mapper;

import java.util.ArrayList;

import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_ActVO;
import com.ja.cbh.vo.Club_BoardVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

public interface Student_MainSQLMapper {
	
	//'대표'의 정보가 있으면 1, 아니면 0 구분자 역활
	public int selectBossIsCount(String stud_id);
	//'대표'의 정보가 있는가? 없는가? -> (지금 접속한 유저가 대표인지 알기 위한)
	public Club_StudVO selectBossMemberIs(String stud_id);
	//동아리 장 정보를 가져오는 쿼리 (실제 가입 절차를 걸쳐 승인이 떨어진 활동중인 동아리 대표 정보)
	public StudVO selectGetClubBoss(String stud_id);
	//동아리 장이 설립한 동아리에 대한 정보를 가져오는 쿼리. (실제 가입 절차를 걸쳐 승인이 떨어진 활동중인 동아리 정보)
	public ClubVO selectGetClubBossClubInfo(String stud_id);
	
	//'일반회원'의 정보가 있는가? 없는가?
	public int selectNormalMemberIsCount(String stud_id);
	//'일반회원'의 정보 -> (일반회원이 속해있는 'CLUB_NO'추출)
	public Club_StudVO selectNormalMemberIs(String stud_id);
	//'대표'의 회원정보. (일반회원이 속해있는 동아리 대표의 'ID'추출)
	public Club_StudVO selectClubBossMemberInfo(int club_no);
	//동아리 대표의 정보
	public StudVO selectClubBossInfo(String stud_id);
	//추출한 'CLUB_NO'의 동아리 정보 (내가 속해있는 동아리)
	public ClubVO selectClubInfo(int club_no);

	//동아리에 들가어가 있으면 동아리 넘버를 가져오기 위한 쿼리.
	public Club_StudVO selectClubNoIs(String stud_id);
	//동아리에 들가어가 있으면 동아리 넘버가 있으는지? 없는지?
	public int selectClubNoCount(int club_no);
	
	//자유 게시판의 목록을 출력하기 위한 쿼리
	public ArrayList<Club_BoardVO> selectClubBoardInfo(int club_no);
	//각 자유 게시판의 'CLUB_STUD_NO'를 추출 하여 회원의 정보를 가져오기 위한 쿼리. 
	public Club_StudVO selectClubBoardStudByNo(int club_stud_no);
	//회원의 'STUD_ID'를 추출하여 학생의 정보를 가져오는 쿼리.
	public StudVO selectClubBoardStudInfo(String club_stud_id);
	
	//활동 계획 목록을 출력하기 위한 쿼리
	public ArrayList<Club_ActVO> selectClubActInfo(int club_no);
	//각 활동 계획 목록에 'STUD_ID'를 추출 하여 동아리 대표의 정보를 가져오기 위한 쿼리.
	public StudVO selectClubActStudInfo(String club_boss_stud_id);
	

}
