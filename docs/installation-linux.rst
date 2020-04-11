Install Tiny Webcasts on Linux
##############################

Users of the Linux operating system will usually prefer a direct install of the required programs as well as the Tiny Webcasts command-line tools on their system. However, for convenience, they can nevertheless use the Docker image provided. 


.. note::

   Linux users are assumed hereafter to be familiar with the command line and their operating system, *e.g.* using the package manager of the respective Linux distribution for installing programs.


Direct install
==============

Directly installing the Tiny Webcasts command-line tools is a rather straight-forward three-step process:


  #. Download (or clone) the Tiny Webcasts project from GitHub
  
  #. Install all necessary prerequisites
  
  #. Install the Tiny Webcasts command-line tools


Download (or clone) the Tiny Webcasts project from GitHub
---------------------------------------------------------

The Tiny Webcasts command-line tools used for creating the webcasts can be obtained from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_. Just download and unpack the project from there:

  * Project: https://github.com/tillbiskup/tiny-webcasts
  * Download: https://github.com/tillbiskup/tiny-webcasts/archive/master.zip
  
  
.. note::

   Instead of simply downloading the master branch, it might be advisable to look at the `releases <https://github.com/tillbiskup/tiny-webcasts/releases>`_ and download the latest (stable) release.


If you prefer, you can alternatively clone the git repository from GitHub:


.. code-block:: bash

   git clone https://github.com/tillbiskup/tiny-webcasts.git


This allows you to be always up to date with the latest developments of Tiny Webcasts.

Here again, it might be advisable to switch to the release branch after you have cloned the repository:


.. code-block:: bash

   git checkout releae


This should give you the latest (stable) release.



Install all necessary prerequisites
-----------------------------------

Running the Tiny Webcasts command-line tools directly on your machine rather than in the Docker container provided, you need to install a series of command-line programs freely available for Linux. For most Linux distributions, these programs should be available as packages via the respective package manager. For details, see the ":doc:`requirements`" page and install all the required programs before continuing.

Debian (and Ubuntu) users may be lazy and simply run a small bash script provided that installs all necessary requirements for them. To do so, open a terminal, change directory to the directory you've downloaded and unpacked Tiny Webcasts to, change to the :file:`webcasts` subdirectory, and type the following into it:


.. code-block:: bash

   ./twc-install-dependencies-debian.sh


This should install all necessary requirements. For details, see the ":doc:`requirements`" page.


Install the Tiny Webcasts command-line tools
--------------------------------------------

To install the Tiny Webcasts command-line tools directly to your system, use the installer provided. This will basically do two things for you:


  #. Concatenate all bash functions and the main bash script into a single file
  
  #. Copy this file to :file:`~/bin/` and add this directory to your path (if necessary)


To use the installer, open a terminal, change directory to the directory you've downloaded and unpacked Tiny Webcasts to, change to the :file:`webcasts` subdirectory, and type the following into it:


.. code-block:: bash

   ./twc-install.sh


If it was successful, you should see the message:


.. code-block:: bash

   Installing twc scripts to /<path_to_users_home_dir>/bin/ was successful.
   You may now create tiny webcasts by calling 'twc' from anyhwere.


with ``<path_to_users_home_dir>`` usually something like ``/home/johndoe``.


.. important::

   If you see the message ``You need to open a new terminal for the changes to take effect...``, please do as been told before continuing to work with the tiny webcasts scripts. Otherwise, you will not be able to access the scripts from everywhere.


Congratulations! Now you're ready to :doc:`create your first webcast <workflow>`.



Using the Docker image
======================

Installing Tiny Webcasts using the Docker image provided is a two-step process:

  #. Install Docker for Linux
  
  #. Download and install Tiny Webcasts


Install Docker for Linux
------------------------

In order to build and use the Docker image provided with "Tiny Webcasts", you need to install Docker for your platform. Follow the `instructions on the Docker website <https://docs.docker.com/>`_ and make sure your Docker installation is working.

There is a detailed and step-by-step guide for the `Docker installation for Ubuntu <https://docs.docker.com/engine/install/ubuntu/>`_ available on the official Docker website. However, there may well be packages available for your particular Linux distribution.

Once you've installed Docker, test that everything is well setup and working. To do so, open a terminal and type the following into it:


.. code-block:: bash

   docker run hello-world


This should usually present you with a welcome message and tell you that your Docker installation was successful and everthing seems working.

If however you see some error messages, refer to the official Docker documentation and trouble-shoot accordingly.


.. important::

   Please refer to the information available `on the Docker website <https://docs.docker.com/>`_ for any questions regarding the installation of Docker for your platform. There will be no support by the authors of "Tiny Webcasts" regarding those questions.


Download and install Tiny Webcasts
----------------------------------

The Tiny Webcasts command-line tools used for creating the webcasts can be obtained from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_. Just download and unpack the project from there:

  * Project: https://github.com/tillbiskup/tiny-webcasts
  * Download: https://github.com/tillbiskup/tiny-webcasts/archive/master.zip
  
  
.. note::

   Instead of simply downloading the master branch, it might be advisable to look at the `releases <https://github.com/tillbiskup/tiny-webcasts/releases>`_ and download the latest (stable) release.


Tiny Webcasts comes with an installer that helps you getting everything setup. It is named :file:`twc-install-docker.sh` and lives inside the :file:`webcasts` directory of the directory you've just downloaded and unpacked Tiny Webcasts to.


The installer will do two things for you:

  #. Build the docker image
  
  #. Install a small script file named :file:`twc` to the :file:`bin` directory in your user directory and add that directory to the path (if necessary)


To install Tiny Webcasts, open a terminal, change directory to the directory you've downloaded and unpacked Tiny Webcasts to, change to the :file:`webcasts` subdirectory, and type the following into it (and afterwards, hit the "Enter" key):


.. code-block:: bash

   ./twc-install-docker.sh


The output of this command is a bit lengthly, as it includes building the docker image. It should look similar to the following:


.. code-block:: bash

	Sending build context to Docker daemon  38.96MB
	Step 1/7 : FROM alpine
	latest: Pulling from library/alpine
	Digest: sha256:b276d875eeed9c7d3f1cfa7edb06b22ed22b14219a7d67c52c56612330348239
	Status: Image is up to date for alpine:latest
	 ---> a187dde48cd2
	Step 2/7 : RUN apk --no-cache --update add bash 	ffmpeg 	sox 	flac 	imagemagick 	poppler-utils
	 ---> Using cache
	 ---> a5feb5e63d2e
	Step 3/7 : COPY webcasts/ /usr/local/webcasts/
	 ---> Using cache
	 ---> e11de3151254
	Step 4/7 : COPY docker/docker-entrypoint.sh /usr/local/bin/
	 ---> Using cache
	 ---> 0f75bb6c8a9b
	Step 5/7 : RUN cd /usr/local/webcasts/functions/; ./generate-combine-user-chaptermetadata-times-awk-function.sh > combine-user-chaptermetadata-times.sh
	 ---> Using cache
	 ---> d531da265065
	Step 6/7 : RUN cd /usr/local/webcasts/; targetFile=twc; (echo '#!/bin/bash'; cat `ls functions/*sh | grep -v 'awk'` | grep -v '^#!/bin/bash'; grep -v '^#!/bin/bash' twc.sh) > ${targetFile}; chmod +x ${targetFile}; mv ${targetFile} /usr/local/bin/
	 ---> Running in 0ad94cbe3eb6
	Removing intermediate container 0ad94cbe3eb6
	 ---> c077dc5bfe42
	Step 7/7 : ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
	 ---> Running in 63cc9885c6a0
	Removing intermediate container 63cc9885c6a0
	 ---> e446af9b4da8
	Successfully built e446af9b4da8
	Successfully tagged twc:latest

	Installing 'twc' script to /Users/till/bin/ was successful.
	You may now create tiny webcasts by calling 'twc' from anyhwere.


Depending on whether you have installed the image previously, there will be much more output lines from building the original image and container.


.. important::

   If you see the message ``You need to open a new terminal for the changes to take effect...``, please do as been told before continuing to work with the tiny webcasts scripts. Otherwise, you will not be able to access the scripts from everywhere.


Congratulations! Now you're ready to :doc:`create your first webcast <workflow>`.
