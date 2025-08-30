## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")
knitr::opts_chunk$set(echo = TRUE)


## ----echo=FALSE---------------------------------------------------------------
tibble(
  Standart = "$H^2=\\frac{\\sigma_g^2}{\\sigma_p^2}=\\frac{\\Delta G}{S}$",
  Cullis = "$H_{Cullis}^2=1-\\frac{\\overline{V}_{\\Delta..}^{^{BLUP}}}{2\\cdot\\sigma_g^2}$",
  Piepho = "$H_{Piepho}^2=\\frac{\\sigma_g^2}{\\sigma_g^2+\\frac{\\overline{V}_{\\Delta..}^{BLUE}}{2}}$"
  ) %>% 
  kable(caption = "Differentes heritability calculation")


## ----pkgs, echo=TRUE----------------------------------------------------------
library(inti)


## ----fig.width= 7, fig.height=5-----------------------------------------------
 dt <- inti::potato
 hr <- H2cal(data = dt
            , trait = "stemdw"
            , gen.name = "geno"
            , rep.n = 5
            , fixed.model = "0 + (1|bloque) + geno"
            , random.model = "1 + (1|bloque) + (1|geno)"
            , emmeans = TRUE
            , plot_diag = TRUE
            , outliers.rm = TRUE
            )


## -----------------------------------------------------------------------------
hr$model %>% summary()


## -----------------------------------------------------------------------------
hr$tabsmr %>% kable(caption = "Variance component table")


## -----------------------------------------------------------------------------
hr$blues %>% kable(caption = "BLUEs")


## -----------------------------------------------------------------------------
hr$blups %>% kable(caption = "BLUPs")


## -----------------------------------------------------------------------------
hr$outliers$fixed %>% kable(caption = "Outliers fixed model")


## -----------------------------------------------------------------------------
hr$outliers$random %>% kable(caption = "Outliers random model")


## ----references, echo=FALSE---------------------------------------------------
if(!file.exists("files/pkgs.bib")){write_bib(c(.packages()),'files/pkgs.bib')}

