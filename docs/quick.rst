Quick reference
###############

All those having read the :doc:`details of the overall workflow <workflow>` and interested in a quick reference of the commands may find here what they need.


.. important::

   You need to be familiar with the :doc:`overall workflow <workflow>` for creating webcasts.


To create webcasts, there is only a few simple steps:

  #. Create your presentation (slide show) and convert it into PDF format
  #. Record the audio for your presentation
  #. Cut the audio trace in pieces, one file per slide
  #. Create the actual webcast
  #. Upload and share your webcast


Here, we will only cover the last two steps, assuming that you have already created your presentation, recorded and cut the audio.


Starting point
==============

You should have a directory containing the following:

  * Your presentation as PDF file (and only this one PDF file)
  * Your original audio recording (as WAV), having ``-raw.wav`` at the end of the name
  * Your cut audio files, one file per slide, consecutively numbered
  
Ideally, the contents of this directory look similar to the following:


.. code-block:: bash

	.
	├── audio-000.wav
	├── audio-001.wav
	├── ...
	├── audio-nnn.wav
	├── audio-raw.wav
	└── presentation.pdf


Generate and edit metadata
==========================

To generate the metadata files, simply issue the following command on a terminal:


.. code-block:: bash

   twc metadata


This will generate two metadata files, one for the overall metadata of your webcast, one for creating chapter marks. Edit both files according to your needs.

If you're not interested in adding chapter marks, simply leave the file ``chaptermeta.txt`` unchanged and it will get ignored by ``twc``.



Create the actual webcast
=========================

After having generated and edited the metadata as shown in the step before, simply create the webcast, with just one simple command issued in the terminal:


.. code-block:: bash

   twc make


This will create a subdirectory in your current directory, called ``out`` and containing the final webcast.

That's it. Share it and enjoy.

Hint: Save your final webcast together with the original raw files and the metadata to a safe place. This allows you to easily change slides afterwards and recreate the webcast, without having to do any audio recording and cutting again.
