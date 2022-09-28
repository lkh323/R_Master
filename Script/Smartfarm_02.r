install.packages("readr")
library(readr)

install.packages("dplyr")  # dplyr 설치
library(dplyr)             # dplyr 로드

install.packages("descr")
library(descr)

install.packages("dplyr")
library(dplyr)


#CSV 파일 로딩
df_sfenv <- read_csv("D:/Dev/Tool/Doit_R-master/Data/SmartfarmEnvData.csv")
#Data 삭제
#rm(df_sfenv)

nrow(df_sfenv)
ncol(df_sfenv) 
dim(df_sfenv) # 3,187,319      79
head(df_sfenv)
tail(df_sfenv)
ls(df_sfenv)

# 조건에 맞는 데이터 추출하기(p.209)
filter(df_sfenv, c02 == "김성욱")

# %>%
# sum(c16:c18)

#컬럼열 이름 변경경
names(df_sfenv)
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


names(df_sfenv) <- tolower(names(df_sfenv))

View(df_sfenv)
summary(df_sfenv)
str(df_sfenv)


# 선택한 변수 추출하기(p.226)
df_sfenv %>% select(c02, c03, c09, c14, c15, c55, c56, c57)
df_sfenv %>% select(c02, c03, c09, c55, c56, c57)

# 변수 값을 그룹별로 합산하기(p.233)
df_sfenv %>% 
  select(c02, c03, c09, c55, c56, c57) %>% 
  filter(c02 == "강규현") %>% 
  arrange(c02, c09) 


df_sfenv %>% 
  group_by(c02, c03, c09) %>% 
  summarise("temp" = sum(c55), "hum" = sum(c56),"co2" = sum(c57)) %>% 
  arrange(c02, c09) %>% 
  filter(c02 == "강규현")

# 데이터 세트 결측치 확인하기(p.265)
is.na(df_sfenv)

# 데이터 세트에 있는 결측치 전체 개수 확인
sum(is.na(df_sfenv)) 


# 컬럼별 결측치 개수 확인하기(p.266)
colSums(df_sfenv)
colSums(is.na(df_sfenv))


# 결측치가 있는 행 제거하기(p.266)
na.omit(df_sfenv)
str(na.omit(df_sfenv))
colSums(na.omit(df_sfenv))


# 결측치 0으로 대체하기(p.267)
airquality[is.na(df_sfenv)] <- 0
colSums(is.na(airquality))


# 이상치 확인하기(p.268)
boxplot(df_sfenv$c55)
boxplot(df_sfenv$c56)
boxplot(df_sfenv$c57)
boxplot(df_sfenv$c41,df_sfenv$c42,df_sfenv$c43,df_sfenv$c44,df_sfenv$c45)
str(df_sfenv$c41)

# 산점도 그리기
plot(x = df_sfenv$c41, y = df_sfenv$c41)



# ------------------------------------------------------------------------------------------------

# df_sfenv

# dplyr 패키지 설치 및 로드하기(p.207)
install.packages("dplyr")
library(dplyr)


# mtcars 데이터 세트 구조 확인하기(p.208)
nrow(df_sfenv)
str(df_sfenv)


# 조건에 맞는 데이터 추출하기(p.209)
filter(df_sfenv, c02 == "김성욱")


# 두 가지 조건에 맞는 데이터를 필터링하기(p.209)
filter(df_sfenv, c02 == "김성욱", c15 >= 12 & c15 < 24)


# 지정한 변수만 추출하기(p.210)
head(select(df_sfenv, c02, c14, c15, c41))


# 오름차순 정렬하기(p.211)
head(arrange(df_sfenv, c02))


# 오름차순 정렬한 후 내림차순 정렬하기(p.212)
head(arrange(mtcars, mpg, desc(wt)))


# 새로운 열 추가하기(p.213)
head(mutate(mtcars, years = "1974"))
head(mutate(mtcars, "1974"))

head(mutate(mtcars, mpg_rank = rank(mpg)))
mutate(mtcars, mpg_rank = rank(mpg)) %>% arrange(mpg_rank)

# 중복 값 제거하기(p.214)
distinct(df_sfenv, c02)


# 여러 개 열에서 중복 값 제거하기(p.215)
distinct(df_sfenv, c02, c03)


# 데이터 요약하기(p.216)
summarise(df_sfenv, tem = mean(c41), hum = min(c42), co2 = max(c43))
summarise(df_sfenv, mean(cyl), min(cyl), max(cyl))


# 그룹별로 요약하기(p.217)
gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, n())

gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, n_distinct(gear))


# 샘플 데이터 10개 추출하기(p.218)
sample_n(mtcars, 10)


# 전체 데이터의 20%를 샘플로 추출하기(p.219)
sample_frac(mtcars, 0.2)


# 파이프 연산자로 그룹별 요약하기(p.220)
group_by(mtcars, cyl) %>% summarise(n())


# 파이프 연산자 없이 순위 기준으로 정렬하기(p.220)
mp_rank <- mutate(mtcars, mpg_rank = rank(mpg))
arrange(mp_rank, mpg_rank)


# 파이프 연산자를 사용하여 순위 기준으로 정렬하기(p.221)
mutate(mtcars, mpg_rank = rank(mpg)) %>% arrange(mpg_rank)



