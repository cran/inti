## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")


## ----echo=TRUE----------------------------------------------------------------
# Install packages and dependencies

library(inti)
library(dplyr)
library(huito)


## ----echo=TRUE----------------------------------------------------------------
# 1. Define factors: Salinity levels and incubation temperatures
factors_crd_2f <- list(
  NaCl = c("0", "50", "100"),
  Temp = c("20", "25")
)

# 2. Generate factorial CRD layout
crd_exp_2f <- design_repblock(
  nfactors = 2,
  factors = factors_crd_2f,
  type = "crd",
  rep = 4,
  zigzag = TRUE,
  seed = 2026
)

# Fieldbook preview
crd_exp_2f$fieldbook %>%
  head(10) %>%
  knitr::kable(caption = "Factorial CRD Fieldbook preview")

# Spatial layout visualization
tarpuy_plotdesign(
  data = crd_exp_2f,
  factor = "NaCl",
  fill = c("plots", "Temp")
)


## ----echo=TRUE----------------------------------------------------------------
# Experimental fieldbook
fb <- crd_exp_2f$fieldbook


## ----echo=TRUE----------------------------------------------------------------
font <- c("Permanent Marker", "Tillana", "Courgette")

huito_fonts(font)


## -----------------------------------------------------------------------------
#| echo: true

label <- fb %>%  
  label_layout(size = c(10, 2.5)
               , border_color = "blue"
               ) %>%
  include_image(
    value = "https://flavjack.github.io/inti/img/inkaverse.png"
    , size = c(2.1, 2.4)
    , position = c(1.2, 1.25)
    # , opts = list("image_scale(200)", "image_noise()")
    ) %>%
  include_barcode(
     value = "barcode"
     , size = c(2.5, 2.5)
     , position = c(8.2, 1.25)
     ) %>%
  include_text(value = "INKAVERSE"
               , position = c(4.6, 2)
               , size = 20
               , font = font[1]
               , fontface = "bold"
               , color = "red"
               ) %>%
  include_text(value = "NaCl"
               , position = c(4.5, 1.2)
               , size = 12
               , font = font[2]
               , color = "black"
               , prefix = "NaCl: "
               , fontface = "bold"
               ) %>%
    include_text(value = "Temp"
               , position = c(4.6, 0.5)
               , size = 12
               , color = "#009966"
               , font = font[2]
               , prefix = "Temperature: "
               , fontface = "bold"
               ) %>% 
  include_text(value = "plots"
               , position = c(9.7, 1.25)
               , angle = 90
               , size = 12
               , color = "brown"
               , font = font[3]
               , prefix = "Plot: "
               ) 


## -----------------------------------------------------------------------------
label %>% 
  label_print(mode = "preview")


## ----echo = TRUE--------------------------------------------------------------
#| eval: false

# label %>%
#   label_print(mode = "complete"
#               , filename = "horizontal_crd_exp_2f"
#               , nlabels = 12)

