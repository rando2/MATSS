#' @title Read in the cowley lizard community data from a txt file
#'
#' Import cowley lizard data from data files
#' 
#' @return list of two dataframes (one with abundance data, the other with 
#'   covariate data) and one list of metadata.
#'
#' @export
#'
get_cowley_lizards <- function()
{
    path <- system.file("extdata", "cowleylizards.txt",
                        package = "MATSS", mustWork = TRUE)
    raw_data <- read.delim(path) %>%
        dplyr::mutate_if(is.numeric, list(~dplyr::na_if(., -99))) %>%
        dplyr::filter(!is.na(.data$Cnemnidophorous_sexlineatus))
    
    out <- list(abundance = dplyr::select(raw_data, -dplyr::one_of(c("Year", "Site", "Total"))), 
         covariates = dplyr::select(raw_data, .data$Year),
         metadata = list(timename = "Year", effort = NULL, site = "CowleyCounty",
                         is_community = TRUE, 
                         citation = paste("Wilgers, DJ, Horne, EA, Sandercock, BK, Volkmann, AW, 2006.", 
                                        "EFFECTS OF RANGELAND MANAGEMENT ON COMMUNITY DYNAMICS OF THE",  
                                        "HERPETOFAUNA OF THE TALLGRASS PRAIRIE, Herpetologica, 62(4)."),
                         source_url = "https://bioone.org/journals/Herpetologica/volume-62/
                            issue-4/0018-0831(2006)62[378:EORMOC]2.0.CO;2/EFFECTS-OF-RANGELAND-
                            MANAGEMENT-ON-COMMUNITY-DYNAMICS-OF-THE-HERPETOFAUNA/10.1655/0018-
                            0831(2006)62[378:EORMOC]2.0.CO;2.full"))
    attr(out, "class") <- "matssdata"
    
    return(out)
}

#' @title Read in the cowley snake community data from a txt file
#'
#' Import cowley snake data from data files
#' 
#' @return list of two dataframes (one with abundance data, the other with 
#'   covariate data) and one list of metadata.
#'
#' @export
#'
get_cowley_snakes <- function()
{
    path <- system.file("extdata", "cowleysnakes.txt",
                        package = "MATSS", mustWork = TRUE)
    raw_data <- read.delim(path) %>%
        dplyr::mutate_if(is.numeric,list(~dplyr::na_if(., -99))) %>%
        dplyr::filter(!is.na(.data$Agkistrodon_contortrix))
    
    out <- list(abundance = dplyr::select(raw_data, -dplyr::one_of(c("Year", "Site", "Total"))), 
         covariates = dplyr::select(raw_data, .data$Year),
         metadata = list(timename = "Year", effort = NULL, site = "CowleyCounty",
                         is_community = TRUE, 
                         citation = paste("Wilgers, DJ, Horne, EA, Sandercock, BK, Volkmann, AW, 2006.", 
                                          "EFFECTS OF RANGELAND MANAGEMENT ON COMMUNITY DYNAMICS OF THE", 
                                          "HERPETOFAUNA OF THE TALLGRASS PRAIRIE, Herpetologica, 62(4)."), 
                         source_url = "https://bioone.org/journals/Herpetologica/volume-62/
                            issue-4/0018-0831(2006)62[378:EORMOC]2.0.CO;2/EFFECTS-OF-RANGELAND-
                            MANAGEMENT-ON-COMMUNITY-DYNAMICS-OF-THE-HERPETOFAUNA/10.1655/0018-
                            0831(2006)62[378:EORMOC]2.0.CO;2.full"))
    attr(out, "class") <- "matssdata"
    
    return(out)
}