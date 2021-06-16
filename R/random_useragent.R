#' randomly choosing an user-agent string, given a set of conditions
#'
#' @param min_obs minimum number observed for any given UA string, default 5000
#' @param software_name e.g. "Chrome", "Safari", "Firefox", "Edge", etc
#' @param software_type e.g. "browser", "bot", "application"
#' @param operating_system_name e.g. "Windows", "Linux", "Mac OS X", "macOS", etc
#' @param layout_engine_name e.g. "Gecko", "Blink", etc
#' @return a random user agent string, given filter conditions
#' @examples
#' random_useragent()
#' @export
random_useragent <- function(
  min_obs = 5000,
  software_name = NULL,
  software_type = "browser",
  operating_system_name = "Windows",
  layout_engine_name = NULL
) {

  ua_strings <- filter_useragent(
    min_obs = min_obs,
    software_name = software_name,
    software_type = software_type,
    operating_system_name = operating_system_name,
    layout_engine_name = layout_engine_name
  )
  sample(ua_strings, 1)
}

#' filter useragents based on criteria
#'
#' @param min_obs minimum number observed for any given UA string, default 5000
#' @param software_name e.g. "Chrome", "Safari", "Firefox", "Edge", etc
#' @param software_type e.g. "browser", "bot", "application"
#' @param operating_system_name e.g. "Windows", "Linux", "Mac OS X", "macOS", etc
#' @param layout_engine_name e.g. "Gecko", "Blink", etc
#' @return character vector of user agents
#' @examples
#' filter_useragent(
#'   min_obs = 500000,
#'   software_name = "Chrome",
#'   operating_system_name = "Linux"
#' )
#' @export
filter_useragent <- function(
  min_obs = 0,
  software_name = NULL,
  software_type = NULL,
  operating_system_name = NULL,
  layout_engine_name = NULL
) {

  # filters <- list(software_name = "Chrome", software_type = "browser", operating_system_name = "Windows")
  uas <- useragents[which(useragents$times_seen >= min_obs),]

  if (!is.null(software_name)) {
    uas <- uas[which((uas$software_name %in% software_name) & (!is.na(uas$software_name))),]
  }
  if (!is.null(software_type)) {
    uas <- uas[which((uas$software_type %in% software_type) & (!is.na(uas$software_type))),]
  }
  if (!is.null(operating_system_name)) {
    uas <- uas[which((uas$operating_system_name %in% operating_system_name) & (!is.na(uas$operating_system_name))),]
  }
  if (!is.null(layout_engine_name)) {
    uas <- uas[which((uas$layout_engine_name %in% layout_engine_name) & (!is.na(uas$layout_engine_name))),]
  }
  if (nrow(uas) == 0) {
    stop("No useragent string selected! Consider other combinations!")
  }
  uas$user_agent
}
