#' Metadata of all HILDA variables.
#'
#' A data table containing information for every HILDA variable.
#' It contains the cross-wave information from the online HILDA
#' data dictionary including subject area, description and
#' waves where the variable occurs. Information accurate as at
#' 2018-11-22.
#'
#' @format A data table with 9297 rows and 5 variables:
#' \describe{
#'   \item{name}{Variable name where '_' replaces the wave ID}
#'   \item{description}{Variable description}
#'   \item{occurance}{Waves where the variable has been recorded}
#'   \item{category1}{Subject area}
#'   \item{category2}{Nested area}
#' }
#'
#' @source \url{https://www.online.fbe.unimelb.edu.au/HILDAodd/Default.aspx}
"dictionary"
