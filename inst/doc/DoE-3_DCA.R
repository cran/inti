## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")


## ----echo=TRUE----------------------------------------------------------------
# Install packages and dependencies

library(inti)
library(dplyr)
library(huito)


## ----echo=TRUE----------------------------------------------------------------
# 1. Define factors: Salinity levels, incubation temperatures, and genotypes
factors_crd_3f <- list(
  NaCl = c("0", "50"),
  Temp = c("20", "25"),
  Genotype = c("G1", "G2")
)

# 2. Generate factorial CRD layout
crd_exp_3f <- design_repblock(
  nfactors = 3,
  factors = factors_crd_3f,
  type = "crd",
  rep = 4,
  zigzag = TRUE,
  seed = 2026
)

# Fieldbook preview
crd_exp_3f$fieldbook %>%
  head(10) %>%
  knitr::kable(caption = "Factorial CRD Fieldbook preview")

# Spatial layout visualization
tarpuy_plotdesign(
  data = crd_exp_3f,
  factor = "NaCl",
  fill = c("plots", "Temp", "Genotype")
)


## ----echo=TRUE----------------------------------------------------------------
# Experimental fieldbook
fb <- crd_exp_3f$fieldbook


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
    value = "Genotype"
    ,
    position = c(2.6, 2)
    ,
    size = 12
    ,
    prefix = "Genotype: "
    ,
    color = "blue"
    ,
    font = font[2]
    , 
    fontface = "bold"
  )  %>%
    include_text(
    value = "NaCl"
    ,
    position = c(2.6, 1.5)
    ,
    size = 12
    ,
    prefix = "salinity: "
    ,
    color = "red"
    ,
    font = font[2]
    , 
    fontface = "bold"
  ) |> 
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
#               , filename = "vertical-DCA-3"
#               , nlabels = 12)

