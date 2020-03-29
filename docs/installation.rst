Installation
############

After having installed all the necessary :doc:`requirements <requirements>`, you can finally install the bash scripts for creating the webcasts in just two simple steps:

  #. Download the scripts from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_.
  #. Install the scripts by running the installer.


Download from GitHub
====================

The scripts for creating the webcasts can be obtained from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_. Just download and unpack (or clone) the project from there:

  * Project: https://github.com/tillbiskup/tiny-webcasts
  * Download: https://github.com/tillbiskup/tiny-webcasts/archive/master.zip


Run the installer
=================

To install all scripts for tiny webcasts, change directory into the ``webcasts`` directory within the project just downloaded from GitHub and call the installer::

  ./twc-install.sh

If it was successful, you should see the message::

  Installing twc scripts to /<path_to_users_home_dir>/bin/ was successful.

with ``<path_to_users_home_dir>`` depending on your operating system, but usually something like ``/home/johndoe`` or ``/Users/johndoe``.


.. important::

   If you see the message ``You need to open a new terminal for the changes to take effect...``, please do as been told before continuing to work with the tiny webcasts scripts. Otherwise, you will not be able to access the scripts from everywhere.
 

Congratulations! Now you're ready to :doc:`create your first webcast <workflow>`.


Details of the install script
=============================

One way to conveniently access these scripts is to copy them into the directory ``bin/`` in the user's HOME directory, *i.e.* ``~/bin/``. For convenience, we have provided a small shell script for this task, ``twc-install.sh``. It does exactly that (and a bit more)::

  # Create directory for local binaries in user home if it doesn't exist
  mkdir -p ~/bin/

  # Copy all shell scripts (excluding this install script)
  ls -1 | grep -v 'twc-install' | while read filename
      do cp ${filename} ~/bin/
  done

The only magic involved here is to *not* copy the install scripts there as well. Additionally, the install script checks whether ``~/bin/`` is included in the path, and if not, adds it via ``~/.profile`` (not shown above).
