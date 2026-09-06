## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")


## -----------------------------------------------------------------------------
#| echo: true

# Install packages and dependencies

library(inti)
library(dplyr)
library(huito)


## ----echo=TRUE----------------------------------------------------------------
# 1. Define salinity levels (NaCl concentrations in mM)
factors_crd <- list(
  NaCl= c("0", "50", "100", "150", "200")
)

# 2. Generate CRD layout (5 treatments x 4 replications = 20 petri dishes/units)
crd_exp <- design_repblock(
  factors = factors_crd,
  type = "crd",
  rep = 4,
  zigzag = TRUE,
  seed = 2026
)

# Fieldbook preview
crd_exp$fieldbook %>% 
  head(10) %>% 
  knitr::kable(caption = "CRD Fieldbook preview")

# Layout on germination chamber shelves

tarpuy_plotdesign(
  data = crd_exp,
  factor = "NaCl",
  fill = c("plots", "NaCl")
)


## ----echo=TRUE----------------------------------------------------------------
# Experimental fieldbook
fb <- crd_exp$fieldbook


## ----echo=TRUE----------------------------------------------------------------
font <- c("Permanent Marker", "Tillana", "Courgette")

huito_fonts(font)


## -----------------------------------------------------------------------------
#| echo: true

label <- fb %>%
  label_layout(
    size = c(5.2, 10)
    ,
    border_color = "#5C0000"
    ,
    border_width = 1.5
  ) %>%
  include_image(
    value = "https://inkaverse.com/img/inkaverse.png"
    ,
    size = c(1.3, 1.5)
    ,
    position = c(0.8, 9.1)
  )  %>%
  include_text(
    value = "plots"
    ,
    position = c(4.2, 9.1)
    ,
    size = 20
    ,
    color = "black"
    ,
    fontface = "bold"
    ,
    font = font[1]
  )  %>%
  include_image(value = "https://huito.inkaverse.com/img/scale.pdf"
                ,
                size = c(5, 1)
                ,
                position = c(2.6, 7.7)) %>%
  include_barcode(value = "qrcode"
                  ,
                  size = c(5, 5)
                  ,
                  position = c(2.6, 4.7)) %>%
  include_text(
    value = "NaCl"
    ,
    position = c(2.6, 1.7)
    ,
    size = 12
    ,
    prefix = "NaCl: "
    ,
    color = "blue"
    ,
    font = font[2]
    , 
    fontface = "bold"
  )  %>%
  include_image(value = "https://huito.inkaverse.com/img/scale.pdf"
                ,
                size = c(5, 1)
                ,
                position = c(2.6, 0.6)) 


## -----------------------------------------------------------------------------
label %>% 
  label_print(mode = "preview")


## ----echo = TRUE--------------------------------------------------------------
#| eval: false
# label %>%
#   label_print(mode = "complete"
#               , filename = "vertical-DCA-1"
#               , nlabels = 12)

