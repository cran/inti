## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")


## ----echo=TRUE----------------------------------------------------------------
# Install packages and dependencies

library(inti)
library(dplyr)
library(huito)


## ----echo=TRUE----------------------------------------------------------------
# 1. Define checks (commercial controls) and new accessions
checks <- c("INIA_415", "INIA_420")
entries <- paste0("Geno_", 1:50)

# 2. Generate Augmented layout: 18 entries + (2 checks x 3 blocks) = 24 plots
aug_exp <- design_augmented(
  checks = checks,
  entries = entries,
  blocks = 5,
  zigzag = FALSE,
  seed = 2026
)

# Fieldbook preview
aug_exp$fieldbook %>% 
  head(10) %>% 
  knitr::kable(caption = "Augmented RCBD Fieldbook preview")

# Field layout visualization
tarpuy_plotdesign(
  data = aug_exp,
  factor = "type",          
  fill = c("plots", "entry")
)


## ----echo=TRUE----------------------------------------------------------------
# Experimental fieldbook
fb <- aug_exp$fieldbook


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
    value = "checks"
    ,
    position = c(2.6, 2)
    ,
    size = 12
    ,
    prefix = "Checks: "
    ,
    color = "blue"
    ,
    font = font[2]
    , 
    fontface = "bold"
  )  %>%
    include_text(
    value = "entry"
    ,
    position = c(2.6, 1.5)
    ,
    size = 12
    ,
    prefix = "Entry: "
    ,
    color = "red"
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
#               , filename = "vertical-aug")

