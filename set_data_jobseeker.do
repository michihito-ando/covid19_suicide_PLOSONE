///////////////
/// date: 2020/12,2021/2/23,2022/01
/// 


/// mypc 

global mypc ""

///set cd

//cd "$mypc\2020COVID_impact_R\R_for_web"

global cd_input  "$mypc\2020COVID_impact_R\R_for_web\input"
global cd_output  "$mypc\2020COVID_impact_R\R_for_web\output"

cd "$cd_input"
  
/// input :job_seekers_table15
/// output: 有効求職者数_パート除く常用_temp

cd "$cd_input"

/// import excel "第15表.xlsx", sheet("第１５表ー５（パート除く常用）") clear

import excel "job_seekers_table15.xlsx", sheet("第１５表ー５（パート除く常用）") clear


drop in 113/122
drop B AZ

rename D 有効求職者数_パート除く常用99
rename E 有効求職者数_パート除く常用1
rename F 有効求職者数_パート除く常用2
rename G 有効求職者数_パート除く常用3
rename H 有効求職者数_パート除く常用4
rename I 有効求職者数_パート除く常用5
rename J 有効求職者数_パート除く常用6
rename K 有効求職者数_パート除く常用7
rename L 有効求職者数_パート除く常用8
rename M 有効求職者数_パート除く常用9
rename N 有効求職者数_パート除く常用10
rename O 有効求職者数_パート除く常用11
rename P 有効求職者数_パート除く常用12
rename Q 有効求職者数_パート除く常用13
rename R 有効求職者数_パート除く常用14
rename S 有効求職者数_パート除く常用15
rename T 有効求職者数_パート除く常用16
rename U 有効求職者数_パート除く常用17
rename V 有効求職者数_パート除く常用18
rename W 有効求職者数_パート除く常用19
rename X 有効求職者数_パート除く常用20
rename Y 有効求職者数_パート除く常用21
rename Z 有効求職者数_パート除く常用22
rename AA 有効求職者数_パート除く常用23
rename AB 有効求職者数_パート除く常用24
rename AC 有効求職者数_パート除く常用25
rename AD 有効求職者数_パート除く常用26
rename AE 有効求職者数_パート除く常用27
rename AF 有効求職者数_パート除く常用28
rename AG 有効求職者数_パート除く常用29
rename AH 有効求職者数_パート除く常用30
rename AI 有効求職者数_パート除く常用31
rename AJ 有効求職者数_パート除く常用32
rename AK 有効求職者数_パート除く常用33
rename AL 有効求職者数_パート除く常用34
rename AM 有効求職者数_パート除く常用35
rename AN 有効求職者数_パート除く常用36
rename AO 有効求職者数_パート除く常用37
rename AP 有効求職者数_パート除く常用38
rename AQ 有効求職者数_パート除く常用39
rename AR 有効求職者数_パート除く常用40
rename AS 有効求職者数_パート除く常用41
rename AT 有効求職者数_パート除く常用42
rename AU 有効求職者数_パート除く常用43
rename AV 有効求職者数_パート除く常用44
rename AW 有効求職者数_パート除く常用45
rename AX 有効求職者数_パート除く常用46
rename AY 有効求職者数_パート除く常用47


rename A year
rename C month


drop in 1/54

replace year = "2016" if year =="2016年"
replace year = "2017" if year =="2017年"
replace year = "2018" if year =="2018年"

replace year = "2019" if year =="2019年"
replace year = "2020" if year =="2020年"


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

save 有効求職者数_パート除く常用_temp,replace
clear

//// input: 有効求職者数_パート除く常用_temp
///  output: 有効求職者数_パート除く常用_yearmonth 


forvalues j  =2016/2019  {
	forvalues i = 1/12 {
					
		use 有効求職者数_パート除く常用_temp,clear
		qui keep if year==`j'
		qui keep if month ==`i'

		qui reshape long 有効求職者数_パート除く常用,i(year) j(id)
		gen date=ym(year,month)

		xtset id date,monthly

		save 有効求職者数_パート除く常用_`j'm`i',replace
		
	}

}
////2020

forvalues i = 1/10 {
	
		
	use 有効求職者数_パート除く常用_temp,clear
	qui keep if year==2020
	qui keep if month ==`i'

	qui reshape long 有効求職者数_パート除く常用,i(year) j(id)
	gen date=ym(year,month)

	xtset id date,monthly

	save 有効求職者数_パート除く常用_2020m`i',replace
	
}

//////////////////////////////////////
//// merge 
//// input:有効求職者数_パート除く常用_yearmonth 
//// output:有効求職者数_パート除く常用_2016m12020m10
//////////////////////////////////////////



use 有効求職者数_パート除く常用_2016m1,clear

forvalues i = 2/12 {
	
		
	qui merge 1:1  id date using 有効求職者数_パート除く常用_2016m`i'
	qui xtset id date,monthly

	drop _merge
}
///

forvalues j  =2017/2019  {
	
	forvalues i = 1/12 {
		
			
	qui merge 1:1  id date using 有効求職者数_パート除く常用_`j'm`i'
	qui xtset id date,monthly

	drop _merge
		
	}

}
////2020


///
forvalues i = 1/10 {
	
		
	qui merge 1:1  id date using 有効求職者数_パート除く常用_2020m`i'
	qui xtset id date,monthly

	qui drop _merge
}
////

label vari 有効求職者数_パート除く常用 "有効求職者数（実数）（パート除く常用）"

save 有効求職者数_パート除く常用_2016m12020m10,replace


////////////////////////////////////
///////////////////////////////////
/// 合計
/// 表15　有効求職者数（実数）（パートタイムを含む一般）
/// input 表15-1　有効求職者数（実数）（パートタイムを含む一般）
/// ouput: 有効求職者数_パート含む一般_temp
///

cd "$cd_input"


import excel "第15表.xlsx", sheet("第１５表－１（パート含む一般）") clear
drop in 113/121
drop AZ
drop B

rename D 有効求職者数_パート含む一般99
rename E 有効求職者数_パート含む一般1
rename F 有効求職者数_パート含む一般2
rename G 有効求職者数_パート含む一般3
rename H 有効求職者数_パート含む一般4
rename I 有効求職者数_パート含む一般5
rename J 有効求職者数_パート含む一般6
rename K 有効求職者数_パート含む一般7
rename L 有効求職者数_パート含む一般8
rename M 有効求職者数_パート含む一般9
rename N 有効求職者数_パート含む一般10
rename O 有効求職者数_パート含む一般11
rename P 有効求職者数_パート含む一般12
rename Q 有効求職者数_パート含む一般13
rename R 有効求職者数_パート含む一般14
rename S 有効求職者数_パート含む一般15
rename T 有効求職者数_パート含む一般16
rename U 有効求職者数_パート含む一般17
rename V 有効求職者数_パート含む一般18
rename W 有効求職者数_パート含む一般19
rename X 有効求職者数_パート含む一般20
rename Y 有効求職者数_パート含む一般21
rename Z 有効求職者数_パート含む一般22
rename AA 有効求職者数_パート含む一般23
rename AB 有効求職者数_パート含む一般24
rename AC 有効求職者数_パート含む一般25
rename AD 有効求職者数_パート含む一般26
rename AE 有効求職者数_パート含む一般27
rename AF 有効求職者数_パート含む一般28
rename AG 有効求職者数_パート含む一般29
rename AH 有効求職者数_パート含む一般30
rename AI 有効求職者数_パート含む一般31
rename AJ 有効求職者数_パート含む一般32
rename AK 有効求職者数_パート含む一般33
rename AL 有効求職者数_パート含む一般34
rename AM 有効求職者数_パート含む一般35
rename AN 有効求職者数_パート含む一般36
rename AO 有効求職者数_パート含む一般37
rename AP 有効求職者数_パート含む一般38
rename AQ 有効求職者数_パート含む一般39
rename AR 有効求職者数_パート含む一般40
rename AS 有効求職者数_パート含む一般41
rename AT 有効求職者数_パート含む一般42
rename AU 有効求職者数_パート含む一般43
rename AV 有効求職者数_パート含む一般44
rename AW 有効求職者数_パート含む一般45
rename AX 有効求職者数_パート含む一般46
rename AY 有効求職者数_パート含む一般47

rename A year
rename C month


drop in 1/54

replace year = "2016" if year =="2016年"
replace year = "2017" if year =="2017年"
replace year = "2018" if year =="2018年"

replace year = "2019" if year =="2019年"
replace year = "2020" if year =="2020年"


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

save 有効求職者数_パート含む一般_temp,replace
clear

/////////////////////////////////////////////
//// data 作成
//// input: 有効求職者数_パート含む一般_temp
///  output: 有効求職者数_パート含む一般_yearmonth 

cd "$cd_output"


forvalues j  =2016/2019  {
	forvalues i = 1/12 {
					
		use 有効求職者数_パート含む一般_temp,clear
		qui keep if year==`j'
		qui keep if month ==`i'

		qui reshape long 有効求職者数_パート含む一般,i(year) j(id)
		gen date=ym(year,month)

		xtset id date,monthly

		save 有効求職者数_パート含む一般_`j'm`i',replace
		
	}

}
////2020

forvalues i = 1/10 {
	
		
	use 有効求職者数_パート含む一般_temp,clear
	qui keep if year==2020
	qui keep if month ==`i'

	qui reshape long 有効求職者数_パート含む一般,i(year) j(id)
	gen date=ym(year,month)

	xtset id date,monthly

	save 有効求職者数_パート含む一般_2020m`i',replace
	
}

//////////////////////////////////////
//// merge 
//// input:有効求職者数_パート含む一般_yearmonth 
//// output:有効求職者数_パート含む一般_2016m12020m10
//////////////////////////////////////////

cd "$cd_output"

use 有効求職者数_パート含む一般_2016m1,clear

forvalues i = 2/12 {
	
		
	qui merge 1:1  id date using 有効求職者数_パート含む一般_2016m`i'
	qui xtset id date,monthly

	drop _merge
}
///

forvalues j  =2017/2019  {
	
	forvalues i = 1/12 {
		
			
	qui merge 1:1  id date using 有効求職者数_パート含む一般_`j'm`i'
	qui xtset id date,monthly

	drop _merge
		
	}

}
////2020


///
forvalues i = 1/10 {
	
		
	qui merge 1:1  id date using 有効求職者数_パート含む一般_2020m`i'
	qui xtset id date,monthly

	qui drop _merge
}
////

label vari 有効求職者数_パート含む一般 "有効求職者数（実数）（パートタイムを含む一般）"

save 有効求職者数_パート含む一般_2016m12020m10,replace


////////////////////////////////////
///////////////////////////////////
/// 
/// 一般職業状況報告\第17表
/// note:表17はパートタイムが含まれていない
/// input 表17-4　
/// ouput:有効求職者数_男女計_temp
///

cd "$cd_input"

import excel "job_seekers_table17.xlsx", sheet("第１７表ー４　有効求職者数（男女計）") clear
drop in 115/127
drop AZ
drop B

rename D 有効求職者数_男女計99
rename E 有効求職者数_男女計1
rename F 有効求職者数_男女計2
rename G 有効求職者数_男女計3
rename H 有効求職者数_男女計4
rename I 有効求職者数_男女計5
rename J 有効求職者数_男女計6
rename K 有効求職者数_男女計7
rename L 有効求職者数_男女計8
rename M 有効求職者数_男女計9
rename N 有効求職者数_男女計10
rename O 有効求職者数_男女計11
rename P 有効求職者数_男女計12
rename Q 有効求職者数_男女計13
rename R 有効求職者数_男女計14
rename S 有効求職者数_男女計15
rename T 有効求職者数_男女計16
rename U 有効求職者数_男女計17
rename V 有効求職者数_男女計18
rename W 有効求職者数_男女計19
rename X 有効求職者数_男女計20
rename Y 有効求職者数_男女計21
rename Z 有効求職者数_男女計22
rename AA 有効求職者数_男女計23
rename AB 有効求職者数_男女計24
rename AC 有効求職者数_男女計25
rename AD 有効求職者数_男女計26
rename AE 有効求職者数_男女計27
rename AF 有効求職者数_男女計28
rename AG 有効求職者数_男女計29
rename AH 有効求職者数_男女計30
rename AI 有効求職者数_男女計31
rename AJ 有効求職者数_男女計32
rename AK 有効求職者数_男女計33
rename AL 有効求職者数_男女計34
rename AM 有効求職者数_男女計35
rename AN 有効求職者数_男女計36
rename AO 有効求職者数_男女計37
rename AP 有効求職者数_男女計38
rename AQ 有効求職者数_男女計39
rename AR 有効求職者数_男女計40
rename AS 有効求職者数_男女計41
rename AT 有効求職者数_男女計42
rename AU 有効求職者数_男女計43
rename AV 有効求職者数_男女計44
rename AW 有効求職者数_男女計45
rename AX 有効求職者数_男女計46
rename AY 有効求職者数_男女計47


rename A year
rename C month


drop in 1/54

replace year = "2016" if year =="2016年"
replace year = "2017" if year =="2017年"
replace year = "2018" if year =="2018年"

replace year = "2019" if year =="2019年"
replace year = "2020" if year =="2020年"


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

save 有効求職者数_男女計_temp,replace
clear

//// data 作成
//// input: 有効求職者数_男女計_temp
///  output: 有効求職者数_男女計_2016m12020m10 

cd "$cd_output"

forvalues j  =2016/2019  {
	forvalues i = 1/12 {
					
		use 有効求職者数_男女計_temp,clear
		qui keep if year==`j'
		qui keep if month ==`i'

		qui reshape long 有効求職者数_男女計,i(year) j(id)
		gen date=ym(year,month)

		xtset id date,monthly

		save 有効求職者数_男女計_`j'm`i',replace
		
	}

}
////2020

forvalues i = 1/10 {
	
		
	use 有効求職者数_男女計_temp,clear
	qui keep if year==2020
	qui keep if month ==`i'

	qui reshape long 有効求職者数_男女計,i(year) j(id)
	gen date=ym(year,month)

	xtset id date,monthly

	save 有効求職者数_男女計_2020m`i',replace
	
}


//////////////////////////////////////
//// merge 
//// input:有効求職者数_男女計_yearmonth 
//// output:有効求職者数_男女計_2016m12020m10
//////////////////////////////////////////


use 有効求職者数_男女計_2016m1,clear

forvalues i = 2/12 {
	
		
	qui merge 1:1  id date using 有効求職者数_男女計_2016m`i'
	qui xtset id date,monthly

	drop _merge
}
///

forvalues j  =2017/2019  {
	
	forvalues i = 1/12 {
		
			
	qui merge 1:1  id date using 有効求職者数_男女計_`j'm`i'
	qui xtset id date,monthly

	drop _merge
		
	}

}
////2020

forvalues i = 1/10 {
	
		
	qui merge 1:1  id date using 有効求職者数_男女計_2020m`i'
	qui xtset id date,monthly

	qui drop _merge
}
////

label vari 有効求職者数_男女計 "有効求職者数（実数）"

save 有効求職者数_男女計_2016m12020m10,replace




////////////////////////////////////
///////////////////////////////////
/// 
/// 一般職業状況報告\第17表
/// note:表17はパートタイムが含まれていない
/// input 表17-5
/// ouput:有効求職者数_男_temp
///

cd "$cd_input"

import excel "job_seekers_table17.xlsx", sheet("第１７表ー５　有効求職者数（男）") clear

drop in 113/125

drop AZ

rename D 有効求職者数_男99
rename E 有効求職者数_男1
rename F 有効求職者数_男2
rename G 有効求職者数_男3
rename H 有効求職者数_男4
rename I 有効求職者数_男5
rename J 有効求職者数_男6
rename K 有効求職者数_男7
rename L 有効求職者数_男8
rename M 有効求職者数_男9
rename N 有効求職者数_男10
rename O 有効求職者数_男11
rename P 有効求職者数_男12
rename Q 有効求職者数_男13
rename R 有効求職者数_男14
rename S 有効求職者数_男15
rename T 有効求職者数_男16
rename U 有効求職者数_男17
rename V 有効求職者数_男18
rename W 有効求職者数_男19
rename X 有効求職者数_男20
rename Y 有効求職者数_男21
rename Z 有効求職者数_男22
rename AA 有効求職者数_男23
rename AB 有効求職者数_男24
rename AC 有効求職者数_男25
rename AD 有効求職者数_男26
rename AE 有効求職者数_男27
rename AF 有効求職者数_男28
rename AG 有効求職者数_男29
rename AH 有効求職者数_男30
rename AI 有効求職者数_男31
rename AJ 有効求職者数_男32
rename AK 有効求職者数_男33
rename AL 有効求職者数_男34
rename AM 有効求職者数_男35
rename AN 有効求職者数_男36
rename AO 有効求職者数_男37
rename AP 有効求職者数_男38
rename AQ 有効求職者数_男39
rename AR 有効求職者数_男40
rename AS 有効求職者数_男41
rename AT 有効求職者数_男42
rename AU 有効求職者数_男43
rename AV 有効求職者数_男44
rename AW 有効求職者数_男45
rename AX 有効求職者数_男46
rename AY 有効求職者数_男47


rename A year
rename C month

drop in 1/54

replace year = "2016" if year =="2016年"
replace year = "2017" if year =="2017年"
replace year = "2018" if year =="2018年"

replace year = "2019" if year =="2019年"
replace year = "2020" if year =="2020年"


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

drop B

drop if  month ==.
qui destring,replace

cd "$cd_output"

save 有効求職者数_男_temp,replace
clear

////////////////////////////////////
//// panel male jobseeker
//// input: 有効求職者数_男_temp
///  output: 有効求職者数_男_2016m12020m10 

cd "$cd_output"


forvalues j  =2016/2019  {
	forvalues i = 1/12 {
		
			
		use 有効求職者数_男_temp,clear
		qui keep if year==`j'
		qui keep if month ==`i'

		qui reshape long 有効求職者数_男,i(year) j(id)
		gen date=ym(year,month)

		xtset id date,monthly

		save 有効求職者数_男_`j'm`i',replace
		
	}

}
////2020

forvalues i = 1/10 {
	
		
	use 有効求職者数_男_temp,clear
	qui keep if year==2020
	qui keep if month ==`i'

	qui reshape long 有効求職者数_男,i(year) j(id)
	gen date=ym(year,month)

	xtset id date,monthly

	save 有効求職者数_男_2020m`i',replace
	
}
//////


use 有効求職者数_男_2016m1,clear

forvalues i = 2/12 {
	
		
	qui merge 1:1  id date using 有効求職者数_男_2016m`i'
	qui xtset id date,monthly

	drop _merge
}
///

forvalues j  =2017/2019  {
	
	forvalues i = 1/12 {
		
			
	qui merge 1:1  id date using 有効求職者数_男_`j'm`i'
	qui xtset id date,monthly

	drop _merge
		
	}

}
////2020


///
forvalues i = 1/10 {
	
		
	qui merge 1:1  id date using 有効求職者数_男_2020m`i'
	qui xtset id date,monthly

	qui drop _merge
}
////

label vari 有効求職者数_男 "有効求職者数（実数）"

save 有効求職者数_男_2016m12020m10,replace


***/*/
///  Female jobseeker 
/// 
/// 一般職業状況報告\第17表
/// note:表17はパートタイムが含まれていない
/// input 表17-6
/// ouput:有効求職者数_女_temp
///

cd "$cd_input"

import excel "job_seekers_table17.xlsx", sheet("第１７表ー６　有効求職者数 （女）") clear

drop in 113/125

drop AZ

rename D 有効求職者数_女99
rename E 有効求職者数_女1
rename F 有効求職者数_女2
rename G 有効求職者数_女3
rename H 有効求職者数_女4
rename I 有効求職者数_女5
rename J 有効求職者数_女6
rename K 有効求職者数_女7
rename L 有効求職者数_女8
rename M 有効求職者数_女9
rename N 有効求職者数_女10
rename O 有効求職者数_女11
rename P 有効求職者数_女12
rename Q 有効求職者数_女13
rename R 有効求職者数_女14
rename S 有効求職者数_女15
rename T 有効求職者数_女16
rename U 有効求職者数_女17
rename V 有効求職者数_女18
rename W 有効求職者数_女19
rename X 有効求職者数_女20
rename Y 有効求職者数_女21
rename Z 有効求職者数_女22
rename AA 有効求職者数_女23
rename AB 有効求職者数_女24
rename AC 有効求職者数_女25
rename AD 有効求職者数_女26
rename AE 有効求職者数_女27
rename AF 有効求職者数_女28
rename AG 有効求職者数_女29
rename AH 有効求職者数_女30
rename AI 有効求職者数_女31
rename AJ 有効求職者数_女32
rename AK 有効求職者数_女33
rename AL 有効求職者数_女34
rename AM 有効求職者数_女35
rename AN 有効求職者数_女36
rename AO 有効求職者数_女37
rename AP 有効求職者数_女38
rename AQ 有効求職者数_女39
rename AR 有効求職者数_女40
rename AS 有効求職者数_女41
rename AT 有効求職者数_女42
rename AU 有効求職者数_女43
rename AV 有効求職者数_女44
rename AW 有効求職者数_女45
rename AX 有効求職者数_女46
rename AY 有効求職者数_女47

rename A year
rename C month

drop in 1/54


replace year = "2016" if year =="2016年"
replace year = "2017" if year =="2017年"
replace year = "2018" if year =="2018年"

replace year = "2019" if year =="2019年"
replace year = "2020" if year =="2020年"


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

drop B

drop if  month ==.

cd "$cd_output"

save 有効求職者数_女_temp,replace
clear


forvalues j  =2016/2019  {
	forvalues i = 1/12 {
		
			
		use 有効求職者数_女_temp,clear
		qui keep if year==`j'
		qui keep if month ==`i'

		qui reshape long 有効求職者数_女,i(year) j(id)
		gen date=ym(year,month)

		xtset id date,monthly

		save 有効求職者数_女_`j'm`i',replace
		
	}

}
////2020

forvalues i = 1/10 {
	
		
	use 有効求職者数_女_temp,clear
	qui keep if year==2020
	qui keep if month ==`i'

	qui reshape long 有効求職者数_女,i(year) j(id)
	gen date=ym(year,month)

	xtset id date,monthly

	save 有効求職者数_女_2020m`i',replace
	
}
//////


use 有効求職者数_女_2016m1,clear

forvalues i = 2/12 {
	
		
	qui merge 1:1  id date using 有効求職者数_女_2016m`i'
	qui xtset id date,monthly

	drop _merge
}
///

forvalues j  =2017/2019  {
	
	forvalues i = 1/12 {
		
			
	qui merge 1:1  id date using 有効求職者数_女_`j'm`i'
	qui xtset id date,monthly

	drop _merge
		
	}

}
////2020


///
forvalues i = 1/10 {
	
		
	qui merge 1:1  id date using 有効求職者数_女_2020m`i'
	qui xtset id date,monthly

	qui drop _merge
}
////

label vari 有効求職者数_女 "有効求職者数（実数）"

save 有効求職者数_女_2016m12020m10,replace

clear
///////////////////////
////  Panel data   
/// input 
///  有効求職者数_パート含む一般_2016m12020m10 
/// 有効求職者数_パート除く常用_2016m12020m10
///  有効求職者数_男女計_2016m12020m10
/// 有効求職者数_男_2016m12020m10
/// output 

cd "$cd_output"

use 有効求職者数_パート含む一般_2016m12020m10,clear

merge 1:1 id date using 有効求職者数_パート除く常用_2016m12020m10

drop _merge

merge 1:1 id date using 有効求職者数_男女計_2016m12020m10
drop _merge

merge 1:1 id date using 有効求職者数_女_2016m12020m10
drop _merge

merge 1:1 id date using 有効求職者数_男_2016m12020m10

drop _merge

rename 有効求職者数_男女計 有効求職者数_男女計_パートタイムを除く一般

label vari 有効求職者数_男女計_パートタイムを除く一般 "有効求職者数（実数）（パートタイムを除く一般（男女計））"

order year id month date 有効求職者数_パート除く常用 有効求職者数_パート含む一般 有効求職者数_男女計_パートタイムを除く一般 有効求職者数_女 有効求職者数_男

/// drop 2020m10

drop if year==2020 & month ==10

xtset id date

save jobseeker_total_2016m12020m9,replace
 


