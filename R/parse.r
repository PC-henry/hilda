parse_header <- function(path){

  extention <- tools::file_ext(path)
  stopifnot(extention %in% c("csv", "tab", "txt"))

  names(data.table::fread(path, nrows = 0))
}

parse_switch <- function(path, vars){

  ext <- tools::file_ext(path)

  switch(ext,

         txt      = parse_txt(path = path, vars = vars),
         tab      = parse_tab(path = path, vars = vars),
         csv      = parse_csv(path = path, vars = vars),
         dta      = parse_dta(path = path, vars = vars),
         sav      = parse_sav(path = path, vars = vars),
         sas7bdat = parse_sas7bdat(path = path, vars = vars),

         stop("This function only accepts txt, csv, tab, dta, sav, sas7bdat files")
         )

}

parse_txt <- function(path, vars){
  data.table::fread(path, select = vars, data.table = TRUE)
}

parse_tab <- function(path, vars){
  data.table::fread(path, select = vars, data.table = TRUE)
}

parse_csv <- function(path, vars){
  data.table::fread(path, select = vars, data.table = TRUE)
}

parse_dta <- function(path, vars){
  data.table::as.data.table(
    haven::read_dta(path)
    )[, vars, with = FALSE]
}

parse_sav <- function(path, vars){
  data.table::as.data.table(
    haven::read_sav(path)
  )[, vars, with = FALSE]
}

parse_sas7bdat <- function(path, vars){
  data.table::as.data.table(
    haven::read_sas(path)
  )[, vars, with = FALSE]
}



