#' This function collects comments from source code that use the #' symbol for commenting.
#' It also collects lines of code
#'
#' @param file A string that contains the path to the source file
#'
#' @param encoding A string containing the encode that will be used to read the script, by default it will be 'Native'
#'
#' @return a list of lines
#'
#' @example get_lines('C:/path/to/file.R')
#'

get_comments <- function(file, encoding = "UTF-8") {

  # lines are collected
  data <- read.delim(file, col.names = 'lines', header = FALSE, stringsAsFactors = FALSE, encoding = encoding)

  # Comments are extracted and trimmed
  extracted_comments <- trimws(data[substr(data$lines, 1, 2) == "#'",], 'left')

  # the #' is removed
  extracted_comments <- unlist(lapply(extracted_comments,
                                      function(x) {
                                        x <- substr(x, 3, nchar(x))
                                        if(substr(x, 1, 1) == ' ') x <- substr(x, 2, nchar(x))
                                        x
                                        }))


  return(extracted_comments)
}

