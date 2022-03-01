///////////////
/// date:2020/12, 2021/07,2022/01
/// source：https://www.e-stat.go.jp/stat-search/files?page=1&layout=datalist&toukei=00200531&tstat=000000110001&cycle=0&tclass1=000001011635&tclass2=000001011637&cycle_facet=tclass1%3Acycle
/// 
/// 
//////////////////////


/// 

global mypc ""

///set cd

//cd "$mypc\2020COVID_impact_R\R_for_web"

global cd_input  "$mypc\2020COVID_impact_R\R_for_web\input"
global cd_output  "$mypc\2020COVID_impact_R\R_for_web\output"


/// input :ltq.xlsx
/// output: pop_over15_raw

cd "$cd_input"

import excel "ltq.xlsx", sheet("第１表") clear

rename C pop_over15_1
rename D pop_over15_2
rename E pop_over15_3
rename F pop_over15_4
rename G pop_over15_5
rename H pop_over15_6
rename I pop_over15_7
rename J pop_over15_8
rename K pop_over15_9
rename L pop_over15_10
rename M pop_over15_11
rename N pop_over15_12
rename O pop_over15_13
rename P pop_over15_14
rename Q pop_over15_15
rename R pop_over15_16
rename S pop_over15_17
rename T pop_over15_18
rename U pop_over15_19
rename V pop_over15_20
rename W pop_over15_21
rename X pop_over15_22
rename Y pop_over15_23
rename Z pop_over15_24
rename AA pop_over15_25
rename AB pop_over15_26
rename AC pop_over15_27
rename AD pop_over15_28
rename AE pop_over15_29
rename AF pop_over15_30
rename AG pop_over15_31
rename AH pop_over15_32
rename AI pop_over15_33
rename AJ pop_over15_34
rename AK pop_over15_35
rename AL pop_over15_36
rename AM pop_over15_37
rename AN pop_over15_38
rename AO pop_over15_39
rename AP pop_over15_40
rename AQ pop_over15_41
rename AR pop_over15_42
rename AS pop_over15_43
rename AT pop_over15_44
rename AU pop_over15_45
rename AV pop_over15_46
rename AW pop_over15_47

drop in 102/105
drop in 1/6

replace A = "2016" in 78
replace A = "2016" in 79
replace A = "2016" in 80
replace A = "2016" in 81
replace A = "2017" in 82
replace A = "2017" in 83
replace A = "2017" in 84
replace A = "2017" in 85
replace A = "2018" in 86
replace A = "2018" in 87
replace A = "2018" in 88
replace A = "2018" in 89
replace A = "2019" in 90
replace A = "2019" in 91
replace A = "2019" in 92
replace A = "2019" in 93
replace A = "2020" in 94
replace A = "2020" in 95

rename A year
drop in 1/77
qui destring,replace

cd "$cd_output"

save pop_over15_raw,replace

/////////////////////
////  Panel data   
/// input pop_over15_raw
/// output panel_pop_over15_2016Q1_2020Q2

cd "$cd_output"

use pop_over15_raw,clear

replace B = "2016q1" in 1
replace B = "2016q2" in 2
replace B = "2016q3" in 3
replace B = "2016q4" in 4
replace B = "2017q1" in 5
replace B = "2017q2" in 6
replace B = "2017q3" in 7
replace B = "2017q4" in 8
replace B = "2018q1" in 9
replace B = "2018q2" in 10
replace B = "2018q3" in 11
replace B = "2018q4" in 12
replace B = "2019q1" in 13
replace B = "2019q2" in 14
replace B = "2019q3" in 15
replace B = "2019q4" in 16
replace B = "2020q1" in 17
replace B = "2020q2" in 18
rename B qrt

gen quarterly = ""

order qrt year quarterly
replace quarterly = "q1" in 1
replace quarterly = "q2" in 2
replace quarterly = "q3" in 3
replace quarterly = "q4" in 4
replace quarterly = "q1" in 5
replace quarterly = "q2" in 6
replace quarterly = "q3" in 7
replace quarterly = "q4" in 8
replace quarterly = "q1" in 9
replace quarterly = "q2" in 10
replace quarterly = "q3" in 11
replace quarterly = "q4" in 12
replace quarterly = "q1" in 13
replace quarterly = "q2" in 14
replace quarterly = "q3" in 15
replace quarterly = "q4" in 16
replace quarterly = "q1" in 17
replace quarterly = "q2" in 18

qui destring,replace

reshape long pop_over15_,i(qrt) j(id)

gen time = quarterly(qrt, "Yq")


label vari time "1960q1=0とする時間変数"

cd "$cd_output"

save panel_pop_over15_2016Q1_2020Q2,replace


/////////////////////////////////////////////////////////
/// 　第２表　都道府県別労働力人口（モデル推計値）　////////
/// input :ltq.xlsx,sheet第２表
/// output: pop_over15_raw

cd "$cd_input"

import excel "ltq.xlsx", sheet("第２表") clear

rename C 労働力人口1
rename D 労働力人口2
rename E 労働力人口3
rename F 労働力人口4
rename G 労働力人口5
rename H 労働力人口6
rename I 労働力人口7
rename J 労働力人口8
rename K 労働力人口9
rename L 労働力人口10
rename M 労働力人口11
rename N 労働力人口12
rename O 労働力人口13
rename P 労働力人口14
rename Q 労働力人口15
rename R 労働力人口16
rename S 労働力人口17
rename T 労働力人口18
rename U 労働力人口19
rename V 労働力人口20
rename W 労働力人口21
rename X 労働力人口22
rename Y 労働力人口23
rename Z 労働力人口24
rename AA 労働力人口25
rename AB 労働力人口26
rename AC 労働力人口27
rename AD 労働力人口28
rename AE 労働力人口29
rename AF 労働力人口30
rename AG 労働力人口31
rename AH 労働力人口32
rename AI 労働力人口33
rename AJ 労働力人口34
rename AK 労働力人口35
rename AL 労働力人口36
rename AM 労働力人口37
rename AN 労働力人口38
rename AO 労働力人口39
rename AP 労働力人口40
rename AQ 労働力人口41
rename AR 労働力人口42
rename AS 労働力人口43
rename AT 労働力人口44
rename AU 労働力人口45
rename AV 労働力人口46
rename AW 労働力人口47

qui destring,replace

drop in 102/105
drop in 1/6

replace A = "2016" in 78
replace A = "2016" in 79
replace A = "2016" in 80
replace A = "2016" in 81
replace A = "2017" in 82
replace A = "2017" in 83
replace A = "2017" in 84
replace A = "2017" in 85
replace A = "2018" in 86
replace A = "2018" in 87
replace A = "2018" in 88
replace A = "2018" in 89
replace A = "2019" in 90
replace A = "2019" in 91
replace A = "2019" in 92
replace A = "2019" in 93
replace A = "2020" in 94
replace A = "2020" in 95

drop in 1/77

drop if 労働力人口47=="" 

rename A year
qui destring,replace

cd "$cd_output"

save  labor_force_raw,replace

/////////////////////
////  Panel data   ////
/// input labor_force_raw
/// output  labor_force_2016Q1_2020Q2 


cd "$cd_output"

use labor_force_raw,clear

replace B = "2016q1" in 1
replace B = "2016q2" in 2
replace B = "2016q3" in 3
replace B = "2016q4" in 4
replace B = "2017q1" in 5
replace B = "2017q2" in 6
replace B = "2017q3" in 7
replace B = "2017q4" in 8
replace B = "2018q1" in 9
replace B = "2018q2" in 10
replace B = "2018q3" in 11
replace B = "2018q4" in 12
replace B = "2019q1" in 13
replace B = "2019q2" in 14
replace B = "2019q3" in 15
replace B = "2019q4" in 16
replace B = "2020q1" in 17
replace B = "2020q2" in 18
rename B qrt

gen quarterly = ""

order qrt year quarterly

replace quarterly = "q1" in 1
replace quarterly = "q2" in 2
replace quarterly = "q3" in 3
replace quarterly = "q4" in 4
replace quarterly = "q1" in 5
replace quarterly = "q2" in 6
replace quarterly = "q3" in 7
replace quarterly = "q4" in 8
replace quarterly = "q1" in 9
replace quarterly = "q2" in 10
replace quarterly = "q3" in 11
replace quarterly = "q4" in 12
replace quarterly = "q1" in 13
replace quarterly = "q2" in 14
replace quarterly = "q3" in 15
replace quarterly = "q4" in 16
replace quarterly = "q1" in 17
replace quarterly = "q2" in 18

qui destring,replace

reshape long 労働力人口,i(qrt) j(id)

gen time = quarterly(qrt, "Yq")


label vari time "1960q1=0とする時間変数"

cd "$cd_output"


save labor_force_2016Q1_2020Q2,replace


/////////////////////////////////////////////////////////
/// 第３表　都道府県別就業者（モデル推計値）////////
/// input :ltq.xlsx,sheet=第3表
/// output: employed_person_raw 

cd "$cd_input"

import excel "ltq.xlsx", sheet("第３表") clear

rename C 就業者1
rename D 就業者2
rename E 就業者3
rename F 就業者4
rename G 就業者5
rename H 就業者6
rename I 就業者7
rename J 就業者8
rename K 就業者9
rename L 就業者10
rename M 就業者11
rename N 就業者12
rename O 就業者13
rename P 就業者14
rename Q 就業者15
rename R 就業者16
rename S 就業者17
rename T 就業者18
rename U 就業者19
rename V 就業者20
rename W 就業者21
rename X 就業者22
rename Y 就業者23
rename Z 就業者24
rename AA 就業者25
rename AB 就業者26
rename AC 就業者27
rename AD 就業者28
rename AE 就業者29
rename AF 就業者30
rename AG 就業者31
rename AH 就業者32
rename AI 就業者33
rename AJ 就業者34
rename AK 就業者35
rename AL 就業者36
rename AM 就業者37
rename AN 就業者38
rename AO 就業者39
rename AP 就業者40
rename AQ 就業者41
rename AR 就業者42
rename AS 就業者43
rename AT 就業者44
rename AU 就業者45
rename AV 就業者46
rename AW 就業者47

qui destring,replace

drop in 102/113
drop in 1/6

replace A = "2016" in 78
replace A = "2016" in 79
replace A = "2016" in 80
replace A = "2016" in 81
replace A = "2017" in 82
replace A = "2017" in 83
replace A = "2017" in 84
replace A = "2017" in 85
replace A = "2018" in 86
replace A = "2018" in 87
replace A = "2018" in 88
replace A = "2018" in 89
replace A = "2019" in 90
replace A = "2019" in 91
replace A = "2019" in 92
replace A = "2019" in 93
replace A = "2020" in 94
replace A = "2020" in 95

drop in 1/77

rename A year
qui destring,replace

cd "$cd_output"


save employed_person_raw,replace

//////////////////////
////  Panel data   ////
/// input employed_person_raw 
/// output panel_employed_person_2016Q1_2020Q2

cd "$cd_output"

use employed_person_raw,clear

replace B = "2016Q1" in 1
replace B = "2016q1" in 1
replace B = "2016q2" in 2
replace B = "2016q3" in 3
replace B = "2016q4" in 4
replace B = "2017q1" in 5
replace B = "2017q2" in 6
replace B = "2017q3" in 7
replace B = "2017q4" in 8
replace B = "2018q1" in 9
replace B = "2018q2" in 10
replace B = "2018q3" in 11
replace B = "2018q4" in 12
replace B = "2019q1" in 13
replace B = "2019q2" in 14
replace B = "2019q3" in 15
replace B = "2019q4" in 16
replace B = "2020q1" in 17
replace B = "2020q2" in 18
rename B qrt

gen quarterly = ""

order qrt year quarterly
replace quarterly = "q1" in 1
replace quarterly = "q2" in 2
replace quarterly = "q3" in 3
replace quarterly = "q4" in 4
replace quarterly = "q1" in 5
replace quarterly = "q2" in 6
replace quarterly = "q3" in 7
replace quarterly = "q4" in 8
replace quarterly = "q1" in 9
replace quarterly = "q2" in 10
replace quarterly = "q3" in 11
replace quarterly = "q4" in 12
replace quarterly = "q1" in 13
replace quarterly = "q2" in 14
replace quarterly = "q3" in 15
replace quarterly = "q4" in 16
replace quarterly = "q1" in 17
replace quarterly = "q2" in 18

qui destring,replace

reshape long 就業者,i(qrt) j(id)

gen time = quarterly(qrt, "Yq")


label vari time "1960q1=0とする時間変数"

cd "$cd_output"

save panel_employed_person_2016Q1_2020Q2,replace


/////////////////////////////////////////////////////////
//////// 第４表　都道府県別完全失業者（モデル推計値）////////
/// input :ltq.xlsx,sheet第4表
/// output: unemployment_raw 

cd "$cd_input"

import excel "ltq.xlsx", sheet("第４表") clear

rename C 失業者1
rename D 失業者2
rename E 失業者3
rename F 失業者4
rename G 失業者5
rename H 失業者6
rename I 失業者7
rename J 失業者8
rename K 失業者9
rename L 失業者10
rename M 失業者11
rename N 失業者12
rename O 失業者13
rename P 失業者14
rename Q 失業者15
rename R 失業者16
rename S 失業者17
rename T 失業者18
rename U 失業者19
rename V 失業者20
rename W 失業者21
rename X 失業者22
rename Y 失業者23
rename Z 失業者24
rename AA 失業者25
rename AB 失業者26
rename AC 失業者27
rename AD 失業者28
rename AE 失業者29
rename AF 失業者30
rename AG 失業者31
rename AH 失業者32
rename AI 失業者33
rename AJ 失業者34
rename AK 失業者35
rename AL 失業者36
rename AM 失業者37
rename AN 失業者38
rename AO 失業者39
rename AP 失業者40
rename AQ 失業者41
rename AR 失業者42
rename AS 失業者43
rename AT 失業者44
rename AU 失業者45
rename AV 失業者46
rename AW 失業者47


qui destring,replace

drop in 102/113
drop in 1/6

replace A = "2016" in 78
replace A = "2016" in 79
replace A = "2016" in 80
replace A = "2016" in 81
replace A = "2017" in 82
replace A = "2017" in 83
replace A = "2017" in 84
replace A = "2017" in 85
replace A = "2018" in 86
replace A = "2018" in 87
replace A = "2018" in 88
replace A = "2018" in 89
replace A = "2019" in 90
replace A = "2019" in 91
replace A = "2019" in 92
replace A = "2019" in 93
replace A = "2020" in 94
replace A = "2020" in 95

drop in 1/77

rename A year
qui destring,replace

cd "$cd_output"

save unemployment_raw,replace

///////////////////////
////  Panel data   
/// input unemployment_raw
/// output panel_unemployment_2016Q1_2020Q2

cd "$cd_output"

use unemployment_raw,clear

replace B = "2016Q1" in 1
replace B = "2016q1" in 1
replace B = "2016q2" in 2
replace B = "2016q3" in 3
replace B = "2016q4" in 4
replace B = "2017q1" in 5
replace B = "2017q2" in 6
replace B = "2017q3" in 7
replace B = "2017q4" in 8
replace B = "2018q1" in 9
replace B = "2018q2" in 10
replace B = "2018q3" in 11
replace B = "2018q4" in 12
replace B = "2019q1" in 13
replace B = "2019q2" in 14
replace B = "2019q3" in 15
replace B = "2019q4" in 16
replace B = "2020q1" in 17
replace B = "2020q2" in 18
rename B qrt

gen quarterly = ""

order qrt year quarterly

replace quarterly = "q1" in 1
replace quarterly = "q2" in 2
replace quarterly = "q3" in 3
replace quarterly = "q4" in 4
replace quarterly = "q1" in 5
replace quarterly = "q2" in 6
replace quarterly = "q3" in 7
replace quarterly = "q4" in 8
replace quarterly = "q1" in 9
replace quarterly = "q2" in 10
replace quarterly = "q3" in 11
replace quarterly = "q4" in 12
replace quarterly = "q1" in 13
replace quarterly = "q2" in 14
replace quarterly = "q3" in 15
replace quarterly = "q4" in 16
replace quarterly = "q1" in 17
replace quarterly = "q2" in 18

qui destring,replace

reshape long 失業者,i(qrt) j(id)

gen time = quarterly(qrt, "Yq")

label vari time "1960q1=0とする時間変数"

cd "$cd_output"


 save panel_unemployment_2016Q1_2020Q2,replace

///////////////////////
////  Panel data   
/// Input 
/// panel_unemployment_2016Q1_2020Q2 
/// labor_force_2016Q1_2020Q2 
/// panel_employed_person_2016Q1_2020Q2 
/// panel_pop_over15_2016Q1_2020Q2
/// prefecture_name_jp 
/// Output:panel_labor_force_2016q1_2020q2 

cd "$cd_output"

use panel_unemployment_2016Q1_2020Q2,clear

merge 1:1 id qrt using labor_force_2016Q1_2020Q2
drop _merge

merge 1:1 id qrt using panel_employed_person_2016Q1_2020Q2
drop _merge

merge 1:1 id qrt using panel_pop_over15_2016Q1_2020Q2
drop _merge 

rename pop_over15_ pop_over15

cd "$cd_input"

merge m:1 id  using prefecture_name_jp
drop _merge

merge m:1 id  using prefecture_name
drop _merge

xtset id time
order 都道府県 prefecture id time qrt year quarterly

cd "$cd_output"


save panel_labor_force_2016q1_2020q2,replace




