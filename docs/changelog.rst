Changelog
#########

A list of changes between releases. This list is not exhaustive, for details look at the git commit messages. However, this list tries to give an overview of changes relevant to users of "Tiny Webcasts".


v.0.2.2
=======

*Bugfix release*

Bug fixes:

  * PDF files with mixed greyscale and colour slides work
  * Completed dependencies for manual install


v.0.2.1
=======

*Bugfix release*

Bug fixes:

  * Handling of metadata works (again)
  * PDF files with transparency (alpha channel) work
  
New features:

  * Improved installer for the Windows platform
  * Updated documentation
  
    * Installation described in more detail for Windows, macOS, and Linux
    * Extended list of Frequently Asked Questions


v.0.2.0
=======

*Second release. Major restructuring of the command-line interface, docker support, support for the Windows platform (via docker).*

New features:

  * Docker image
  * Windows support (via docker image)
  * One-step workflow
  * User-friendly support of chapter metadata

Changes:

  * Improved user interface: new commands for ``twc``
  * Converted all scripts to functions


v.0.1.0
=======

*First release.*

Features:

  * Command-line workflow in three steps
  * Creating tiny webcasts from a series of cut audio files and a presentation in PDF format
  * Automatic generation of metadata templates after ``prepare`` step
  * Full support for Linux and macOS
  * Dependency installer scripts for Debian Linux and macOS

