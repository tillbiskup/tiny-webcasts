Frequently Asked Questions (FAQ)
################################

A (growing) list of questions users (and early adopters) of "Tiny Webcasts" asked and attempts to answer these questions.


How to install "Tiny Webcasts"?
===============================

Getting "Tiny Webcasts" to run is a two-step process:

  #. Download "Tiny Webcasts" from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_ and install it.
  
  #. Install all the :doc:`required programs <requirements>`.

Both steps are documented:

  * :doc:`Install "Tiny Webcasts" <installation>`
  
  * :doc:`Install the required programs <requirements>`.

Installation requires two things:

  * Internet connection (and a web browser)
  
  * A terminal (and basic knowledge how to use it)


Do you support Windows?
=======================

Unfortunately, currently the Windows platform is not supported. All programs used by "Tiny Webcasts" are available for Windows, too. Therefore, there should be no general problem in getting "Tiny Webcasts" to run using the Windows platform.

Please note that "Tiny Webcasts" requires the ``bash`` shell to run. Therefore, Windows users need to install this shell as well.

Windows 10 users may use the "Linux subsystem for Windows" and follow the instructions for the Linux platform.

Due to lack of experience of the authors with the Windows platform, currently, there is no further support available.


How to exit the "vim" editor?
=============================

I've followed the documentation and opened the file ``meta.txt`` with the "vim" editor on the terminal. Now I'm stuck. How to edit the file, and how to exit this editor?

Admittedly, "vim" is rather useful for users familiar with the command line. Nevertheless, here a few very quick hints.

  * Editing
  
    Press "i" to enter the edit mode
  
  * Saving an edited file
  
    Press "Esc" + ":" + "w"
  
  * Exiting the "vim" editor
  
    Press "Esc" + ":" + "q"


"twc prepare" does not create a file "video.mp4"
================================================

Does your PDF file of your presentation contain as many pages (slides) as you have WAV files?

If not, the programs don't know how to handle the situation and produce errors (and no video).

