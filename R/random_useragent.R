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
filter_useragent <- function(
  min_obs = 0,
  software_name = NULL,
  software_type = NULL,
  operating_system_name = NULL,
  layout_engine_name = NULL
) {

  # filters <- list(software_name = "Chrome", software_type = "browser", operating_system_name = "Windows")
  uas <- dplyr::filter(useragents, times_seen >= min_obs)

  if (!is.null(software_name)) {
    uas <- dplyr::filter(uas, software_name %in% !!software_name)
  }
  if (!is.null(software_type)) {
    uas <- dplyr::filter(uas, software_type %in% !!software_type)
  }
  if (!is.null(operating_system_name)) {
    uas <- dplyr::filter(uas, operating_system_name %in% !!operating_system_name)
  }
  if (!is.null(layout_engine_name)) {
    uas <- dplyr::filter(uas, layout_engine_name %in% !!layout_engine_name)
  }
  dplyr::pull(uas, user_agent)
}
