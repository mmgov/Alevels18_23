library("DT")
library("tidyverse")
library("cpp11")






alc2223<-read_csv("./england_ks5final2223.csv", na = c('*','','na')) %>% 
  select('URN','REGION','ESTAB','SCHNAME','TALLPPE_ALEV_1618','TALLPUP_ALEV_1618','TALLPPEGRD_ALEV_1618','NFTYPE/FESITYPE','TOWN','PCON_NAME')%>%
  rename(SCHOOLTYPE = 'NFTYPE/FESITYPE')%>% 
  filter (
    !TALLPPE_ALEV_1618 %in% c('NE','SUPP',NA)
    ,ESTAB != 'NA'
    ,!SCHOOLTYPE %in% c('SS','3066905','3104027','AC1619','Agriculture and Horticulture College'
                        ,'Art, Design and Performing Arts College','CTC','MODFC',NA))%>%
  mutate_at(c('TALLPPE_ALEV_1618', 'TALLPUP_ALEV_1618'), as.numeric)

SCHOOLTYPE<- c('Academy Converter','Independent School','Academy Sponsor Led','Community School','Voluntary Aided School','Foundation School','University Technical College','Free School – Mainstream', 'Academy 16-19 Converter','Voluntary Controlled School','Free School - 16-19')
ACRONYM<-c('ACC','IND','AC','CY','VA','FD','UTC','F','ACC1619','VC','F1619')
super_sleepers <- data.frame(ACRONYM, SCHOOLTYPE)


function(input, output) {


alc1819<-read_csv("./england_ks5final1819.csv", na = c('*','','na')) %>% 
  select('URN','REGION','ESTAB','SCHNAME','TALLPPE_ALEV_1618','TALLPUP_ALEV_1618','TALLPPEGRD_ALEV_1618','NFTYPE/FESITYPE','TOWN','PCON_NAME')%>%
  rename(SCHOOLTYPE = 'NFTYPE/FESITYPE')%>% 
  filter (
    !TALLPPE_ALEV_1618 %in% c('NE','SUPP',NA)
    ,ESTAB != 'NA'
    ,!SCHOOLTYPE %in% c('SS','3066905','3104027','AC1619','Agriculture and Horticulture College'
                        ,'Art, Design and Performing Arts College','CTC','MODFC',NA))%>%
  mutate_at(c('TALLPPE_ALEV_1618', 'TALLPUP_ALEV_1618'), as.numeric) %>% 
  rename('18/19' = 'TALLPPE_ALEV_1618') %>% 
  rename('18/19 Grade' = 'TALLPPEGRD_ALEV_1618')


alc2122<-read_csv("./england_ks5final2122.csv", na = c('*','','na')) %>% 
  select('URN','REGION','ESTAB','SCHNAME','TALLPPE_ALEV_1618','TALLPUP_ALEV_1618','TALLPPEGRD_ALEV_1618','NFTYPE/FESITYPE','TOWN','PCON_NAME')%>%
  rename(SCHOOLTYPE = 'NFTYPE/FESITYPE')%>% 
  filter (
    !TALLPPE_ALEV_1618 %in% c('NE','SUPP',NA)
    ,ESTAB != 'NA'
    ,!SCHOOLTYPE %in% c('SS','3066905','3104027','AC1619','Agriculture and Horticulture College'
                        ,'Art, Design and Performing Arts College','CTC','MODFC',NA))%>%
  mutate_at(c('TALLPPE_ALEV_1618', 'TALLPUP_ALEV_1618'), as.numeric) %>% 
  rename('21/22' = 'TALLPPE_ALEV_1618') %>% 
  rename( '21/22 Grade'= 'TALLPPEGRD_ALEV_1618')




final<-left_join(alc2223,(alc1819 %>% select(URN,'18/19','18/19 Grade')), by = "URN") %>% 
  left_join(.,(alc2122 %>% select(URN,'21/22','21/22 Grade')), by = "URN")



summarise(final)




output$Search <- renderDT({
  final %>%
    rename(SCHOOLNAME = 'SCHNAME')%>% 
    rename('PARLIAMENTARY CONTITUENCY' = 'PCON_NAME')%>% 
    rename('22/23' = 'TALLPPE_ALEV_1618')%>% 
    rename('22/23 Grade' = 'TALLPPEGRD_ALEV_1618')%>% 
    select('SCHOOLNAME','SCHOOLTYPE','PARLIAMENTARY CONTITUENCY','TOWN','18/19','18/19 Grade','21/22','21/22 Grade','22/23','22/23 Grade') %>% 
    arrange(SCHOOLNAME)
})



output$tb <- renderTable({
  dfa <- data.frame(
    Academic_Year = c('18/19', '21/22', '22/23'),
    Mean_TALLPPE_ALEV_1618 = c(32.4, 36.9, 33.1)
  )
}, align = "l")



  




final %>%
  rename(SCHOOLNAME = 'SCHNAME')%>% 
  rename('PARLIAMENTARY CONTITUENCY' = 'PCON_NAME')%>% 
  rename('22/23' = 'TALLPPE_ALEV_1618')%>% 
  rename('22/23 Grade' = 'TALLPPEGRD_ALEV_1618')%>% 
  select('18/19','21/22','22/23') %>% 
  summary()







output$download_scores <- downloadHandler(
  
  filename = "score.csv",
  content = function(file){
    file.copy("RawData/england_ks5final.csv",
              file)
  }
)

}








