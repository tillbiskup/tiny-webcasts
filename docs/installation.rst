Installation
############

After having installed all the necessary :doc:`requirements <requirements>`, you can finally install the bash scripts used for creating the webcasts.

The scripts used to create the webcasts can be obtained from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_. Just download and unpack (or clone) the project.

One way to conveniently access these scripts is to copy them into the directory ``bin/`` in the user's HOME directory, *i.e.* ``~/bin/``. For convenience, we have provided a small shell script for this task, ``twc-install.sh``. It does exactly that::

  # Create directory for local binaries in user home if it doesn't exist
  mkdir -p ~/bin/

  # Copy all shell scripts (excluding this install script)
  ls -1 | grep -v 'twc-install' | while read filename
      do cp ${filename} ~/bin/
  done

The only magic involved here is to *not* copy the install scripts there as well. To call this script, change directory into the ``webcasts`` directory within the project just downloaded from GitHub and call the script::

  ./twc-install.sh

Congratulatios! Now you're ready to :doc:`create your first webcast <workflow>`.
