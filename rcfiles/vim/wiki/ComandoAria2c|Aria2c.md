# Porwerful downloader

``` markdown
File:		 ComandoAria2c|Aria2c.md
Created:	 ter 10 jan 2017 17:57:28 BRT
Last Change: ter 10 jan 2017 18:05:12 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```
#### References:
http://www.2daygeek.com/aria2-command-line-download-utility-tool/#

#### how to use it

``` sh
# -c continue
Aria2c -c [URL]

aria2c -c [URL-1]  [URL-2]
```

#### chose output result

``` sh
aria2c -o owncloud.zip https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
```

#### Limit download spped

``` sh
aria2c --max-download-limit=500k link
```
#### Downloading files from a file

``` sh
aria2c -i file.txt
```
#### Download using 2 connections per host

``` sh
aria2c -x2 https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
```

#### Downloading from a protected site

``` sh
aria2c --http-user=xxx --http-password=xxx link
```
