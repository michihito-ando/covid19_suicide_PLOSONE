///////////////
/// date:2020/10,202201
/// 



/// pc 
global mypc ""

///set cd

global cd_input  "$mypc\2020COVID_impact_R\R_for_web\input"
global cd_output  "$mypc\2020COVID_impact_R\R_for_web\output"

cd "$cd_input"

//  有効求人倍率 : jobs to applicants ratio
// 

/// input :job_seekers_table18.xlsx,sheet ="第１８表ー８　有効求人倍率（季節調整値）"
/// output:yuko_temp


cd "$cd_input"

import excel "job_seekers_table18.xlsx", sheet("第１８表ー８　有効求人倍率（季節調整値）") clear

drop in 1/133

drop AX

rename C 有効求人倍率1
rename D 有効求人倍率2
rename E 有効求人倍率3
rename F 有効求人倍率4
rename G 有効求人倍率5
rename H 有効求人倍率6
rename I 有効求人倍率7
rename J 有効求人倍率8
rename K 有効求人倍率9
rename L 有効求人倍率10
rename M 有効求人倍率11
rename N 有効求人倍率12
rename O 有効求人倍率13
rename P 有効求人倍率14
rename Q 有効求人倍率15
rename R 有効求人倍率16
rename S 有効求人倍率17
rename T 有効求人倍率18
rename U 有効求人倍率19
rename V 有効求人倍率20
rename W 有効求人倍率21
rename X 有効求人倍率22
rename Y 有効求人倍率23
rename Z 有効求人倍率24
rename AA 有効求人倍率25
rename AB 有効求人倍率26
rename AC 有効求人倍率27
rename AD 有効求人倍率28
rename AE 有効求人倍率29
rename AF 有効求人倍率30
rename AG 有効求人倍率31
rename AH 有効求人倍率32
rename AI 有効求人倍率33
rename AJ 有効求人倍率34
rename AK 有効求人倍率35
rename AL 有効求人倍率36
rename AM 有効求人倍率37
rename AN 有効求人倍率38
rename AO 有効求人倍率39
rename AP 有効求人倍率40
rename AQ 有効求人倍率41
rename AR 有効求人倍率42
rename AS 有効求人倍率43
rename AT 有効求人倍率44
rename AU 有効求人倍率45
rename AV 有効求人倍率46
rename AW 有効求人倍率47

rename A year
rename B month


replace year = "2016" in 1/12
replace year = "2017" in 13/24
replace year = "2018" in 25/36

replace year = "2019" in 37/48
replace year = "2020" in 49/56

replace month = "1" if month == "１月"
replace month = "2" if month == "２月"

replace month = "3" if month== "３月"
replace month = "4" if month== "４月"
replace month = "5" if month== "５月"
replace month = "6" if month== "６月"
replace month = "7" if month== "７月"

replace month = "8" if month== "８月"
replace month = "9" if month== "９月"
replace month = "10" if month== "10月"
replace month = "11" if month== "11月"
replace month = "12" if month== "12月"


qui destring,replace


drop if  month ==.
qui destring,replace

cd "$cd_output"

save yuko_temp,replace

clear

/// input: yuko_temp
/// output: kyujin_`j'm`i'. j=2016~2019, i=1~12

cd "$cd_output"

forvalues j  =2016/2019  {
	forvalues i = 1/12 {
		
			
		use yuko_temp,clear
		qui keep if year==`j'
		qui keep if month ==`i'

		qui reshape long 有効求人倍率,i(year) j(id)
		gen date=ym(year,month)

		xtset id date,monthly

		save kyujin_`j'm`i',replace
		
	}

}
////2020
/// input: yuko_temp
/// output: kyujin_`j'm`i'. j=2020, i=1~8

cd "$out_output"

forvalues i = 1/8 {
	
		
	use yuko_temp,clear
	qui keep if year==2020
	qui keep if month ==`i'

	qui reshape long 有効求人倍率,i(year) j(id)
	gen date=ym(year,month)

	xtset id date,monthly

	save kyujin_2020m`i',replace
	
}

////////////////////////
/// panel
/// input: kyujin_`j'm`i'. 
/// output: kyujin_2016m1to2020m8

cd "$out_output"

use kyujin_2016m1,clear

forvalues i = 2/12 {
	
		
	qui merge 1:1  id date using kyujin_2016m`i'
	qui xtset id date,monthly

	drop _merge
}
///

forvalues j  =2017/2019  {
	
	forvalues i = 1/12 {
		
			
	qui merge 1:1  id date using kyujin_`j'm`i'
	qui xtset id date,monthly

	drop _merge
		
	}

}
////2020


///
forvalues i = 1/8 {
	
		
	qui merge 1:1  id date using kyujin_2020m`i'
	qui xtset id date,monthly

	qui drop _merge
}
////

label vari 有効求人倍率 "季節調整値"

save kyujin_2016m1to2020m8,replace
