Requirements
############

A number of programs are used to record and post-process the audio and create the final webcast as a combination of slide show and audio trace.

You have the choice:

  #. Install all required programs and run "Tiny Webcasts" directly on your operating sytem.
  
  #. Install docker for your operating system and build and use the docker image provided.


.. important::

   Due to "Tiny Webcasts" heavily relying on a series of command-line tools as well as the bash shell, we highly recommend the **docker image** for users of the **Windows** operating system.


The command-line tool used to create the webcasts (as well as to create the docker image) can be obtained from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_. Just download and unpack (or clone) the project.

.. _overview:

Overview
========

A number of command-line programs are used to post-process the audio files and slides.

  * `ffmpeg <https://www.ffmpeg.org/>`_
  * `sox <http://sox.sourceforge.net/>`_
  * `metaflac <https://xiph.org/flac/>`_
  * `normalize-audio <http://normalize.nongnu.org/>`_
  * `ImageMagick <https://imagemagick.org/>`_
  * `pdfinfo <https://www.xpdfreader.com/pdfinfo-man.html>`

All the programs mentioned here are free and open-source, and they are definitely available for (and tested under) both, Linux and macOS. They should, however, be available for Windows as well.

The "Tiny Webcasts" command-line tool calling these command-line programs requires the **bash shell** readily available on unixoid systems such as Linux and macOS.

If you intend to use the **docker image**, you need to install docker for your platform:

  * `docker <https://docs.docker.com/>`_

What program you use to actually record the audio is your choice, however, we strongly recommend using the free and professional audio recording tool

  * `Audacity <https://www.audacityteam.org/>`_


Docker installation
===================

In order to build and use the docker image provided with "Tiny Webcasts", you need to install docker for your platform. Follow the `instructions on the docker website <https://docs.docker.com/>`_ and make sure your docker installation is working.

   * `Docker installation for macOS <https://docs.docker.com/docker-for-mac/install/>`_
   * `Docker installation for Windows <https://docs.docker.com/docker-for-windows/install/>`_

Once you've downloaded and installed docker for your platform, open a terminal and type the following to test that everything is well setup and working:


.. code-block:: bash

   docker run hello-world


If you see some error messages, refer to the official docker documentation and trouble-shoot accordingly.

Windows users may need to manually activate some virtualisation features in their BIOS.


.. note::

   Please refer to the information available `on the docker website <https://docs.docker.com/>`_ for any questions regarding the installation of docker for your platform. There will be no support by the authors of "Tiny Webcasts" regarding those questions.


Direct installation
===================

All programs listed in the :ref:`overview <overview>` are readily available for Linux and macOS, but should be available for the Windows platform as well. However, the bash shell might be more tricky for the Windows platform.


Linux
-----

For most linux users, it is fair to assume that they know how to install the required packages, and of course it depends as well on the linux distribution you are using.

For Debian and similar systems (Ubuntu), it should be something in these lines for the command-line tools:

.. code-block:: bash

   apt install ffmpeg
   apt install sox
   apt install flac
   apt install normalize
   apt install imagemagick
   apt install poppler-utils

  
For convenience, the user may run the shell script ``twc-install-dependencies-debian.sh`` in the ``webcasts`` directory. Assuming you just downloaded the project from GitHub and changed into its root directory:


.. code-block:: bash

   ./webcasts/twc-install-dependencies-debian.sh


Similarly, for Audacity as highly recommended audio recording and editing tool, installation is straight-forward:

.. code-block:: bash

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

All the other tools can be installed using `Homebrew <https://brew.sh/>`_, the free package manager for macOS. See there for how to install Homebrew, or simply paste the following line into a terminal on macOS:


.. code-block:: bash

   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"



.. note::

   Homebrew requires the "Xcode Command Line Tools" (CLT) to be installed. This may therefore take some time, as unfortunately Xcode seems to be quite large a download (> 1 GB). Hence, if you don't have the Xcode CLT installed yet, expect a longer download time depending on your available bandwidth. However, you need to do that only once, and Homebrew is a very useful tool anyway.


To get all the tools installed, paste the following lines right into the terminal:


.. code-block:: bash

   brew install ffmpeg
   brew install sox
   brew install flac
   brew install normalize
   brew install imagemagick
   brew install poppler


For convenience, the user may run the shell script ``twc-install-dependencies-macos.sh`` in the ``webcasts`` directory. Assuming you just downloaded the project from GitHub and changed into its root directory:


.. code-block:: bash

   ./webcasts/twc-install-dependencies-macos.sh


Afterwards, you should have all necessary tools installed.

.. note::
   
   Depending on your system and account settings, you should install Homebrew as a privileged user. However, it will complain if you try to call it as root user.

