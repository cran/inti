## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")


## ----echo=TRUE----------------------------------------------------------------
# Install packages and dependencies

library(inti)
library(dplyr)
library(huito)


## ----echo=TRUE----------------------------------------------------------------
# 1. Define factors: Irrigation regimes (main plots) and commercial quinoa varieties (sub-plots)
factors_split <- list(
  Irrigation = c("Full", "Deficit"),
  Variety    = c("Var_1", "Var_2", "Var_3")
)

# 2. Generate Split-plot layout: 2 main levels x 3 sub levels x 4 blocks = 24 plots
split_exp <- design_split(
  factors = factors_split,
  type = "split_rcbd",
  rep = 4,
  zigzag = TRUE,
  seed = 2026
)

# Fieldbook preview
split_exp$fieldbook %>% 
  head(10) %>% 
  knitr::kable(caption = "Split-plot Fieldbook preview")

# Field layout visualization
tarpuy_plotdesign(
  data = split_exp,
  factor = "Irrigation",
  fill = c("plots", "Variety")
)


## ----echo=TRUE----------------------------------------------------------------
# Experimental fieldbook
fb <- split_exp$fieldbook


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
               , opts = list(hjust = 0.0, vjust = 0.0)
               , font = font[2]
               , color = "black"
               , prefix = "Irrigation: "
               , fontface = "bold"
               ) %>%
    include_text(value = "Variety"
               , position = c(2.4, 0.5)
               , opts = list(hjust = 0.0, vjust = 0.0) 
               , size = 12
               , color = "#009966"
               , font = font[2]
               , prefix = "Variety: "
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
#               , filename = "horizontal-split"
#               , nlabels = 12)

