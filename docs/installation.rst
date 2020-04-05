Installation
############

After having installed all the necessary :doc:`requirements <requirements>`, you can finally install the bash scripts for creating the webcasts in just two simple steps:

  #. Download the scripts from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_.

  #. Install the ``twc`` command-line tool by running the installer.


Note that you have two options available for installing the ``twc`` command-line tool:

  #. Install "Tiny Webcasts" directly on your operating sytem.
  
  #. Build and use the docker image provided.


**Windows users** are highly recommended to use the docker image.


Download from GitHub
====================

The scripts for creating the webcasts can be obtained from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_. Just download and unpack (or clone) the project from there:

  * Project: https://github.com/tillbiskup/tiny-webcasts
  * Download: https://github.com/tillbiskup/tiny-webcasts/archive/master.zip
  
  
.. note::

   Instead of simply downloading the master branch, it might be advisable to look at the `releases <https://github.com/tillbiskup/tiny-webcasts/releases>`_ and download the latest (stable) release.


Run the installer
=================

To install the "Tiny Webcasts" command-line tool called ``twc``, open a terminal, change into the "Tiny Webcasts" sources directory you've just downloaded from GitHub (and unpacked afterwards), change into the ``webcasts`` subdirectory within the project and call the installer. Which installer to run depends on whether you choose to install it directly on your operating system or via docker.


Direct install
--------------

To directly install the ``twc`` command-line tool, use the following installer:


.. code-block:: bash

   ./twc-install.sh


If it was successful, you should see the message:

.. code-block:: bash

   Installing twc scripts to /<path_to_users_home_dir>/bin/ was successful.
   You may now create tiny webcasts by calling 'twc' from anyhwere.

with ``<path_to_users_home_dir>`` depending on your operating system, but usually something like ``/home/johndoe`` or ``/Users/johndoe``.


.. important::

   If you see the message ``You need to open a new terminal for the changes to take effect...``, please do as been told before continuing to work with the tiny webcasts scripts. Otherwise, you will not be able to access the scripts from everywhere.


Docker image
------------

Depending on the operating system you are on, use either of the two docker installers provided. 

**Linux and macOS**


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


**Windows**


.. code-block:: bash

   ./twc-install-docker-windows.bat


The output of this command should generally look similar to the one for Linux and macOS shown above. Additionally, the installer will install the file ``twc.bat`` to the directory ``bin`` in the current user's directory and (try to) add this directory permanently to the Windows path. Therefore, you should be able to access ``twc`` from within the Windows terminal (*i.e.*, ``cmd``) from every directory, as you are in case of Linux and macOS.


Congratulations! Now you're ready to :doc:`create your first webcast <workflow>`.

