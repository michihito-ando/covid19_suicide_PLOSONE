///////////////////////////////////////////
/// date 2020/9, 2020/12,2021/07/28,2022/01
/// 
//////////////////////


/// pc 
global mypc ""

///set cd

global cd_input  "$mypc\2020COVID_impact_R\R_for_web\input"
global cd_output  "$mypc\2020COVID_impact_R\R_for_web\output"

cd "$cd_output"

///////////////////////
/// Panel data   
/// input panel_suicide_2015m1to2020m9
/// kyujin_2016m1to2020m8  
/// jobseeker_total_2016m12020m9
/// prefecture_name prefecture_name_jp
/// Output:panel_suicide_kyujin

use panel_suicide_2015m1to2020m9,clear

merge 1:1 id date using kyujin_2016m1to2020m8 

drop _merge

///merge jobseeker_total_2016m12020m9

merge 1:1 id date using jobseeker_total_2016m12020m9

drop _merge
drop 都道府県 

///merge prefecture_name_jp

cd "$cd_input"

merge m:1 id using prefecture_name_jp

///merge prefecture_name


drop _merge

merge m:1 id  using prefecture_name
drop _merge

xtset id date,monthly

///  order variables

drop tot_suicide_ave2016to2018m male_suicide_ave2016to2018m female_suicide_ave2016to2018m tot_suicide_ave2017to2019m male_suicide_ave2017to2019m female_suicide_ave2017to2019m
order 都道府県 prefecture id month date year 自殺者数_合計 自殺者数_男 自殺者数_女 suicide_rate_mhlw suicide_rate_male_mhlw suicide_rate_female_mhlw yoy_suicide_rate_mhlw yoy_suicide_rate_male_mhlw yoy_suicide_rate_female_mhlw yo3y_base_total yo3y_base_male yo3y_base_female yo3y_suicide_rate_mhlw yo3y_suicide_rate_male_mhlw yo3y_suicide_rate_female_mhlw 有効求人倍率 有効求職者数_パート含む一般 有効求職者数_パート除く常用 有効求職者数_男女計_パートタイムを除く一般 有効求職者数_女 有効求職者数_男

xtset id date

/// This data is used for R analysis. 
/// See “preprocess_main.html”

cd "$cd_output"

save panel_suicide_kyujin,replace

