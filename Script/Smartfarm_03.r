install.packages("tidyverse")
install.packages("naniar")
install.packages("mice")
install.packages("VIM")
install.packages("cowplot")
library(tidyverse)
library(naniar)
library(mice)
library(VIM)
library(cowplot)

# 데이터 읽어오기
# rm(df_sfenv)
df_sfenv <- read_csv(file = "D:/Dev/Tool/Doit_R-master/Data/SmartfarmEnvData.csv")

names(df_sfenv) <- c("c01"	,"c02"	,"c03"	,"c04"	,"c05"	,"c06"	,"c07"	,
                     "c08"	,"c09"	,"c10"	,"c11"	,"c12"	,"c13"	,"c14"	,
                     "c15"	,"c16"	,"c17"	,"c18"	,"c19"	,"c20"	,"c21"	,
                     "c22"	,"c23"	,"c24"	,"c25"	,"c26"	,"c27"	,"c28"	,
                     "c29"	,"c30"	,"c31"	,"c32"	,"c33"	,"c34"	,"c35"	,
                     "c36"	,"c37"	,"c38"	,"c39"	,"c40"	,"c41"	,"c42"	,
                     "c43"	,"c44"	,"c45"	,"c46"	,"c47"	,"c48"	,"c49"	,
                     "c50"	,"c51"	,"c52"	,"c53"	,"c54"	,"c55"	,"c56"	,
                     "c57"	,"c58"	,"c59"	,"c60"	,"c61"	,"c62"	,"c63"	,
                     "c64"	,"c65"	,"c66"	,"c67"	,"c68"	,"c69"	,"c70"	,
                     "c71"	,"c72"	,"c73"	,"c74"	,"c75"	,"c76"	,"c77"	,
                     "c78"	,"c79")
head(df_sfenv)

df_sfenv2 <- df_sfenv %>% select(c02, c03, c09, c14, c15, c55, c56, c57) 
df_sfenv2 <- df_sfenv %>% filter(c02 == "김성욱" ) %>% select(c14, c15, c55, c56, c57)
df_sfenv2 <- df_sfenv %>% filter(c03 == "PF_0022132_01" ) %>% select(c55,c56,c57) 
# df_sfenv2 <- paste(df_sfenv2$c14, df_sfenv2$c15)

# %>% filter
dim(df_sfenv2)
head(df_sfenv2)

# 각 변수에 있는 missing value의 개수
df_sfenv2 %>% purrr::map_dbl(naniar::n_miss)

# 각 변수에 있는 missing value에 대한 정보
naniar::miss_var_summary(df_sfenv2)

# 각 행에 있는 missing value에 대한 정보
naniar::miss_case_summary(df_sfenv2)

# missing value 시각화01
mice::md.pattern(df_sfenv2[ , 1:2])
mice::md.pattern(df_sfenv2)


# missing value 시각화02
VIM::aggr(df_sfenv2, 
          col       = c("gray", "red"), 
          numbers = TRUE, 
          # sortVars = TRUE, 
          labels   = names(df_sfenv2), 
          cex.axis = 0.7, 
          gap      = 3, 
          ylab      = c("Histogram of missing data", "Pattern"))


# ------------------------------------------------------------------------------
str(riskfactors)
View(riskfactors)
names(riskfactors)
data(riskfactors)
is.na(riskfactors) # 전체 결측치 반환

is.na(riskfactors$smoke_stop) # 변수별 결측치
sum(is.na(riskfactors$smoke_stop)) # 변수별 결측치의 합

# 각 행별로 NA가 포함된 행인지 아닌지를 반환
# NA가 있을 경우 FALSE, NA가 없을 경우 TRUE로 is.na()와는 반대
complete.cases(riskfactors)

# sum()함수를 통해 NA가 없는 행의 개수를 확인할 수 있다
sum(complete.cases(riskfactors))

# 반대로 NA가 있는 행의 개수를 알고 싶다면 앞에 !를 붙인다
sum(!complete.cases(riskfactors))

library(naniar) #naniar 패키지를 불러옵니다.
naniar::miss_case_summary(riskfactors) # case : 행 기준
naniar::miss_var_summary(riskfactors) # variable : 변수 기준

naniar::miss_var_summary(df_sfenv2) # variable : 변수 기준

aniar::vis_miss(riskfactors)


naniar::vis_miss(riskfactors)
VIM::aggr(df_sfenv2)


# Missing Value 시각화
naniar::vis_miss(df_sfenv2)

# 이미지 저장하기
png("plot1.png",width=600,height=600)
plot(runif(100))
dev.off()



# 반복문을 사용하여 서브객체 생성하기
data(iris)
head(iris)
# rm(type)
types <- as.vector(unique(iris$Species))

for(type in types){
  new_data <- paste("iris", type, sep = "_")
  assign(new_data, subset(iris, Species == type))
}



# 반복문을 사용하여 서브객체 생성하기
head(df_sfenv)

types <- as.vector(unique(df_sfenv$c03))

for(type in types){
  # new_data <- paste("df_sfenv", type, sep = "_")
  # assign(new_data, subset(df_sfenv, c03 == type))
  
  df_sfenv_temp <- df_sfenv %>% filter(c03 == type) %>% select(c55,c56,c57) 
  
  naniar::vis_miss(df_sfenv_temp)
  
  png("df_sfenv_" & type & ".png", width=600, height=600)
  plot(runif(100))
  dev.off()
}





