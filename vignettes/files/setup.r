library(inti)
library(knitr)

# -------------------------------------------------------------------------
# Knitr options -----------------------------------------------------------
# -------------------------------------------------------------------------

knitr::opts_chunk$set(
    fig.align = "center" # Center images in the export file
  , out.width = "98%" # Figure width in html
  , echo = TRUE # Avoid print code in the export file
  , message = FALSE # Avoid print messages in the export file
  , warning = FALSE # Avoid print messages in the export file
  , collapse = TRUE
  , comment = "#>"
  )

# -------------------------------------------------------------------------
# Compile options ---------------------------------------------------------
# -------------------------------------------------------------------------

options(
    OutDec= "." # Use "." instead of "," in the decimal values
  , scipen = 99 # Avoid use "6e-04"
  , knitr.kable.NA = "" # NA values will appear as empty cell
  , knitr.table.format = "pipe" # Format for export tables
  , citr.use_betterbiblatex = FALSE # For zotero addin 
  ) 

