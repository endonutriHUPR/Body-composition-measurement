# ===================================================================================== # 
# ===================================================================================== # 
############################ BODY COMPOSITION PROTOCOL IMAGEJ ########################### 
# ===================================================================================== # 
# ===================================================================================== # 

# Body composition protocol have to be followed concienciously

# ===================================================================================== # 
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! JUST TYPE THIS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #
# ===================================================================================== # 

results_file_directory <- "~/CT/Body_composition/ESTO_ES_PRUEBA/"
setwd(results_file_directory)
names_files <-list.files()
#id_name <- "_body_composition"
dir.create("./OUT")
where_save <- paste0(results_file_directory, "OUT")


# ===================================================================================== # 
######################################## LOADING ######################################## 
# ===================================================================================== # 

########### PACKAGES ########### 

library(openxlsx)
library(tidyverse)
library(dplyr)
library(tools)

########### FILE ########### 

#X1 <- read.csv(paste0(results_file_directory, "9464386_20190128_L3.csv"))


#l_files <- list(X1)
# l_files <- list(X1, X2)

for (ele in 1:length(names_files)){
  
  #results_table <- l_files[[ele]]
  results_table <- read.csv(paste0("./", names_files[ele]))
  # ===================================================================================== # 
  ##################################### TABLE BUILDING #################################### 
  # ===================================================================================== # 
  
  names_1<- c("Body_area",
              "Total_fat",
              "VLD_muscle_outer_circle",
              "LD_muscle_outer_circle",
              "ND_muscle_outer_circle",
              "HD_muscle_outer_circle",
              "VHD_muscle_outer_circle",
              "Total_muscle_outer_circle",
              "Fat_outer_circle",
              "VLD_muscle_inner_circle",
              "LD_muscle_inner_circle",
              "ND_muscle_inner_circle",
              "HD_muscle_inner_circle",
              "VHD_muscle_inner_circle",
              "Total_muscle_inner_circle",
              "Fat_inner_circle",
              "VLD_muscle_vertebra",
              "LD_muscle_vertebra",
              "ND_muscle_vertebra",
              "HD_muscle_vertebra",
              "VHD_muscle_vertebra",
              "Total_muscle_vertebra",
              "Fat_vertebra",
              "Error_fat")
  
  results_table$X <- names_1
  names(results_table)[1] <- "Names_measures"
  
  
  TAC_measures <- as.data.frame(matrix(nrow = 11, ncol = 4))
  names(TAC_measures) <- c("Names", "Area (mm2)", "Area (cm2)","Normalization")
  
  TAC_measures[1] <- c("Total_area",
                       "Subcutaneous_fat",
                       "Visceral_fat",
                       "Intramuscular_fat",
                       "Total_fat",
                       "VLD_muscle",
                       "LD_muscle",
                       "ND_muscle",
                       "HD_muscle",
                       "VHD_muscle",
                       "Total_muscle")
  
  # Total area
  TAC_measures[1,2] <- results_table[1,2]
  
  # Subcutaneous fat = Total fat - fat outer circle
  TAC_measures[2,2] <- results_table[2,2] - results_table[9,2]
  
  # Visceral fat = fat inner circle - mistake 
  TAC_measures[3,2] <- results_table[16,2] - results_table[24,2]
  
  # Intramuscular fat = fat outer circle - fat inner circle - fat vertebra error
  TAC_measures[4,2] <- results_table[9,2] - results_table[16,2] - results_table[23,2]
  
  # Total fat = subcutaneous + visceral + intramuscular
  TAC_measures[5,2] <- TAC_measures[2,2] + TAC_measures[3,2] + TAC_measures[4,2]
  
  # VLD muscle = VLD outer circle - VLD inner circle - VLD vertebra
  TAC_measures[6,2] <- results_table[3,2] - results_table[10,2] - results_table[17,2]
  
  # LD muscle = LD outer circle - LD inner circle - LD vertebra
  TAC_measures[7,2] <- results_table[4,2] - results_table[11,2] - results_table[18,2]
  
  # ND muscle = ND outer circle - ND inner circle - ND vertebra
  TAC_measures[8,2] <- results_table[5,2] - results_table[12,2] - results_table[19,2]
  
  # HD muscle = HD outer circle - HD inner circle - HD vertebra
  TAC_measures[9,2] <- results_table[6,2] - results_table[13,2] - results_table[20,2]
  
  # VHD muscle = VHD outer circle - VHD inner circle - VHD vertebra
  TAC_measures[10,2] <- results_table[7,2] - results_table[14,2] - results_table[21,2]
  
  # Total muscle = Total muscle outer circle - Total muscle inner circle - Total muscle vertebra
  TAC_measures[11,2] <- results_table[8,2] - results_table[15,2] - results_table[22,2]
  
  
  ######## From mm² to cm² ###########  
  cm <- as.vector(sapply(TAC_measures$`Area (mm2)`, function(x) x/100))
  TAC_measures$`Area (cm2)`<- cm
    
  # ===================================================================================== # 
  ########################################## SAVE ######################################### 
  # ===================================================================================== # 
  
  #### Excel ####
  wb <- createWorkbook()
  #add raw
  addWorksheet(wb, sheetName="Raw_measures_ImageJ")
  writeData(wb,sheet = "Raw_measures_ImageJ", results_table)
  #add processed
  addWorksheet(wb, sheetName="Def_measures_ImageJ")
  writeData(wb,sheet = "Def_measures_ImageJ", TAC_measures)
  
  #save
  #saveWorkbook(wb, paste0(where_save,"/",id_name ,"_body_composition_",ele,".xlsx"))
  saveWorkbook(wb, paste0(where_save,"/", file_path_sans_ext(names_files[ele]),
                          "_body_composition",".xlsx"))
  
}


