## -----------------------------------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")

## -----------------------------------------------------------------------------
url <- "https://docs.google.com/spreadsheets/d/1nLP-dH9-dsVMXgsU7Z02EbgWvMIBKG5IYVRHAJCN-Z0/edit#gid=0"
url %>% 
  gsheet2tbl() %>% 
  include_table(caption = "Módulos de la aplicación Yupana")

## -----------------------------------------------------------------------------
url <- "https://docs.google.com/spreadsheets/d/1nLP-dH9-dsVMXgsU7Z02EbgWvMIBKG5IYVRHAJCN-Z0/edit#gid=1216293392"
url %>% 
  gsheet2tbl() %>% 
  include_table(    
    caption = "Lista de argumentos, descripción y opciones para la generación de gráficos en la aplicación Yupana"
    , notes = "Opciones basadas en la función: `plot_smr()`"
    , label = "Nota:"
    )

## -----------------------------------------------------------------------------
knitr::include_graphics("files/graph-table.png")

## -----------------------------------------------------------------------------
knitr::include_graphics("files/graph-figure.png")

## -----------------------------------------------------------------------------
knitr::include_graphics("files/graph-figure.png")

## -----------------------------------------------------------------------------
knitr::include_graphics("files/graph-table-grid.png")

