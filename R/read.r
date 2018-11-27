
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
#'\dontrun{
#' dt1 <- read.hilda("Eperson_n160u.dta")
#' dt2 <- read.hilda(
#'     paths     = c("Combined p160c.tab", "Combined o160c.tab"),
#'     variables = c("XHHRAID","_alopmt", "hhwte")
#'  )
#' }

read.hilda <- function(paths, variables = NULL){

  if (Sys.info()["sysname"] == "Windows"){

    pbapply::pboptions(type = "win", title = "Parsing HILDA files")
    hilda_list <- pbapply::pblapply(paths, parse_switch, vars = variables)

  } else {

    hilda_list <- lapply(paths, parse_switch, vars = variables)

  }
  message(paste0(crayon::green(cli::symbol$tick), " ", crayon::white("Files parsed")))


  hilda_list <- lapply(hilda_list, function(dt){

    names(dt) <- match_vars(names(dt))
    return(dt)

  })
  message(paste0(crayon::green(cli::symbol$tick), " ", crayon::white("Headers cleaned")))


  if(length(hilda_list) == 1){

    return(hilda_list[[1]])

  } else {

    hilda_list <- data.table::rbindlist(hilda_list, use.names = TRUE, fill = TRUE)
    message(paste0(crayon::green(cli::symbol$tick), " ", crayon::white("Datasets merged")))
    return(hilda_list)

  }

}


