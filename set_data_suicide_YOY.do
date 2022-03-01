//////////////////////////////////////////
/// date 2020,9,20201202、20210728、20211227
/// This do-file make YOY diffrences in suicide rates.
/// input: suicide_bothsex_2015m1to2020m9
/// Final Output:  panel_suicide_2015m1to2020m9.dta

//////////////////////
/// mypc 

global mypc ""


///set cd

global cd_output  "$mypc\2020COVID_impact_R\R_for_web\output"

cd "$cd_output"


use suicide_bothsex_2015m1to2020m9 ,clear
xtset id date,monthly

/// bys id month: egen tot_suicide_ave2016to2018m = mean( suicide_rate_mhlw )
/// bys id month: egen tot_suicide_ave2016to2018m = mean( suicide_rate_mhlw )
/// 

/// rename. 

rename 自殺死亡率_総数（厚労省計算） suicide_rate_mhlw
rename 自殺死亡率_男 suicide_rate_male_mhlw
rename 自殺死亡率_女 suicide_rate_female_mhlw

/// 3year average 

///total

bys id month : egen tot_suicide_ave2016to2018m = mean( suicide_rate_mhlw ) if year <=2018 & year >=2016
sort id date
replace tot_suicide_ave2016to2018m = . if year <2018

bys id month: egen tot_suicide_ave2017to2019m = mean( suicide_rate_mhlw ) if year <=2019 & year  >=2017

sort id date
replace tot_suicide_ave2017to2019m = . if year <2019

/// male

bys id month : egen male_suicide_ave2016to2018m = mean( suicide_rate_male_mhlw ) if year <=2018 & year >=2016
sort id date
replace male_suicide_ave2016to2018m = . if year <2018

bys id month: egen male_suicide_ave2017to2019m = mean( suicide_rate_male_mhlw ) if year <=2019 & year  >=2017

sort id date
replace male_suicide_ave2017to2019m = . if year <2019

/// female

bys id month : egen female_suicide_ave2016to2018m = mean( suicide_rate_female_mhlw ) if year <=2018 & year >=2016
sort id date
replace female_suicide_ave2016to2018m = . if year <2018

bys id month: egen female_suicide_ave2017to2019m = mean( suicide_rate_female_mhlw ) if year <=2019 & year  >=2017

sort id date
replace female_suicide_ave2017to2019m = . if year <2019



/// Year on Year difference

bys id: gen yoy_suicide_rate_mhlw = suicide_rate_mhlw[_n] - suicide_rate_mhlw[_n-12] 
bys id: gen yoy_suicide_rate_male_mhlw= suicide_rate_male_mhlw[_n] - suicide_rate_male_mhlw[_n-12]
bys id: gen yoy_suicide_rate_female_mhlw = suicide_rate_female_mhlw[_n] - suicide_rate_female_mhlw[_n-12]

label vari yoy_suicide_rate_mhlw "Year on Year suicide_rate_mhlw"
label vari yoy_suicide_rate_male_mhlw "Year on Year suicide_rate_male_mhlw "
label vari yoy_suicide_rate_female_mhlw "Year on Year suicide_rate_female_mhlw"



/// Year on 3 Year average 

egen yo3y_base_total = rowtotal( tot_suicide_ave2017to2019m tot_suicide_ave2016to2018m )
replace yo3y_base_total=. if yo3y_base_total==0

egen yo3y_base_male = rowtotal( male_suicide_ave2016to2018m male_suicide_ave2017to2019m)
replace yo3y_base_male=. if yo3y_base_male==0

egen yo3y_base_female = rowtotal( female_suicide_ave2016to2018m female_suicide_ave2017to2019m)
replace yo3y_base_female=. if yo3y_base_female==0

bys id: gen yo3y_suicide_rate_mhlw = suicide_rate_mhlw[_n] - yo3y_base_total[_n-12] 
bys id: gen yo3y_suicide_rate_male_mhlw = suicide_rate_male_mhlw[_n] - yo3y_base_male[_n-12]
bys id: gen yo3y_suicide_rate_female_mhlw = suicide_rate_female_mhlw[_n] - yo3y_base_female[_n-12]

label vari yo3y_suicide_rate_mhlw "Year on 3 Year average suicide_rate_mhlw"
label vari yo3y_suicide_rate_male_mhlw "Year on 3 Year average suicide_rate_male_mhlw "
label vari yo3y_suicide_rate_female_mhlw "Year on 3 Year average suicide_rate_female_mhlw"


xtset id date,monthly
     

save panel_suicide_2015m1to2020m9,replace


