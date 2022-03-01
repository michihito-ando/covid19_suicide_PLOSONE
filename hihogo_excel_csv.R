rm(list = ls())

path <- getwd()

setwd(path)

# packages
pacman::p_load(tidyverse, plotly)

##############################################################################
# データ読み込み・年月データの追加・上４行の削除・csv書き出し

hihogo2017_1 <- readxl::read_excel("input/hihogo_data_excel/2017_1.xls")  %>% dplyr::mutate(year_month = as.Date("2017-01-01")) 
hihogo2017_1[5:nrow( hihogo2017_1),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_1.csv")

hihogo2017_2 <- readxl::read_excel("input/hihogo_data_excel/2017_2.xls")  %>% dplyr::mutate(year_month = as.Date("2017-02-01")) 
hihogo2017_2[5:nrow( hihogo2017_2),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_2.csv")

hihogo2017_3 <- readxl::read_excel("input/hihogo_data_excel/2017_3.xls")  %>% dplyr::mutate(year_month = as.Date("2017-03-01")) 
hihogo2017_3[5:nrow( hihogo2017_3),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_3.csv")

hihogo2017_4 <- readxl::read_excel("input/hihogo_data_excel/2017_4.xls")  %>% dplyr::mutate(year_month = as.Date("2017-04-01")) 
hihogo2017_4[5:nrow( hihogo2017_4),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_4.csv")

hihogo2017_5 <- readxl::read_excel("input/hihogo_data_excel/2017_5.xls")  %>% dplyr::mutate(year_month = as.Date("2017-05-01")) 
hihogo2017_5[5:nrow( hihogo2017_5),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_5.csv")

hihogo2017_6 <- readxl::read_excel("input/hihogo_data_excel/2017_6.xls")  %>% dplyr::mutate(year_month = as.Date("2017-06-01")) 
hihogo2017_6[5:nrow( hihogo2017_6),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_6.csv")

hihogo2017_7 <- readxl::read_excel("input/hihogo_data_excel/2017_7.xls")  %>% dplyr::mutate(year_month = as.Date("2017-07-01")) 
hihogo2017_7[5:nrow( hihogo2017_7),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_7.csv")

hihogo2017_8 <- readxl::read_excel("input/hihogo_data_excel/2017_8.xls")  %>% dplyr::mutate(year_month = as.Date("2017-08-01")) 
hihogo2017_8[5:nrow(hihogo2017_8),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_8.csv")

hihogo2017_9 <- readxl::read_excel("input/hihogo_data_excel/2017_9.xls")  %>% dplyr::mutate(year_month = as.Date("2017-09-01")) 
hihogo2017_9[5:nrow( hihogo2017_9),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_9.csv")

hihogo2017_10 <- readxl::read_excel("input/hihogo_data_excel/2017_10.xls")  %>% dplyr::mutate(year_month = as.Date("2017-10-01")) 
hihogo2017_10[5:nrow( hihogo2017_10),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_10.csv")

hihogo2017_11 <- readxl::read_excel("input/hihogo_data_excel/2017_11.xls")  %>% dplyr::mutate(year_month = as.Date("2017-11-01")) 
hihogo2017_11[5:nrow( hihogo2017_11),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_11.csv")

hihogo2017_12 <- readxl::read_excel("input/hihogo_data_excel/2017_12.xls")  %>% dplyr::mutate(year_month = as.Date("2017-12-01")) 
hihogo2017_12[5:nrow( hihogo2017_12),] %>%  write_csv("output/hihogo_data_csv/hihogo2017_12.csv")


hihogo2018_1 <- readxl::read_excel("input/hihogo_data_excel/2018_1.xls")  %>% dplyr::mutate(year_month = as.Date("2018-01-01")) 
hihogo2018_1[5:nrow( hihogo2018_1),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_1.csv")

hihogo2018_2 <- readxl::read_excel("input/hihogo_data_excel/2018_2.xls")  %>% dplyr::mutate(year_month = as.Date("2018-02-01"))
hihogo2018_2[5:nrow( hihogo2018_2),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_2.csv")

hihogo2018_3 <- readxl::read_excel("input/hihogo_data_excel/2018_3.xls")  %>% dplyr::mutate(year_month = as.Date("2018-03-01"))
hihogo2018_3[5:nrow( hihogo2018_3),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_3.csv")

hihogo2018_4 <- readxl::read_excel("input/hihogo_data_excel/2018_4.xls")  %>% dplyr::mutate(year_month = as.Date("2018-04-01"))
hihogo2018_4[5:nrow( hihogo2018_4),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_4.csv")

hihogo2018_5 <- readxl::read_excel("input/hihogo_data_excel/2018_5.xls")  %>% dplyr::mutate(year_month = as.Date("2018-05-01"))
hihogo2018_5[5:nrow( hihogo2018_5),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_5.csv")

hihogo2018_6 <- readxl::read_excel("input/hihogo_data_excel/2018_6.xls")  %>% dplyr::mutate(year_month = as.Date("2018-06-01"))
hihogo2018_6[5:nrow( hihogo2018_6),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_6.csv")

hihogo2018_7 <- readxl::read_excel("input/hihogo_data_excel/2018_7.xls")  %>% dplyr::mutate(year_month = as.Date("2018-07-01"))
hihogo2018_7[5:nrow( hihogo2018_7),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_7.csv")

hihogo2018_8 <- readxl::read_excel("input/hihogo_data_excel/2018_8.xls")  %>% dplyr::mutate(year_month = as.Date("2018-08-01"))
hihogo2018_8[5:nrow( hihogo2018_8),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_8.csv")

hihogo2018_9 <- readxl::read_excel("input/hihogo_data_excel/2018_9.xls")  %>% dplyr::mutate(year_month = as.Date("2018-09-01"))
hihogo2018_9[5:nrow( hihogo2018_9),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_9.csv")

hihogo2018_10 <- readxl::read_excel("input/hihogo_data_excel/2018_10.xls")  %>% dplyr::mutate(year_month = as.Date("2018-10-01"))
hihogo2018_10[5:nrow( hihogo2018_10),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_10.csv")

hihogo2018_11 <- readxl::read_excel("input/hihogo_data_excel/2018_11.xls")  %>% dplyr::mutate(year_month = as.Date("2018-11-01"))
hihogo2018_11[5:nrow( hihogo2018_11),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_11.csv")

hihogo2018_12 <- readxl::read_excel("input/hihogo_data_excel/2018_12.xls")  %>% dplyr::mutate(year_month = as.Date("2018-12-01"))
hihogo2018_12[5:nrow( hihogo2018_12),] %>%  write_csv("output/hihogo_data_csv/hihogo2018_12.csv")



hihogo2019_1 <- readxl::read_excel("input/hihogo_data_excel/2019_1.xls")  %>% dplyr::mutate(year_month = as.Date("2019-01-01")) 
hihogo2019_1[5:nrow( hihogo2019_1),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_1.csv")

hihogo2019_2 <- readxl::read_excel("input/hihogo_data_excel/2019_2.xls")  %>% dplyr::mutate(year_month = as.Date("2019-02-01"))
hihogo2019_2[5:nrow( hihogo2019_2),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_2.csv")

hihogo2019_3 <- readxl::read_excel("input/hihogo_data_excel/2019_3.xls")  %>% dplyr::mutate(year_month = as.Date("2019-03-01"))
hihogo2019_3[5:nrow( hihogo2019_3),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_3.csv")

hihogo2019_4 <- readxl::read_excel("input/hihogo_data_excel/2019_4.xls")  %>%  dplyr::mutate(year_month = as.Date("2019-04-01"))
# ４月の数値データに空白が含まれており、その空白をなくす処理
for (i in 4:11) {
  hihogo2019_4[[i]] <- str_replace_all( hihogo2019_4[[i]]," ","")
}
hihogo2019_4[5:nrow( hihogo2019_4),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_4.csv")

hihogo2019_5 <- readxl::read_excel("input/hihogo_data_excel/2019_5.xls")  %>% dplyr::mutate(year_month = as.Date("2019-05-01"))
hihogo2019_5[5:nrow( hihogo2019_5),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_5.csv")

hihogo2019_6 <- readxl::read_excel("input/hihogo_data_excel/2019_6.xls")  %>% dplyr::mutate(year_month = as.Date("2019-06-01"))
hihogo2019_6[5:nrow( hihogo2019_6),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_6.csv")

hihogo2019_7 <- readxl::read_excel("input/hihogo_data_excel/2019_7.xls")  %>% dplyr::mutate(year_month = as.Date("2019-07-01"))
hihogo2019_7[5:nrow( hihogo2019_7),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_7.csv")

hihogo2019_8 <- readxl::read_excel("input/hihogo_data_excel/2019_8.xls")  %>% dplyr::mutate(year_month = as.Date("2019-08-01"))
hihogo2019_8[5:nrow( hihogo2019_8),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_8.csv")

hihogo2019_9 <- readxl::read_excel("input/hihogo_data_excel/2019_9.xls")  %>% dplyr::mutate(year_month = as.Date("2019-09-01"))
hihogo2019_9[5:nrow( hihogo2019_9),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_9.csv")

hihogo2019_10 <- readxl::read_excel("input/hihogo_data_excel/2019_10.xls")  %>% dplyr::mutate(year_month = as.Date("2019-10-01"))
hihogo2019_10[5:nrow( hihogo2019_10),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_10.csv")

hihogo2019_11 <- readxl::read_excel("input/hihogo_data_excel/2019_11.xls")  %>% dplyr::mutate(year_month = as.Date("2019-11-01"))
hihogo2019_11[5:nrow( hihogo2019_11),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_11.csv")

hihogo2019_12 <- readxl::read_excel("input/hihogo_data_excel/2019_12.xls")  %>% dplyr::mutate(year_month = as.Date("2019-12-01"))
hihogo2019_12[5:nrow( hihogo2019_12),] %>%  write_csv("output/hihogo_data_csv/hihogo2019_12.csv")

hihogo2020_1 <- readxl::read_excel("input/hihogo_data_excel/2020_1.xls")  %>% dplyr::mutate(year_month = as.Date("2020-01-01"))
hihogo2020_1[5:nrow( hihogo2020_1),] %>%  write_csv("output/hihogo_data_csv/hihogo2020_1.csv")

hihogo2020_2 <- readxl::read_excel("input/hihogo_data_excel/2020_2.xlsx")  %>% dplyr::mutate(year_month = as.Date("2020-02-01"))
hihogo2020_2[5:nrow( hihogo2020_2),] %>%  write_csv("output/hihogo_data_csv/hihogo2020_2.csv")

hihogo2020_3 <- readxl::read_excel("input/hihogo_data_excel/2020_3.xlsx")  %>% dplyr::mutate(year_month = as.Date("2020-03-01"))
hihogo2020_3[5:nrow( hihogo2020_3),] %>%  write_csv("output/hihogo_data_csv/hihogo2020_3.csv")

hihogo2020_4 <- readxl::read_excel("input/hihogo_data_excel/2020_4.xlsx")  %>% dplyr::mutate(year_month = as.Date("2020-04-01"))
hihogo2020_4[5:nrow( hihogo2020_4),] %>%  write_csv("output/hihogo_data_csv/hihogo2020_4.csv")

hihogo2020_5 <- readxl::read_excel("input/hihogo_data_excel/2020_5.xlsx")  %>% dplyr::mutate(year_month = as.Date("2020-05-01"))
hihogo2020_5[5:nrow( hihogo2020_5),] %>%  write_csv("output/hihogo_data_csv/hihogo2020_5.csv")

hihogo2020_6 <- readxl::read_excel("input/hihogo_data_excel/2020_6.xlsx")  %>% dplyr::mutate(year_month = as.Date("2020-06-01"))
hihogo2020_6[5:nrow(hihogo2020_6),] %>%  write_csv("output/hihogo_data_csv/hihogo2020_6.csv")

hihogo2020_7 <- readxl::read_excel("input/hihogo_data_excel/2020_7.xlsx")  %>% dplyr::mutate(year_month = as.Date("2020-07-01"))
hihogo2020_7[5:nrow(hihogo2020_7),] %>%  write_csv("output/hihogo_data_csv/hihogo2020_7.csv")

hihogo2020_8 <- readxl::read_excel("input/hihogo_data_excel/2020_8.xlsx")  %>% dplyr::mutate(year_month = as.Date("2020-08-01"))
hihogo2020_8[5:nrow(hihogo2020_8),] %>%  write_csv("output/hihogo_data_csv/hihogo2020_8.csv")

hihogo2020_9 <- readxl::read_excel("input/hihogo_data_excel/2020_9.xlsx")  %>% dplyr::mutate(year_month = as.Date("2020-09-01"))
hihogo2020_9[5:nrow(hihogo2020_9),] %>%  write_csv("output/hihogo_data_csv/hihogo2020_9.csv")




