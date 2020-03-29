# Tiny webcasts for lecture(r)s

Creating webcasts from a presentation in PDF format and audio files.

A series of bash scripts using ffmpeg and other tools to create webcasts with small file size starting off from a PDF presentation with slides and audio files in high resolution for each slide.

All bash scripts reside in the `webcasts` directory. Documentation (using Sphinx and reStructuredText) can be found in the `docs` directory.


## Install

Download the project or check it out using git. Afterwards, go to the `webcasts` directory and run the installer:

```bash
./twc-install.sh
```

This will create a `~/bin/` directory (if it doesn't already exist) and copy all the scripts in there.


## A typical workflow

Assume you have a presentation in PDF format with one page per slide/overlay, and a series of cut audio files corresponding to the slides. Then there are only three simple steps to create your webcast.


### Copy audio and PDF files to temporary directory

This step is highly recommended, as the scripts will remove the raw files after processing them.

```bash
twc tmpdir
```


### Prepare your webcast

Postprocess your audio files and create the audio and video trace for your webcast.

```bash
twc prepare
```

Now, you will have to edit the metadata contained in the newly created file `meta.txt`:

```bash
vim meta.txt
```

Of course, you can use any text editor.


### Finalise your webcast

And finally, you can create the webcast:

```bash
twc finalise my_fancy_webcast.mp4
```

That's it. Enjoy and share your tiny webcast.


## Documentation

All documentation is contained in the `docs` directory and can either be created using Sphinx or visited online: https://webcasts.docs.till-biskup.de/.


## Contribute

A note for developers: A bash script for auto-incrementing the version number resides in the `bin` directory. Add this to the `pre-commit` hook of your local git repo for convenience.
