# DID estimation 設定

######Function list###################################
# OLS or WLS

## Outcome: suicide rate, public assistance recipients/recipient households, 
## unemployment benefit, Emergency Small Amount Funds, General Support Funds
## アウトカム：自殺率、生活保護、失業手当、緊急小口、総合支援
# dynamic_DID_OLS_notrend
# dynamic_DID_WLS_notrend
# dynamic_DID_OLS_trend  #緊急小口、総合支援では不使用
# dynamic_DID_WLS_trend #緊急小口、総合支援では不使用

## Outcome:Housing Security Benefit
## アウトカム：住居確保給付金
# dynamic_DID_jukyo_OLS
# dynamic_DID_jukyo_WLS


## Arrange Results/結果の整理
# DID_coefficients_main # main
# DID_coefficients_jukyo # Housing security benefit (2nd tier)
# DID_coefficients_loan  # Loans(2nd tier, Emergency Small Amount Funds, General Support Funds)
    
## Event study graph/イベントスタディグラフの作成（Markdown確認用）
# event_study_graph

# Merge results/結果の統合
## Labelling results/結果の統合・ラベル付け
#estimates_labeling_main (for suicide, UI and PA benefits)
#estimates_labeling_poverty (for 2nd-tier outcomes)
                      
## Event study graphs for the paper/イベントスタディグラフの作成（論文用）
#event_study_graph_bind_main

###DID estimation without covar######################################
                        
### 信頼区間の設定
significance_level <- 0.1 # 90% CI

                        
### OLS, no prefecture trends
# 2021Jul23  2018年分反映

dynamic_DID_OLS_notrend <- function(dataset, outcome_var, treat_var){
                          
estimatr::lm_robust(outcome_var ~ 
                      treat_var:date_2018_01 + 
                      treat_var:date_2018_02 +  
                      treat_var:date_2018_03 + 
                      treat_var:date_2018_04 + 
                      treat_var:date_2018_05 + 
                      treat_var:date_2018_06 + 
                      treat_var:date_2018_07 + 
                      treat_var:date_2018_08 +
                      treat_var:date_2018_09 + 
                      treat_var:date_2018_10 +
                      treat_var:date_2018_11 + 
                      treat_var:date_2018_12 + 
                      treat_var:date_2019_01 + 
                      treat_var:date_2019_02 +  
                      treat_var:date_2019_03 + 
                      treat_var:date_2019_04 + 
                      treat_var:date_2019_05 + 
                      treat_var:date_2019_06 + 
                      treat_var:date_2019_07 + 
                      treat_var:date_2019_08 +
                      treat_var:date_2019_09 + 
                      treat_var:date_2019_10 +
                      treat_var:date_2019_11 + 
                      treat_var:date_2019_12 + 
                      treat_var:date_2020_02 +
                      treat_var:date_2020_03 +
                      treat_var:date_2020_04 + 
                      treat_var:date_2020_05 +
                      treat_var:date_2020_06 + 
                      treat_var:date_2020_07 + 
                      treat_var:date_2020_08 + 
                      treat_var:date_2020_09,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level)}

                        
### With WLS, no prefecture trends

dynamic_DID_WLS_notrend <- function(dataset, outcome_var, treat_var){
                          
estimatr::lm_robust(outcome_var ~ 
                      treat_var:date_2018_01 + 
                      treat_var:date_2018_02 +  
                      treat_var:date_2018_03 + 
                      treat_var:date_2018_04 + 
                      treat_var:date_2018_05 + 
                      treat_var:date_2018_06 + 
                      treat_var:date_2018_07 + 
                      treat_var:date_2018_08 +
                      treat_var:date_2018_09 + 
                      treat_var:date_2018_10 +
                      treat_var:date_2018_11 + 
                      treat_var:date_2018_12 + 
                      treat_var:date_2019_01 + 
                      treat_var:date_2019_02 +  
                      treat_var:date_2019_03 + 
                      treat_var:date_2019_04 + 
                      treat_var:date_2019_05 + 
                      treat_var:date_2019_06 + 
                      treat_var:date_2019_07 + 
                      treat_var:date_2019_08 +
                      treat_var:date_2019_09 + 
                      treat_var:date_2019_10 +
                      treat_var:date_2019_11 + 
                      treat_var:date_2019_12 + 
                      treat_var:date_2020_02 +
                      treat_var:date_2020_03 +
                      treat_var:date_2020_04 + 
                      treat_var:date_2020_05 +
                      treat_var:date_2020_06 + 
                      treat_var:date_2020_07 + 
                      treat_var:date_2020_08 + 
                      treat_var:date_2020_09,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}

                        
### OLS, with prefecture trends

dynamic_DID_OLS_trend <- function(dataset, outcome_var, treat_var){
                          
estimatr::lm_robust(outcome_var ~ 
                      treat_var:date_2018_01 + 
                      treat_var:date_2018_02 +  
                      treat_var:date_2018_03 + 
                      treat_var:date_2018_04 + 
                      treat_var:date_2018_05 + 
                      treat_var:date_2018_06 + 
                      treat_var:date_2018_07 + 
                      treat_var:date_2018_08 +
                      treat_var:date_2018_09 + 
                      treat_var:date_2018_10 +
                      treat_var:date_2018_11 + 
                      treat_var:date_2018_12 + 
                      treat_var:date_2019_01 + 
                      treat_var:date_2019_02 +  
                      treat_var:date_2019_03 + 
                      treat_var:date_2019_04 + 
                      treat_var:date_2019_05 + 
                      treat_var:date_2019_06 + 
                      treat_var:date_2019_07 + 
                      treat_var:date_2019_08 +
                      treat_var:date_2019_09 + 
                      treat_var:date_2019_10 +
                      treat_var:date_2019_11 + 
                      treat_var:date_2019_12 + 
                      treat_var:date_2020_02 +
                      treat_var:date_2020_03 +
                      treat_var:date_2020_04 + 
                      treat_var:date_2020_05 +
                      treat_var:date_2020_06 + 
                      treat_var:date_2020_07 + 
                      treat_var:date_2020_08 + 
                      treat_var:date_2020_09 + 
                      as.factor(id):year_month_id, #pref linear trend,
                      fixed_effects = ~ factor(id)+factor(date),  
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level)}

### With WLS, with prefecture trends

dynamic_DID_WLS_trend <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ 
                        treat_var:date_2018_01 + 
                        treat_var:date_2018_02 +  
                        treat_var:date_2018_03 + 
                        treat_var:date_2018_04 + 
                        treat_var:date_2018_05 + 
                        treat_var:date_2018_06 + 
                        treat_var:date_2018_07 + 
                        treat_var:date_2018_08 +
                        treat_var:date_2018_09 + 
                        treat_var:date_2018_10 +
                        treat_var:date_2018_11 + 
                        treat_var:date_2018_12 + 
                        treat_var:date_2019_01 + 
                        treat_var:date_2019_02 +  
                        treat_var:date_2019_03 + 
                        treat_var:date_2019_04 + 
                        treat_var:date_2019_05 + 
                        treat_var:date_2019_06 + 
                        treat_var:date_2019_07 + 
                        treat_var:date_2019_08 +
                        treat_var:date_2019_09 + 
                        treat_var:date_2019_10 +
                        treat_var:date_2019_11 + 
                        treat_var:date_2019_12 + 
                        treat_var:date_2020_02 +
                        treat_var:date_2020_03 +
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 + 
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09 + 
                        as.factor(id):year_month_id, #pref linear trend,
                        fixed_effects = ~ factor(id)+factor(date), 
                        data = dataset, 
                        se_type = "stata", 
                        clusters = id, 
                        alpha = significance_level,
                        weights = population_total)}

                        
                        
## DID estimation for 住居確保
                        
#住居確保給付金は、201901~201903と202004-202006しかデータがないので、201903を参照年とする。
                        
### OLS

dynamic_DID_jukyo_OLS <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ treat_var:date_2019_01 + 
                        treat_var:date_2019_02 +
                        treat_var:date_2020_04 +
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 +
                        treat_var:date_2020_07 +
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset,
                      se_type = "stata",
                      clusters = id,
                      alpha = significance_level)}

### WLS

dynamic_DID_jukyo_WLS <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ 
                        treat_var:date_2019_01 + 
                        treat_var:date_2019_02 +  
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 +
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09,
                        fixed_effects = ~ factor(id)+factor(date), 
                        data = dataset, 
                        se_type = "stata", 
                        clusters = id, 
                        alpha = significance_level,
                        weights = population_total)}

###DID estimation with eight covar interected with post-covid-month dummies ####################
# 2021Aug6  
### OLS, no prefecture trends
dynamic_DID_OLS_notrend_covar8Xcovid_months <- function(dataset, outcome_var, treat_var){
  
  estimatr::lm_robust(outcome_var ~ treat_var:date_2018_01 + 
                        treat_var:date_2018_02 +  
                        treat_var:date_2018_03 + 
                        treat_var:date_2018_04 + 
                        treat_var:date_2018_05 + 
                        treat_var:date_2018_06 + 
                        treat_var:date_2018_07 + 
                        treat_var:date_2018_08 +
                        treat_var:date_2018_09 + 
                        treat_var:date_2018_10 +
                        treat_var:date_2018_11 + 
                        treat_var:date_2018_12 + 
                        treat_var:date_2019_01 + 
                        treat_var:date_2019_02 +  
                        treat_var:date_2019_03 + 
                        treat_var:date_2019_04 + 
                        treat_var:date_2019_05 + 
                        treat_var:date_2019_06 + 
                        treat_var:date_2019_07 + 
                        treat_var:date_2019_08 +
                        treat_var:date_2019_09 + 
                        treat_var:date_2019_10 +
                        treat_var:date_2019_11 + 
                        treat_var:date_2019_12 + 
                        treat_var:date_2020_02 +
                        treat_var:date_2020_03 +
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 + 
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09 + 
                        
                        google_mobility_index_2020may:date_2020_02 +
                        google_mobility_index_2020may:date_2020_03 +
                        google_mobility_index_2020may:date_2020_04 + 
                        google_mobility_index_2020may:date_2020_05 +
                        google_mobility_index_2020may:date_2020_06 + 
                        google_mobility_index_2020may:date_2020_07 + 
                        google_mobility_index_2020may:date_2020_08 + 
                        google_mobility_index_2020may:date_2020_09 + 
                        
                        infection_rate_cumulative2020jun:date_2020_02 +
                        infection_rate_cumulative2020jun:date_2020_03 +
                        infection_rate_cumulative2020jun:date_2020_04 + 
                        infection_rate_cumulative2020jun:date_2020_05 +
                        infection_rate_cumulative2020jun:date_2020_06 + 
                        infection_rate_cumulative2020jun:date_2020_07 + 
                        infection_rate_cumulative2020jun:date_2020_08 + 
                        infection_rate_cumulative2020jun:date_2020_09 + 
                        
                        death_rate_cumulative2020jun:date_2020_02 +
                        death_rate_cumulative2020jun:date_2020_03 +
                        death_rate_cumulative2020jun:date_2020_04 + 
                        death_rate_cumulative2020jun:date_2020_05 +
                        death_rate_cumulative2020jun:date_2020_06 + 
                        death_rate_cumulative2020jun:date_2020_07 + 
                        death_rate_cumulative2020jun:date_2020_08 + 
                        death_rate_cumulative2020jun:date_2020_09 + 
                        
                        Population_per_1_km_2_of_inhabitable_area:date_2020_02 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_03 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_04 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_05 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_06 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_07 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_08 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_09 + 
                        
                        Secondary_industry_ratio:date_2020_02 +
                        Secondary_industry_ratio:date_2020_03 +
                        Secondary_industry_ratio:date_2020_04 + 
                        Secondary_industry_ratio:date_2020_05 +
                        Secondary_industry_ratio:date_2020_06 + 
                        Secondary_industry_ratio:date_2020_07 + 
                        Secondary_industry_ratio:date_2020_08 + 
                        Secondary_industry_ratio:date_2020_09 + 
                        
                        Tertiary_industry_ratio:date_2020_02 +
                        Tertiary_industry_ratio:date_2020_03 +
                        Tertiary_industry_ratio:date_2020_04 + 
                        Tertiary_industry_ratio:date_2020_05 +
                        Tertiary_industry_ratio:date_2020_06 + 
                        Tertiary_industry_ratio:date_2020_07 + 
                        Tertiary_industry_ratio:date_2020_08 + 
                        Tertiary_industry_ratio:date_2020_09 + 
                        
                        Total_population:date_2020_02 +
                        Total_population:date_2020_03 +
                        Total_population:date_2020_04 + 
                        Total_population:date_2020_05 +
                        Total_population:date_2020_06 + 
                        Total_population:date_2020_07 + 
                        Total_population:date_2020_08 + 
                        Total_population:date_2020_09 + 
                        
                        Ratio_of_aged_population:date_2020_02 +
                        Ratio_of_aged_population:date_2020_03 +
                        Ratio_of_aged_population:date_2020_04 + 
                        Ratio_of_aged_population:date_2020_05 +
                        Ratio_of_aged_population:date_2020_06 + 
                        Ratio_of_aged_population:date_2020_07 + 
                        Ratio_of_aged_population:date_2020_08 + 
                        Ratio_of_aged_population:date_2020_09,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level)}

### With WLS, no prefecture trends
dynamic_DID_WLS_notrend_covar8Xcovid_months <- function(dataset, outcome_var, treat_var){
  
  estimatr::lm_robust(outcome_var ~ 
                        treat_var:date_2018_01 + 
                        treat_var:date_2018_02 +  
                        treat_var:date_2018_03 + 
                        treat_var:date_2018_04 + 
                        treat_var:date_2018_05 + 
                        treat_var:date_2018_06 + 
                        treat_var:date_2018_07 + 
                        treat_var:date_2018_08 +
                        treat_var:date_2018_09 + 
                        treat_var:date_2018_10 +
                        treat_var:date_2018_11 + 
                        treat_var:date_2018_12 + 
                        treat_var:date_2019_01 + 
                        treat_var:date_2019_02 +  
                        treat_var:date_2019_03 + 
                        treat_var:date_2019_04 + 
                        treat_var:date_2019_05 + 
                        treat_var:date_2019_06 + 
                        treat_var:date_2019_07 + 
                        treat_var:date_2019_08 +
                        treat_var:date_2019_09 + 
                        treat_var:date_2019_10 +
                        treat_var:date_2019_11 + 
                        treat_var:date_2019_12 + 
                        treat_var:date_2020_02 +
                        treat_var:date_2020_03 +
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 + 
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09 + 
                        
                        google_mobility_index_2020may:date_2020_02 +
                        google_mobility_index_2020may:date_2020_03 +
                        google_mobility_index_2020may:date_2020_04 + 
                        google_mobility_index_2020may:date_2020_05 +
                        google_mobility_index_2020may:date_2020_06 + 
                        google_mobility_index_2020may:date_2020_07 + 
                        google_mobility_index_2020may:date_2020_08 + 
                        google_mobility_index_2020may:date_2020_09 + 
                        
                        infection_rate_cumulative2020jun:date_2020_02 +
                        infection_rate_cumulative2020jun:date_2020_03 +
                        infection_rate_cumulative2020jun:date_2020_04 + 
                        infection_rate_cumulative2020jun:date_2020_05 +
                        infection_rate_cumulative2020jun:date_2020_06 + 
                        infection_rate_cumulative2020jun:date_2020_07 + 
                        infection_rate_cumulative2020jun:date_2020_08 + 
                        infection_rate_cumulative2020jun:date_2020_09 + 
                        
                        death_rate_cumulative2020jun:date_2020_02 +
                        death_rate_cumulative2020jun:date_2020_03 +
                        death_rate_cumulative2020jun:date_2020_04 + 
                        death_rate_cumulative2020jun:date_2020_05 +
                        death_rate_cumulative2020jun:date_2020_06 + 
                        death_rate_cumulative2020jun:date_2020_07 + 
                        death_rate_cumulative2020jun:date_2020_08 + 
                        death_rate_cumulative2020jun:date_2020_09 + 
                        
                        Population_per_1_km_2_of_inhabitable_area:date_2020_02 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_03 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_04 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_05 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_06 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_07 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_08 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_09 + 
                        
                        Secondary_industry_ratio:date_2020_02 +
                        Secondary_industry_ratio:date_2020_03 +
                        Secondary_industry_ratio:date_2020_04 + 
                        Secondary_industry_ratio:date_2020_05 +
                        Secondary_industry_ratio:date_2020_06 + 
                        Secondary_industry_ratio:date_2020_07 + 
                        Secondary_industry_ratio:date_2020_08 + 
                        Secondary_industry_ratio:date_2020_09 + 
                        
                        Tertiary_industry_ratio:date_2020_02 +
                        Tertiary_industry_ratio:date_2020_03 +
                        Tertiary_industry_ratio:date_2020_04 + 
                        Tertiary_industry_ratio:date_2020_05 +
                        Tertiary_industry_ratio:date_2020_06 + 
                        Tertiary_industry_ratio:date_2020_07 + 
                        Tertiary_industry_ratio:date_2020_08 + 
                        Tertiary_industry_ratio:date_2020_09 + 
                        
                        Total_population:date_2020_02 +
                        Total_population:date_2020_03 +
                        Total_population:date_2020_04 + 
                        Total_population:date_2020_05 +
                        Total_population:date_2020_06 + 
                        Total_population:date_2020_07 + 
                        Total_population:date_2020_08 + 
                        Total_population:date_2020_09 + 
                        
                        Ratio_of_aged_population:date_2020_02 +
                        Ratio_of_aged_population:date_2020_03 +
                        Ratio_of_aged_population:date_2020_04 + 
                        Ratio_of_aged_population:date_2020_05 +
                        Ratio_of_aged_population:date_2020_06 + 
                        Ratio_of_aged_population:date_2020_07 + 
                        Ratio_of_aged_population:date_2020_08 + 
                        Ratio_of_aged_population:date_2020_09,
                        

                      fixed_effects = ~ factor(id)+factor(date),  
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}

### OLS, with prefecture trends
dynamic_DID_OLS_trend_covar8Xcovid_months <- function(dataset, outcome_var, treat_var){
  
  estimatr::lm_robust(outcome_var ~ 
                        treat_var:date_2018_01 + 
                        treat_var:date_2018_02 +  
                        treat_var:date_2018_03 + 
                        treat_var:date_2018_04 + 
                        treat_var:date_2018_05 + 
                        treat_var:date_2018_06 + 
                        treat_var:date_2018_07 + 
                        treat_var:date_2018_08 +
                        treat_var:date_2018_09 + 
                        treat_var:date_2018_10 +
                        treat_var:date_2018_11 + 
                        treat_var:date_2018_12 + 
                        treat_var:date_2019_01 + 
                        treat_var:date_2019_02 +  
                        treat_var:date_2019_03 + 
                        treat_var:date_2019_04 + 
                        treat_var:date_2019_05 + 
                        treat_var:date_2019_06 + 
                        treat_var:date_2019_07 + 
                        treat_var:date_2019_08 +
                        treat_var:date_2019_09 + 
                        treat_var:date_2019_10 +
                        treat_var:date_2019_11 + 
                        treat_var:date_2019_12 + 
                        treat_var:date_2020_02 +
                        treat_var:date_2020_03 +
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 + 
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09 + 
                        
                        google_mobility_index_2020may:date_2020_02 +
                        google_mobility_index_2020may:date_2020_03 +
                        google_mobility_index_2020may:date_2020_04 + 
                        google_mobility_index_2020may:date_2020_05 +
                        google_mobility_index_2020may:date_2020_06 + 
                        google_mobility_index_2020may:date_2020_07 + 
                        google_mobility_index_2020may:date_2020_08 + 
                        google_mobility_index_2020may:date_2020_09 + 
                        
                        infection_rate_cumulative2020jun:date_2020_02 +
                        infection_rate_cumulative2020jun:date_2020_03 +
                        infection_rate_cumulative2020jun:date_2020_04 + 
                        infection_rate_cumulative2020jun:date_2020_05 +
                        infection_rate_cumulative2020jun:date_2020_06 + 
                        infection_rate_cumulative2020jun:date_2020_07 + 
                        infection_rate_cumulative2020jun:date_2020_08 + 
                        infection_rate_cumulative2020jun:date_2020_09 + 
                        
                        death_rate_cumulative2020jun:date_2020_02 +
                        death_rate_cumulative2020jun:date_2020_03 +
                        death_rate_cumulative2020jun:date_2020_04 + 
                        death_rate_cumulative2020jun:date_2020_05 +
                        death_rate_cumulative2020jun:date_2020_06 + 
                        death_rate_cumulative2020jun:date_2020_07 + 
                        death_rate_cumulative2020jun:date_2020_08 + 
                        death_rate_cumulative2020jun:date_2020_09 + 
                        
                        Population_per_1_km_2_of_inhabitable_area:date_2020_02 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_03 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_04 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_05 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_06 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_07 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_08 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_09 + 
                        
                        Secondary_industry_ratio:date_2020_02 +
                        Secondary_industry_ratio:date_2020_03 +
                        Secondary_industry_ratio:date_2020_04 + 
                        Secondary_industry_ratio:date_2020_05 +
                        Secondary_industry_ratio:date_2020_06 + 
                        Secondary_industry_ratio:date_2020_07 + 
                        Secondary_industry_ratio:date_2020_08 + 
                        Secondary_industry_ratio:date_2020_09 + 
                        
                        Tertiary_industry_ratio:date_2020_02 +
                        Tertiary_industry_ratio:date_2020_03 +
                        Tertiary_industry_ratio:date_2020_04 + 
                        Tertiary_industry_ratio:date_2020_05 +
                        Tertiary_industry_ratio:date_2020_06 + 
                        Tertiary_industry_ratio:date_2020_07 + 
                        Tertiary_industry_ratio:date_2020_08 + 
                        Tertiary_industry_ratio:date_2020_09 + 
                        
                        Total_population:date_2020_02 +
                        Total_population:date_2020_03 +
                        Total_population:date_2020_04 + 
                        Total_population:date_2020_05 +
                        Total_population:date_2020_06 + 
                        Total_population:date_2020_07 + 
                        Total_population:date_2020_08 + 
                        Total_population:date_2020_09 + 
                        
                        Ratio_of_aged_population:date_2020_02 +
                        Ratio_of_aged_population:date_2020_03 +
                        Ratio_of_aged_population:date_2020_04 + 
                        Ratio_of_aged_population:date_2020_05 +
                        Ratio_of_aged_population:date_2020_06 + 
                        Ratio_of_aged_population:date_2020_07 + 
                        Ratio_of_aged_population:date_2020_08 + 
                        Ratio_of_aged_population:date_2020_09 +
                
                        as.factor(id):year_month_id, #pref linear trend,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level)}

### With WLS, with prefecture trends
dynamic_DID_WLS_trend_covar8Xcovid_months <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ 
                        treat_var:date_2018_01 + 
                        treat_var:date_2018_02 +  
                        treat_var:date_2018_03 + 
                        treat_var:date_2018_04 + 
                        treat_var:date_2018_05 + 
                        treat_var:date_2018_06 + 
                        treat_var:date_2018_07 + 
                        treat_var:date_2018_08 +
                        treat_var:date_2018_09 + 
                        treat_var:date_2018_10 +
                        treat_var:date_2018_11 + 
                        treat_var:date_2018_12 + 
                        treat_var:date_2019_01 + 
                        treat_var:date_2019_02 +  
                        treat_var:date_2019_03 + 
                        treat_var:date_2019_04 + 
                        treat_var:date_2019_05 + 
                        treat_var:date_2019_06 + 
                        treat_var:date_2019_07 + 
                        treat_var:date_2019_08 +
                        treat_var:date_2019_09 + 
                        treat_var:date_2019_10 +
                        treat_var:date_2019_11 + 
                        treat_var:date_2019_12 + 
                        treat_var:date_2020_02 +
                        treat_var:date_2020_03 +
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 + 
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09 + 
                        
                        google_mobility_index_2020may:date_2020_02 +
                        google_mobility_index_2020may:date_2020_03 +
                        google_mobility_index_2020may:date_2020_04 + 
                        google_mobility_index_2020may:date_2020_05 +
                        google_mobility_index_2020may:date_2020_06 + 
                        google_mobility_index_2020may:date_2020_07 + 
                        google_mobility_index_2020may:date_2020_08 + 
                        google_mobility_index_2020may:date_2020_09 + 
                        
                        infection_rate_cumulative2020jun:date_2020_02 +
                        infection_rate_cumulative2020jun:date_2020_03 +
                        infection_rate_cumulative2020jun:date_2020_04 + 
                        infection_rate_cumulative2020jun:date_2020_05 +
                        infection_rate_cumulative2020jun:date_2020_06 + 
                        infection_rate_cumulative2020jun:date_2020_07 + 
                        infection_rate_cumulative2020jun:date_2020_08 + 
                        infection_rate_cumulative2020jun:date_2020_09 + 
                        
                        death_rate_cumulative2020jun:date_2020_02 +
                        death_rate_cumulative2020jun:date_2020_03 +
                        death_rate_cumulative2020jun:date_2020_04 + 
                        death_rate_cumulative2020jun:date_2020_05 +
                        death_rate_cumulative2020jun:date_2020_06 + 
                        death_rate_cumulative2020jun:date_2020_07 + 
                        death_rate_cumulative2020jun:date_2020_08 + 
                        death_rate_cumulative2020jun:date_2020_09 + 
                        
                        Population_per_1_km_2_of_inhabitable_area:date_2020_02 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_03 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_04 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_05 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_06 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_07 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_08 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_09 + 
                        
                        Secondary_industry_ratio:date_2020_02 +
                        Secondary_industry_ratio:date_2020_03 +
                        Secondary_industry_ratio:date_2020_04 + 
                        Secondary_industry_ratio:date_2020_05 +
                        Secondary_industry_ratio:date_2020_06 + 
                        Secondary_industry_ratio:date_2020_07 + 
                        Secondary_industry_ratio:date_2020_08 + 
                        Secondary_industry_ratio:date_2020_09 + 
                        
                        Tertiary_industry_ratio:date_2020_02 +
                        Tertiary_industry_ratio:date_2020_03 +
                        Tertiary_industry_ratio:date_2020_04 + 
                        Tertiary_industry_ratio:date_2020_05 +
                        Tertiary_industry_ratio:date_2020_06 + 
                        Tertiary_industry_ratio:date_2020_07 + 
                        Tertiary_industry_ratio:date_2020_08 + 
                        Tertiary_industry_ratio:date_2020_09 + 
                        
                        Total_population:date_2020_02 +
                        Total_population:date_2020_03 +
                        Total_population:date_2020_04 + 
                        Total_population:date_2020_05 +
                        Total_population:date_2020_06 + 
                        Total_population:date_2020_07 + 
                        Total_population:date_2020_08 + 
                        Total_population:date_2020_09 + 
                        
                        Ratio_of_aged_population:date_2020_02 +
                        Ratio_of_aged_population:date_2020_03 +
                        Ratio_of_aged_population:date_2020_04 + 
                        Ratio_of_aged_population:date_2020_05 +
                        Ratio_of_aged_population:date_2020_06 + 
                        Ratio_of_aged_population:date_2020_07 + 
                        Ratio_of_aged_population:date_2020_08 + 
                        Ratio_of_aged_population:date_2020_09 +
                      
                        as.factor(id):year_month_id, #pref linear trend,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}

## DID estimation for 住居確保

#住居確保給付金は、201901~201903と202004-202006しかデータがないので、201903を参照年とする。

### OLS

dynamic_DID_jukyo_OLS_covar8Xcovid_months <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ 
                        treat_var:date_2019_01 + 
                        treat_var:date_2019_02 +
                        treat_var:date_2020_04 +
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 +
                        treat_var:date_2020_07 +
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09 +
                        
                        google_mobility_index_2020may:date_2020_04 + 
                        google_mobility_index_2020may:date_2020_05 +
                        google_mobility_index_2020may:date_2020_06 + 
                        google_mobility_index_2020may:date_2020_07 + 
                        google_mobility_index_2020may:date_2020_08 + 
                        google_mobility_index_2020may:date_2020_09 + 
                        
                        infection_rate_cumulative2020jun:date_2020_04 + 
                        infection_rate_cumulative2020jun:date_2020_05 +
                        infection_rate_cumulative2020jun:date_2020_06 + 
                        infection_rate_cumulative2020jun:date_2020_07 + 
                        infection_rate_cumulative2020jun:date_2020_08 + 
                        infection_rate_cumulative2020jun:date_2020_09 + 
                        
                        death_rate_cumulative2020jun:date_2020_04 + 
                        death_rate_cumulative2020jun:date_2020_05 +
                        death_rate_cumulative2020jun:date_2020_06 + 
                        death_rate_cumulative2020jun:date_2020_07 + 
                        death_rate_cumulative2020jun:date_2020_08 + 
                        death_rate_cumulative2020jun:date_2020_09 + 
                        
                        Population_per_1_km_2_of_inhabitable_area:date_2020_04 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_05 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_06 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_07 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_08 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_09 + 
                        
                        Secondary_industry_ratio:date_2020_04 + 
                        Secondary_industry_ratio:date_2020_05 +
                        Secondary_industry_ratio:date_2020_06 + 
                        Secondary_industry_ratio:date_2020_07 + 
                        Secondary_industry_ratio:date_2020_08 + 
                        Secondary_industry_ratio:date_2020_09 + 
                        
                        Tertiary_industry_ratio:date_2020_04 + 
                        Tertiary_industry_ratio:date_2020_05 +
                        Tertiary_industry_ratio:date_2020_06 + 
                        Tertiary_industry_ratio:date_2020_07 + 
                        Tertiary_industry_ratio:date_2020_08 + 
                        Tertiary_industry_ratio:date_2020_09 + 
                        
                        Total_population:date_2020_04 + 
                        Total_population:date_2020_05 +
                        Total_population:date_2020_06 + 
                        Total_population:date_2020_07 + 
                        Total_population:date_2020_08 + 
                        Total_population:date_2020_09 + 
                        
                        Ratio_of_aged_population:date_2020_04 + 
                        Ratio_of_aged_population:date_2020_05 +
                        Ratio_of_aged_population:date_2020_06 + 
                        Ratio_of_aged_population:date_2020_07 + 
                        Ratio_of_aged_population:date_2020_08 + 
                        Ratio_of_aged_population:date_2020_09, 
                        
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset,
                      se_type = "stata",
                      clusters = id,
                      alpha = significance_level)}

### WLS

dynamic_DID_jukyo_WLS_covar8Xcovid_months <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ 
                        treat_var:date_2019_01 + 
                        treat_var:date_2019_02 +  
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 +
                        treat_var:date_2020_08 +
                        treat_var:date_2020_09 + 
                        
                        google_mobility_index_2020may:date_2020_04 + 
                        google_mobility_index_2020may:date_2020_05 +
                        google_mobility_index_2020may:date_2020_06 + 
                        google_mobility_index_2020may:date_2020_07 + 
                        google_mobility_index_2020may:date_2020_08 + 
                        google_mobility_index_2020may:date_2020_09 + 
                        
                        infection_rate_cumulative2020jun:date_2020_04 + 
                        infection_rate_cumulative2020jun:date_2020_05 +
                        infection_rate_cumulative2020jun:date_2020_06 + 
                        infection_rate_cumulative2020jun:date_2020_07 + 
                        infection_rate_cumulative2020jun:date_2020_08 + 
                        infection_rate_cumulative2020jun:date_2020_09 + 
                        
                        death_rate_cumulative2020jun:date_2020_04 + 
                        death_rate_cumulative2020jun:date_2020_05 +
                        death_rate_cumulative2020jun:date_2020_06 + 
                        death_rate_cumulative2020jun:date_2020_07 + 
                        death_rate_cumulative2020jun:date_2020_08 + 
                        death_rate_cumulative2020jun:date_2020_09 + 
                        
                        Population_per_1_km_2_of_inhabitable_area:date_2020_04 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_05 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_06 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_07 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_08 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_09 + 
                        
                        Secondary_industry_ratio:date_2020_04 + 
                        Secondary_industry_ratio:date_2020_05 +
                        Secondary_industry_ratio:date_2020_06 + 
                        Secondary_industry_ratio:date_2020_07 + 
                        Secondary_industry_ratio:date_2020_08 + 
                        Secondary_industry_ratio:date_2020_09 + 
                        
                        Tertiary_industry_ratio:date_2020_04 + 
                        Tertiary_industry_ratio:date_2020_05 +
                        Tertiary_industry_ratio:date_2020_06 + 
                        Tertiary_industry_ratio:date_2020_07 + 
                        Tertiary_industry_ratio:date_2020_08 + 
                        Tertiary_industry_ratio:date_2020_09 + 
                        
                        Total_population:date_2020_04 + 
                        Total_population:date_2020_05 +
                        Total_population:date_2020_06 + 
                        Total_population:date_2020_07 + 
                        Total_population:date_2020_08 + 
                        Total_population:date_2020_09 + 
                        
                        Ratio_of_aged_population:date_2020_04 + 
                        Ratio_of_aged_population:date_2020_05 +
                        Ratio_of_aged_population:date_2020_06 + 
                        Ratio_of_aged_population:date_2020_07 + 
                        Ratio_of_aged_population:date_2020_08 + 
                        Ratio_of_aged_population:date_2020_09,
                      
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}

## DID estimation, only post-COVID estimates, monthly ##########


### With WLS, without prefecture trends(Used only for loan)

dynamic_onlypost_DID_WLS_notrend <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~  
                        treat_var:date_2020_02 +
                        treat_var:date_2020_03 +
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 + 
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}


### With WLS, without prefecture trends
dynamic_onlypost_DID_WLS_notrend_covar8Xcovid_months <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ 
                        
                        treat_var:date_2020_02 +
                        treat_var:date_2020_03 +
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 + 
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09 + 
                        
                        google_mobility_index_2020may:date_2020_02 +
                        google_mobility_index_2020may:date_2020_03 +
                        google_mobility_index_2020may:date_2020_04 + 
                        google_mobility_index_2020may:date_2020_05 +
                        google_mobility_index_2020may:date_2020_06 + 
                        google_mobility_index_2020may:date_2020_07 + 
                        google_mobility_index_2020may:date_2020_08 + 
                        google_mobility_index_2020may:date_2020_09 + 
                        
                        infection_rate_cumulative2020jun:date_2020_02 +
                        infection_rate_cumulative2020jun:date_2020_03 +
                        infection_rate_cumulative2020jun:date_2020_04 + 
                        infection_rate_cumulative2020jun:date_2020_05 +
                        infection_rate_cumulative2020jun:date_2020_06 + 
                        infection_rate_cumulative2020jun:date_2020_07 + 
                        infection_rate_cumulative2020jun:date_2020_08 + 
                        infection_rate_cumulative2020jun:date_2020_09 + 
                        
                        death_rate_cumulative2020jun:date_2020_02 +
                        death_rate_cumulative2020jun:date_2020_03 +
                        death_rate_cumulative2020jun:date_2020_04 + 
                        death_rate_cumulative2020jun:date_2020_05 +
                        death_rate_cumulative2020jun:date_2020_06 + 
                        death_rate_cumulative2020jun:date_2020_07 + 
                        death_rate_cumulative2020jun:date_2020_08 + 
                        death_rate_cumulative2020jun:date_2020_09 + 
                        
                        Population_per_1_km_2_of_inhabitable_area:date_2020_02 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_03 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_04 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_05 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_06 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_07 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_08 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_09 + 
                        
                        Secondary_industry_ratio:date_2020_02 +
                        Secondary_industry_ratio:date_2020_03 +
                        Secondary_industry_ratio:date_2020_04 + 
                        Secondary_industry_ratio:date_2020_05 +
                        Secondary_industry_ratio:date_2020_06 + 
                        Secondary_industry_ratio:date_2020_07 + 
                        Secondary_industry_ratio:date_2020_08 + 
                        Secondary_industry_ratio:date_2020_09 + 
                        
                        Tertiary_industry_ratio:date_2020_02 +
                        Tertiary_industry_ratio:date_2020_03 +
                        Tertiary_industry_ratio:date_2020_04 + 
                        Tertiary_industry_ratio:date_2020_05 +
                        Tertiary_industry_ratio:date_2020_06 + 
                        Tertiary_industry_ratio:date_2020_07 + 
                        Tertiary_industry_ratio:date_2020_08 + 
                        Tertiary_industry_ratio:date_2020_09 + 
                        
                        Total_population:date_2020_02 +
                        Total_population:date_2020_03 +
                        Total_population:date_2020_04 + 
                        Total_population:date_2020_05 +
                        Total_population:date_2020_06 + 
                        Total_population:date_2020_07 + 
                        Total_population:date_2020_08 + 
                        Total_population:date_2020_09 + 
                        
                        Ratio_of_aged_population:date_2020_02 +
                        Ratio_of_aged_population:date_2020_03 +
                        Ratio_of_aged_population:date_2020_04 + 
                        Ratio_of_aged_population:date_2020_05 +
                        Ratio_of_aged_population:date_2020_06 + 
                        Ratio_of_aged_population:date_2020_07 + 
                        Ratio_of_aged_population:date_2020_08 + 
                        Ratio_of_aged_population:date_2020_09,

                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}


### Jukyo WLS

dynamic_onlypost_DID_jukyo_WLS <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ 
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 +
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09,
                 
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}


### With WLS, with prefecture trends

dynamic_onlypost_DID_WLS_trend <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~  
                        treat_var:date_2020_02 +
                        treat_var:date_2020_03 +
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 + 
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09 +
                        as.factor(id):year_month_id, #pref linear trend,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}


### With WLS, with prefecture trends
dynamic_onlypost_DID_WLS_trend_covar8Xcovid_months <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ 
                        
                        treat_var:date_2020_02 +
                        treat_var:date_2020_03 +
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 + 
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09 + 
                        
                        google_mobility_index_2020may:date_2020_02 +
                        google_mobility_index_2020may:date_2020_03 +
                        google_mobility_index_2020may:date_2020_04 + 
                        google_mobility_index_2020may:date_2020_05 +
                        google_mobility_index_2020may:date_2020_06 + 
                        google_mobility_index_2020may:date_2020_07 + 
                        google_mobility_index_2020may:date_2020_08 + 
                        google_mobility_index_2020may:date_2020_09 + 
                        
                        infection_rate_cumulative2020jun:date_2020_02 +
                        infection_rate_cumulative2020jun:date_2020_03 +
                        infection_rate_cumulative2020jun:date_2020_04 + 
                        infection_rate_cumulative2020jun:date_2020_05 +
                        infection_rate_cumulative2020jun:date_2020_06 + 
                        infection_rate_cumulative2020jun:date_2020_07 + 
                        infection_rate_cumulative2020jun:date_2020_08 + 
                        infection_rate_cumulative2020jun:date_2020_09 + 
                        
                        death_rate_cumulative2020jun:date_2020_02 +
                        death_rate_cumulative2020jun:date_2020_03 +
                        death_rate_cumulative2020jun:date_2020_04 + 
                        death_rate_cumulative2020jun:date_2020_05 +
                        death_rate_cumulative2020jun:date_2020_06 + 
                        death_rate_cumulative2020jun:date_2020_07 + 
                        death_rate_cumulative2020jun:date_2020_08 + 
                        death_rate_cumulative2020jun:date_2020_09 + 
                        
                        Population_per_1_km_2_of_inhabitable_area:date_2020_02 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_03 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_04 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_05 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_06 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_07 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_08 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_09 + 
                        
                        Secondary_industry_ratio:date_2020_02 +
                        Secondary_industry_ratio:date_2020_03 +
                        Secondary_industry_ratio:date_2020_04 + 
                        Secondary_industry_ratio:date_2020_05 +
                        Secondary_industry_ratio:date_2020_06 + 
                        Secondary_industry_ratio:date_2020_07 + 
                        Secondary_industry_ratio:date_2020_08 + 
                        Secondary_industry_ratio:date_2020_09 + 
                        
                        Tertiary_industry_ratio:date_2020_02 +
                        Tertiary_industry_ratio:date_2020_03 +
                        Tertiary_industry_ratio:date_2020_04 + 
                        Tertiary_industry_ratio:date_2020_05 +
                        Tertiary_industry_ratio:date_2020_06 + 
                        Tertiary_industry_ratio:date_2020_07 + 
                        Tertiary_industry_ratio:date_2020_08 + 
                        Tertiary_industry_ratio:date_2020_09 + 
                        
                        Total_population:date_2020_02 +
                        Total_population:date_2020_03 +
                        Total_population:date_2020_04 + 
                        Total_population:date_2020_05 +
                        Total_population:date_2020_06 + 
                        Total_population:date_2020_07 + 
                        Total_population:date_2020_08 + 
                        Total_population:date_2020_09 + 
                        
                        Ratio_of_aged_population:date_2020_02 +
                        Ratio_of_aged_population:date_2020_03 +
                        Ratio_of_aged_population:date_2020_04 + 
                        Ratio_of_aged_population:date_2020_05 +
                        Ratio_of_aged_population:date_2020_06 + 
                        Ratio_of_aged_population:date_2020_07 + 
                        Ratio_of_aged_population:date_2020_08 + 
                        Ratio_of_aged_population:date_2020_09 +
                        as.factor(id):year_month_id, #pref linear trend,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}


### Jukyo WLS

dynamic_onlypost_DID_jukyo_WLS <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ 
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 +
                        treat_var:date_2020_08 + 
                        treat_var:date_2020_09,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}


### WLS

dynamic_onlypost_DID_jukyo_WLS_covar8Xcovid_months <- function(dataset, outcome_var, treat_var){
  estimatr::lm_robust(outcome_var ~ 
                        
                        treat_var:date_2020_04 + 
                        treat_var:date_2020_05 +
                        treat_var:date_2020_06 + 
                        treat_var:date_2020_07 +
                        treat_var:date_2020_08 +
                        treat_var:date_2020_09 + 
                        
                        google_mobility_index_2020may:date_2020_04 + 
                        google_mobility_index_2020may:date_2020_05 +
                        google_mobility_index_2020may:date_2020_06 + 
                        google_mobility_index_2020may:date_2020_07 + 
                        google_mobility_index_2020may:date_2020_08 + 
                        google_mobility_index_2020may:date_2020_09 + 
                        
                        infection_rate_cumulative2020jun:date_2020_04 + 
                        infection_rate_cumulative2020jun:date_2020_05 +
                        infection_rate_cumulative2020jun:date_2020_06 + 
                        infection_rate_cumulative2020jun:date_2020_07 + 
                        infection_rate_cumulative2020jun:date_2020_08 + 
                        infection_rate_cumulative2020jun:date_2020_09 + 
                        
                        death_rate_cumulative2020jun:date_2020_04 + 
                        death_rate_cumulative2020jun:date_2020_05 +
                        death_rate_cumulative2020jun:date_2020_06 + 
                        death_rate_cumulative2020jun:date_2020_07 + 
                        death_rate_cumulative2020jun:date_2020_08 + 
                        death_rate_cumulative2020jun:date_2020_09 + 
                        
                        Population_per_1_km_2_of_inhabitable_area:date_2020_04 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_05 +
                        Population_per_1_km_2_of_inhabitable_area:date_2020_06 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_07 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_08 + 
                        Population_per_1_km_2_of_inhabitable_area:date_2020_09 + 
                        
                        Secondary_industry_ratio:date_2020_04 + 
                        Secondary_industry_ratio:date_2020_05 +
                        Secondary_industry_ratio:date_2020_06 + 
                        Secondary_industry_ratio:date_2020_07 + 
                        Secondary_industry_ratio:date_2020_08 + 
                        Secondary_industry_ratio:date_2020_09 + 
                        
                        Tertiary_industry_ratio:date_2020_04 + 
                        Tertiary_industry_ratio:date_2020_05 +
                        Tertiary_industry_ratio:date_2020_06 + 
                        Tertiary_industry_ratio:date_2020_07 + 
                        Tertiary_industry_ratio:date_2020_08 + 
                        Tertiary_industry_ratio:date_2020_09 + 
                        
                        Total_population:date_2020_04 + 
                        Total_population:date_2020_05 +
                        Total_population:date_2020_06 + 
                        Total_population:date_2020_07 + 
                        Total_population:date_2020_08 + 
                        Total_population:date_2020_09 + 
                        
                        Ratio_of_aged_population:date_2020_04 + 
                        Ratio_of_aged_population:date_2020_05 +
                        Ratio_of_aged_population:date_2020_06 + 
                        Ratio_of_aged_population:date_2020_07 + 
                        Ratio_of_aged_population:date_2020_08 + 
                        Ratio_of_aged_population:date_2020_09,
                      fixed_effects = ~ factor(id)+factor(date), 
                      data = dataset, 
                      se_type = "stata", 
                      clusters = id, 
                      alpha = significance_level,
                      weights = population_total)}


## Arrange DID results###########

### 自殺・生活保護・失業手当（フル期間）

DID_coefficients_main <- function(DID_results, treat_var, estimation_label){
  
  # make a data frame for graph
  data_for_graph <- data.frame(estimate = DID_results$coefficients, 
                               ci_lower = DID_results$conf.low,
                               ci_upper = DID_results$conf.high)
  
  # make lable (of date)  variable
  data_for_graph$label <- rownames(data_for_graph)
  # replace rownames to number
  rownames(data_for_graph) <- 1:nrow(data_for_graph)
  
  # generate month variable based on label
  data_for_graph <- data_for_graph %>% mutate(month = case_when(
    str_detect(data_for_graph$label, "date_2018_01") ~ "2018-01",
    str_detect(data_for_graph$label, "date_2018_02") ~ "2018-02",
    str_detect(data_for_graph$label, "date_2018_03") ~ "2018-03",
    str_detect(data_for_graph$label, "date_2018_04") ~ "2018-04",
    str_detect(data_for_graph$label, "date_2018_05") ~ "2018-05",
    str_detect(data_for_graph$label, "date_2018_06") ~ "2018-06",
    str_detect(data_for_graph$label, "date_2018_07") ~ "2018-07",
    str_detect(data_for_graph$label, "date_2018_08") ~ "2018-08",
    str_detect(data_for_graph$label, "date_2018_09") ~ "2018-09",
    str_detect(data_for_graph$label, "date_2018_10") ~ "2018-10",
    str_detect(data_for_graph$label, "date_2018_11") ~ "2018-11",
    str_detect(data_for_graph$label, "date_2018_12") ~ "2018-12",
    str_detect(data_for_graph$label, "date_2019_01") ~ "2019-01",
    str_detect(data_for_graph$label, "date_2019_02") ~ "2019-02",
    str_detect(data_for_graph$label, "date_2019_03") ~ "2019-03",
    str_detect(data_for_graph$label, "date_2019_04") ~ "2019-04",
    str_detect(data_for_graph$label, "date_2019_05") ~ "2019-05",
    str_detect(data_for_graph$label, "date_2019_06") ~ "2019-06",
    str_detect(data_for_graph$label, "date_2019_07") ~ "2019-07",
    str_detect(data_for_graph$label, "date_2019_08") ~ "2019-08",
    str_detect(data_for_graph$label, "date_2019_09") ~ "2019-09",
    str_detect(data_for_graph$label, "date_2019_10") ~ "2019-10",
    str_detect(data_for_graph$label, "date_2019_11") ~ "2019-11",
    str_detect(data_for_graph$label, "date_2019_12") ~ "2019-12",
    str_detect(data_for_graph$label, "date_2020_01") ~ "2020-01",
    str_detect(data_for_graph$label, "date_2020_02") ~ "2020-02",
    str_detect(data_for_graph$label, "date_2020_03") ~ "2020-03",
    str_detect(data_for_graph$label, "date_2020_04") ~ "2020-04",
    str_detect(data_for_graph$label, "date_2020_05") ~ "2020-05",
    str_detect(data_for_graph$label, "date_2020_06") ~ "2020-06",
    str_detect(data_for_graph$label, "date_2020_07") ~ "2020-07",
    str_detect(data_for_graph$label, "date_2020_08") ~ "2020-08",
    str_detect(data_for_graph$label, "date_2020_09") ~ "2020-09"))
  
  # delete NA
  data_for_graph <- na.omit(data_for_graph)
  
  # "treat_var"が含まれている行（処置変数と期間ダミーとの交差項の推定結果）のみ残す
  data_for_graph <- dplyr::filter(data_for_graph, str_detect(label, "treat_var"))
  
  #put "treat" into label data and rename 
  data_for_graph <- data_for_graph %>% 
    mutate(label = treat_var) %>% 
    rename(treatment = label)
  
  # bind reference month data
  reference_month <- c(0, 0, 0, treat_var, "2020-01")
  data_for_graph <- rbind(data_for_graph, reference_month)
  
  # turn into numeric (alread numeric?)
  data_for_graph <- data_for_graph %>% 
    mutate(estimate = as.numeric(estimate)) %>%
    mutate(ci_lower = as.numeric(ci_lower)) %>%
    mutate(ci_upper = as.numeric(ci_upper)) 
  
  # Gen estimation label
  data_for_graph <- data_for_graph %>%
    mutate(estimation_type = estimation_label)
  #old:data_for_graph[,1:3] <- lapply(data_for_graph[,1:3], as.numeric)
}


### 住居確保給付金の場合

#201901-201903と202004-202006しかない


DID_coefficients_jukyo <- function(DID_results, treat_var, estimation_label){
  
  # make a data frame for graph
  data_for_graph <- data.frame(estimate = DID_results$coefficients, 
                               ci_lower = DID_results$conf.low,
                               ci_upper = DID_results$conf.high)
  
  # make lable (of date)  variable
  data_for_graph$label <- rownames(data_for_graph)
  # replace rownames to number
  rownames(data_for_graph) <- 1:nrow(data_for_graph)
  
  # generate month variable based on label
  data_for_graph <- data_for_graph %>% mutate(month = case_when(
    str_detect(data_for_graph$label, "date_2019_01") ~ "2019-01",
    str_detect(data_for_graph$label, "date_2019_02") ~ "2019-02",
    str_detect(data_for_graph$label, "date_2020_04") ~ "2020-04",
    str_detect(data_for_graph$label, "date_2020_05") ~ "2020-05",
    str_detect(data_for_graph$label, "date_2020_06") ~ "2020-06",
    str_detect(data_for_graph$label, "date_2020_07") ~ "2020-07", #210115 追加
    str_detect(data_for_graph$label, "date_2020_08") ~ "2020-08",
    str_detect(data_for_graph$label, "date_2020_09") ~ "2020-09"))
  
  # delete NA
  data_for_graph <- na.omit(data_for_graph)
  
  # "treat_var"が含まれている行（処置変数と期間ダミーとの交差項の推定結果）のみ残す
  data_for_graph <- dplyr::filter(data_for_graph, str_detect(label, "treat_var"))
  
  #put "treat" into label data
  data_for_graph <- data_for_graph %>% mutate(label = treat_var)
  
  # Generate reference and missing months for graph
  
  ## data frame作成
  jukyo_missing_months <- data.frame(matrix(nrow = 13, ncol = 5))
  colnames(jukyo_missing_months) <- c("estimate", "ci_lower", "ci_upper", "label", "month") 
  jukyo_missing_months[,5] <- c("2019-03","2019-04","2019-05","2019-06", 
                                "2019-07", "2019-08", "2019-09", "2019-10",
                                "2019-11", "2019-12", "2020-01", "2020-02", "2020-03")
  
  ## 1行目の参照年(2019-03)の推定値と90%CIを0に
  jukyo_missing_months[1,1:3] <- c(0,0,0)
  
  ## label追加
  jukyo_missing_months <-  jukyo_missing_months %>% mutate(label =  treat_var) 
  
  # missing monthsを推定結果に結合
  data_for_graph  <- dplyr::bind_rows(data_for_graph, jukyo_missing_months)
  
  # turn into numeric (bind_rowsのときはalready numeric?)
  data_for_graph <- data_for_graph %>% 
    mutate(estimate = as.numeric(estimate)) %>%
    mutate(ci_lower = as.numeric(ci_lower)) %>%
    mutate(ci_upper = as.numeric(ci_upper)) 
  
  #old:data_for_graph[,1:3] <- lapply(data_for_graph[,1:3], as.numeric)
  
  
  # Gen estimation label
  data_for_graph <- data_for_graph %>%
    mutate(estimation_type = estimation_label)
}


### 緊急小口・総合貸し付けの場合

#2020年2,3,8,9月がmissing


DID_coefficients_loan <- function(DID_results, treat_var, estimation_label){
  
  # make a data frame for graph
  data_for_graph <- data.frame(estimate = DID_results$coefficients, 
                               ci_lower = DID_results$conf.low,
                               ci_upper = DID_results$conf.high)
  
  # make lable (of date)  variable
  data_for_graph$label <- rownames(data_for_graph)
  # replace rownames to number
  rownames(data_for_graph) <- 1:nrow(data_for_graph)
  
  # generate month variable based on label
  data_for_graph <- data_for_graph %>% mutate(month = case_when(
    str_detect(data_for_graph$label, "date_2019_01") ~ "2019-01",
    str_detect(data_for_graph$label, "date_2019_02") ~ "2019-02",
    str_detect(data_for_graph$label, "date_2019_03") ~ "2019-03",
    str_detect(data_for_graph$label, "date_2019_04") ~ "2019-04",
    str_detect(data_for_graph$label, "date_2019_05") ~ "2019-05",
    str_detect(data_for_graph$label, "date_2019_06") ~ "2019-06",
    str_detect(data_for_graph$label, "date_2019_07") ~ "2019-07",
    str_detect(data_for_graph$label, "date_2019_08") ~ "2019-08",
    str_detect(data_for_graph$label, "date_2019_09") ~ "2019-09",
    str_detect(data_for_graph$label, "date_2019_10") ~ "2019-10",
    str_detect(data_for_graph$label, "date_2019_11") ~ "2019-11",
    str_detect(data_for_graph$label, "date_2019_12") ~ "2019-12",
    str_detect(data_for_graph$label, "date_2020_01") ~ "2020-01",
    str_detect(data_for_graph$label, "date_2020_04") ~ "2020-04",
    str_detect(data_for_graph$label, "date_2020_05") ~ "2020-05",
    str_detect(data_for_graph$label, "date_2020_06") ~ "2020-06",
    str_detect(data_for_graph$label, "date_2020_07") ~ "2020-07",
    str_detect(data_for_graph$label, "date_2020_08") ~ "2020-08", #210115追加
    str_detect(data_for_graph$label, "date_2020_09") ~ "2020-09"))
  
  # delete NA
  data_for_graph <- na.omit(data_for_graph)
  
  # "treat_var"が含まれている行（処置変数と期間ダミーとの交差項の推定結果）のみ残す
  data_for_graph <- dplyr::filter(data_for_graph, str_detect(label, "treat_var"))
  
  #put "treat" into label data
  data_for_graph <- data_for_graph %>% mutate(label = treat_var)
  
  # Generate missing months for graph
  
  ## data framke作成
  jukyo_missing_months <- data.frame(matrix(nrow = 3, ncol = 5))
  colnames(jukyo_missing_months) <- c("estimate", "ci_lower", "ci_upper", "label", "month") 
  jukyo_missing_months[,5] <- c("2020-01", "2020-02", "2020-03")
  
  ## 参照年(2020-01)の推定値と90%CIを0に
  jukyo_missing_months[1,1:3] <- c(0,0,0)
  
  ## label追加
  jukyo_missing_months <-  jukyo_missing_months %>% mutate(label =  treat_var) 
  
  # missing monthsを推定結果に結合
  data_for_graph  <- dplyr::bind_rows(data_for_graph, jukyo_missing_months)
  
  # turn into numeric (bind_rowsのときはalread numeric?)
  data_for_graph <- data_for_graph %>% 
    mutate(estimate = as.numeric(estimate)) %>%
    mutate(ci_lower = as.numeric(ci_lower)) %>%
    mutate(ci_upper = as.numeric(ci_upper)) 
  
  #old:data_for_graph[,1:3] <- lapply(data_for_graph[,1:3], as.numeric)
  
  
  # Gen estimation label
  data_for_graph <- data_for_graph %>%
    mutate(estimation_type = estimation_label)
}

## Semi-dynamic DID with quarter estimates

DID_coefficients_semi_dynamic <- function(DID_results, treat_var, estimation_label){
  
  # make a data frame for graph
  data_for_table <- data.frame(estimate = DID_results$coefficients, 
                               se = DID_results$std.error,
                               ci_lower = DID_results$conf.low,
                               ci_upper = DID_results$conf.high)
  
  # make lable (of date)  variable
  data_for_table$label <- rownames(data_for_table)
  
  # "treat_var"が含まれている行（処置変数と期間ダミーとの交差項の推定結果）のみ残す
  data_for_graph <- dplyr::filter(data_for_table, str_detect(label, "treat_var")) %>%
    dplyr::select(estimate,se)
  
}


## Construct an event_study_graph ####################################################################

# 2019-01がないデータ用 2021Feb09    
estimate <- NA
ci_lower <- NA
ci_upper <- NA
treatment <- NA
month <- "2018-01"  #2021Jul23 2018年に変更      
legend_title <- NA

row2019Jan  <- data.frame(estimate, ci_lower,ci_upper, treatment,month,legend_title)

event_study_graph <- function(data, graph_title){
  for(i in 1:length(data$month)) {
    if(stringr::str_detect(data$month[i], "2018-01")){ #2021Jul23 2018年に変更      
      data <- data
    }else{
      data <- dplyr::bind_rows(row2019Jan,data)}}
  
  ## dodge for overlapping graphs (not used)
  dodge <- position_dodge(0) # move graphs 0.05 to the left and right
  
  ## label (not used)
  label <- ""
  
  ## ggplot  
  data %>% ggplot(aes(x = month, y = estimate, color = label, shape = label, group = label)) +
    geom_point(size = 2.5, position = dodge, fill = "blue", color = "blue") + # 21 is filled circle
    geom_line(size = 1.1, position = dodge, color = "blue") + # line
    geom_errorbar(aes(ymin = ci_lower, ymax = ci_upper, width = 0.15, color = "blue"), position = dodge, color = "black") + # 90% CI error bar
    #geom_ribbon(aes(ymin = ci_lower, ymax = ci_upper, alpha = 0.1), position = dodge, color = "gray") + # 9t% CI shaded region
    #geom_line(aes(x = month, y = ci_lower), size = 0.8, color = "blue", linetype = "dashed") +
    #geom_line(aes(x = month, y = ci_upper), size = 0.8, color = "blue", linetype = "dashed") +
    geom_hline(yintercept = 0, linetype = "solid", color = "gray") + # line of y=0
    geom_vline(xintercept= "2020-01", colour="gray20", size = 1.1, linetype ="dashed") +
    labs(title = graph_title, x = "", y = "") +
    #scale_colour_discrete(name = " ") +  # Legend label
    #scale_shape_discrete(name = " ") +  # Legend label
    #scale_x_continuous(breaks = seq(1970, 1995, 5), # x axis break and label
    #                    labels=seq(1970, 1995, 5)) + 
    #scale_y_continuous(breaks = seq(-0.1:0.15, by = 0.05)) + # y axix breaks
    theme_classic(base_size = 15) + # white background
    theme(legend.position = 'none', axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5), # Adjust x axis label
          panel.grid.minor = element_blank(),  # Delete minor grid lines
          legend.title=element_blank())   # Delete legend title
  #geom_rect(aes(xmin = 1973, xmax = 1984, ymin = -Inf, ymax = Inf), # Change background color
  #          color ="#CCCCCC", fill = "#CCCCCC", alpha = 0.01)
  
}


# 2021Aug23 
# 2018-01を表示させない
## dodge for overlapping graphs (not used)
event_study_graph_2nd_safetynet <- function(data, graph_title){
  dodge <- position_dodge(0) # move graphs 0.05 to the left and right
  
  ## label (not used)
  label <- ""
  
  ## ggplot  
  data %>% ggplot(aes(x = month, y = estimate, color = label, shape = label, group = label)) +
    geom_point(size = 2.5, position = dodge, fill = "blue", color = "blue") + # 21 is filled circle
    geom_line(size = 1.1, position = dodge, color = "blue") + # line
    geom_errorbar(aes(ymin = ci_lower, ymax = ci_upper, width = 0.15, color = "blue"), position = dodge, color = "black") + # 90% CI error bar
    #geom_ribbon(aes(ymin = ci_lower, ymax = ci_upper, alpha = 0.1), position = dodge, color = "gray") + # 9t% CI shaded region
    #geom_line(aes(x = month, y = ci_lower), size = 0.8, color = "blue", linetype = "dashed") +
    #geom_line(aes(x = month, y = ci_upper), size = 0.8, color = "blue", linetype = "dashed") +
    geom_hline(yintercept = 0, linetype = "solid", color = "gray") + # line of y=0
    geom_vline(xintercept= "2020-01", colour="gray20", size = 1.1, linetype ="dashed") +
    labs(title = graph_title, x = "", y = "") +
    #scale_colour_discrete(name = " ") +  # Legend label
    #scale_shape_discrete(name = " ") +  # Legend label
    #scale_x_continuous(breaks = seq(1970, 1995, 5), # x axis break and label
    #                    labels=seq(1970, 1995, 5)) + 
    #scale_y_continuous(breaks = seq(-0.1:0.15, by = 0.05)) + # y axix breaks
    theme_classic(base_size = 15) + # white background
    theme(legend.position = 'none', axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5), # Adjust x axis label
          panel.grid.minor = element_blank(),  # Delete minor grid lines
          legend.title=element_blank())   # Delete legend title
  #geom_rect(aes(xmin = 1973, xmax = 1984, ymin = -Inf, ymax = Inf), # Change background color
  #          color ="#CCCCCC", fill = "#CCCCCC", alpha = 0.01)
  
}


# 2021Aug3  jukyo用
event_study_graph_jukyo <- function(data, graph_title){
  
  ## dodge for overlapping graphs (not used)
  dodge <- position_dodge(0) # move graphs 0.05 to the left and right
  
  ## label (not used)
  label <- ""
  
  ## ggplot  
  data %>% ggplot(aes(x = month, y = estimate, color = label, shape = label, group = label)) +
    geom_point(size = 2.5, position = dodge, fill = "blue", color = "blue") + # 21 is filled circle
    geom_line(size = 1.1, position = dodge, color = "blue") + # line
    geom_errorbar(aes(ymin = ci_lower, ymax = ci_upper, width = 0.15, color = "blue"), position = dodge, color = "black") + # 90% CI error bar
    #geom_ribbon(aes(ymin = ci_lower, ymax = ci_upper, alpha = 0.1), position = dodge, color = "gray") + # 9t% CI shaded region
    #geom_line(aes(x = month, y = ci_lower), size = 0.8, color = "blue", linetype = "dashed") +
    #geom_line(aes(x = month, y = ci_upper), size = 0.8, color = "blue", linetype = "dashed") +
    geom_hline(yintercept = 0, linetype = "solid", color = "gray") + # line of y=0
    geom_vline(xintercept= "2020-01", colour="gray20", size = 1.1, linetype ="dashed") +
    labs(title = graph_title, x = "", y = "") +
    #scale_colour_discrete(name = " ") +  # Legend label
    #scale_shape_discrete(name = " ") +  # Legend label
    #scale_x_continuous(breaks = seq(1970, 1995, 5), # x axis break and label
    #                    labels=seq(1970, 1995, 5)) + 
    #scale_y_continuous(breaks = seq(-0.1:0.15, by = 0.05)) + # y axix breaks
    theme_classic(base_size = 15) + # white background
    theme(legend.position = 'none', axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5), # Adjust x axis label
          panel.grid.minor = element_blank(),  # Delete minor grid lines
          legend.title=element_blank())   # Delete legend title
  #geom_rect(aes(xmin = 1973, xmax = 1984, ymin = -Inf, ymax = Inf), # Change background color
  #          color ="#CCCCCC", fill = "#CCCCCC", alpha = 0.01)
  
}


# アウトカム結果の結合

## 雇用ショックラベルの作成関数と順序変更(自殺および失業手当)

#個々のmarkdownで、estimates_labelingをestimates_labeling_mainに変更する必要あり


## 雇用ショックラベルの作成関数と順序変更(自殺と雇用)

estimates_labeling_main <- function(estimates_df){
  
  #change labels and reorder labels (hi_jouyou_shock and job offer not used in the current ver.)
  estimates_df  %>% 
    mutate(legend_title = case_when(estimation_type == "total_OLS_notrend" ~ "OLS without trends",  #total
                                    estimation_type == "yoy_total_OLS_notrend" ~ "OLS without trends", 
                                    estimation_type == "total_WLS_notrend" ~ "WLS without trends",
                                    estimation_type == "yoy_total_WLS_notrend" ~ "WLS without trends",
                                    estimation_type == "total_OLS_trend" ~ "OLS with trends",
                                    estimation_type == "yoy_total_OLS_trend" ~ "OLS with trends",
                                    estimation_type == "total_WLS_trend" ~ "WLS with trends",
                                    estimation_type == "yoy_total_WLS_trend" ~ "WLS with trends",
                                    estimation_type == "female_OLS_notrend" ~ "OLS without trends", #female
                                    estimation_type == "yoy_female_OLS_notrend" ~ "OLS without trends", 
                                    estimation_type == "female_WLS_notrend" ~ "WLS without trends",
                                    estimation_type == "yoy_female_WLS_notrend" ~ "WLS without trends",
                                    estimation_type == "female_OLS_trend" ~ "OLS with trends",
                                    estimation_type == "yoy_female_OLS_trend" ~ "OLS with trends",
                                    estimation_type == "female_WLS_trend" ~ "WLS with trends",
                                    estimation_type == "yoy_female_WLS_trend" ~ "WLS with trends",
                                    estimation_type == "male_OLS_notrend" ~ "OLS without trends", #male
                                    estimation_type == "yoy_male_OLS_notrend" ~ "OLS without trends", 
                                    estimation_type == "male_WLS_notrend" ~ "WLS without trends",
                                    estimation_type == "yoy_male_WLS_notrend" ~ "WLS without trends",
                                    estimation_type == "male_OLS_trend" ~ "OLS with trends",
                                    estimation_type == "yoy_male_OLS_trend" ~ "OLS with trends",
                                    estimation_type == "male_WLS_trend" ~ "WLS with trends",
                                    estimation_type == "yoy_male_WLS_trend" ~ "WLS with trends")) %>%
    mutate(legend_title = factor(legend_title, 
                                 levels = c("OLS without trends", 
                                            "WLS without trends",
                                            "OLS with trends", 
                                            "WLS with trends")))
  
}



## 雇用ショックラベルの作成関数と順序変更(貧困対策)


#個々のmarkdownで、estimates_labelingをestimates_labeling_povertyに変更する必要あり


estimates_labeling_poverty <- function(estimates_df){
  
  #change labels and reorder labels (hi_jouyou_shock and job offer not used in the current ver.)
  estimates_df  %>%
    mutate(legend_title = case_when(estimation_type == "hogo_persons_OLS_notrend" ~ "OLS without trends",  #生活保護受給者
                                    estimation_type == "hogo_persons_WLS_notrend" ~ "WLS without trends", 
                                    estimation_type == "hogo_persons_OLS_trend" ~ "OLS with trends",
                                    estimation_type == "hogo_persons_WLS_trend" ~ "WLS with trends",
                                    estimation_type == "yoy_hogo_persons_OLS_notrend" ~ "OLS without trends",  #生活保護受給者(YoY)
                                    estimation_type == "yoy_hogo_persons_WLS_notrend" ~ "WLS without trends", 
                                    estimation_type == "yoy_hogo_persons_OLS_trend" ~ "OLS with trends",
                                    estimation_type == "yoy_hogo_persons_WLS_trend" ~ "WLS with trends",
                                    
                                    estimation_type == "hogo_households_OLS_notrend" ~ "OLS without trends",  #生活保護受給世帯
                                    estimation_type == "hogo_households_WLS_notrend" ~ "WLS without trends", 
                                    estimation_type == "hogo_households_OLS_trend" ~ "OLS with trends",
                                    estimation_type == "hogo_households_WLS_trend" ~ "WLS with trends",
                                    estimation_type == "yoy_hogo_households_OLS_notrend" ~ "OLS without trends",  #生活保護受給世帯(YoY)
                                    estimation_type == "yoy_hogo_households_WLS_notrend" ~ "WLS without trends", 
                                    estimation_type == "yoy_hogo_households_OLS_trend" ~ "OLS with trends",
                                    estimation_type == "yoy_hogo_households_WLS_trend" ~ "WLS with trends",
                                    
                                    estimation_type == "jukyo_number_OLS" ~ "OLS", # 住居確保
                                    estimation_type == "jukyo_number_WLS" ~ "WLS",
                                    
                                    estimation_type == "koguchi_number_OLS" ~ "OLS", # 緊急小口
                                    estimation_type == "koguchi_number_WLS" ~ "WLS",
                                    
                                    estimation_type == "sogo_number_OLS" ~ "OLS", # 総合支援
                                    estimation_type == "sogo_number_WLS" ~ "WLS")) %>%
    mutate(legend_title = factor(legend_title, 
                                 levels = c("OLS without trends", 
                                            "WLS without trends",
                                            "OLS with trends", 
                                            "WLS with trends",
                                            "OLS",
                                            "WLS")))
  
}


## イベントグラフ関数
### main
### poverty

event_study_graph_bind_main <- function(data, graph_title){
  
  # 2019-01がないデータ用 2021Feb09 > いったんオフ legendに5つめの項目（NA）が生じてしまうため(2021.2Ando)
  # for (i in 1:length(data$month)) {
  #  if(stringr::str_detect(data$month[i], "2018-01")){
  #    data <- data
  #  }else{
  #    data <- dplyr::bind_rows(row2019Jan,data)}}
  
  ## dodge for overlapping graphs 
  dodge <- position_dodge(0.5) # move graphs 0.05 to the left and right
  #legend
  legend_name <- ""
  shape_data <- data.frame()
  ## ggplot  
  data %>% ggplot(aes(x = month, y = estimate, color = legend_title, shape = legend_title, group = legend_title)) +
    geom_point(size = 3.3, position = dodge) + # 21 is filled circle
    geom_line(size = 1.1, position = dodge) + # line
    geom_errorbar(aes(ymin = ci_lower, ymax = ci_upper, width = 0.15), position = dodge) + # 90% CI error bar
    #geom_ribbon(aes(ymin = ci_lower, ymax = ci_upper, alpha = 0.1), position = dodge, color = "gray") + # 9t% CI shaded region
    #geom_line(aes(x = month, y = ci_lower), size = 0.8, linetype = "dashed") +
    #geom_line(aes(x = month, y = ci_upper), size = 0.8, linetype = "dashed") +
    geom_hline(yintercept = 0, linetype = "solid", color = "gray") + # line of y=0
    geom_vline(xintercept= "2020-01", colour="gray20", size = 1.1, linetype ="dashed") +
    labs(title = graph_title, x = "", y = "") +
    scale_colour_discrete(name = legend_name) +  # Legend label
    #scale_shape_discrete(name = legend_name) +  # Legend label
    scale_shape_manual(name = legend_name, values = c(16,17,15,8)) + # Point shape
    #scale_x_continuous(breaks = seq(1970, 1995, 5), # x axis break and label
    #                    labels=seq(1970, 1995, 5)) + 
    #scale_y_continuous(breaks = seq(-0.1:0.15, by = 0.05)) + # y axix breaks
    theme_classic(base_size = 15) + # white background
    theme(legend.position = 'none', axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5), # Adjust x axis label
          panel.grid.minor = element_blank(),  # Delete minor grid lines
          legend.title = element_text(colour="blue", size=16, face="bold"))   # Delete legend title
  #geom_rect(aes(xmin = 1973, xmax = 1984, ymin = -Inf, ymax = Inf), # Change background color
  #          color ="#CCCCCC", fill = "#CCCCCC", alpha = 0.01)
}

# With legend                 
event_study_graph_bind_legend <- function(data, graph_title){
  
  ## dodge for overlapping graphs (not used)
  dodge <- position_dodge(0.5) # move graphs 0.05 to the left and right
  
  #legend
  legend_name <- ""
  
  ## ggplot  
  data %>% ggplot(aes(x = month, y = estimate, color = legend_title, shape = legend_title, group = legend_title)) +
    geom_point(size = 3, position = dodge) + # 21 is filled circle
    geom_line(size = 1.1, position = dodge) + # line
    geom_errorbar(aes(ymin = ci_lower, ymax = ci_upper, width = 0.15), position = dodge) + # 90% CI error bar
    #geom_ribbon(aes(ymin = ci_lower, ymax = ci_upper, alpha = 0.1), position = dodge, color = "gray") + # 9t% CI shaded region
    #geom_line(aes(x = month, y = ci_lower), size = 0.8, linetype = "dashed") +
    #geom_line(aes(x = month, y = ci_upper), size = 0.8, linetype = "dashed") +
    geom_hline(yintercept = 0, linetype = "solid", color = "gray") + # line of y=0
    geom_vline(xintercept= "2020-01", colour="gray20", size = 1.1, linetype ="dashed") +
    labs(title = graph_title, x = "", y = "") +
    scale_colour_discrete(name = legend_name) +  # Legend label
    #scale_shape_discrete(name = legend_name) +  # Legend label
    scale_shape_manual(name = legend_name, values = c(16,17,15,8)) + # Point shape
    #scale_x_continuous(breaks = seq(1970, 1995, 5), # x axis break and label
    #                    labels=seq(1970, 1995, 5)) + 
    #scale_y_continuous(breaks = seq(-0.1:0.15, by = 0.05)) + # y axix breaks
    theme_classic(base_size = 15) + # white background
    theme(legend.position = 'bottom', axis.text.x = element_text(angle = 90, hjust = 0, vjust = 0.5), # Adjust x axis label
          panel.grid.minor = element_blank(),  # Delete minor grid lines
          legend.title = element_text(colour="blue", size=16, face="bold"))   # Delete legend title
  #geom_rect(aes(xmin = 1973, xmax = 1984, ymin = -Inf, ymax = Inf), # Change background color
  #          color ="#CCCCCC", fill = "#CCCCCC", alpha = 0.01)
  
}

### DID estimation result table #####################################################################

## rename gof 
gm <- modelsummary::gof_map
gm$clean[gm$raw == "nobs"] <- "Sample size"

###  Monthly, baseline

estimates_table_MONTH <- function(df, rows, gof,  title_words, notes_words, output_style){

modelsummary::modelsummary(df, coef_map  = c(
  "treat_var:date_2020_02" = "Feb. 2020", 
  "treat_var:date_2020_03" = "Mar. 2020", 
  "treat_var:date_2020_04" = "Apr. 2020", 
  "treat_var:date_2020_05" = "May. 2020", 
  "treat_var:date_2020_06" = "Jun. 2020", 
  "treat_var:date_2020_07" = "Jul. 2020", 
  "treat_var:date_2020_08" = "Aug. 2020",
  "treat_var:date_2020_09" = "Sep. 2020" ),
  gof_omit = "^(?!R2 Adj.|Sample size)",
  add_rows = rows, 
  gof_map = gof,
  title = title_words,
  output = output_style)
}


###  Monthly, 2nd tier safetynet

estimates_table_MONTH_2nd <- function(df, rows,gof,title_words, notes_words, output_style){
  
  modelsummary::modelsummary(df, coef_map  = c(
    "treat_var:date_2020_04" = "Apr. 2020", 
    "treat_var:date_2020_05" = "May. 2020", 
    "treat_var:date_2020_06" = "Jun. 2020", 
    "treat_var:date_2020_07" = "Jul. 2020", 
    "treat_var:date_2020_08" = "Aug. 2020",
    "treat_var:date_2020_09" = "Sep. 2020" ),
    gof_omit = "^(?!R2 Adj.|Sample size)",
    add_rows = rows, 
    gof_map = gof,
    title = title_words,
    output = output_style)
}
