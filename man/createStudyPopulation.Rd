% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/StudyPopulation.R
\name{createStudyPopulation}
\alias{createStudyPopulation}
\title{Create a study population}
\usage{
createStudyPopulation(
  plpData,
  population = NULL,
  outcomeId,
  binary = T,
  includeAllOutcomes = T,
  firstExposureOnly = FALSE,
  washoutPeriod = 0,
  removeSubjectsWithPriorOutcome = TRUE,
  priorOutcomeLookback = 99999,
  requireTimeAtRisk = F,
  minTimeAtRisk = 365,
  riskWindowStart = 0,
  startAnchor = "cohort start",
  riskWindowEnd = 365,
  endAnchor = "cohort start",
  verbosity = "INFO",
  addExposureDaysToStart,
  addExposureDaysToEnd,
  ...
)
}
\arguments{
\item{plpData}{An object of type \code{plpData} as generated using
\code{getDbplpData}.}

\item{population}{If specified, this population will be used as the starting point instead of the
cohorts in the \code{plpData} object.}

\item{outcomeId}{The  ID of the outcome.}

\item{binary}{Forces the outcomeCount to be 0 or 1 (use for binary prediction problems)}

\item{includeAllOutcomes}{(binary) indicating whether to include people with outcomes who are not observed for the whole at risk period}

\item{firstExposureOnly}{Should only the first exposure per subject be included? Note that
this is typically done in the \code{createStudyPopulation} function,}

\item{washoutPeriod}{The mininum required continuous observation time prior to index
date for a person to be included in the cohort.}

\item{removeSubjectsWithPriorOutcome}{Remove subjects that have the outcome prior to the risk window start?}

\item{priorOutcomeLookback}{How many days should we look back when identifying prior outcomes?}

\item{requireTimeAtRisk}{Should subject without time at risk be removed?}

\item{minTimeAtRisk}{The minimum number of days at risk required to be included}

\item{riskWindowStart}{The start of the risk window (in days) relative to the \code{startAnchor}.}

\item{startAnchor}{The anchor point for the start of the risk window. Can be "cohort start" or "cohort end".}

\item{riskWindowEnd}{The end of the risk window (in days) relative to the \code{endAnchor} parameter}

\item{endAnchor}{The anchor point for the end of the risk window. Can be "cohort start" or "cohort end".}

\item{verbosity}{Sets the level of the verbosity. If the log level is at or higher in priority than the logger threshold, a message will print. The levels are:
\itemize{
\item{DEBUG}{Highest verbosity showing all debug statements}
\item{TRACE}{Showing information about start and end of steps}
\item{INFO}{Show informative information (Default)}
\item{WARN}{Show warning messages}
\item{ERROR}{Show error messages}
\item{FATAL}{Be silent except for fatal errors} 
}}

\item{addExposureDaysToStart}{DEPRECATED: Add the length of exposure the start of the risk window? Use \code{startAnchor} instead.}

\item{addExposureDaysToEnd}{DEPRECATED: Add the length of exposure the risk window? Use \code{endAnchor} instead.}

\item{...}{Other inputs}
}
\value{
A data frame specifying the study population. This data frame will have the following columns:
\describe{
\item{rowId}{A unique identifier for an exposure}
\item{subjectId}{The person ID of the subject}
\item{cohortStartdate}{The index date}
\item{outcomeCount}{The number of outcomes observed during the risk window}
\item{timeAtRisk}{The number of days in the risk window}
\item{survivalTime}{The number of days until either the outcome or the end of the risk window}
}
}
\description{
Create a study population
}
\details{
Create a study population by enforcing certain inclusion and exclusion criteria, defining
a risk window, and determining which outcomes fall inside the risk window.
}
