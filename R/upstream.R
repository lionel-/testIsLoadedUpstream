#' @export
upstream <- function() "foobar"

.onLoad <- function(...) {
  do_downstream <- function(...) testIsLoadedDownstream::downstream()

  if (isNamespaceLoaded("testIsLoadedDownstream")) {
    do_downstream()
  } else {
    setHook(
      packageEvent("testIsLoadedDownstream", "onLoad"),
      do_downstream
    )
  }
}
