## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")

## -----------------------------------------------------------------------------
url <- "https://docs.google.com/spreadsheets/d/1nLP-dH9-dsVMXgsU7Z02EbgWvMIBKG5IYVRHAJCN-Z0/edit#gid=73943593"
url %>% 
  gsheet2tbl() %>% 
  include_table(caption = "Módulos de la aplicación Tarpuy")

