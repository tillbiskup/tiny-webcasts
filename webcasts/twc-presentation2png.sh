# vars
inputPDF="$1"
slidePrefix=slides
 
### convert input
# adjust density to produce desired output resolution
# width needs to be dividable by 2
convert \
  -density 285.75 \
  "${inputPDF}" \
  -quality 90 \
  -geometry x1080 \
  ${slidePrefix}-%03d.png

