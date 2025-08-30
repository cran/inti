## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")


## ----modules------------------------------------------------------------------
url <- "https://docs.google.com/spreadsheets/d/1nLP-dH9-dsVMXgsU7Z02EbgWvMIBKG5IYVRHAJCN-Z0/edit#gid=0"
url %>% 
  gsheet2tbl() %>% 
  include_table(caption = "Módulos de la aplicación Yupana")


## ----param--------------------------------------------------------------------
url <- "https://docs.google.com/spreadsheets/d/1nLP-dH9-dsVMXgsU7Z02EbgWvMIBKG5IYVRHAJCN-Z0/edit#gid=1216293392"
url %>% 
  gsheet2tbl() %>% 
  include_table(    
    caption = "Lista de argumentos, descripción y opciones para la generación de gráficos en la aplicación Yupana"
    , notes = "Opciones basadas en la función: `plot_smr()`"
    , label = "Nota:"
    )


## ----tparam, fig.cap= "Parámetros en `{arguments}` y `{values}` para la generación de gráficos en la aplicación Yupana."----

knitr::include_graphics("files/graph-table.png")


## ----plot, fig.cap= "Figura basada en los `{arguments}` y `{values}` de la tabla anterior."----

knitr::include_graphics("files/graph-figure.png")


## ----opt, fig.cap= "Gráfico con la inclusión de la capa `facet_grid()`"-------

knitr::include_graphics("files/graph-figure.png")


## ----topt, fig.cap= "Inclusión de `facet_grid(tratamiento ~ .)` en `opt` de los `{arguments}` en Yupana."----

knitr::include_graphics("files/graph-table-grid.png")

