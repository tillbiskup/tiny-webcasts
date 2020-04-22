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


Can I use "Tiny Webcasts" on Windows?
=====================================

Yes, you can (starting with release 0.2.0), thanks to adding functionality to create a docker image.


.. _faq-terminal-windows:

How to open a terminal/command line in Windows?
===============================================

There are many different ways how to open a terminal/command line window/command prompt in Windows. You may find the following documentation useful:

  * https://www.digitalcitizen.life/7-ways-launch-command-prompt-windows-7-windows-8
  
Probably the shortest way would be to type "cmd" on the search bar on the bottom left and hit "Enter". This should open a terminal for you.


.. figure:: ./images/windows-cmd-open-en.*
   
   One way to open a terminal in Windows, here shown for Windows 10. (1) Type "cmd" in the search bar on the bottom left of your desktop. (2) Hit enter. Afterwards, a black window should appear where you can start typing commands.

Once you were successful, a black window like the one shown in the following should appear on your screen.


.. figure:: ./images/windows-cmd-de.*
   :width: 100%
   
   A windows terminal/command line window/command prompt, here shown for Windows 10 on a German Windows installation. Yours should look overall pretty similar.


There are ways to open a terminal in Windows **directly within a certain directory**. Usually, holding :kbd:`Shift` and right-clicking on the folder you want it opened on, and then clicking "open command window here" should do the trick. Alternatively, you can also type cmd into the Windows File Explorer address bar (use :kbd:`Ctrl+L` to focus the address bar) and press Enter to open the shell.

If that doesn't work for you, check out `these more detailed explanations on superuser.com <https://superuser.com/questions/339997/how-to-open-a-terminal-quickly-from-a-file-explorer-at-a-folder-in-windows-7>`_.


.. _faq-terminal-macos:

How to open a terminal/command line in macOS?
=============================================

There is, as always, different options, depending on your experience and personal taste. To name just a few:

  * Open spotlight by pressing :kbd:`command + space` and start typing "terminal". If "Terminal" appears together with a black symbol, hit :kbd:`Return`.
  
  * Open the launchpad and start typing "terminal". Once the symbol with the name "Terminal" underneath is highlighted, hit :kbd:`Return`.

Once you were successful, a window like the one shown in the following should appear on your screen.


.. figure:: ./images/macos-terminal.*
   :width: 100%
   
   A macOS terminal window. Yours should look overall pretty similar. If you have chosen a different colour scheme ("profile"), the colours may look different, though.


There are ways to open a terminal in macOS **directly within a certain directory**. Therefore, locate the directory in a :command:`Finder` window, right-click on the directory and select "Services" > "New Terminal At Folder". If that doesn't work for you, check out `these more detailed explanations on lifehacker.com <https://lifehacker.com/launch-an-os-x-terminal-window-from-a-specific-folder-1466745514>`_.


Why did you change the user interface?
======================================

Those users having used version 0.1.0 will notice that the user interface of the ``twc`` command has changed quite a bit with version 0.2.0. This is generally deemed bad practice, as the user interface should be as stable as possible, not having breaking changes (as in this case). However, there were good reasons for this change (usability), and there is a reason why we are still with version 0.x (see `Semantic Versioning <https://semver.org/>`_ for details).

The new user interface has been streamlined and should be much more convenient to use. The idea behind "Tiny Webcasts", besides small resulting videos, still is: **focus on your teaching, not the underlying technique**.

