Workflow
########

To create webcasts, there is only a few simple steps:

  #. Create your presentation (slide show) and convert it into PDF format
  #. Record the audio for your presentation
  #. Cut the audio trace in pieces, one file per slide
  #. Run the scripts provided with this project
  #. Upload and share your webcast

Be sure to at least once read through the details below to get an idea how to perform each of these steps.



Create your presentation and convert it into PDF format
=======================================================

It doesn't matter what program(s) you are using to create your presentation. It should, however, not contain any animations or videos.

Stepwise uncovering of parts of the slide should end up in different pages of your resulting PDF file.

LaTeX together with the beamer class works perfect for this, but converting presentations created with programs such as Microsoft PowerPoint or Apple Keynote into PDF files should do as well.


Record the audio for your presentation
======================================

We recommend using `Audacity <https://www.audacityteam.org/>`_ for this task.

A few tips and tricks from own experience, making post-processing your audio recording much easier (for you):

  * Record the audio for one presentation in one go (mono, not stereo).
  * Snap your fingers after each slide, to have a visible mark in the audio trace.
  * Take a bit of time between two slides (1--2 seconds).
  * If you get muddled with a slide, snap twice with your fingers and repeat what you want to say for this slide.
  * If you spot typos, simply ignore them and continue talking. You can change the slides afterwards, not affecting your audio recordings.
  * Don't comment on the current situation, keep your recording as timeless as possible.
  * Describe the slides, *don't* use your mouse or presenter.
  * Don't mix recordings from different parts of a day, as your voice changes during a day.

Why snapping your fingers after each slide? Well, usually, we have problems listening to recordings of our own voice. And if you snap your fingers, you will have a clear mark in the audio trace that you can easily detect optically. For details, see below.


Cut the audio trace in pieces
=============================

Before you start cutting the audio trace, make sure to have a copy of it at a safe place.

Again, we recommend using `Audacity <https://www.audacityteam.org/>`_ for this task.

  * Load the audio trace.
  * You will see the transitions between slides optically, as you have snapped your fingers.
  * Select pieces that are **multiples of 0.5 seconds** long, one piece per slide.
  * Make sure to have exact multiples of 0.5 seconds, use the display in the status bar of Audacity for this.
  * Export the selected piece of audio to a WAV file, naming it consecutively, *e.g.*: ``audio-000``, ``audio-001``, ...
  * Select the next piece and continue as above.


Why multiples of 0.5 seconds in length for the audio files? This determines your frame rate for the final webcast. 0.5 seconds is reasonably fine-grained, while resulting in small files (due to the low video frame rate) at the same time.

Once you have as many audio files in a directory as you have slides in your presentation, and each audio file being a multiple of 0.5 seconds long, proceed to postprocessing and actually creating your webcast.

.. tip::

   Never throw your cut audio files in WAV format away. You can always create new versions of the webcast from these files, with different compression levels and settings for the audio.


Run the scripts
===============


Assume you have a presentation in PDF format with one page per slide/overlay, and a series  of cut audio files (in WAV format) corresponding to the slides. Put them all in one (temporary) directory. If you're lazy, you may consider simply calling a script for that purpose::

  twc-create-tmpdir.sh


Ideally, the contents of this directory look similar to the following::

  presentation.pdf
  audio-001.wav
  audio-002.wav
  audio-003.wav
  audio-004.wav
  ...
  audio-nnn.wav

Wonder why using three digits for numbering the audio files? From own experience, it can easily happen for a lecture of 45 minutes that you end up with more than 99 single slides, provided that you uncover content on a single slide in small steps. Remember: The number of slides appearing in your presentation is usually less than the actual number of slides you are showing if you uncover things stepwise.

.. warning::

   **Never ever** run the following scripts in the directory containing your original cut WAV files from the process before, but in a temporary directory containing only the cut WAV files and the PDF file for the presentation. The scripts will **delete** the raw files. For convenience, run the script ``twc-create-tmpdir.sh`` to create such a temporary directory named ``tmp`` and get all necessary files copied therein.


The first step consists of converting the PDF file of the presentation into images (one per slide), post-process the audio files, concatenate audio and video trace, and create a metadata template. All this can be done with a single call from within the (temporary) directory created and filled as detailed above::

  twc-prepare-webcast.sh
  

or even shorter::

  twc prepare


Now, you will have to edit the metadata contained in ``meta.txt``. Of course, you can use any text editor you like, as long as it is a bare text editor. What does this file ``meta.txt`` actually contain and what is it used for? Well, it contains all information regarding the overall webcast as well as information for each individual slide, making it possible to create chapter marks. A raw ``meta.txt`` file will look like this::

	;FFMETADATA1
	title=xxx
	artist=xxx
	album=xxx
	date=xxx
	track=1/n
	genre=xxx
	1[CHAPTER]
	TIMEBASE=1/1000
	START=1
	END=42
	title=TBD
	2[CHAPTER]
	TIMEBASE=1/1000
	START=42
	END=96
	title=TBD
	...
	n[CHAPTER]
	TIMEBASE=1/1000
	START=4242
	END=4296
	title=TBD

Usually, a chapter consists of several slides, hence you need to manually remove some (most of) the blocks starting with ``###[CHAPTER]``, where ``###`` denotes the slide number (for convenience). The final metadata file should look simliar to the following::

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


Note that we have removed the (slide) numbers prefixing each of the ``[CHAPTER]`` lines and adjusted the ``END`` lines accordingly. The ``START`` of a new chapter should be the same as the ``END`` of the preceding chapter.

And finally, you can create the webcast::

  twc-finalise-webcast.sh my_fancy_webcast.mp4


Or, once again, even shorter::

  twc finalise


Upload and share your webcast
=============================

If course, where to upload and how to share your webcast(s) depends highly on your preferences and local circumstances. Personally, we advice against using YouTube, but are very much in favour of e-learning and teaching platforms such as a (local) moodle installation. Your personal webpage will also do, if that is reasonably well-known by the students and other people interested in your teaching.
