

hilda_parse <- function(path){

  ext <- tools::file_ext(path)

  switch(ext,

         tab      = hilda_parse_tab(path),
         csv      = hilda_parse_csv(path),
         dta      = hilda_parse_dta(path),
         sav      = hilda_parse_sav(path),
         sas      = hilda_parse_sas(path),
         sas7bdat = hilda_parse_sas7bdat(path),

         error("This function only accepts csv, tab, dta, sav, sas and sas7bdat files")
         )


}



hilda_parse_tab <- function(path){
  data.table::fread(path)
}

hilda_parse_csv <- function(path){
  data.table::fread(path)
}

hilda_parse_dta <- function(path){

}

hilda_parse_sav <- function(path){

}

hilda_parse_sas <- function(path){

}

hilda_parse_sas7bdat <- function(path){

}



