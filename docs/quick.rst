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
  
Ideally, the contents of this directory look similar to the following::

  audio-001.wav
  audio-002.wav
  audio-003.wav
  audio-004.wav
  ...
  audio-nnn.wav
  audio-raw.wav
  presentation.pdf


Create temporary directory
==========================

.. warning::

   **Never ever** execute the commands creating the webcast in the directory containing your original WAV files, but in a temporary directory containing only the cut WAV files and the PDF file for the presentation. The commands will **delete** the raw files.


To create a temporary directory ``tmp`` within your current directory containing the files as detailed above, issue the following command in the terminal::

  twc tmpdir

Afterwards, change into the newly created temporary directory ``tmp`` as follows::

  cd tmp

The contents of this directory should look similar to the following::

  audio-001.wav
  audio-002.wav
  audio-003.wav
  audio-004.wav
  ...
  audio-nnn.wav
  presentation.pdf


Prepare the webcast
===================

From within the temporary directory, issue the following command::

  twc prepare

Your directory should now look similar to the following::

  audio.m4a
  meta.txt
  presentation.pdf
  video.mp4

Note that the original cut WAV files have been removed. This is why you should *never* issue this command in the directory with your original WAV files.


Edit the metadata
=================

The only manual step: Edit the metadata contained in ``meta.txt`` with the text editor of your choice.

The final metadata should look similar to the following::

	;FFMETADATA1
	title=My fancy first webcast
	artist=Incredible Me
	album=Tiny Webcasts to go
	date=2020/04/01
	track=1/42
	genre=Physical Chemistry
	[CHAPTER]
	TIMEBASE=1/1000
	START=1
	END=2096
	title=Intro: Why do we actually care?
	[CHAPTER]
	TIMEBASE=1/1000
	START=2096
	END=4296
	title=Summary: Why it didn't matter at all.

Don't forget to remove the numbers prefixing each ``[CHAPTER]`` mark. If you're not interested in chapter bookmarks, simply delete everything starting with the first ``[CHAPTER]`` mark.


Finalise your webcast
=====================

After having edited the metadata, simply finalise your webcast, adding audio and video trace together::

    twc finalise my_fancy_webcast.mp4

That's it. Share it and enjoy.

Hint: Save your final webcast together with the original raw files and the metadata to a safe place. This allows you to easily change slides afterwards and recreate the webcast, without having to do any audio recording and cutting again.
