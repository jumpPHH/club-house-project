package com.ja.cbh.student.myclub.clubactivities.service;

import java.lang.reflect.AnnotatedArrayType;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.cbh.student.myclub.clubactivities.mapper.ClubActivitiesSQLMapper;
import com.ja.cbh.vo.Club_ActVO;

@Service
public class ClubActivitesServiceImpl {

	@Autowired
	private ClubActivitiesSQLMapper clubActivitiesSQLMapper;
	
	// 특정 동아리의 모든 활동내역 가져오기
	public ArrayList<Club_ActVO> getClubActivitiesList(String searchWord){
		ArrayList<Club_ActVO> clubActivitiesList = clubActivitiesSQLMapper.selectClubActivitiesListByClubNo(searchWord);
		
		return clubActivitiesList;
	}
	
	// 특정 글의 내용 페이지
	public HashMap<String, Object> getClubActivityByClubActNoAndClubNo(@Param(value="clubActNo") int clubActNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Club_ActVO clubActData = clubActivitiesSQLMapper.selectClubActivityByClubActNoAndClubNo(clubActNo);
		System.out.println("clubActivities Service : " + clubActData.getClub_act_title());
	 
		
		Club_ActVO[] forPreviousAndNextPost = clubActivitiesSQLMapper.selectClubActivitiesListForContentPageByClubActNo();
		// 이전 글 다음 글 제목과 club_act_no를 따기 위한 코드
		
		System.out.println("이거length다" + forPreviousAndNextPost.length);
		
		
		for(int i = 0 ; i < forPreviousAndNextPost.length ; i++) {
			System.out.println("이전글 다음 글 위한 for문에 들어옴.");

			if(forPreviousAndNextPost[i].getClub_act_no() == clubActNo) {
				
				//배열 길이가 1이면 이전 글 다음글은 없으므로 break
				if(forPreviousAndNextPost.length == 1 ) {
					break;
				}
				//다음 글만 존재하는 경우 다음 글의 데이터만 해시맵에 넣어주자.
				if(i == 0 && forPreviousAndNextPost.length > 1) {
					String NextPostTitle = forPreviousAndNextPost[i+1].getClub_act_title();
					int NextPostActNo = forPreviousAndNextPost[i+1].getClub_act_no();
					map.put("NextPostTitle", NextPostTitle);
					map.put("NextPostActNo", NextPostActNo);
					break;
				}
				
				//이전 글만 존재하는 경우 이전 글의 데이터만 해시맵에 넣어주자
				if(i > 0 && forPreviousAndNextPost.length - 1 == i) {
					String PreviousPostTitle = forPreviousAndNextPost[i-1].getClub_act_title();
					int PreviousPostActNo = forPreviousAndNextPost[i-1].getClub_act_no();
					map.put("PreviousPostTitle", PreviousPostTitle);
					map.put("PreviousPostActNo", PreviousPostActNo);
					break;
				}
				
				//이전 글 , 다음 글 둘다 존재할 경우 둘의 데이터 해시맵에 다 넣어주기.
				if(0 < i && i < forPreviousAndNextPost.length - 1) {
					String PreviousPostTitle = forPreviousAndNextPost[i-1].getClub_act_title();
					int PreviousPostActNo = forPreviousAndNextPost[i-1].getClub_act_no();
					map.put("PreviousPostTitle", PreviousPostTitle);
					map.put("PreviousPostActNo", PreviousPostActNo);
					
					String NextPostTitle = forPreviousAndNextPost[i+1].getClub_act_title();
					int NextPostActNo = forPreviousAndNextPost[i+1].getClub_act_no();
					map.put("NextPostTitle", NextPostTitle);
					map.put("NextPostActNo", NextPostActNo);
					break;
				}
			}
				
		}
		System.out.println(map.get("NextPostTitle"));
		
		//HTML escape 특수문자 처리.. <br> &npsp;
		String content = clubActData.getClub_act_content();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp;");
		content = content.replaceAll("\n", "<br>");
		clubActData.setClub_act_content(content);
		
		map.put("clubActData", clubActData);
		clubActivitiesSQLMapper.updateClubActivityReadcountByClubActNo(clubActNo);			
		
		
		
		return map; 
	}
	
	// 단순하게 특정 클럽활동내역 데이터만 가져오기.
	public Club_ActVO getClubActByClubActNoAndClubNoForJustDataUse(int clubActNo) {
		
		Club_ActVO clubActData = clubActivitiesSQLMapper.selectClubActivityByClubActNoAndClubNo(clubActNo); 
	
		return clubActData;
	}
	
	// 어떤 클럽의 클럽 활동내역의 개수가 몇개인지 가져오기
	public int getClubActCountByClubNoAndSearchWord(String searchWord) {
		int clubActCount = clubActivitiesSQLMapper.selectClubActivitiesCountByClubNoAndSearchWord(searchWord);
		
		return clubActCount; 
	}
	
	// 클럽 활동내역 입력
	public void inputClubActByClubActVO(Club_ActVO clubActVO) {
		clubActivitiesSQLMapper.insertClubActivityByClubActVO(clubActVO);
	}
	
	// 클럽 활동내역 수정하기
	public void modifyClubAct(Club_ActVO clubActVO) {
		clubActivitiesSQLMapper.updateClubActivityByClubNoAndClubActNo(clubActVO);
	}
	
	
	//클럽 활동내역 삭제하기
	public void deleteClubActByClubNoAndClubActNo(Club_ActVO clubActVO) {
		
		clubActivitiesSQLMapper.deleteClubActivityByClubNoAndClubActNo(clubActVO);
	}
	
}
