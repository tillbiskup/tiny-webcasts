Workflow
########

To create webcasts, there is only a few simple steps:

  #. Create your presentation (slide show) and convert it into PDF format
  #. Record the audio for your presentation
  #. Cut the audio trace in pieces, one file per slide
  #. Create the actual webcast
  #. Upload and share your webcast


.. important::

   Be sure to read through the details below at least once to get an idea how to perform each of these steps -- and to familiarise yourself with a few conventions that greatly simplify your life.


A few important things for the impatient:

  * Be organised. Have a concise naming scheme for your files.
  * Always backup your recorded and cut audio files to a save place -- *before* you run the scripts.
  * Execute the commands for creating the webcast exclusively on a *copy* of your cut audio files.


Create your presentation and convert it into PDF format
=======================================================

It doesn't matter what program(s) you are using to create your presentation. It should, however, not contain any animations or videos.

Stepwise uncovering of parts of the slide should end up in different pages of your resulting PDF file.

`LaTeX <http://www.tug.org/begin.html>`_ together with the `beamer class <https://ctan.org/pkg/beamer>`_ works perfectly for this, but converting presentations created with programs such as Microsoft PowerPoint or Apple Keynote into PDF files should do as well.


Record the audio for your presentation
======================================

We recommend using `Audacity <https://www.audacityteam.org/>`_ for this task. Have a look at the :doc:`short introduction <audacity>` if not already familiar with the program.

A few tips and tricks from own experience, making post-processing your audio recording much easier (for you):

  * Record the audio for one presentation in one go (mono, not stereo).
  * (Optional:) Snap your fingers after each slide, to have a visible mark in the audio trace.
  * Take a bit of time between two slides (1--2 seconds).
  * If you get muddled with a slide, snap twice with your fingers and repeat what you want to say for this slide.
  * If you spot typos, simply ignore them and continue talking. You can change the slides afterwards, not affecting your audio recordings.
  * Don't comment on the current situation, keep your recording as timeless as possible.
  * Describe the slides, *don't* use your mouse or presenter.
  * Don't mix recordings from different parts of a day, as your voice changes during a day.

Why snapping your fingers after each slide? Well, usually, we have problems listening to recordings of our own voice. And if you snap your fingers, you will have a clear mark in the audio trace that you can easily detect optically. For details, see below. Alternatively, if you leave enough time between two slides, you can let the software automatically detect the boundaries between slides.


.. tip::

   When saving the raw recording, suffix the filename with ``-raw`` to make clear that this is the raw, original recording. Never, ever throw this raw recording away and back it up to a safe place.


Cut the audio trace in pieces
=============================

Before you start cutting the audio trace, make sure to have a copy of the raw audio recording in a safe place.

Again, we recommend using `Audacity <https://www.audacityteam.org/>`_ for this task. Have a look at the :doc:`short introduction <audacity>` if not already familiar with the program.

Depending on how you recorded your audio originally, *i.e.* whether you snapped your fingers to mark transitions between slides or (only) left some silence between two slides, there are two different strategies how to continue. Perhaps you want to try out both and see whatever fits better.


Optically visible marks by snapping your fingers
------------------------------------------------

Suppose you have recorded the audio for your presentation and snapped with your fingers between each slide.

  * Load the audio trace.
  * You will see the transitions between slides optically, as you have snapped your fingers.
  * Select pieces that are **multiples of 0.5 seconds** long, one piece per slide.
  * Make sure to have exact multiples of 0.5 seconds or a bit longer, but not less. Use the display in the status bar of Audacity for this.
  * Export the selected piece of audio to a WAV file, naming it consecutively, *e.g.*: ``audio-000``, ``audio-001``, ...
  * Select the next piece and continue as above.


Why multiples of 0.5 seconds in length for the audio files? This determines your frame rate for the final webcast. 0.5 seconds is reasonably fine-grained, while resulting in small files (due to the low video frame rate) at the same time. The postprocessing steps of your audio files will cut each track to exact multiples of 0.5 seconds. Therefore, it is save to have a bit longer pieces, but not a bit less. With the latter, you risk loosing part of your audio recording for the respective slide.


Automatically detecting silence between two slides
--------------------------------------------------

Alternatively, if you haven't snapped your fingers, but just left some silence between two slides, you can let Audacity automatically insert labels that you can use to cut your recording into single tracks.

  * Load the audio trace.
  * Select the complete audio trace
  * Select "Analyze" > "Silence finder" from the menu
  * Choose appropriate values for "Minimum duration of silence" and "Label placement"
  
    For me, 1.5 seconds for minimum duration and 0.5 seconds for label placement work fine.
    
  * Press the "OK" button to let Audacity place the labels for you.
  * Below your audio track, a second track labelled "Label Track" will appear, having labels on it.
  * Make sure to have as many sections as you have slides.
  
    To remove a label, click into the text field of the label and use the context menu accessible via right mouse click to delete the label.
    
  * Select "File" > "Export" > "Export Multiple" and choose "Labels" from "Split files based on:". Do *not* include audio before first label (as it should be silence anyway).
  * Export all your traces.
  
    Most probably, you need to remove the last exported audio track, as it will contain only silence as well.


Once you have as many audio files in a directory as you have slides in your presentation, and each audio file being a multiple of 0.5 seconds long (or slightly longer), proceed to postprocessing and actually creating your webcast.

.. tip::

   Never throw your cut audio files in WAV format away. You can always create new versions of the webcast from these files, with different compression levels and settings for the audio.


Create the actual webcast
=========================

Creating the actual webcast involves just two steps, one of them fully automated:

  #. Generate and edit the metadata for your webcast
  #. Create the actual webcast

These steps assume that you have a presentation in PDF format with one page per slide/overlay, and a series  of cut audio files (in WAV format) corresponding to the slides.

Ideally, the contents of this directory look similar to the following:


.. code-block:: bash

	.
	├── audio-000.wav
	├── audio-001.wav
	├── ...
	├── audio-nnn.wav
	├── audio-raw.wav
	└── presentation.pdf


It doesn't matter how you name your presentation, as long as you have only a single PDF file in the temporary directory. Furthermore, as long as your audio files are named in a consecutive way so that they are listed in the correct order (using the ``ls`` command), everything should be fine.

Wonder why using three digits for numbering the audio files? From own experience, it can easily happen for a lecture of 45 minutes that you end up with more than 99 single slides, provided that you uncover content on a single slide in small steps. Remember: The number of slides appearing in your presentation is usually less than the actual number of slides you are showing if you uncover things stepwise.

Additionally, you can see here that each audio file with ``raw`` in its name will get ignored. Hence, add the string ``raw`` to the name of your original audio recording to have it ignored by the "Tiny Webcasts" command-line tool.


.. note::

   The "Tiny Webcasts" command-line tool is called ``twc`` and can be invoked from the terminal, regardless whether you chose to install it directly on your operating system or via docker.


Generate and edit the metadata
------------------------------

The first step towards your webcast is to generate templates for the metadata and afterwards edit the two metadata files created. To generate the metadata files, simply issue the following command on a terminal:


.. code-block:: bash

   twc metadata


This will generate two metadata files, one for the overall metadata of your webcast, one for creating chapter marks. The latter is a very convenient feature for the listeners of your webcasts, as they can easily jump to different sections. The output of the command shown above should look like this:


.. code-block:: bash

   Creating metadata
   Created metadata file 'meta.txt'.
   You may want to edit the metadata file 'meta.txt' now.
   Created metadata file 'chaptermeta.txt'.
   You may want to edit the chapter metadata file 'chaptermeta.txt' now.


Just do as you have been told and edit the two files. Here is how they look like and what their contents actually mean.


The overall metadata: ``meta.txt``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Each video (and hence webcast) contains some general information, such as the title, author, date. This can be set in the file ``meta.txt``. The template generated by issuing the command ``twc metadata`` looks like follows:


.. code-block:: bash

   ;FFMETADATA1
   title=My First Tiny Webcast
   artist=John Doe
   album=Tiny Webcasts
   date=2020/04/04
   track=1/42
   genre=Lectures


The fields "title", "artist", "date", and "track" should be rather straightforward. For "album", we suggest to use the name of the teaching unit, *i.e.* the lecture or seminar series. For "genre", you can add whatever you like.

It is highly recommended to actually **edit** these values, as otherwise, your final webcast will contain just those default values shown here.


The chapter metadata: ``chaptermeta.txt``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As mentioned, chapter marks are a very convenient feature for the listeners of your webcasts, as they can easily jump to different sections. All you need to do is to think of chapter titles and insert those at the respective places in the file ``chaptermeta.txt``. The important bit of this file is shown below:


.. code-block:: bash

   title=TBD
     slide1
     slide2
     slide3
     ...
     slideN


Please note that the file ``chaptermeta.txt`` as created by the command ``twc metadata`` comes with extensive documentation contained in the actual file. Simply follow the advice given there and edit according to your needs.


.. important::

   If you don't want to include any chapter marks, simply leave the file ``chaptermeta.txt`` unchanged. In this case, it will get ignored, leaving your final webcast without any chapter marks.


Now that you have edited the metadata of your webcast, you can proceed to actually creating your webcast.


Create the actual webcast
-------------------------

After having generated and edited the metadata as shown in the step before, simply create the webcast, with just one simple command issued in the terminal:


.. code-block:: bash

   twc make


This will create a subdirectory in your current directory, called ``out`` and containing the final webcast and a few more files that may come in handy for later changes.

Generally, ``twc`` will tell you what it does. The output will look similar to the following:


.. code-block:: bash

	Checking project
	Everything seems fine and ready for creating the webcast.
	Making project
	# Created output directory out and copied WAV and PDF file(s) therein.
	audio-000.wav => audio-000.wav
	audio-001.wav => audio-001.wav
	# processing audio 'audio-000.wav': InputGain: 3.6530; referenceGain: 3.55 dB; ReplayGain: 6.60 dB;
	# adjusting length 'audio-000.m4a': from 4.06 s to 4.00 s
	# processing audio 'audio-001.wav': InputGain: 3.2795; referenceGain: 6.58 dB; ReplayGain: 5.31 dB;
	# adjusting length 'audio-001.m4a': from 4.06 s to 4.00 s
	# concatenating slides to video
	[swscaler @ 0x10ee07000] deprecated pixel format used, make sure you did set range correctly
	# concatenating audio files to final audio trace
	# combining video and audio trace to final webcast
	Final webcast written to: out/presentation.mp4


Of course, you will usually have more audio files than in this example (with only two audio files), but besides that, it should look pretty similar.

As you can see from the output, the first step ``twc make`` does is checking whether all relevant files are available and everything is setup for creating the webcast. The program will tell you if there is something missing and how to fix it.

So how does the final result look like? Here is a view of the ``out`` directory:


.. code-block:: bash

	out/
	├── presentation-chaptermeta.txt
	├── presentation-meta.txt
	├── presentation.mp4
	└── presentation.pdf


What you see here is that the final webcast and all metadata have been prefixed by the name of your presentation. Hence, if you give your presentation (*i.e.* the PDF file) a reasonable name, probably including both a shorthand for the lecture series and a consecutive number, you will end up with sensible file names here as well.

The two files you are actually most interested in are the webcast (as MP4 video) and the presentation (as PDF file). You may want to upload either only the webcast or, better, both the webcast and the slides as PDF file.


Upload and share your webcast
=============================

Of course, where to upload and how to share your webcast(s) depends highly on your preferences and local circumstances. Personally, we advice against using YouTube, but are very much in favour of e-learning and teaching platforms such as a (local) moodle installation. Your personal webpage will also do, if that is reasonably well-known by the students and other people interested in your teaching.
