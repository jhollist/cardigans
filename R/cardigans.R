#' Generates palettes based on Mr. Rogers cardigans
#'
#' These color palettes are based on Owen Phillips for his blog post on 
#' [Mr. Rogers cardigans](https://theawl.com/every-color-of-cardigan-mister-rogers-wore-from-1979-2001-83c1faba2677) 
#' and to [@Henryjean's code](https://github.com/Henryjean/Rogers-Cardigans).  
#' And the real work in getting these colors is from [Tim Lybarger](http://www.neighborhoodarchive.com/about/).  
#'
#' @param n Number of colors desired. Default is to use all colors.
#' @param name 
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#' @importFrom graphics rgb rect par image text
#' @return A vector of colors.
#' @export
#' @keywords colors
#' @examples
#' 
cardigan <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  
  pal <- wes_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")
  
  if (missing(n)) {
    n <- length(pal)
  }
  
  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }
  
  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}
