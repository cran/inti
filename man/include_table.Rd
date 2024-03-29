% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/include_table.R
\name{include_table}
\alias{include_table}
\title{Table with footnotes}
\usage{
include_table(table, caption = NA, notes = NA, label = NA, notation = "none")
}
\arguments{
\item{table}{Data frame.}

\item{caption}{Table caption (default = NULL). See details.}

\item{notes}{Footnotes for the table (default = NA). See details.}

\item{label}{Label for start the footnote (default = NA).}

\item{notation}{Notation for the symbols and footnotes (default =
"none") Others: "alphabet", "number", "symbol".}
}
\value{
Table with caption and footnotes
}
\description{
Include tables with title and footnotes for word and html documents
}
\examples{

library(inti)

table <- data.frame(
x = rep_len(1, 5)
, y = rep_len(3, 5)
, z = rep_len("c", 5)
)

table \%>\% inti::include_table(
  caption = "Title caption b) line 0
  a) line 1
  b) line 2"
  , notes = "Footnote"
  , label = "Where:"
  )
  
}
