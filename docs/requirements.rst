Requirements
############

A number of programs are used to record and post-process the audio and create the final webcast as a combination of slide show and audio trace.

All the programs mentioned here are free and open-source, and they are definitely available for (and tested under) both, Linux and macOS. They should, however, be available for Windows as well.


.. warning::

   Due to "Tiny Webcasts" heavily relying on a series of command-line tools as well as the bash shell, currently, **Windows is not officially supported**. Windows 10 users may have a go with the "Linux Subsystem for Windows", but due to lack of experience, we do not officially support this for now. However, there are plans to provide containerised versions of "Tiny Webcasts" soon.


The scripts used to create the webcasts can be obtained from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_. Just download and unpack (or clone) the project.


Overview
========

A number of command-line programs are used to post-process the audio files and slides.

  * `ffmpeg <https://www.ffmpeg.org/>`_
  * `sox <http://sox.sourceforge.net/>`_
  * `metaflac <https://xiph.org/flac/>`_
  * `normalize-audio <http://normalize.nongnu.org/>`_
  * `ImageMagick <https://imagemagick.org/>`_

Currently, the shell scripts calling these command-line programs are written for the **bash shell** readily available on unixoid systems such as Linux and macOS.

What program you use to actually record the audio is your choice, however, we strongly recommend using the free and professional audio recording tool

  * `Audacity <https://www.audacityteam.org/>`_


Installation
============

All programs listed above are readily available for Linux and macOS, but should be available for the Windows platform as well.


Linux
-----

For most linux users, it is fair to assume that they know how to install the required packages, and of course it depends as well on the linux distribution you are using.

For Debian and similar systems (Ubuntu), it should be something in these lines for the command-line tools::

  apt install ffmpeg
  apt install sox
  apt install flac
  apt install normalize
  apt install imagemagick
  
For convenience, the user may run the shell script ``twc-install-dependencies-debian.sh`` in the ``webcasts`` directory. Assuming you just downloaded the project from GitHub and changed into its root directory::

  ./webcasts/twc-install-dependencies-debian.sh

Similarly, for Audacity as highly recommended audio recording and editing tool, installation is straight-forward::

  apt install audacity

With this, you should be fully equipped to record your audio and create the final webcasts.


macOS
-----

While Audacity can be downloaded directly, for the command line tools, we highly recommend to use the package manager Homebrew.


Audacity
~~~~~~~~

Audacity is highly recommended as audio recording and editing tool. It is free and open-source software with professional functions and can be readily downloaded from its homepage:

  * https://www.audacityteam.org/download/

A note for macOS users already having updated to macOS 10.15 "Catalina": Officially, Audacity does not support this version of macOS, but only the predecessor macOS 10.14 "Mojave". You will experience problems accessing the microphone, but there seems to be a workaround:

  * https://www.audacityteam.org/macos-10-15-catalina-is-not-yet-supported-by-audacity/
  * https://forum.audacityteam.org/viewtopic.php?f=47&t=107162&p=378694


Command-line tools
~~~~~~~~~~~~~~~~~~

All the other tools can be installed using `Homebrew <https://brew.sh/>`_, the free package manager for macOS. See there for how to install Homebrew, or simply paste the following line into a terminal on macOS::

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


.. note::

   Homebrew requires the "Xcode Command Line Tools" (CLT) to be installed. This may therefore take some time, as unfortunately Xcode seems to be quite large a download (> 1 GB). Hence, if you don't have the Xcode CLT installed yet, expect a longer download time depending on your available bandwidth. However, you need to do that only once, and Homebrew is a very useful tool anyway.


To get all the tools installed, paste the following lines right into the terminal::

  brew install ffmpeg
  brew install sox
  brew install flac
  brew install normalize
  brew install imagemagick

For convenience, the user may run the shell script ``twc-install-dependencies-macos.sh`` in the ``webcasts`` directory. Assuming you just downloaded the project from GitHub and changed into its root directory::

  ./webcasts/twc-install-dependencies-macos.sh

Afterwards, you should have all necessary tools installed.

.. note::
   
   Depending on your system and account settings, you should install Homebrew as a privileged user. However, it will complain if you try to call it as root user.

