###############################
 Tiny webcasts for lecture(r)s
###############################

Are you a lecturer and interested in not only providing your presentation slides online, but an **audio recording** as well? Would you like to have **small file sizes**, let's say 20--30 MB per hour recorded webcast? Would you be willing to accept a few restrictions, such as no mouse pointer and no HD audio quality? Than we might have something for you.


.. note::

   Interested in a real-world example? A (growing) :doc:`series of webcasts introducing "Tiny Webcasts" <examples>` created with -- well, you will guess it -- "Tiny Webcasts" is :doc:`now available <examples>`.
   

Features
########

  * Webcasts: slide shows with audio recording
  * Small file size: approx. 20--30 MB per hour (50--70 kbit/s)
  * Tool chain consisting exclusively of open source programs
  * Slides separated from audio: perfect for fixing typos, changing slide layout and alike
  * Open source, free of charge
  * **Docker image available** (including support for the **Windows** platform)


In a nutshell
#############

To create webcasts, there is only a few simple steps:

  * Create your presentation (slide show) and convert it into PDF format
  * Record the audio for your presentation
  * Cut the audio trace in pieces, one file per slide
  * Run the "twc" command-line program provided with this project
  * Upload and share your final webcast


Eventually, "Tiny Webcasts" is both, a command-line tool helping you to create tiny webcasts, and a list of tips and tricks, of best practices, to record webcasts and to help you **focus on your teaching, not the underlying technique**.


Installation
############

The command-line tool used to create the webcasts can be obtained from `GitHub <https://github.com/tillbiskup/tiny-webcasts>`_.

There are now two options available for installing the "Tiny Webcasts" command-line tool:
    
  * Docker image
  
    requires docker locally installed on your machine, preferred way for **Windows** (and macOS) users.

  * Direct install
  
    available for Linux and macOS, makes it necessary to install all the :doc:`requirements <requirements>`


.. note::

   We highly recommend to use the **Docker image** provided. This only requires Docker to be installed on your computer and is the preferred way for **Windows** users.


Have a look at :doc:`how to install Tiny Webcasts <installation>` (the command-line tool) for your operating system.


Where to start
##############

Still unsure whether this is something for you? See the :doc:`Who's the audience? <audience>` section. Ready to start? Have a look at the :doc:`requirements <requirements>` necessary to get started. And finally, have a look at the :doc:`workflow <workflow>` for creating webcasts.

Those new to audacity but interested in using it may have a look at the :doc:`short introduction to audacity <audacity>`. And those already familiar but in need of a quick reminder how to create the webcasts may visit the :doc:`quick reference <quick>`.

Have fun and share your knowledge!


Examples
########

A few `examples of lecture webcasts <https://www.till-biskup.de/de/lehre/organische-elektronik/ss2019/>`_ created with the workflow described here can be found on the website of one of the authors. The lectures are currently in German only.

A (growing) :doc:`series of webcasts introducing Tiny Webcasts <examples>` created with -- well, you will guess it -- "Tiny Webcasts" is now as well available, but this time in English. Look at the :doc:`respective page in this documentation <examples>`.


License
#######

This program is free software: you can redistribute it and/or modify it under the terms of the **GNU General Public License** as published by the Free Software Foundation, either **version 3** of the License, or (at your option) any later version.


.. toctree::
   :maxdepth: 2
   :caption: User Manual:

   audience
   installation
   workflow
   organising
   audacity


.. toctree::
   :maxdepth: 2
   :caption: Resources:

   quick
   faq
   comments
   examples

.. toctree::
   :maxdepth: 2
   :caption: Developers:

   requirements
   roadmap
   changelog
