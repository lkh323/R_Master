library(naniar)
library(dplyr)            
library(ggplot2)       

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

types <- as.vector(unique(df_sfenv$c03))

for(type in types){
  # new_data <- paste("df_sfenv", type, sep = "_")
  # assign(new_data, subset(df_sfenv, c03 == type))
  
  df_sfenv_temp <- df_sfenv %>% filter(c03 %in% type) %>% select(c55,c56,c57) 

  # png("df_sfenv_" & type & ".png", width=600, height=600)
  # png(paste("df_sfenv_", type , ".png"), width=600, height=600)
  # plot(runif(100))
  # dev.off()

  naniar::vis_miss(df_sfenv_temp)
  ggsave(file=paste("D:/Dev/Tool/Doit_R-master/Script/df_sfenv", type , ".png"), width=10, height=10)
}


