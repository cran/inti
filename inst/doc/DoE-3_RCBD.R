## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")


## ----echo=TRUE----------------------------------------------------------------
# Install packages and dependencies

library(inti)
library(dplyr)
library(huito)


## ----echo=TRUE----------------------------------------------------------------
# 1. Define factors: Bean genotypes, fertilization levels, and irrigation regimes
factors_rcbd_3f <- list(
  Genotype = c("Bean_01", "Bean_02"),
  Fertilization = c("0", "50"),
  Irrigation = c("Low", "Medium")
)

# 2. Generate factorial RCBD layout
rcbd_exp_3f <- design_repblock(
  nfactors = 3,
  factors = factors_rcbd_3f,
  type = "rcbd",
  rep = 4,
  zigzag = TRUE,
  seed = 2026
)

# Fieldbook preview
rcbd_exp_3f$fieldbook %>%
  head(10) %>%
  knitr::kable(caption = "Factorial RCBD Fieldbook preview")

# Spatial layout visualization
tarpuy_plotdesign(
  data = rcbd_exp_3f,
  factor = "Genotype",
  fill = c("plots", "Fertilization", "Irrigation")
)


## ----echo=TRUE----------------------------------------------------------------
# Experimental fieldbook
fb <- rcbd_exp_3f $fieldbook


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
  include_text(value = "Irrigation"
               , position = c(2.4, 1.2)
               , size = 12
               , font = font[2]
               , color = "black"
               , prefix = "Irrigation: "
               , fontface = "bold"
               , opts = list(hjust = 0.0, vjust = 0.0)
               ) %>%
    include_text(value = "Genotype"
               , position = c(2.4, 0.5)
               , size = 12
               , color = "#009966"
               , font = font[2]
               , prefix = "Genotype: "
               , fontface = "bold"
               , opts = list(hjust = 0.0, vjust = 0.0)
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
#               , filename = "horizontal_rcbd_exp_3f "
#               , nlabels = 12)

