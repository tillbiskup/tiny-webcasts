Details of the steps performed by the scripts
#############################################

For those interested in the details of what the two scripts described in the :doc:`workflow <workflow>` actually do, here is a more detailed list with some comments and explanations.


.. note::

   Currently, this section is not really up-to date. It will be updated soon and more details added.


Split and convert the presentation
==================================

First, we need to split the presentation into single image files. The following line assumes that there is only one PDF file in the current directory::

  twc-presentation2jpg.sh *pdf


Convert audio files
===================

Next, we need to convert the audio files from WAV to M4A format, in between filtering, normalising and generally tremendously reducing their size (this is where most of the magic happens, reducing the file size of the audio)::

  for wav in *.wav; do twc-wav2aac.sh ${wav}; done


Concatenate video and audio files and create metadata template
==============================================================

Next is to concatenate the slides to a video trace and the audio files to a single audio trace and create the metadata::

  twc-concat-slides.sh
  twc-concat-audio.sh
  twc-create-metadata.sh


Edit metadata
=============

Now, you will have to edit the metadata contained in ``meta.txt``::

  vim meta.txt

Of course, you can use any text editor you like.


Create the final webcast
========================

And finally, you can create the webcast::

  twc-finalise-webcast.sh my_fancy_webcast.mp4
