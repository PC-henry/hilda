

#' Read & combine HILDA files
#'
#' This function reads in any HILDA file (SAS, Stata and SPSS included) and merges
#' the files where appropriate. This function works best with HILDA's TAB files as
#' they allow for parsing of individual columns, not the entire dataset. This function
#' is designed for HILDA 16 general and restricted and may not function correctly with
#' other versions of HILDA.
#'
#' @param paths a character vector of file paths to HILDA files
#' @param variables a character vector variables names to parse. These can use
#'
#' @return data.table
#' @export
#'
#' @examples
#'

read.hilda <- function(paths, variables){

  fast_parse <- any(!(
    tolower(tools::file_ext(paths)) %in% c("csv", "txt", "tab")
    ))


  if(fast_parse){

    return(fast_read_hilda(paths = paths, variables = variables))

  } else {

    return(slow_read_hilda(paths = paths, variables = variables))

  }

}


fast_read_hilda <- function(paths, variables){

  NULL

}


slow_read_hilda <- function(paths, variables){

  NULL

}


