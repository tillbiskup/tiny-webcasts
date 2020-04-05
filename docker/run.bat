@echo off
docker run -v %cd%:/workdir -it twc %*
