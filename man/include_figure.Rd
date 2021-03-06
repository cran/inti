% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/include_figure.R
\name{include_figure}
\alias{include_figure}
\title{Figure with caption and notes}
\usage{
include_figure(figure, caption = NA, notes = NA, label = NA)
}
\arguments{
\item{figure}{Path or URL of the figure.}

\item{caption}{Figure caption (default = NA).}

\item{notes}{Figure notes (default = NA).}

\item{label}{Label for the notes (default = NA).}
}
\value{
Figure with caption and notes
}
\description{
Include figures with title and notes using a data base
}
\examples{

library(inti)

figure <- "https://inkaverse.com/reference/figures/logo.png"

figure \%>\% include_figure(caption = "Title test."
                        , notes = "Note test.")

}
