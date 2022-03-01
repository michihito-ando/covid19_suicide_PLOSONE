rm(list = ls())

path <- getwd()

setwd(path)

# packages
pacman::p_load(tidyverse, plotly)

# step1 ##########################################################
#https://www.stat.go.jp/data/roudou/longtime/03roudou.html#hyo_8 の
#【地域別結果】
#*四半期平均結果の原数値*(4)地域，就業状態別15歳以上人口（エクセル：551KB）
#*（就業者，完全失業者，完全失業率，非労働力人口など）　
#*（1983年～（「九州」及び「沖縄」については2011年～））　原数値のみ
#の人口、就業者、失業者、労働力の地域別四半期パネルデータを作成
################################################################


####################################
# 読み込み・整理のための関数の作成

## 九州・沖縄以外（1983-2020)
panel_1983_2020 <- function(region, region_number){

  # データの読み込み
  labor_force_1983_2020 <- readxl::read_excel("input/labor_force_region_quarter1983_2020.xlsx", sheet = region)
  
  # 使用するデータの範囲の限定
  df_1983_2020 <- labor_force_1983_2020[9:161,]　# 10行目が変数名だが、9行目から抽出（次の作業のため）
  
  # 変数名を作成するために追加（メインの全国値はあとでrenameする）
  df_1983_2020[1,1] <- "year"
  df_1983_2020[1,2] <- "quarterly_jp"
  df_1983_2020[1,3] <- "quarterly"

  df_1983_2020[1,14] <- "pop_over15_region_man"
  df_1983_2020[1,15] <- "labor_force_region_man"
  df_1983_2020[1,16] <- "employ_pop_region_man"
  df_1983_2020[1,19] <- "unemploy_pop_region_man"
  
  df_1983_2020[1,24] <- "pop_over15_region_woman"
  df_1983_2020[1,25] <- "labor_force_region_woman"
  df_1983_2020[1,26] <- "employ_pop_region_woman"
  df_1983_2020[1,29] <- "unemploy_pop_region_woman"
  
  
  # 列名を１行目と置き換える
  colnames(df_1983_2020) <- df_1983_2020[1,]
  #１行目を削除
  df_1983_2020 <- df_1983_2020[2:nrow(df_1983_2020),]
  
  # 使用する変数を抽出
  df_1983_2020 <- df_1983_2020 %>% dplyr::select("quarterly",
                               "Population aged 15 years old and over",
                            "Total","Employed  person","Unemployed person")
  
  
  # df_1983_2020 <- df_1983_2020 %>% dplyr::select("quarterly",
  #                                                "Population aged 15 years old and over",
  #                                                "Total","Employed  person","Unemployed person",
  #                                                "quarterly",
  #                                                "pop_over15_region_man", "labor_force_region_man",
  #                                                "employ_pop_region_man", "unemploy_pop_region_man",
  #                                                "pop_over15_region_woman", "labor_force_region_woman",
  #                                                "employ_pop_region_woman", "unemploy_pop_region_woman")
  
  # 変数名の変更
  df_1983_2020 <- df_1983_2020 %>% dplyr::rename("pop_over15_region" = "Population aged 15 years old and over", 
                                                 "labor_force_region" = "Total", 
                                                 "employ_pop_region"="Employed  person", 
                                                 "unemploy_pop_region" = "Unemployed person")
  
  # 四半期データの置き換え
  df_1983_2020 <- df_1983_2020 %>% dplyr::mutate(quarterly = dplyr::case_when(
  quarterly %>% stringr::str_detect("Jan.-Mar.") ~ "q1",
  quarterly %>% stringr::str_detect("Apr.-Jun.") ~ "q2",
  quarterly %>% stringr::str_detect("Jul.-Sep.") ~ "q3",
  quarterly %>% stringr::str_detect("Oct.-Dec.") ~ "q4"))
  
  #nameとid作成
  df_1983_2020 <- df_1983_2020 %>% dplyr::mutate(region_name = region) %>% 
                                   dplyr::mutate(region_id = region_number)
  
  # 年データの読み込み（年データは自分で作成）
  year_1983_2020 <- readxl::read_excel("input/year_1983_2020.xlsx")
  df_1983_2020 <- dplyr::bind_cols(year_1983_2020, df_1983_2020)
  df_1983_2020 <- na.omit(df_1983_2020)
  
}

## 九州・沖縄（2011-2020)
panel_2011_2020 <- function(region, region_number){
  
  # データの読み込み
  labor_force_2011_2020 <- readxl::read_excel("input/labor_force_region_quarter1983_2020.xlsx", sheet = region) # sheet number =region number
  
  # 使用するデータの範囲の限定
  df_2011_2020 <- labor_force_2011_2020[9:49,] # 10行目が変数名だが、9行目から抽出（次の作業のため）
  
  # 変数名を作成するために追加（メインの全国値はあとでrenameする）
  df_2011_2020[1,1] <- "year"
  df_2011_2020[1,2] <- "quarterly_jp"
  df_2011_2020[1,3] <- "quarterly"
  
  df_2011_2020[1,14] <- "pop_over15_region_man"
  df_2011_2020[1,15] <- "labor_force_region_man"
  df_2011_2020[1,16] <- "employ_pop_region_man"
  df_2011_2020[1,19] <- "unemploy_pop_region_man"
  
  df_2011_2020[1,24] <- "pop_over15_region_woman"
  df_2011_2020[1,25] <- "labor_force_region_woman"
  df_2011_2020[1,26] <- "employ_pop_region_woman"
  df_2011_2020[1,29] <- "unemploy_pop_region_woman"
  
  
  # 列名を１行目と置き換える
  colnames(df_2011_2020) <- df_2011_2020[1,]
  #１行目を削除
  df_2011_2020 <- df_2011_2020[2:nrow(df_2011_2020),]
  
  # 使用する変数を抽出
  df_2011_2020 <- df_2011_2020 %>% dplyr::select("quarterly",
                                  "Population aged 15 years old and over",
                                  "Total","Employed  person","Unemployed person")
  
  # 変数名の変更
  df_2011_2020 <- df_2011_2020 %>% dplyr::rename("pop_over15_region" = "Population aged 15 years old and over", 
                                                 "labor_force_region" = "Total", 
                                                 "employ_pop_region"="Employed  person", 
                                                 "unemploy_pop_region" = "Unemployed person")
  
  # df_2011_2020 <- df_2011_2020 %>% dplyr::select("quarterly",
  #                                                "Population aged 15 years old and over",
  #                                                "Total","Employed  person","Unemployed person",
  #                                                "quarterly",
  #                                                "pop_over15_region_man", "labor_force_region_man",
  #                                                "employ_pop_region_man", "unemploy_pop_region_man",
  #                                                "pop_over15_region_woman", "labor_force_region_woman",
  #                                                "employ_pop_region_woman", "unemploy_pop_region_woman")
  

  # 四半期データの置き換え
  df_2011_2020 <- df_2011_2020 %>% dplyr::mutate(quarterly = dplyr::case_when(
    quarterly %>% stringr::str_detect("Jan.-Mar.") ~ "q1",
    quarterly %>% stringr::str_detect("Apr.-Jun.") ~ "q2",
    quarterly %>% stringr::str_detect("Jul.-Sep.") ~ "q3",
    quarterly %>% stringr::str_detect("Oct.-Dec.") ~ "q4"))
  
  #nameとid作成
  df_2011_2020 <- df_2011_2020 %>% dplyr::mutate(region_name = region) %>%
                                   dplyr::mutate(region_id = region_number)
  
  # 年データの読み込み（元データの年データがそのまま使えないため）
  year_2011_2020 <- readxl::read_excel("input/year_2011_2020.xlsx")
  df_2011_2020 <- dplyr::bind_cols(year_2011_2020, df_2011_2020)
  df_2011_2020 <- na.omit(df_2011_2020)
  
}

######ここまでfunction##############################


# panel_1983_2020 functionを用いた地域四半期パネルの読み込みと作成

## 読み込みとパネル化
df_zenkoku <- panel_1983_2020(region ="全国", region_number =99)
df_hokkaido <- panel_1983_2020(region ="北海道", region_number =1)
df_tohoku <- panel_1983_2020(region ="東北", region_number =2)
df_minamikanto <- panel_1983_2020(region ="南関東", region_number =3)
df_kitakanto_koshin <- panel_1983_2020(region ="北関東・甲信", region_number =4)
df_hokuriku <- panel_1983_2020(region ="北陸", region_number =5)
df_tokai <- panel_1983_2020(region ="東海", region_number =6)
df_kinki <- panel_1983_2020(region ="近畿", region_number =7)
df_chugoku <- panel_1983_2020(region ="中国", region_number =8)
df_shikoku <- panel_1983_2020(region ="四国", region_number =9)
df_kyusyu <- panel_2011_2020(region ="九州", region_number =10)
df_okinawa <- panel_2011_2020(region ="沖縄", region_number =11)


## 統合
df_panel_1983_2020 <- dplyr::bind_rows(df_zenkoku, df_hokkaido)
df_panel_1983_2020 <- dplyr::bind_rows(df_panel_1983_2020, df_tohoku)
df_panel_1983_2020 <- dplyr::bind_rows(df_panel_1983_2020, df_minamikanto)
df_panel_1983_2020 <- dplyr::bind_rows(df_panel_1983_2020, df_kitakanto_koshin)
df_panel_1983_2020 <- dplyr::bind_rows(df_panel_1983_2020, df_hokuriku)
df_panel_1983_2020 <- dplyr::bind_rows(df_panel_1983_2020, df_tokai)
df_panel_1983_2020 <- dplyr::bind_rows(df_panel_1983_2020, df_kinki)
df_panel_1983_2020 <- dplyr::bind_rows(df_panel_1983_2020, df_chugoku)
df_panel_1983_2020 <- dplyr::bind_rows(df_panel_1983_2020, df_shikoku)
df_panel_1983_2020 <- dplyr::bind_rows(df_panel_1983_2020, df_kyusyu)
df_panel_1983_2020 <- dplyr::bind_rows(df_panel_1983_2020, df_okinawa)

## 使う変数をnumericに
df_panel_1983_2020$pop_over15_region <- as.numeric(df_panel_1983_2020$pop_over15_region)
df_panel_1983_2020$labor_force_region <- as.numeric(df_panel_1983_2020$labor_force_region)
df_panel_1983_2020$employ_pop_region <- as.numeric(df_panel_1983_2020$employ_pop_region)
df_panel_1983_2020$unemploy_pop_region <-as.numeric(df_panel_1983_2020$unemploy_pop_region) 


# step2 ####################################
# 労働力調査の都道府県モデル推定値の四半期パネルdtaを読みこみ、
# 変数名を変更し、地域コードと地域名を付ける

# 労働力調査の都道府県モデル推定値の四半期パネルdta読み込み
panel_labor_force_survey_2016q1_2020q2 <- haven::read_dta("output/panel_労働力調査_2016q1_2020q2.dta")

# 変数名の変更
panel_labor_force_survey_2016q1_2020q2 <- panel_labor_force_survey_2016q1_2020q2 %>% 
  dplyr::rename("labor_force" = "労働力人口",
                "employ_pop" = "就業者",
                "unemploy_pop" = "失業者", 
                "year_quarter" = "time")

# 地域名付与
##地域区分	構成都道府県
##北海道	北海道
##東北	青森県，岩手県，宮城県，秋田県，山形県，福島県
##南関東	埼玉県，千葉県，東京都，神奈川県
##北関東・甲信	茨城県，栃木県，群馬県，山梨県，長野県
##北陸	新潟県，富山県，石川県，福井県
##東海	岐阜県，静岡県，愛知県，三重県
##近畿	滋賀県，京都府，大阪府，兵庫県，奈良県，和歌山県
##中国	鳥取県，島根県，岡山県，広島県，山口県
##四国	徳島県，香川県，愛媛県，高知県
##九州	福岡県，佐賀県，長崎県，熊本県，大分県，宮崎県，鹿児島県
##沖縄	沖縄県


panel_labor_force_survey_2016q1_2020q2 <- panel_labor_force_survey_2016q1_2020q2 %>% 
  dplyr::mutate(region_name = dplyr::case_when(
  id == 1 ~ "北海道",  #北海道
  id == 2 ~ "東北",    #青森
  id == 3 ~ "東北",     #岩手
  id == 4 ~ "東北",    #宮城
  id == 5 ~ "東北",    #秋田
  id == 6 ~ "東北",    #山形
  id == 7 ~ "東北",    #福島
  id == 11 ~ "南関東",
  id == 12 ~ "南関東",
  id == 13 ~ "南関東",
  id == 14 ~ "南関東",
  id == 8 ~ "北関東・甲信",
  id == 9 ~ "北関東・甲信",
  id == 10 ~ "北関東・甲信",
  id == 19 ~ "北関東・甲信",
  id == 20 ~ "北関東・甲信",
  id == 15 ~ "北陸",
  id == 16 ~ "北陸",
  id == 17 ~ "北陸",
  id == 18 ~ "北陸",
  id == 21~ "東海",
  id == 22 ~ "東海",
  id == 23 ~ "東海",
  id == 24 ~ "東海",
  id == 25 ~ "近畿",
  id == 26 ~ "近畿",
  id == 27~ "近畿",
  id == 28 ~ "近畿",
  id == 29 ~ "近畿",
  id == 30 ~ "近畿",
  id == 31 ~ "中国",
  id == 32 ~ "中国",
  id == 33 ~ "中国",
  id == 34 ~ "中国",
  id == 35 ~ "中国",
  id == 36 ~ "四国",
  id == 37 ~ "四国",
  id == 38 ~ "四国",
  id == 39 ~ "四国",
  id == 40 ~ "九州",
  id == 41 ~ "九州",
  id == 42 ~ "九州",
  id == 43 ~ "九州",
  id == 44 ~ "九州",
  id == 45 ~ "九州",
  id == 46 ~ "九州",
  id == 47 ~ "沖縄",
  id == 99  ~ "全国"))

# 地域コード付与
panel_labor_force_survey_2016q1_2020q2 <- panel_labor_force_survey_2016q1_2020q2 %>% 
  dplyr::mutate(region_id = dplyr::case_when(
  region_name %>% stringr::str_detect("北海道") ~ 1,
  region_name %>% stringr::str_detect("東北") ~ 2,
  region_name %>% stringr::str_detect("南関東") ~ 3,
  region_name %>% stringr::str_detect("北関東・甲信") ~ 4,
  region_name %>% stringr::str_detect("北陸") ~ 5,
  region_name %>% stringr::str_detect("東海") ~ 6,
  region_name %>% stringr::str_detect("近畿") ~ 7,
  region_name %>% stringr::str_detect("中国") ~ 8,
  region_name %>% stringr::str_detect("四国") ~ 9,
  region_name %>% stringr::str_detect("九州") ~ 10,
  region_name %>% stringr::str_detect("沖縄") ~ 11,
  region_name %>% stringr::str_detect("全国") ~ 99,
  ))
  
# step3 ####################################
# step2のdtaデータを基本として、step1で作成した地域別四半期データをleft_join
# 2016年以降の四半期パネルデータを作成

df_panel_2016_2020 <- dplyr::left_join(panel_labor_force_survey_2016q1_2020q2, 
                                       df_panel_1983_2020, 
                                       by = c("year", "quarterly", "region_id", "region_name") )

# step4 ####################################
# step3で統合したデータを使い、dta由来の都道府県データとregionデータで
# 労働力率、就業率、失業率を作成

# Prefecture data

df_panel_2016_2020 <- df_panel_2016_2020 %>% 
  dplyr::mutate(labor_force_rate = labor_force/pop_over15*100) %>%  # LFP rate
  dplyr::mutate(employment_rate = employ_pop/pop_over15*100) %>% # employment rate
  dplyr::mutate(unemployment_rate = unemploy_pop/labor_force*100) # unemployment rate 

# region data

df_panel_2016_2020 <- df_panel_2016_2020 %>% 
  dplyr::mutate(labor_force_rate_region = labor_force_region/pop_over15_region*100) %>% # LFP rate
  dplyr::mutate(employment_rate_region = employ_pop_region/pop_over15_region*100) %>%  # employment rate
  dplyr::mutate(unemployment_rate_region = unemploy_pop_region/labor_force_region*100) # unemployment rate 


# step5 ####################################
# 都道府県・地域データにおいて、対前年同期差のデータを作成

# prefecture data

## 1年ラグ変数および前年同月差の作成
df_panel_2016_2020_yoy <- df_panel_2016_2020 %>%
  dplyr::group_by(id, quarterly) %>% #idかつ四半期でグループ化
  mutate(year_lag_labor_force_rate  = dplyr::lag(labor_force_rate, order_by = year))　%>% #LFP rate, year lag
  mutate(yoy_labor_force_rate  = labor_force_rate  - year_lag_labor_force_rate) %>%  # year diff
  
  mutate(year_lag_employment_rate  = dplyr::lag(employment_rate, order_by = year))　%>%   #emp rate, year lag
  mutate(yoy_employment_rate  = employment_rate  - year_lag_employment_rate) %>%  # year diff
  
  mutate(year_lag_unemployment_rate  = dplyr::lag(unemployment_rate, order_by = year))　%>%  #unemp rate, year lag
  mutate(yoy_unemployment_rate  = unemployment_rate  - year_lag_unemployment_rate)  # year diff

## 目視でcheck
df_panel_2016_2020_check <- df_panel_2016_2020_yoy %>% 
  dplyr::select(id,region_id, year,quarterly, 
         labor_force_rate, year_lag_labor_force_rate, yoy_labor_force_rate,
         employment_rate, year_lag_employment_rate, yoy_employment_rate,
         unemployment_rate, year_lag_unemployment_rate, yoy_unemployment_rate)

# region data

## 1年ラグ変数および前年同月差の作成
df_panel_2016_2020_yoy <- df_panel_2016_2020_yoy %>%
  dplyr::group_by(id, quarterly) %>% #idかつ四半期でグループ化
  dplyr::mutate(year_lag_labor_force_rate_region  = dplyr::lag(labor_force_rate_region, order_by = year))　%>% #LFP rate, year lag
  dplyr::mutate(yoy_labor_force_rate_region  = labor_force_rate_region  - year_lag_labor_force_rate_region) %>%  #year diff
  
  dplyr::mutate(year_lag_employment_rate_region  = dplyr::lag(employment_rate_region, order_by = year))　%>%  # emp rate, year lag
  dplyr::mutate(yoy_employment_rate_region  = employment_rate_region  - year_lag_employment_rate_region) %>%  #year diff
  
  dplyr::mutate(year_lag_unemployment_rate_region  = dplyr::lag(unemployment_rate_region, order_by = year))　%>% # unemp rate, year lag
  dplyr::mutate(yoy_unemployment_rate_region  = unemployment_rate_region  - year_lag_unemployment_rate_region) #year diff

# 目視でcheck
df_panel_2016_2020_check <- df_panel_2016_2020_yoy %>% 
  dplyr::select(id,region_id, year,quarterly, 
             labor_force_rate_region, year_lag_labor_force_rate_region, yoy_labor_force_rate_region,
             employment_rate_region, year_lag_employment_rate_region, yoy_employment_rate_region,
             unemployment_rate_region, year_lag_unemployment_rate_region, yoy_unemployment_rate_region)


# step6 ####################################
# step5で作成したyoyデータの1,2,3期diffデータをprefectureとregion両方で作成（処置変数の作成）
# yoyのx期ラグ = x期diffのyoyとも解釈できる

# prefecture data

## lag1 & diff1 
df_panel_2016_2020_yoy_diff <- df_panel_2016_2020_yoy %>%
  dplyr::group_by(id) %>%　# idでグループ化
  dplyr::mutate(yoy_lag1_labor_force_rate = lag(yoy_labor_force_rate, order_by = year_quarter, n = 1)) %>% 
  dplyr::mutate(yoy_diff1_labor_force_rate = yoy_labor_force_rate - yoy_lag1_labor_force_rate) %>% 
  
  dplyr::mutate(yoy_lag1_employment_rate = lag(yoy_employment_rate, order_by = year_quarter, n = 1)) %>% 
  dplyr::mutate(yoy_diff1_employment_rate = yoy_employment_rate - yoy_lag1_employment_rate) %>% 
  
  dplyr::mutate(yoy_lag1_unemployment_rate = lag(yoy_unemployment_rate, order_by = year_quarter, n = 1)) %>% 
  dplyr::mutate(yoy_diff1_unemployment_rate = yoy_unemployment_rate - yoy_lag1_unemployment_rate)

#目視check
df_panel_2016_2020_yoy_diff_check <- df_panel_2016_2020_yoy_diff %>% dplyr::select(id,region_id, year,
                                                                                   yoy_labor_force_rate,yoy_lag1_labor_force_rate,yoy_diff1_labor_force_rate,
                                                                                   yoy_employment_rate,yoy_lag1_employment_rate,yoy_diff1_employment_rate,
                                                                                   yoy_unemployment_rate,yoy_lag1_unemployment_rate,yoy_diff1_unemployment_rate)


## lag2 & diff2 
df_panel_2016_2020_yoy_diff <- df_panel_2016_2020_yoy_diff %>%
  dplyr::group_by(id) %>%　　# idでグループ化
  dplyr::mutate(yoy_lag2_labor_force_rate = lag(yoy_labor_force_rate, order_by = year_quarter, n = 2)) %>% 
  dplyr::mutate(yoy_diff2_labor_force_rate = yoy_labor_force_rate - yoy_lag2_labor_force_rate) %>% 
  
  dplyr::mutate(yoy_lag2_employment_rate = lag(yoy_employment_rate, order_by = year_quarter, n = 2)) %>% 
  dplyr::mutate(yoy_diff2_employment_rate = yoy_employment_rate - yoy_lag2_employment_rate) %>% 
  
  dplyr::mutate(yoy_lag2_unemployment_rate=lag(yoy_unemployment_rate, order_by = year_quarter, n = 2)) %>% 
  dplyr::mutate(yoy_diff2_unemployment_rate = yoy_unemployment_rate - yoy_lag2_unemployment_rate)

#目視check
df_panel_2016_2020_yoy_diff_check <- df_panel_2016_2020_yoy_diff %>% dplyr::select(id,region_id, year,
                                                                                   yoy_labor_force_rate,yoy_lag2_labor_force_rate,yoy_diff2_labor_force_rate,
                                                                                   yoy_employment_rate,yoy_lag2_employment_rate,yoy_diff2_employment_rate,
                                                                                   yoy_unemployment_rate,yoy_lag2_unemployment_rate,yoy_diff2_unemployment_rate)

## lag3 & diff3 
df_panel_2016_2020_yoy_diff <- df_panel_2016_2020_yoy_diff %>%
  dplyr::group_by(id) %>%　　# idでグループ化
  dplyr::mutate(yoy_lag3_labor_force_rate = lag(yoy_labor_force_rate, order_by = year_quarter, n = 3)) %>% 
  dplyr::mutate(yoy_diff3_labor_force_rate = yoy_labor_force_rate - yoy_lag3_labor_force_rate) %>% 
  
  dplyr::mutate(yoy_lag3_employment_rate = lag(yoy_employment_rate, order_by = year_quarter, n = 3)) %>% 
  dplyr::mutate(yoy_diff3_employment_rate = yoy_employment_rate - yoy_lag3_employment_rate) %>% 
  
  dplyr::mutate(yoy_lag3_unemployment_rate = lag(yoy_unemployment_rate, order_by = year_quarter, n = 3)) %>% 
  dplyr::mutate(yoy_diff3_unemployment_rate = yoy_unemployment_rate - yoy_lag3_unemployment_rate)

#目視check
df_panel_2016_2020_yoy_diff_check <- df_panel_2016_2020_yoy_diff %>% dplyr::select(id,region_id, year,
                                                                                   yoy_labor_force_rate,yoy_lag3_labor_force_rate,yoy_diff3_labor_force_rate,
                                                                                   yoy_employment_rate,yoy_lag3_employment_rate,yoy_diff3_employment_rate,
                                                                                   yoy_unemployment_rate,yoy_lag3_unemployment_rate,yoy_diff3_unemployment_rate)


# region data

## lag1 & diff1 
df_panel_2016_2020_yoy_diff <- df_panel_2016_2020_yoy_diff %>%
  dplyr::group_by(id) %>%　# idでグループ化
  dplyr::mutate(yoy_lag1_labor_force_rate_region = lag(yoy_labor_force_rate_region, order_by = year_quarter, n = 1)) %>% 
  dplyr::mutate(yoy_diff1_labor_force_rate_region = yoy_labor_force_rate_region - yoy_lag1_labor_force_rate_region) %>% 

  dplyr::mutate(yoy_lag1_employment_rate_region = lag(yoy_employment_rate_region, order_by = year_quarter, n = 1)) %>% 
  dplyr::mutate(yoy_diff1_employment_rate_region = yoy_employment_rate_region - yoy_lag1_employment_rate_region) %>% 
  
  dplyr::mutate(yoy_lag1_unemployment_rate_region = lag(yoy_unemployment_rate_region, order_by = year_quarter, n = 1)) %>% 
  dplyr::mutate(yoy_diff1_unemployment_rate_region = yoy_unemployment_rate_region - yoy_lag1_unemployment_rate_region)

#目視check
df_panel_2016_2020_yoy_diff_check <- df_panel_2016_2020_yoy_diff %>% dplyr::select(id,region_id, year,
yoy_labor_force_rate_region,yoy_lag1_labor_force_rate_region,yoy_diff1_labor_force_rate_region,
yoy_employment_rate_region,yoy_lag1_employment_rate_region,yoy_diff1_employment_rate_region,
yoy_unemployment_rate_region,yoy_lag1_unemployment_rate_region,yoy_diff1_unemployment_rate_region)


## lag2 & diff2 
df_panel_2016_2020_yoy_diff <- df_panel_2016_2020_yoy_diff %>%
  dplyr::group_by(id) %>%　　# idでグループ化
  dplyr::mutate(yoy_lag2_labor_force_rate_region = lag(yoy_labor_force_rate_region, order_by = year_quarter, n = 2)) %>% 
  dplyr::mutate(yoy_diff2_labor_force_rate_region = yoy_labor_force_rate_region - yoy_lag2_labor_force_rate_region) %>% 
  
  dplyr::mutate(yoy_lag2_employment_rate_region = lag(yoy_employment_rate_region, order_by = year_quarter, n = 2)) %>% 
  dplyr::mutate(yoy_diff2_employment_rate_region = yoy_employment_rate_region - yoy_lag2_employment_rate_region) %>% 
  
  dplyr::mutate(yoy_lag2_unemployment_rate_region=lag(yoy_unemployment_rate_region, order_by = year_quarter, n = 2)) %>% 
  dplyr::mutate(yoy_diff2_unemployment_rate_region = yoy_unemployment_rate_region - yoy_lag2_unemployment_rate_region)

#目視check
df_panel_2016_2020_yoy_diff_check <- df_panel_2016_2020_yoy_diff %>% dplyr::select(id,region_id, year,
yoy_labor_force_rate_region,yoy_lag2_labor_force_rate_region,yoy_diff2_labor_force_rate_region,
yoy_employment_rate_region,yoy_lag2_employment_rate_region,yoy_diff2_employment_rate_region,
yoy_unemployment_rate_region,yoy_lag2_unemployment_rate_region,yoy_diff2_unemployment_rate_region)

## lag3 & diff3 
df_panel_2016_2020_yoy_diff <- df_panel_2016_2020_yoy_diff %>%
  dplyr::group_by(id) %>%　　# idでグループ化
  dplyr::mutate(yoy_lag3_labor_force_rate_region = lag(yoy_labor_force_rate_region, order_by = year_quarter, n = 3)) %>% 
  dplyr::mutate(yoy_diff3_labor_force_rate_region = yoy_labor_force_rate_region - yoy_lag3_labor_force_rate_region) %>% 
  
  dplyr::mutate(yoy_lag3_employment_rate_region = lag(yoy_employment_rate_region, order_by = year_quarter, n = 3)) %>% 
  dplyr::mutate(yoy_diff3_employment_rate_region = yoy_employment_rate_region - yoy_lag3_employment_rate_region) %>% 
  
  dplyr::mutate(yoy_lag3_unemployment_rate_region = lag(yoy_unemployment_rate_region, order_by = year_quarter, n = 3)) %>% 
  dplyr::mutate(yoy_diff3_unemployment_rate_region = yoy_unemployment_rate_region - yoy_lag3_unemployment_rate_region)

#目視check
df_panel_2016_2020_yoy_diff_check <- df_panel_2016_2020_yoy_diff %>% dplyr::select(id,region_id, year,
yoy_labor_force_rate_region,yoy_lag3_labor_force_rate_region,yoy_diff3_labor_force_rate_region,
yoy_employment_rate_region,yoy_lag3_employment_rate_region,yoy_diff3_employment_rate_region,
yoy_unemployment_rate_region,yoy_lag3_unemployment_rate_region,yoy_diff3_unemployment_rate_region)




## step8 処置変数クロスセクションデータの作成########################################
df_emp_shock2020Q2 <- df_panel_2016_2020_yoy_diff %>%
  dplyr::select("都道府県", prefecture, id, year_quarter, qrt, year, quarterly, region_name, region_id,
                pop_over15, yoy_diff1_labor_force_rate, yoy_diff1_employment_rate, yoy_diff1_unemployment_rate,
                yoy_diff2_labor_force_rate, yoy_diff2_employment_rate, yoy_diff2_unemployment_rate) %>%
  dplyr::filter(qrt == "2020q2")

# 散布図チェック
graph_emp_shock_corr <- df_emp_shock2020Q2  %>%
  ggplot(aes(x = yoy_diff1_employment_rate, y = yoy_diff2_employment_rate, size = pop_over15)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "gray20", linetype = "dashed") +
  theme_classic()  +
  scale_size(range = c(2,12)) 
ggplotly(graph_emp_shock_corr)

graph_unemp_shock_corr <- df_emp_shock2020Q2  %>%
  ggplot(aes(x = yoy_diff1_unemployment_rate, y = yoy_diff2_unemployment_rate, size = pop_over15)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "gray20", linetype = "dashed") +
  theme_classic()  +
  scale_size(range = c(2,12)) 
ggplotly(graph_unemp_shock_corr)

df_emp_shock2020Q2 %>%  write_csv("output/df_emp_shock2020Q2.csv")


# step7 ####################################
#2020Q2の補正係数の作成と補正値の作成
##1.2020年第二四半期（2020Q2)のデータだけ取り出す
##2.2020Q2の都道府県の労働力人口、就業者数、失業者数を地域別に足し上げる（group_byを使う。_region_sum とする）
##3.2020Q2の地域別労働力人口、就業者数、失業者数（_region)を、2で作成した労働力人口、就業者数、失業者数（_region_sum ）で割る。これを補正係数と呼ぶ（coef_labor_force_region, coef_employ_pop_region, coef_unemploy_pop_regionとしてください。単位が違うので気を付けてください。たしか_regionは万人、_region_sumは千人のはずです。)
##4.2020Q2の都道府県の労働力人口、就業者数、失業者数にこの補正係数をかけた補正値を作成
##5.元のデータの2020Q2をこの2020Q2hoseiに差し替えて、labor_force_rate、employment_rate、unemployment_rateのyoyおよびyoy_diff1,2,3まで作成。

# 1.2020年第二四半期（2020Q2)のデータだけ取り出す
df_panel_2016_2020_yoy_diff_2020q2 <-  df_panel_2016_2020_yoy_diff %>% dplyr::filter(qrt == "2020q2")

# 2.2020Q2の都道府県の労働力人口、就業者数、失業者数を地域別に足し上げる
##group_byを使う。_region_sumとする
##単位は千人

df_panel_2016_2020_yoy_diff_2020q2 <- df_panel_2016_2020_yoy_diff_2020q2 %>% 
  dplyr::group_by(region_id) %>% 
  mutate(labor_force_region_sum = sum(labor_force))%>% 
  mutate(employ_pop_region_sum = sum(employ_pop))%>% 
  mutate(unemploy_pop_region_sum = sum(unemploy_pop))

# 3.2020Q2の地域別労働力人口、就業者数、失業者数（_region)を、
##2で作成した労働力人口、就業者数、失業者数（_region_sum）で割る。
##これを補正係数と呼ぶ
##単位が違うので気を付けける_regionは万人、_region_sumは千人なので、前者に10かける)

df_panel_2016_2020_yoy_diff_2020q2 <-   df_panel_2016_2020_yoy_diff_2020q2 %>% 
  mutate(coef_labor_force_region = labor_force_region*10/labor_force_region_sum,
         coef_employ_pop_region = employ_pop_region*10/employ_pop_region_sum,
         coef_unemploy_pop_region =  unemploy_pop_region*10/unemploy_pop_region_sum)

# 4.2020Q2の都道府県の労働力人口、就業者数、失業者数にこの補正係数をかけた補正値を作成
df_panel_2016_2020_yoy_diff_2020q2 <- df_panel_2016_2020_yoy_diff_2020q2 %>% 
  mutate(labor_force_2020q2hosei = labor_force*coef_labor_force_region,
         employ_pop_2020q2hosei = employ_pop*coef_employ_pop_region,
         unemploy_pop_2020q2hosei = unemploy_pop*coef_unemploy_pop_region)

# check
graph_labor_force_hosei <- df_panel_2016_2020_yoy_diff_2020q2 %>%
  ggplot(aes(x = labor_force, y = labor_force_2020q2hosei, size = pop_over15)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "gray20", linetype = "dashed") +
  theme_classic()  +
  scale_size(range = c(2,12)) 

ggplotly(graph_labor_force_hosei)

graph_employ_pop_hosei <- df_panel_2016_2020_yoy_diff_2020q2 %>%
  ggplot(aes(x = employ_pop, y = employ_pop_2020q2hosei, size = pop_over15)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "gray20", linetype = "dashed") +
  theme_classic()  +
  scale_size(range = c(2,12)) 

ggplotly(graph_employ_pop_hosei)


graph_unemploy_pop_hosei <- df_panel_2016_2020_yoy_diff_2020q2 %>%
  ggplot(aes(x = unemploy_pop, y = unemploy_pop_2020q2hosei, size = pop_over15)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE, color = "gray20", linetype = "dashed") +
  theme_classic()  +
  scale_size(range = c(2,12)) 

ggplotly(graph_unemploy_pop_hosei)



# step5 補正版 ####################################
# 都道府県において、対前年同期差のデータを作成

# prefecture data

## 1年ラグ変数および前年同月差の作成
df_panel_2016_2020_yoy_hosei <- df_panel_2016_2020 %>%
  dplyr::group_by(id, quarterly) %>% #idかつ四半期でグループ化
  mutate(year_lag_labor_force_rate  = dplyr::lag(labor_force_rate, order_by = year))　%>% #LFP rate, year lag
  mutate(yoy_labor_force_rate  = labor_force_rate  - year_lag_labor_force_rate) %>%  # year diff
  
  mutate(year_lag_employment_rate  = dplyr::lag(employment_rate, order_by = year))　%>%   #emp rate, year lag
  mutate(yoy_employment_rate  = employment_rate  - year_lag_employment_rate) %>%  # year diff
  
  mutate(year_lag_unemployment_rate  = dplyr::lag(unemployment_rate, order_by = year))　%>%  #unemp rate, year lag
  mutate(yoy_unemployment_rate  = unemployment_rate  - year_lag_unemployment_rate)  # year diff

# step6 補正版####################################
# step5で作成したyoyデータの1,2,3期diffデータをprefectureとregion両方で作成（処置変数の作成）
# yoyのx期ラグ = x期diffのyoyとも解釈できる

# prefecture data

## lag1 & diff1 
df_panel_2016_2020_yoy_diff <- df_panel_2016_2020_yoy_hosei %>%
  dplyr::group_by(id) %>%　# idでグループ化
  dplyr::mutate(yoy_lag1_labor_force_rate = lag(yoy_labor_force_rate, order_by = year_quarter, n = 1)) %>% 
  dplyr::mutate(yoy_diff1_labor_force_rate = yoy_labor_force_rate - yoy_lag1_labor_force_rate) %>% 
  
  dplyr::mutate(yoy_lag1_employment_rate = lag(yoy_employment_rate, order_by = year_quarter, n = 1)) %>% 
  dplyr::mutate(yoy_diff1_employment_rate = yoy_employment_rate - yoy_lag1_employment_rate) %>% 
  
  dplyr::mutate(yoy_lag1_unemployment_rate = lag(yoy_unemployment_rate, order_by = year_quarter, n = 1)) %>% 
  dplyr::mutate(yoy_diff1_unemployment_rate = yoy_unemployment_rate - yoy_lag1_unemployment_rate)


## lag2 & diff2 
df_panel_2016_2020_yoy_diff <- df_panel_2016_2020_yoy_diff %>%
  dplyr::group_by(id) %>%　　# idでグループ化
  dplyr::mutate(yoy_lag2_labor_force_rate = lag(yoy_labor_force_rate, order_by = year_quarter, n = 2)) %>% 
  dplyr::mutate(yoy_diff2_labor_force_rate = yoy_labor_force_rate - yoy_lag2_labor_force_rate) %>% 
  
  dplyr::mutate(yoy_lag2_employment_rate = lag(yoy_employment_rate, order_by = year_quarter, n = 2)) %>% 
  dplyr::mutate(yoy_diff2_employment_rate = yoy_employment_rate - yoy_lag2_employment_rate) %>% 
  
  dplyr::mutate(yoy_lag2_unemployment_rate=lag(yoy_unemployment_rate, order_by = year_quarter, n = 2)) %>% 
  dplyr::mutate(yoy_diff2_unemployment_rate = yoy_unemployment_rate - yoy_lag2_unemployment_rate)

## lag3 & diff3 
df_panel_2016_2020_yoy_diff <- df_panel_2016_2020_yoy_diff %>%
  dplyr::group_by(id) %>%　　# idでグループ化
  dplyr::mutate(yoy_lag3_labor_force_rate = lag(yoy_labor_force_rate, order_by = year_quarter, n = 3)) %>% 
  dplyr::mutate(yoy_diff3_labor_force_rate = yoy_labor_force_rate - yoy_lag3_labor_force_rate) %>% 
  
  dplyr::mutate(yoy_lag3_employment_rate = lag(yoy_employment_rate, order_by = year_quarter, n = 3)) %>% 
  dplyr::mutate(yoy_diff3_employment_rate = yoy_employment_rate - yoy_lag3_employment_rate) %>% 
  
  dplyr::mutate(yoy_lag3_unemployment_rate = lag(yoy_unemployment_rate, order_by = year_quarter, n = 3)) %>% 
  dplyr::mutate(yoy_diff3_unemployment_rate = yoy_unemployment_rate - yoy_lag3_unemployment_rate)

