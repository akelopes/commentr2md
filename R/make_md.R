#' Parses a list of comments in markdown style and
#' renders a markdown or html file.
#' To be used in conjunction with \code{get_comments()}
#'
#' @name make_md
#' @param file A string containing the path of the file that will be documented
#'
#' @param output_name A string containing the name of the file that will be written, without extension
#'
#' @param encoding A string containing the encode that will be passed on to the \code{get_comments()} and \code{markdownToHTML} functions, by default it will be 'Native'
#'
#' @param style A string containing a CSS stylesheet file
#'
#' @param ... args that can be passed on to markdownToHTML
#'
#' @return A markdown and a html file.
#'
#' @example make_md('C:/path/to/file.R', 'file')

require(markdown)

make_md <- function(file, output_name, encoding = "UTF-8", style = NULL, ...) {

  default_css <- system.file("css", "style.css", package = "commentr2md")
  write.table(get_comments(file, encoding), file = paste0(output_name, ".md"),
              fileEncoding = encoding,
              eol = '\r\n',
              row.names = FALSE, col.names = FALSE,
              quote = FALSE)

  markdownToHTML(paste0(output_name, ".md"),
                 output = paste0(output_name, '.html'),
                 title = output_name,
                 encoding = encoding,
                 stylesheet = ifelse(is.null(style), default_css, style),
                 ...)
}
