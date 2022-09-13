package com.ja.cbh.student.myclubmain.mapper;

import com.ja.cbh.vo.ClubVO;
import com.ja.cbh.vo.Club_StudVO;
import com.ja.cbh.vo.StudVO;

public interface Student_MyClubMainSQLMapper {
	
	//동아리 장 정보를 가져오는 쿼리 (실제 가입 절차를 걸쳐 승인이 떨어진 활동중인 동아리 대표 정보)
	public StudVO selectGetClubBoss(String stud_id);
	//동아리 장이 설립한 동아리에 대한 정보를 가져오는 쿼리. (실제 가입 절차를 걸쳐 승인이 떨어진 활동중인 동아리 정보)
	public ClubVO selectGetClubBossClubInfo(String stud_id);
	//'일반회원'의 정보 -> (일반회원이 속해있는 'CLUB_NO'추출)
	public Club_StudVO  selectNormalMemberInfo();
	//'대표'의 회원정보. (일반회원이 속해있는 동아리 대표의 'ID'추출)
	public Club_StudVO selectClubBossMemberInfo();
	//동아리 대표의 정보
	public StudVO selectClubBossInfo();
	//추출한 'CLUB_NO'의 동아리 정보 (내가 속해있는 동아리)
	public ClubVO selectClubInfo();
	
	

}
