package com.ja.cbh.student.myclub.membershipfeemgmt.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.cbh.student.myclub.membershipfeemgmt.mapper.Student_MemberShipFeeMgmtSQLMapper;
import com.ja.cbh.vo.Club_BossAndAccountingMemberVO;
import com.ja.cbh.vo.Club_Fee;

@Service
public class Student_MemberShipFeeMgmtService {

	@Autowired
	private Student_MemberShipFeeMgmtSQLMapper memberShipFeeMgmtSQLMapper;

	public Club_BossAndAccountingMemberVO clubBossAndAccountingMemberIs(String stud_id) {

		return memberShipFeeMgmtSQLMapper.selectClubBossAndAccountingMemberIs(stud_id);
	}

	public ArrayList<HashMap<String, Object>> getCLubFeeAllData(String stud_id, String searchType, String searchWord,
			int pageNum) {

		Club_BossAndAccountingMemberVO bossAndAccountingMemberVO = memberShipFeeMgmtSQLMapper
				.selectClubBossAndAccountingMemberIs(stud_id);
		int club_no = bossAndAccountingMemberVO.getClub_no();

		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();

		ArrayList<Club_Fee> cLubFeeAllDataList = memberShipFeeMgmtSQLMapper.selectCLubFeeAllData(club_no, searchType,
				searchWord, pageNum);

		for (Club_Fee club_Fee : cLubFeeAllDataList) {
			DecimalFormat decFormat = new DecimalFormat("###,###");

			int income_amount = club_Fee.getClub_fee_income_amount();
			int using_amount = club_Fee.getClub_fee_using_amount();

			String expnsApply1 = decFormat.format(income_amount);
			String expnsApply2 = decFormat.format(using_amount);

			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("Club_FeeVo", club_Fee);
			map.put("Club_fee_income_amount", expnsApply1);
			map.put("Club_fee_using_amount", expnsApply2);

			dataList.add(map);
		}

		return dataList;
	}

	public int getMemberShipFeeSelectCount(String stud_id, String searchType, String searchWord) {

		Club_BossAndAccountingMemberVO bossAndAccountingMemberVO = memberShipFeeMgmtSQLMapper
				.selectClubBossAndAccountingMemberIs(stud_id);

		int club_no = bossAndAccountingMemberVO.getClub_no();

		int memberShipFeeSelectCount = memberShipFeeMgmtSQLMapper.selectMemberShipFeeSelectCount(club_no, searchType,
				searchWord);

		return memberShipFeeSelectCount;
	}

	public ArrayList<HashMap<String, Object>> getAmountTotal(String stud_id, String searchType, String searchWord,
			int pageNum) {

		Club_BossAndAccountingMemberVO bossAndAccountingMemberVO = memberShipFeeMgmtSQLMapper
				.selectClubBossAndAccountingMemberIs(stud_id);
		int club_no = bossAndAccountingMemberVO.getClub_no();

		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();

		ArrayList<Club_Fee> cLubFeeAllDataList = memberShipFeeMgmtSQLMapper.selectCLubFeeAllData(club_no, searchType,
				searchWord, pageNum);

		int cLubFeeAllDataListSize = cLubFeeAllDataList.size();
		int i = 0; int incomeAamountTotal = 0; int usingAmountTotal = 0; int total = 0;
		
		for (Club_Fee club_Fee : cLubFeeAllDataList) {

			int[] income_amount = new int[cLubFeeAllDataListSize];
			int[] using_amount = new int[cLubFeeAllDataListSize];

			income_amount[i] = club_Fee.getClub_fee_income_amount();
			using_amount[i] = club_Fee.getClub_fee_using_amount();

			incomeAamountTotal += income_amount[i];
			usingAmountTotal += using_amount[i];
			total = incomeAamountTotal - usingAmountTotal;

			i++;
		}

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("IncomeAamountTotal", incomeAamountTotal);
		map.put("UsingAmountTotal", usingAmountTotal);
		map.put("Total", total);

		dataList.add(map);

		return dataList;
	}

}
