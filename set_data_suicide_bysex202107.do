///////////////////////////////////////////////////////////////////////////////
/// date 2020/12/02,2021/07/28
/// This do file make panel data on suicide in Japan.
/// Data source.
/// https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000197204_00006.html
/// https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000197204_00003.html
/// https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000197204.html
/// https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000152688.html
/// https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/hukushi_kaigo/seikatsuhogo/jisatsu/jisatsu_chiiki2016.html
//////////////////////////////////////////////////////////////////////////////

/// mypc 

global mypc ""


///set cd

global cd_input  "$mypc\2020COVID_impact_R\R_for_web\input\suicide_xls\"
global cd_output  "$mypc\2020COVID_impact_R\R_for_web\output"

cd "$cd_input"

/* in Japanese/ in English

都道府県：prefecture
自殺者数_合計: the number of total sucide
自殺死亡率_総数（厚労省計算）:the total suicide rate
自殺者数_男:the number of male sucide
自殺死亡率_男:the male suicide rate
自殺者数_女:the number of female sucide
自殺死亡率_女:the female suicide rate

*/

// m:month

////////////////////////////////////////////////
////////// total suicide rate 
////////////////////////////////////////////////

/////////////////////
/// 2020 
/////////////////////

forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2020-`i'-2020CDR-20-00014_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2020
	gen month =`i'

	drop in 1/7
	drop if 都道府県==""
	
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

	cd "$cd_output"

	save suicide_total_2020`i',replace
}
///

/////////////////////
/// 2019 
/// total suicide

forvalues i = 1/12 {

	cd "$cd_input"

	import excel "2019-`i'-2019CDR-19-00013_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2019
	gen month =`i'

	drop in 1/7
	drop if 都道府県==""
	
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

	cd "$cd_output"

	save suicide_total_2019`i',replace
}
///

/////////////////////
/// 2018
/// total suicide


forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2018-`i'-2018CDR-18-0000`i'_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2018
	gen month =`i'

	drop in 1/7
	drop if 都道府県==""
	
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

	cd "$cd_output"

	save suicide_total_2018`i',replace
}
///


forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2018-`i'-2018CDR-18-000`i'_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)")  clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2018
	gen month =`i'

	drop in 1/7
	drop if 都道府県==""

	replace id = "99"  if id =="0"

	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県  自殺者数_合計 自殺死亡率_総数（厚労省計算）

	cd "$cd_output"

	save suicide_total_2018`i',replace

}

///


/////////////////////
/// 2017
/// total suicide


forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2017-`i'-2017CDR-17-0000`i'_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2017
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

	cd "$cd_output"

	save suicide_total_2017`i',replace
}
///


forvalues i = 10/12 {

cd "$cd_input"

	import excel "2017-`i'-2017CDR-17-000`i'_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2017
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

	cd "$cd_output"

	save suicide_total_2017`i',replace
}
///


/////////////////////
/// 2016
/// total suicide
/////////////////////



forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2016-`i'-2016CDR-16-0000`i'_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2016
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

	cd "$cd_output"

	save suicide_total_2016`i',replace
}
///


forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2016-`i'-2016CDR-16-000`i'_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2016
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

	cd "$cd_output"

	save suicide_total_2016`i',replace
}
///

////////////////////////
/// The xls file name for 2015 is created in a different format than 2016 and later.
/// 2015
/// total suicide
/////////////////////

/// 2015m1


cd "$cd_input"

import excel "2015-1-2014CDR-14-00020_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2015
	gen month = 1

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）
	
cd "$cd_output"

	save suicide_total_20151,replace

	
/// m2

cd "$cd_input"

	import excel "2015-2-2014CDR-14-00023_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear
	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2015
	gen month = 2

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

cd "$cd_output"

	save suicide_total_20152,replace

///m3

cd "$cd_input"

import excel "2015-3-2015CDR-15-00001_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear
	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2015
	gen month = 3

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

	cd "$cd_output"

	save suicide_total_20153,replace

/// m4 

cd "$cd_input"

import excel "2015-4-2015CDR-15-00002_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear
	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2015
	gen month = 4

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

	cd "$cd_output"

	save suicide_total_20154,replace
	
/// m5

cd "$cd_input"

	import excel "2015-5-2015CDR-15-00003_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear
	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2015
	gen month = 5

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

cd "$cd_output"

	save suicide_total_20155,replace
	
/// m6

cd "$cd_input"

import excel "2015-6-2015CDR-15-00004_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2015
	gen month = 6

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

cd "$cd_output"

	save suicide_total_20156,replace

/// m7

cd "$cd_input"

import excel "2015-7-2015CDR-15-00006_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear
	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2015
	gen month = 7

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

cd "$cd_output"

	save suicide_total_20157,replace

///

import excel "2015-8-2015CDR-15-00008_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear
import excel "2015-9-2015CDR-15-00009_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear


/// 2015m8 to m 12

forvalues i = 8/9 {

cd "$cd_input"

	import excel "2015-`i'-2015CDR-15-0000`i'_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2015
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

cd "$cd_output"

	save suicide_total_2015`i',replace
}
//////////////////
// 2015m10to m12


forvalues i = 10/12 {

cd "$cd_input"

	import excel "2015-`i'-2015CDR-15-000`i'_A6表(県・自殺日・発見地).xls", sheet("総数 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_合計
	rename E 自殺死亡率_総数（厚労省計算）
	gen year =2015
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_合計 自殺死亡率_総数（厚労省計算）

cd "$cd_output"

	save suicide_total_2015`i',replace
}
///////////////////////
///  Panel data   
///  input suicide_total_2015 2015m1 to 2020m9
///  merge 
///  output suicide_total_2015m1to2020m9

cd "$cd_output"

use suicide_total_20151,clear

forvalues i = 2/12 {



	qui merge 1:1 id date using suicide_total_2015`i'
	qui xtset id date,monthly

	qui drop _merge

}
////

forvalues i = 1/12 {



	qui merge 1:1 id date using suicide_total_2016`i'
	qui xtset id date,monthly

	qui drop _merge

}
///

forvalues i = 1/12 {



	qui merge 1:1 id date using suicide_total_2017`i'
	qui xtset id date,monthly

	qui drop _merge

}
///


forvalues i=1/12 {

	qui merge 1:1 id date using suicide_total_2018`i'
	qui xtset id date,monthly

	qui drop _merge

}
///


forvalues i=1/12 {

	qui merge 1:1 id date using suicide_total_2019`i'
	qui xtset id date,monthly

	qui drop _merge

}
////


forvalues i=1/9 {

	qui merge 1:1 id date using suicide_total_2020`i'
	qui xtset id date,monthly

	qui drop _merge

}
///// label. in Japanese


label vari 自殺者数_合計 "自殺者数_合計 警察統計"

cd "$cd_output"
qui xtset id date,monthly

save suicide_total_2015m1to2020m9,replace



////////////////////////////////////////////////
////////// male suicide rate 
/////////////////////////////////////////////////

////////////////
/// 2015 
/// male suicide 


/// m1 

cd "$cd_input"

import excel "2015-1-2014CDR-14-00020_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2015
	gen month =1

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

cd "$cd_output"

	save suicide_male_20151,replace

	
/// m2

cd "$cd_input"

	import excel "2015-2-2014CDR-14-00023_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2015
	gen month =2

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

cd "$cd_output"

	save suicide_male_20152,replace

///m3

cd "$cd_input"

import excel "2015-3-2015CDR-15-00001_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2015
	gen month =3

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男
	
cd "$cd_output"

	save suicide_male_20153,replace
	

/// m4 

cd "$cd_input"

import excel "2015-4-2015CDR-15-00002_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear


	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2015
	gen month =4

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

cd "$cd_output"

	save suicide_male_20154,replace
	
/// m5

cd "$cd_input"

	import excel "2015-5-2015CDR-15-00003_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear


	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2015
	gen month =5

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

cd "$cd_output"

	save suicide_male_20155,replace
	
/// m6

cd "$cd_input"

import excel "2015-6-2015CDR-15-00004_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2015
	gen month =6

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

cd "$cd_output"
	
	save suicide_male_20156,replace

/// m7

cd "$cd_input"

import excel "2015-7-2015CDR-15-00006_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2015
	gen month =7

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男
	
cd "$cd_output"

	save suicide_male_20157,replace

///


/// m8 to m 12
forvalues i = 8/9 {

cd "$cd_input"

	import excel "2015-`i'-2015CDR-15-0000`i'_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2015
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

cd "$cd_output"

	save suicide_male_2015`i',replace
}
///


forvalues i = 10/12 {

cd "$cd_input"

	import excel "2015-`i'-2015CDR-15-000`i'_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2015
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

cd "$cd_output"

	save suicide_male_2015`i',replace
}


///2016 ///




forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2016-`i'-2016CDR-16-0000`i'_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2016
	gen month =`i'


	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

	cd "$cd_output"

	save suicide_male_2016`i',replace
}
///


forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2016-`i'-2016CDR-16-000`i'_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2016
	gen month =`i'


	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

	cd "$cd_output"

	save suicide_male_2016`i',replace
}
///


///2017




forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2017-`i'-2017CDR-17-0000`i'_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2017
	gen month =`i'


	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

	cd "$cd_output"

	save suicide_male_2017`i',replace
}
///


forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2017-`i'-2017CDR-17-000`i'_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2017
	gen month =`i'


	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

	cd "$cd_output"

	save suicide_male_2017`i',replace
}
///


/// 2018


forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2018-`i'-2018CDR-18-0000`i'_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2018
	gen month =`i'


	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	replace id = "99"  if id =="0"

	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

	cd "$cd_output"

	save suicide_male_2018`i',replace
}
///

forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2018-`i'-2018CDR-18-000`i'_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2018
	gen month =`i'


	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	replace id = "99"  if id =="0"

	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

	cd "$cd_output"

	save suicide_male_2018`i',replace
}
///

/// 2019///


forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2019-`i'-2019CDR-19-00013_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2019
	gen month =`i'

	drop in 1/7
	drop in 49
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

	cd "$cd_output"

	save suicide_male_2019`i',replace
}
///



forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2019-`i'-2019CDR-19-00013_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2019
	gen month =`i'

	drop in 1/7
	drop in 49
	replace id = "99"  if id =="0"

	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

	cd "$cd_output"

	save suicide_male_2019`i',replace
}
/////////////////////
/// 2020
//////////////////////

forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2020-`i'-2020CDR-20-00014_A6表(県・自殺日・発見地).xls", sheet("男 (秘)") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_男
	rename E 自殺死亡率_男
	gen year =2020
	gen month =`i'

	drop in 1/7
	drop if 都道府県==""
	replace id = "99"  if id =="0"

	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_男 自殺死亡率_男

	cd "$cd_output"

	save suicide_male_2020`i',replace

}

//////////////////////////////////////////////////
///////////////////////
///  Panel data   
///  input suicide_male_2015 2015m1 to 2020m9
///  merge 
///  output suicide_male_2015m1to2020m9


cd "$cd_output"


use suicide_male_20151,clear


forvalues i=2/12 {

	qui merge 1:1 id date using suicide_male_2015`i'
	qui xtset id date,monthly

	qui drop _merge

}
///


forvalues i=1/12 {

	qui merge 1:1 id date using suicide_male_2016`i'
	qui xtset id date,monthly

	qui drop _merge

}
///

/// 


forvalues i=1/12 {

	qui merge 1:1 id date using suicide_male_2017`i'
	qui xtset id date,monthly

	qui drop _merge

}
///


forvalues i=1/12 {

	qui merge 1:1 id date using suicide_male_2018`i'
	qui xtset id date,monthly

	qui drop _merge

}

forvalues i=1/12 {

	qui merge 1:1 id date using suicide_male_2019`i'
	qui xtset id date,monthly

	qui drop _merge

}
///


forvalues i=1/9 {

	qui merge 1:1 id date using suicide_male_2020`i'
	qui xtset id date,monthly

	qui drop _merge

}
///

xtset id date,monthly


save suicide_male_2015m1to2020m9,replace

////////////////////////////////////////////////
////////// female suicide rate 
/////////////////////////////////////////////////

///2015 ///


/// m1 

cd "$cd_input"

import excel "2015-1-2014CDR-14-00020_A6表(県・自殺日・発見地).xls", sheet("女 (秘）")clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2015
	gen month =1

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

cd "$cd_output"
	
	save suicide_female_20151,replace

	
/// m2

cd "$cd_input"

	import excel "2015-2-2014CDR-14-00023_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2015
	gen month =2

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

cd "$cd_output"

	save suicide_female_20152,replace

///m3

cd "$cd_input"

import excel "2015-3-2015CDR-15-00001_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2015
	gen month =3

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

cd "$cd_output"

	save suicide_female_20153,replace

/// m4 

cd "$cd_input"

import excel "2015-4-2015CDR-15-00002_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear


	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2015
	gen month =4

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

cd "$cd_output"

	save suicide_female_20154,replace
	
/// m5

cd "$cd_input"

	import excel "2015-5-2015CDR-15-00003_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear


	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2015
	gen month =5

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

cd "$cd_output"

	save suicide_female_20155,replace
	
/// m6

cd "$cd_input"

import excel "2015-6-2015CDR-15-00004_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2015
	gen month =6

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	/// このデータでは全国値のidが0.他のデータセットの都道府県idの全国が99なので変更
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

cd "$cd_output"

	save suicide_female_20156,replace

/// m7

cd "$cd_input"

import excel "2015-7-2015CDR-15-00006_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2015
	gen month =7

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

cd "$cd_output"

	save suicide_female_20157,replace




/// m8 to m 12
forvalues i = 8/9 {

	cd "$cd_input"


	import excel "2015-`i'-2015CDR-15-0000`i'_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2015
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

cd "$cd_output"

	save suicide_female_2015`i',replace
}
///



forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2015-`i'-2015CDR-15-000`i'_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear
	
	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2015
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"

	qui destring,replace
	
	replace id = 99  if id ==0
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

	cd "$cd_output"

	save suicide_female_2015`i',replace
}



///2016 ///


forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2016-`i'-2016CDR-16-0000`i'_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2016
	gen month =`i'


	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

	cd "$cd_output"

	save suicide_female_2016`i',replace
}
///


forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2016-`i'-2016CDR-16-000`i'_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2016
	gen month =`i'


	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

	cd "$cd_output"

	save suicide_female_2016`i',replace
}
///


///2017

forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2017-`i'-2017CDR-17-0000`i'_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2017
	gen month =`i'


	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

	cd "$cd_output"

	save suicide_female_2017`i',replace
}
///



forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2017-`i'-2017CDR-17-000`i'_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2017
	gen month =`i'


	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	
	replace id = "99"  if id =="0"
	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

	cd "$cd_output"

	save suicide_female_2017`i',replace
}
///


/// 2018 ///


forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2018-`i'-2018CDR-18-0000`i'_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2018
	gen month =`i'

	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	
	replace id = "99"  if id =="0"

	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

	cd "$cd_output"

	save suicide_female_2018`i',replace
}
///



forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2018-`i'-2018CDR-18-000`i'_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2018
	gen month =`i'

	
	drop if 都道府県==""
	drop if 都道府県=="都道府県名"
	
	replace id = "99"  if id =="0"

	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

	cd "$cd_output"

	save suicide_female_2018`i',replace
}
///


forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2019-`i'-2019CDR-19-00013_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2019
	gen month =`i'

	drop in 1/7
	drop in 49
	replace id = "99"  if id =="0"

	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

	cd "$cd_output"

	save suicide_female_2019`i',replace
}
///



forvalues i = 10/12 {

	cd "$cd_input"

	import excel "2019-`i'-2019CDR-19-00013_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2019
	gen month =`i'

	drop in 1/7
	drop in 49
	replace id = "99"  if id =="0"

	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

	cd "$cd_output"

	save suicide_female_2019`i',replace
}
//////////////
/// 2020


forvalues i = 1/9 {

	cd "$cd_input"

	import excel "2020-`i'-2020CDR-20-00014_A6表(県・自殺日・発見地).xls", sheet("女 (秘）") clear

	rename B id
	rename C 都道府県
	rename D 自殺者数_女
	rename E 自殺死亡率_女
	gen year =2020
	gen month =`i'

	drop in 1/7
	drop if 都道府県==""
	replace id = "99"  if id =="0"

	qui destring,replace

	gen date=ym(year,month)

	xtset id date,monthly
	keep id year month date 都道府県 自殺者数_女 自殺死亡率_女

	cd "$cd_output"

	save suicide_female_2020`i',replace
}
///
//////////////////////////////////////////////////
///////////////////////
///  Panel data   
///  input suicide_female_2015 2015m1 to 2020m9
///  merge 
///  output suicide_female_2015m1to2020m9


cd "$cd_output"


use suicide_female_20151,clear

forvalues i=2/12 {

	qui merge 1:1 id date using suicide_female_2015`i'
	qui drop _merge
	qui xtset id date,monthly

}
///

forvalues i=1/12 {

	qui merge 1:1 id date using suicide_female_2016`i'
	qui drop _merge
	qui xtset id date,monthly

}
///

forvalues i=1/12 {

	qui merge 1:1 id date using suicide_female_2017`i'
	qui drop _merge
	qui xtset id date,monthly

}
///

cd $cd_data

forvalues i=1/12 {

	qui merge 1:1 id date using suicide_female_2018`i'
	qui drop _merge
	qui xtset id date,monthly

}
///

forvalues i=1/12 {

	qui merge 1:1 id date using suicide_female_2019`i'
	qui drop _merge
	qui xtset id date,monthly

}
///



forvalues i=1/9 {

	qui merge 1:1 id date using suicide_female_2020`i'
	qui drop _merge
	qui xtset id date,monthly

}
///

cd "$cd_output"

xtset id date,monthly
save suicide_female_2015m1to2020m9,replace



///////////////////////
///  Panel data   
///  input 
///  suicide_total_2015m1to2020m9
///  suicide_male_2015m1to2020m9
///  suicide_female_2015m1to2020m9
///  output : suicide_bothsex_2015m1to2020m9


cd "$cd_output"

use suicide_total_2015m1to2020m9,clear

merge 1:1 id date using suicide_female_2015m1to2020m9

drop _merge
xtset id date,monthly

merge 1:1 id date using suicide_male_2015m1to2020m9


drop _merge
xtset id date,monthly


label vari 自殺死亡率_総数（厚労省計算） "（厚労省計算）"
label vari 自殺死亡率_女 "（厚労省計算）"
label vari 自殺死亡率_男 "（厚労省計算）"
label vari 自殺者数_合計 "自殺者数合計　警察統計（自殺日・発見地）"

label vari 自殺者数_女 "自殺者数・女性　警察統計（自殺日・発見地）"
label vari 自殺者数_男 "自殺者数・男性　警察統計（自殺日・発見地）"

/// order

order id 都道府県 都道府県 date year month 自殺者数_合計 自殺者数_男 自殺者数_女 自殺死亡率_総数（厚労省計算） 自殺死亡率_男 自殺死亡率_女


save suicide_bothsex_2015m1to2020m9,replace

