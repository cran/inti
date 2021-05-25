## ----setup, include=FALSE-----------------------------------------------------
source("http://inkaverse.com/docs.r")
knitr::opts_chunk$set(echo = TRUE)

## ---- echo=FALSE--------------------------------------------------------------
tibble(
  Standart = "$H^2=\\frac{\\sigma_g^2}{\\sigma_p^2}=\\frac{\\Delta G}{S}$",
  Cullis = "$H_{Cullis}^2=1-\\frac{\\overline{V}_{\\Delta..}^{^{BLUP}}}{2\\cdot\\sigma_g^2}$",
  Piepho = "$H_{Piepho}^2=\\frac{\\sigma_g^2}{\\sigma_g^2+\\frac{\\overline{V}_{\\Delta..}^{BLUE}}{2}}$"
  ) %>% 
  kable(caption = "Differentes heritability calculation")

## ----pkgs, echo=TRUE----------------------------------------------------------
library(inti)
library(agridat)

## ----fig.width= 7, fig.height=5-----------------------------------------------
 dt <- john.alpha
 hr <- H2cal(data = dt
            , trait = "yield"
            , gen.name = "gen"
            , rep.n = 3
            , ran.model = "1 + rep + (1|rep:block) + (1|gen)"
            , fix.model = "0 + rep + (1|rep:block) + gen"
            , emmeans = TRUE
            , plot_diag = TRUE
            , outliers.rm = TRUE
            )

## -----------------------------------------------------------------------------
hr$model %>% summary()

## -----------------------------------------------------------------------------
hr$tabsmr %>% kable(caption = "Variance component table")

## -----------------------------------------------------------------------------
hr$blups %>% kable(caption = "BLUPs")

## -----------------------------------------------------------------------------
hr$blues %>% kable(caption = "BLUEs")

## -----------------------------------------------------------------------------
hr$outliers$random %>% kable(caption = "Outliers random model")

## -----------------------------------------------------------------------------
hr$outliers$fixed %>% kable(caption = "Outliers fixed model")

## ----references, echo=FALSE---------------------------------------------------
if(!file.exists("files/pkgs.bib")){write_bib(c(.packages()),'files/pkgs.bib')}

