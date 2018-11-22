
#' Describe HILDA variables
#'
#' Matches variable names to data dictionary entries and returns a
#' data table of descriptions. The function is not case sensitive and
#' matches with or without wave prefixes.
#'
#' @param variables A character vector of variable names
#'
#' @return A data table subset of the data \code{\link{dictionary}}
#' @export
#'
#' @examples
#'
#' describe("XHHRAID")
#' describe(c("pmhlyr", "_TIFDIF"))

describe <- function(variables){

  stopifnot(class(variables) == "character")

  data.table:::merge.data.table(
    data.table::data.table(name = match_vars(variables)),
    dictionary,
    by = "name",
    all.x = T
  )

}


var_match_list <- data.table:::unique.data.table(

  data.table::data.table(
    var   = c(dictionary$name, sapply(c(LETTERS[1:16], ""), function(let) gsub("_", let, dictionary$name))),
    match = rep(dictionary$name, 18),
    key = c("var", "match")
  )

)

match_vars <- function(variables){

  stopifnot(is.vector(variables))
  variables <- toupper(as.character(variables))

  data.table:::merge.data.table(
    data.table(var = variables),
    var_match_list,
    by = "var",
    all.x = T
  )[, match]

}



