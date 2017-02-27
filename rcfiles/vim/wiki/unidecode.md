### Unidecode
It is both a python lybrary and a linux command line

    sudo pip install unidecode

``` python
from unidecode import unidecode
print(unidecode(u"áéíóú äëïöü ñÑ û"))
```

    echo "Ação" | unidecode
