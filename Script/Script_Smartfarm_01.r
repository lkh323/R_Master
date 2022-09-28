
## -------------------------------------------------------------------- ##
df_csv_sfenv <- read.csv("../Data/SmartfarmEnvData.csv", header = FALSE)
df_csv_sfenv

summary(df_csv_sfenv) # 요약 통계량 산출

rm(df_csv_sfenv)


## -------------------------------------------------------------------- ##
install.packages("ggplot2")  # ggplot2 패키지 설치
library(ggplot2)             # ggplot2 패키지 로드


# 빈도표 생성
table(df_csv_sfenv$V30)   

# 빈도 그래프 출력
qplot(df_csv_sfenv$V30)

# 히스토그램 
hist(df_csv_sfenv$V30)



## -------------------------------------------------------------------- ##
# data에 mpg, x축에 hwy 변수 지정하여 그래프 생성
qplot(data = mpg, x = hwy)

# x축 cty
qplot(data = mpg, x = cty)

# x축 drv, y축 hwy
qplot(data = mpg, x = drv, y = hwy)

# x축 drv, y축 hwy, 선 그래프 형태
qplot(data = mpg, x = drv, y = hwy, geom = "line")

# x축 drv, y축 hwy, 상자 그림 형태
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")

# x축 drv, y축 hwy, 상자 그림 형태, drv별 색 표현
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)

# qplot 함수 매뉴얼 출력
?qplot
