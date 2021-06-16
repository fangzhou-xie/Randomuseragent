## Test environments
* local R installation, R 4.0.5
* ubuntu 16.04 (on travis-ci), R 4.0.3
* win-builder (devel and release)
* R-hub (Ubuntu 20.04 LTS, Fedora, Windows Server 2008)

## R CMD check results
There were no ERRORs or WARNINGS or NOTEs.

0 errors | 0 warnings | 0 notes

* This is a new release.
* On R-hub, there is a new submission note.
* On winbuilder, there is also a "Non-standard file found at top level: 'data-raw'" note.
I have excluded this directory from .Rbuildignore file and couldn't see this note on my local check.
But it is showing up in winbuilder.

## Downstream dependencies
There are currently no downstream dependencies for this package.


## License
MIT License
