Organising your webcasts
========================

One crucial aspect when starting to record webcasts of a lecture series is how to organise your files. 


.. warning::

   The following suggestion for a directory layout is not yet fully consistent with the results from the ``twc`` command. However, it is planned in future releases to help the users maintain an organised and well-structured directory layout for their webcasts, helping as well with backing up the valuable data.


Here is a first idea for a final directory layout of your webcasts, assuming you create a series of (numbered) webcasts for a certain topic::

  topic/
    01/
      raw/
        topic-01-audio-raw.wav
        topic-01.pdf
      cut/
        topic-01-audio-000.wav
        topic-01-audio-001.wav
        ...
        topic-01-audio-nnn.wav
      webcast/
        topic-01-chaptermeta.txt
        topic-01-meta.txt
        topic-01.mp4
        topic-01.pdf
    02/
      raw/
        topic-02-audio-raw.wav
        topic-02.pdf
      cut/
        topic-02-audio-000.wav
        topic-02-audio-001.wav
        ...
        topic-02-audio-nnn.wav
      webcast/
        topic-02-chaptermeta.txt
        topic-02-meta.txt
        topic-02.mp4
        topic-02.txt
    ...


For those concerned about file sizes: A sensible idea to reduce the size of the raw and cut audio files is to convert them into FLAC format. This format is lossless, but still much smaller than WAV files.
