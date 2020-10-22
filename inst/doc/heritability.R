## ----setup, include=FALSE-----------------------------------------------------
library(inti)
library(knitr)

knitr::opts_chunk$set(
    fig.align = "center" # Center images in the export file
  , out.width = "98%" # Figure width in html
  , echo = TRUE # Avoid print code in the export file
  , message = FALSE # Avoid print messages in the export file
  , warning = FALSE # Avoid print messages in the export file
  , collapse = TRUE
  , comment = "#>"
  )

options(
    OutDec= "." # Use "." instead of "," in the decimal values
  , scipen = 99 # Avoid use "6e-04"
  , knitr.kable.NA = "" # NA values will appear as empty cell
  , knitr.table.format = "pipe" # Format for export tables
  , citr.use_betterbiblatex = FALSE # For zotero addin 
  ) 

## ---- echo=FALSE--------------------------------------------------------------
tibble(
  Standart = "$H^2=\\frac{\\sigma_g^2}{\\sigma_p^2}=\\frac{\\Delta G}{S}$",
  Cullis = "$H_{Cullis}^2=1-\\frac{\\overline{V}_{\\Delta..}^{^{BLUP}}}{2\\cdot\\sigma_g^2}$",
  Piepho = "$H_{Piepho}^2=\\frac{\\sigma_g^2}{\\sigma_g^2+\\frac{\\overline{V}_{\\Delta..}^{BLUE}}{2}}$"
  ) %>% 
  kable(caption = "Differentes heritability calculation")

## ----pkgs---------------------------------------------------------------------

library(inti)
library(agridat)


## ----fig.width= 7, fig.height=5-----------------------------------------------

 dt <- john.alpha
 hr <- H2cal(data = dt
            , trait = "yield"
            , gen.name = "gen"
            , rep.n = 3
            , fix.model = "rep + (1|rep:block) + gen"
            , ran.model = "rep + (1|rep:block) + (1|gen)"
            , emmeans = TRUE
            , plot_diag = TRUE
            , plot_dots = "rep"
            , outliers.rm = FALSE
            )
 

## -----------------------------------------------------------------------------
hr$model %>% summary()

## -----------------------------------------------------------------------------
hr$tabsmr %>% kable(caption = "Variance component table.")

## -----------------------------------------------------------------------------
hr$blups %>% kable(caption = "BLUPs.")

## -----------------------------------------------------------------------------
hr$blues %>% kable(caption = "BLUEs.")

## ----references, echo=FALSE---------------------------------------------------
if(!file.exists("files/pkgs.bib")){write_bib(c(.packages()),'files/pkgs.bib')}

