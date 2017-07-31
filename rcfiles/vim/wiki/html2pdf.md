### Convert html pages to pdf
+ https://www.cyberciti.biz/open-source/html-to-pdf-freeware-linux-osx-windows-software/

On my system i have found wkhtmltopdf so then I aliased it

    html2pdf https://www.cyberciti.biz/open-source/html-to-pdf-freeware-linux-osx-windows-software/ html2pdf.pdf


### Converting html to pdf online
+ https://www.sejda.com/html-to-pdf

### Grayscale pdf

The following PDF will be generated in grayscale:

    html2pdf -g http://www.cyberciti.biz/faq/bash-for-loop/print/ bash.for.loop.pdf

Set orientation to Landscape or Portrait

Use the following syntax:

    html2pdf -O Landscape http://www.cyberciti.biz/faq/bash-for-loop/print/ bash.for.loop.pdf

Where,

    -O Landscape|Portrait. The default is Portrait.

### How do I set page size?

Use the following syntax:

    html2pdf -S SIZE http://www.cyberciti.biz/faq/bash-for-loop/print/ bash.for.loop.pdf

Where,

    -s Size : Set paper size to: A4, Letter, etc. (default A4)

How do I generate table of content?

A table of content can be added to the document by adding a toc the command line option. For example:

    html2pdf toc http://www.cyberciti.biz/faq/bash-for-loop/print/ bash.for.loop.pdf

