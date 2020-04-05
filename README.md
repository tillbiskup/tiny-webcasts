# Tiny webcasts for lecture(r)s

Creating webcasts from a presentation in PDF format and audio files.

A bash script using ffmpeg and other tools to create webcasts with small file size starting off from a PDF presentation with slides and audio files in high resolution for each slide.

All bash functions reside in the `webcasts` directory and subdirectories. Documentation (using Sphinx and reStructuredText) can be found in the `docs` directory.


## Requirements/Dependencies

There is two options to use "Tiny Webcasts": Install all necessary dependencies and use it directly from the command line, or alternatively use a docker image.


### Dependencies for command-line usage

Creating the webcasts requires a series of command-line tools that need to be installed first: ffmpeg, sox, metaflac, normalize-audio, and ImageMagick. macOS users can install the dependencies using Homebrew and the script `twc-install-dependencies-macos.sh` from the `webcasts` directory. Similarly, Debian users can use `twc-install-dependencies-debian.sh` for convenience.

As the tools for creating the webcasts depend on bash as shell, Windows users will have a bit more work to do.


### Docker image

Alternatively, you may create a docker image from the docker file provided. In this case, all you need is a working docker installation. This is the recommended (and only tested) way for users of the Windows operating systems.


## Install

Download the project or check it out using git. The next steps depend on how you prefer to use "Tiny Webcasts". Directly on your system, having all requirements installed, or as a docker image.


### Directly on the system

Open a terminal, change to the directory you've downloaded "Tiny Webcasts" to, change to the `webcasts` subdirectory and run the installer:

```bash
./twc-install.sh
```

This will create a `~/bin/` directory (if it doesn't already exist) and copy the `twc` bash script in there.


### Docker

Alternatively, if you would want to use docker, you can run the respective installer to create the docker image and create a shortcut for running the docker image:

```bash
./twc-docker-install.sh
```

Users of the Windows operating system may try to use the respective installer for this platform. To do so, open a terminal (`cmd`), change to the directory you've downloaded the files to, change to the `webcasts` subdirectory and type:

```
twc-docker-install-windows
```

This will execute the ``twc-docker-install-windows.bat`` file and build the docker image for you and install a ``twc`` shortcut for use from within the terminal.


## A typical workflow

Assume you have a presentation in PDF format with one page per slide/overlay, and a series of cut audio files corresponding to the slides. Then there are only two simple steps to create your webcast.

All commands are issued on a terminal (using bash as shell).


### Create and edit metadata

This step is highly recommended, as otherwise, your final webcast will contain default metadata for title, author and alike.

```bash
twc metadata
```

This will create two files in your directory, `meta.txt` and `chaptermeta.txt`, that you can both edit according to your needs. The latter is used to insert chapter marks into your final webcast. If you're not interested in that, simply leave the file untouched, as it will get ignored in this case.


### Create your webcast

Postprocess your audio files and create the audio and video trace for your webcast.

```bash
twc make
```

This will create a subdirectory `out` in your current directory, process all your data and create a final webcast as MP4 file in that directory.

That's it. Enjoy and share your tiny webcast.


## Documentation

All documentation is contained in the `docs` directory and can either be created using Sphinx or visited online: https://webcasts.docs.till-biskup.de/.


## Contribute

A note for developers: A bash script for auto-incrementing the version number resides in the `bin` directory. Add this to the `pre-commit` hook of your local git repo for convenience.
