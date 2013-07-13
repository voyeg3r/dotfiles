#!/bin/bash
# bbips - (b)ash (b)atch (i)mage (p)rocessing (s)cript
#              On the web at www.bbips.org

#####################################################################################
#                                                                                   #
#    FILE: bbips                                                                    #
# VERSION: See variable (bbips_version) below.                                      #
#    DATE: See variable (revision_date) below.                                      #
#                                                                                   #
#  AUTHOR: Dave Crouse <dave NOSPAMat usalug.org>                                   #
#      c/o USA Linux Users Group                                                    #
#          PO Box 3210                                                              #
#          Des Moines, IA 50316-0210                                                #
#          United States                                                            #
#                                                                                   #
#                                                                                   #
# Copyright (C) 2004-2006 Dave Crouse <dave NOSPAMat usalug.org>                    #
# All rights reserved.                                                              #
#                                                                                   #
# This program is free software; you can redistribute it and/or modify              #
# it under the terms of the GNU General Public License as published by              #
# the Free Software Foundation; either version 2 of the License, or                 #
# (at your option) any later version.                                               #
#                                                                                   #
# This program is distributed in the hope that it will be useful,                   #
# but WITHOUT ANY WARRANTY; without even the implied warranty of                    #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                     #
# GNU General Public License for more details.                                      #
#                                                                                   #
# You should have received a copy of the GNU General Public License                 #
# along with this program; if not, write to the Free Software                       #
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA         #
#                                                                                   #
#####################################################################################
export IFS=$'\n';
#------------ Start of Variables ------------#

bbips_version="0.4.0"
revision_date="Modified October 10,2006"
author="Created by: Dave Crouse"

#------------ End of Variables   ------------#




#----------------------- START Menu Funtions -----------------------#

Main_Menu ()
{
mainmenu="\t1) \tGeneral Information\n\t2)\tBatch Image Processing Functions\n\t3)\tCreate an Image Gallery\n\t4)\tChange or View Image Information\n\t5)\tBackup Images into Archives: (.tar .tar.gz)\n\t6)\tChange Current Working Directory (PWD)\n\t7)\tExtra Functions\n\t0)\tExit"
headerfile
echo "        ---------- Main Menu -----------";
echo "";
echo -e "${mainmenu}"
echo "";
read -p "Please choose one of the options above : " option

while true
do
   case ${option} in
      1)   BBIPS_information;
         ;;
      2)   Image_Processing;
         ;;
      3)   Gallery_Menu;
         ;;
      4)   Image_Information;
         ;;
      5)   Create_Backups;
         ;;
      6)   Change_PWD;
         ;;
      7)   Extra_Functions
         ;;
      0)   option="";
         exit;
         ;;
      *)   echo "That choice was invalid!!";
         ;;
   esac
   headerfile
   echo "        ---------- Main Menu -----------";
   echo "";
   echo -e "${mainmenu}"
   echo "";
   read -p "Please choose one of the options above : " option
done

}

BBIPS_information ()
# second tier menu
{
informationmenu="\t1) \tMain Menu\n\t2)\tBBIPS - What is it?\n\t3)\tBBIPS - Installed Programs Check\n\t4)\tBBIPS - License Information\n\t5)\tBBIPS - Tips and Tricks\n\t6)\tBBIPS - Show Available Fonts for IM\n\t7)\tBBIPS - Current Changelog\n\t8)\tContributors\n\t0)\tExit"
headerfile
echo "        ------ General Information Menu -------";
echo "";
echo -e "${informationmenu}"
echo "";
read -p "Please choose one of the options above : " option

while true
do
   case ${option} in
      1)   Main_Menu;
         ;;
      2)   BBIPS_Notes;
         ;;
      3)   About_BBIPS;
         ;;
      4)   BBIPS_License;
         ;;
      5)   BBIPS_tips;
         ;;
      6)   Show_Available_Fonts;
         ;;
      7)   BBIPS_changelog;
         ;;
      8)  Special_Thanks;
         ;;
      0)   option="";
         exit;
         ;;
      *)   echo "That choice was invalid!!";
         ;;
   esac
   headerfile
   echo "        ------ General Information Menu -------";
   echo "";
   echo -e "${informationmenu}"
   echo "";
   read -p "Please choose one of the options above : " option

done

}

Image_Processing ()
# second tier menu
{
imageprocessingmenu="\t1) \tMain Menu\n\t2)\tRotate Images\n\t3)\tCreate Thumbnails\n\t4)\tCustom Resize Images\n\t5)\tResize Images to 400x400 max\n\t6)\tPut Text on Images\n\t7)\tAdd Border to Images\n\t8)\tConvert Images to Black and White\n\t9)\tFlop Images Horizontally\n\t10)\tFlip Images Vertically\n\t11)\tColorize Images\n\t12)\tNormalize Images\n\\t13)\tPaint Images\n\t14)\tSolarize Images\n\t15)\tGamma Correct Images\n\t0)\tExit"
headerfile
echo "        -------- Image Processing Menu ---------";
echo "";
echo -e "${imageprocessingmenu}"
echo "";
read -p "Please choose one of the options above : " option

while true
do
   case $option in
      1)   Main_Menu;
         ;;
      2)   Rotate_Images;
         ;;
      3)   Thumbnails;
         ;;
      4)   Custom_Resize;
         ;;
      5)   Resize400;
         ;;
      6)   Text_on_Images;
         ;;
      7)   Add_Border;
         ;;
      8)   Black_and_White;
         ;;
      9)   Flop_Images;
         ;;
     10)   Flip_Images;
         ;;
     11)   Colorize_Images;
         ;;
     12)   Normalize_Images;
         ;;
     13)   Painted_Images;
         ;;
     14)  Solarize_Images;
         ;;
     15)  Gamma_Correct_Images;
	 ;;
      0)   option="";
         exit;
         ;;
      *)   echo "That choice was invalid!!";
         ;;
   esac
   headerfile
   echo "        -------- Image Processing Menu ---------";
   echo "";
   echo -e "${imageprocessingmenu}"
   echo "";
   read -p "Please choose one of the options above : " option

done
}

Gallery_Menu ()
# second tier menu
{
gallerymenu="\t1) \tMain Menu\n\t2)\tCreate Image Gallery\n\t3\tCreate Black & White Gallery\n\t4)\tCreate a Visual Index Image\n\t0)\tExit"
headerfile
echo "        ------ Image Gallery Menu -------";
echo "";
echo -e "${gallerymenu}"
echo "";
read -p "Please choose one of the options above : " option

while true
do
   case ${option} in
      1)   Main_Menu;
         ;;
      2)   Create_Gallery;
         ;;
      3)   Create_BW_Gallery;
         ;;
      4)   create_visual_index;
         ;;
      0)   option="";
         exit;
         ;;
      *)   echo "That choice was invalid!!";
         ;;
   esac
   headerfile
   echo "        ------ Image Gallery Menu -------";
   echo "";
   echo -e "${gallerymenu}"
   echo "";
   read -p "Please choose one of the options above : " option

done

}

Image_Information ()
# second tier menu
{
imageinformationmenu="\t1) \tMain Menu\n\t2)\tRead Comments on Images\n\t3)\tAppend Comments to Images\n\t4)\tOver-Write Comments on Images\n\t5)\tList Images Onscreen\n\t6)\tDisplay an Image\n\t7)\tChange Image Extensions\n\t0)\tExit"
headerfile
echo "        ------ Image Information Menu -------";
echo "";
echo -e "${imageinformationmenu}"
echo "";
read -p "Please choose one of the options above : " option

while true
do
   case ${option} in
      1)   Main_Menu;
         ;;
      2)   Read_Comments;
         ;;
      3)   Append_Comments;
         ;;
      4)   Write_Comments;
         ;;
      5)   list_images;
         ;;
      6)   display_image;
         ;;
      7)   changeextension;
         ;;
      0)   option="";
         exit;
         ;;
      *)   echo "That choice was invalid!!";
         ;;
   esac
   headerfile
   echo "        ------ Image Information Menu -------";
   echo "";
   echo -e "${imageinformationmenu}"
   echo "";
   read -p "Please choose one of the options above : " option

done
}

Create_Backups ()
# second tier menu
{
backupmenu="\t1) \tMain Menu\n\t2)\tCreate a .tar backup\n\t3)\tCreate a .tar.gz backup (GZIPPED) \n\t0)\tExit"
headerfile
echo "        ------ Backup/Archiving Menu --------";
echo "";
echo -e "${backupmenu}"
echo "";
read -p "Please choose one of the options above : " option

while true
do
   case ${option} in
      1)   Main_Menu;
         ;;
      2)   tarbackup;
         ;;
      3)   gzipbackup;
         ;;
      0)   option="";
         exit;
         ;;
      *)   echo "That choice was invalid!!";
         ;;
   esac
   headerfile
   echo "        ------ Backup/Archiving Menu --------";
   echo "";
   echo -e "${backupmenu}"
   echo "";
   read -p "Please choose one of the options above : " option

done
}

Change_PWD ()
# second tier menu
{
changedirectorymenu="\t1) \tMain Menu\n\t2)\tView Current Directory (ls)\n\t3)\tMove up 1 Directory Level (cd ..)\n\t4)\tEnter Directory path manually\n\t0)\tExit"
headerfile
echo "        -- Change Current Working Directory Menu --";
echo "";
echo -e "${changedirectorymenu}"
echo "";
read -p "Please choose one of the options above : " option

while true
do
   case ${option} in
      1)   Main_Menu;
         ;;
      2)   option="";
           ls -pX --color=always; read -p "Hit RETURN to continue" temp;
         ;;
      3)   option="";
           cd ..; echo "Your current working directory is now:"; pwd; read -p "Hit RETURN to continue" temp;
         ;;
      4)   option="";
          read -p "Enter the exact path to the directory you wish to work with: " moveto;
          if [[ -d ${moveto} ]]
          then
                   cd ${moveto};
          else
                   echo "";
                   echo "That directory does not exist!!";
                   echo "";
                   read -p "Hit RETURN to continue" temp
                   Change_PWD;
          fi
          echo "Your current working directory is now:"; pwd; read -p "Hit RETURN to continue" temp;
          ;;

      0)   option="";
         exit;
         ;;
      *)   echo "That choice was invalid!!";
         ;;
   esac
   headerfile
   echo "        -- Change Current Working Directory Menu --";
   echo "";
   echo -e "${changedirectorymenu}"
   echo "";
   read -p "Please choose one of the options above : " option

done
}


Extra_Functions ()
# second tier menu
{
extrafunctionsmenu="\t1) \tMain Menu\n\t2)\tMultiple Screenshot Tool\n\t0)\tExit"
headerfile
echo "        ----- Extra Functions Menu -----";
echo "";
echo -e "${extrafunctionsmenu}"
echo "";
read -p "Please choose one of the options above : " option

while true
do
   case ${option} in
      1)   Main_Menu;
         ;;
      2)   Create_Screenshots;
         ;;

      0)   option="";
         exit;
         ;;
      *)   echo "That choice was invalid!!";
         ;;
   esac
   headerfile
   echo "        ----- Extra Functions Menu -----";
   echo "";
   echo -e "${extrafunctionsmenu}"
   echo "";
   read -p "Please choose one of the options above : " option

done
}

#----------------------- END Menu Funtions -----------------------#



#----------------------- START Program Funtions -----------------------#

Check4IM ()
{
which convert &>/dev/null
  if [ $? != "0" ];
  then
   echo -e "ImageMagick -- NOT INSTALLED";
   echo -e "You will need to install ImageMagick before this script will function correctly.";
   # Don't exit even if ImageMagick isn't installed - Just warns.
   echo ""
   read -p "Hit RETURN to continue" temp
  else
   echo "";
   fi
}

Check4programs ()
{
# check for installed programs
# Don't exit even if ImageMagick or others aren't installed- Just warn.

which convert &>/dev/null
  if [ $? != "0" ];
  then
   echo -e "ImageMagick -- NOT INSTALLED";
   echo -e "You will need to install ImageMagick before this script will function correctly.";
  else
   echo "ImageMagick -- Installed";
   fi

which jpegtran &>/dev/null
  if [ $? != "0" ];
  then
   echo -e "jpegtran -- NOT INSTALLED";
  else
   echo "jpegtran -- Installed";
   fi

which djpeg &>/dev/null
  if [ $? != "0" ];
  then
   echo -e "djpeg -- NOT INSTALLED";
  else
   echo "djpeg -- Installed";
   fi

which cjpeg &>/dev/null
  if [ $? != "0" ];
  then
   echo -e "cjpeg -- NOT INSTALLED";
  else
   echo "cjpeg -- Installed";
   fi

  which rdjpgcom &>/dev/null
  if [ $? != "0" ];
  then
   echo -e "rdjpgcom -- NOT INSTALLED";
  else
   echo "rdjpgcom -- Installed";
   fi

   which wrjpgcom &>/dev/null
  if [ $? != "0" ];
  then
   echo -e "wrjpgcom -- NOT INSTALLED";
  else
   echo "wrjpgcom -- Installed";
   fi

    which gd &>/dev/null
  if [ $? != "0" ];
  then
   echo -e "gd -- NOT INSTALLED";
  else
   echo "gd -- Installed";
   fi

    which jhead &>/dev/null
  if [ $? != "0" ];
  then
   echo -e "jhead -- NOT INSTALLED";
  else
   echo "jhead -- Installed";
   fi
}

list_images ()
{
# ls -pX --color=always  #Replaced 10-10-2006 with line below. This line shows everything...below
# shows only jpg files.
find . -maxdepth 1 -type f -iname "*.jpg"
echo ""
read -p "Hit RETURN to continue" temp
}

Show_Available_Fonts ()
{
clear
grep -v fullname= /usr/lib/*/config/type-ghostscript.xml | grep name= | cut -d'"' -f2 | nl > availablefonts
cat availablefonts
read -p "Hit RETURN to continue" temp
rm availablefonts
clear
}

Quit ()
{
echo " "
echo "Thank you for using bbips !"
echo " "
exit 0
}

#----------------------- END Program Funtions -----------------------#


#----------------------- START Backup Funtions -----------------------#
tarbackup ()
{
echo "This function creates a tar archive
of the images in this directory.
# $PWD
You will need to enter a name for the backup.
This will only create a backup of images in
the current directory. It does not do
a recursive search down. Subdirectories
must be tarred up seperately.
";
read -p "Please enter a name to use for the backup: " backupname
tar -cvf $backupname.tar $(find . -maxdepth 1 -type f -iname "*.jpg");
echo "";
read -p "Hit RETURN to continue" temp
}

gzipbackup ()
{
echo "This function creates a gzipped file containing all the jpgs in the directory.";
read -p "Enter a name for the gzipped file: " backupname
bbgzip
echo "";
read -p "Hit RETURN to continue" temp
}

#----------------------- END Program Funtions -----------------------#


#----------------------- START Image Manipulation Funtions -----------------------#

Thumbnails ()
{
clear
headerfile
echo "
This function creates 100 x 100 Thumbnails
for an entire directory.";
read -p "Hit RETURN to continue" temp
bbresize 100 100
echo "Thumbnails created"
echo "";
read -p "Hit RETURN to continue" temp


}

Resize400 ()
{
clear
headerfile
echo "Create 400 x 400 images for an entire directory.
This creates a directory and then creates
resized images in that directory.";
read -p "Hit RETURN to continue" temp
bbresize 400 400
echo "";
read -p "Hit RETURN to continue" temp
}

Custom_Resize ()
{
clear
headerfile
echo "

This is the custom sized function
Create maxsizewidth x maxsizeheight images for an entire directory.
You supply the max width and max height that you want the images.

";
echo "Please enter the maximun width and height for the images."
echo "Images will be scaled to no larger than EITHER dimension given."
echo "The images won't be stretched to fit, but rather NOT allowed to"
echo "expand beyond the limits you give. IE: When the images reaches either"
echo "a width or height limit, the image resizing is finished."
echo ""
read -p "Please enter maximum pixel width: " maxsizewidth
read -p "Please enter maximum pixel height: " maxsizeheight
sleep 1
bbresize ${maxsizewidth} ${maxsizeheight}
echo "";
read -p "Hit RETURN to continue" temp
}

changeextension ()
{
########## Does NOT work with filenames with spaces in them
clear
headerfile
echo "
################################################
# bbips [Change the extensions on all images ] #
################################################

This function changes the extension on the image
files. IE: from .jpg to .JPG

";

# NOTE: some error checking here would be in order :)

read -p "Please enter the extension you want to change IE: JPEG: " badext
read -p "Please enter the extension you want to change to, IE: jpg: " newext
badextension=*.$badext;
match=.$badext;
replacewith=.$newext;
for i in $( find -iname "$badextension" );
do
src=$i
tgt=$(echo $i | sed -e "s/$match/$replacewith/")
echo renaming $src to $tgt
mv $src $tgt
done
echo ""
read -p "Hit RETURN to continue" temp
}

create_visual_index ()
{
echo "This function creates a visual index page.

The file is named INDEX.jpg  It is not actually a photogallery,
but rather an image of all the images (in thumbnail size) contained
in the directory. It contains file size information, and also file
name information below each image. Only .jpg images will be written
to the image. .JPG .jpeg .JPEG all need to be converted to .jpg if
you want to create a visual index page with them on it. There is a
bbips function that will allow you to change the extensions to .jpg
in the Change or View Image Information menu.

";
read -p "Hit RETURN to continue" temp
# convert 'vid:*.*' INDEX.jpg;
convert 'vid:*[.jpg,.JPG]' INDEX.jpg;
# creates an index-visually of all the images in your directory.
echo "The visual index page(s) have been created";
read -p "Hit RETURN to continue" temp
}

display_image ()
{
ls
read -p "Please enter the image you want to display: " displaythisimage
display "${displaythisimage}"
echo ""
read -p "Hit RETURN to continue" temp
}

Text_on_Images ()
{
echo "
This function puts text on every image on the bottom
center of each image. Creates a new directory for the
modified images called TEXTADDED
";
read -p "Hit RETURN to continue" temp
# need to include varibles for -gravity <type>
# -gravity Choices are: NorthWest, North, NorthEast, West, Center, East, SouthWest, South, SouthEast.
bbcopy TEXTADDED
cd TEXTADDED
bbaddtext
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}

Black_and_White ()
{
echo "This function creates a black and white copy of each image.
Creates a new directory for the
modified images called BLACKandWHITE
";
read -p "Hit RETURN to continue" temp
bbcopy BLACKandWHITE
cd BLACKandWHITE
bbgrayscale
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}

Colorize_Images ()
{
echo "This function creates a colorized copy of each image.
Creates a new directory for the
modified images called COLORIZED

Specify the amount of colorization as a percentage.
You can apply separate colorization values to the red,
green, and blue channels of the image with a colorization
value.

0=normal
50=50% REMOVED
99=99% REMOVED

IE: If you make red=0 green=50 and blue=0, then 50% of the green
will be REMOVED, and the red and blue channels left normal, which
will leave more red and blue, making the image more purple.
";
echo ""
read -p "Enter the colorization value for red 0-99: " rcolor
read -p "Enter the colorization value for green 0-99: " gcolor
read -p "Enter the colorization value for blue 0-99: " bcolor
bbcopy COLORIZED-${rcolor}-${gcolor}-${bcolor}
cd COLORIZED-${rcolor}-${gcolor}-${bcolor}
bbcolorize $rcolor $gcolor $bcolor
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}

Normalize_Images ()
{
echo "This function creates a normalized copy of each image.
Creates a new directory for the
modified images called NORMALIZED

Transforms images to span the full range of color values.
This is a contrast enhancement technique.
";
read -p "Hit RETURN to continue" temp
bbcopy NORMALIZED
cd NORMALIZED
bbnormalize
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}

Painted_Images ()
{
echo "This function creates a painted copy of each image.
Creates a new directory for the
modified images called PAINTED

Simulates an oil painting.
Each pixel is replaced by the most frequent color in
a circular neighborhood whose width is specified with radius.
In this case, the radius is the BRUSH WIDTH. Choosing a value
between 1 and 5 seems to work best.
";
read -p "Enter a value for brush width 1-5 works best." paintvalue
bbcopy PAINTED-${paintvalue}
cd PAINTED-${paintvalue}
bbpaint ${paintvalue}
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}

Solarize_Images ()
{
echo "This function creates a solarized copy of each image.
Creates a new directory for the
modified images called SOLARIZED

This option produces a solarization effect as seen
when exposing a photographic film to light during
the development process.

Specify the value as the percent threshold of the
intensity (0 - 99.9) 0 being the most, 99.9 the least.
";
read -p "Enter a solarize value 0-99.9 : " solarvalue
bbcopy SOLARIZED-${solarvalue}
cd SOLARIZED-${solarvalue}
bbsolarize ${solarvalue}
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}

Gamma_Correct_Images ()
{
echo "This function creates a gamma corrected copy of each image.
Creates a new directory for the
modified images called GAMMA

This option will either lighten or darken an image depending on the amount of gamma correction required.
The same color image displayed on two different workstations may look different due to differences in the display monitor. Use gamma correction to adjust for this color difference. Reasonable values extend from 0.8 to 2.3. Gamma less than 1.0 darkens the image and gamma greater than 1.0 lightens it.

Specify the value between (0.8 - 2.3) 0.8 creating darker images, 2.3 creating lighter images.

You can apply separate gamma values to the red, green, and blue channels of the image with a gamma value list delimited with commas (e.g., 1.7,2.3,1.2).
";
read -p "Enter a gamma value 0.8 - 2.3 : " gammavalue
bbcopy GAMMA-${gammavalue}
cd GAMMA-${gammavalue}
bbgamma ${gammavalue}
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}


Add_Border ()
{
echo "This function creates a border on each image.
Creates a new directory for the
modified images called BORDER
";
	echo "		USAGE: bordercolor bordersize";
	echo "		EXAMPLE: black 6";
read -p "Enter border color: " bordercolor
read -p "Enter border size in pixels: " bordersize
bbcopy BORDER-${bordercolor}-${bordersize}
cd BORDER-${bordercolor}-${bordersize}
bbborder ${bordercolor} ${bordersize}
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}

Rotate_Images ()
{
echo "This function rotates each
image X number of degrees clockwise.
Creates a new directory for the
modified images called ROTATE
";
read -p "Please enter the degree of rotation you would like to perform IE 90, 180, 270 etc.: " rotate_degree
bbcopy ROTATE-${rotate_degree}
cd ROTATE-${rotate_degree}
bbrotate ${rotate_degree}
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}

Flop_Images ()
{
echo "This function creates a copy of each image flipped horizontally.
IE: A mirror image.
Creates a new directory for the
modified images called FLOP
";
read -p "Hit RETURN to continue" temp
bbcopy FLOP
cd FLOP
bbflop
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}

Flip_Images ()
{
echo "This function creates a copy of each image flipped vertically.
IE: A vertical mirror image.
Creates a new directory for the
modified images called FLIP
";
read -p "Hit RETURN to continue" temp
bbcopy FLIP
cd FLIP
bbflip
cd ..
echo "";
read -p "Hit RETURN to continue" temp
}

Read_Comments ()
{
echo "This function reads comments on the jpeg's - readable with rdjpgcom command.
";
read -p "Hit RETURN to continue and hit Q when done." temp
bbrecom
}

Append_Comments ()
{
echo "This function adds comments on the jpeg files. It ADD's to the comments, and does not overwrite them. - readable with rdjpgcom command.
";

read -p "Hit RETURN to continue or type quit to exit this menu" reallycontinue
  if [ "${reallycontinue}" = "quit" ]
   then
   Image_Information;
   fi
read -p "Please enter the comment to add to all the images: " comment
bbapcom ${comment}
echo "";
read -p "Hit RETURN to continue" temp
}

Write_Comments ()
{
echo "This function puts comments on the jpeg's - readable with rdjpgcom command.

WARNING !!!!! IMPORTANT !! PLEASE READ !!
Make SURE there are nothing but JPEG files in the directory your working in. This function makes use of the mv command and could overwrite files, other than JPEG files, in this directory with blank files. YOU HAVE BEEN WARNED !!
";


read -p "Hit RETURN to continue or type quit to exit this menu" reallycontinue
  if [ "${reallycontinue}" = "quit" ]
   then
   Image_Information;
   fi


read -p "Please enter the comment to put on all the images: " comment
bbwrcom ${comment}
echo "";
read -p "Hit RETURN to continue" temp
}

#----------------------- END Image Manipulation Funtions -----------------------#





#-------------------- START REUSABLE FUNCTIONS --------------------#
#------- THESE ARE THE MODIFIED BBIPS COMMAND LINE FUNCTIONS ------#

bbcopy ()
{
# This allows only for single word dir name for $1 - Probably need to quote to allow for spaces eventually.
mkdir -p $1
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
cp ${i:2} $1/${i:2};
echo "Copying ${i:2} into \"$1\" ";
done
echo "Done";
}

bbresize ()
{
if [[ -z "$2" || $1 = *[^0-9]* || $2 = *[^0-9]* ]] ; then
	echo " ";
	echo "		######### COMMAND FAILED ########## ";
	echo "		USAGE: width height";
	echo "		EXAMPLE: 400 400";
	echo "		Note: width and height variables MUST be numeric ! ";
	echo "		In the example 400 400 creates images with a maximum width of 400 and maximum height of 400.";
	echo "		######### COMMAND FAILED ########## ";echo " ";
else
bbcopy RESIZED-${1}x${2}; cd RESIZED-${1}x${2};
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
#echo "Resizing ${i:2} to $1 x $2";convert -size $1\x$2 ${i:2} -resize $1\x$2 new_${i:2}; mv new_${i:2} ${i:2};
echo "Resizing ${i:2} to $1 x $2";convert ${i:2} -resize $1\x$2 new_${i:2}; mv new_${i:2} ${i:2};

done
cd ..
fi
}

labelimage ()
{
convert ${i:2} \
-fill white -box '#00000080' \
-gravity South -font Helvetica-Bold \
-pointsize 15 \
-annotate +0+5 \
"$comment" \
 _${i:2}
}

bbaddtext ()
{
read -p "Please enter the text to put on the images: " comment
comment=" $comment "
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
labelimage; mv _${i:2} ${i:2}; echo "Adding text to" ${i:2};
done
}

bbgrayscale ()
{
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
echo "Converting ${i:2} to Black and White"; convert -colorspace gray ${i:2} new_${i:2}; mv new_${i:2} ${i:2}
done
}

bbcolorize ()
{
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
convert -colorize $1,$2,$3 ${i:2} _${i:2};
mv _${i:2} ${i:2}
echo "Colorized image ${i:2}" ;
done
}

bbnormalize ()
{
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
convert -normalize ${i:2} _${i:2};
mv _${i:2} ${i:2}
echo "Normalized image ${i:2}" ;
done
}

bbpaint ()
{
if [[ -z "$1" || $1 = *[^0-9]* ]] ; then
	echo " ";
	echo "		######### COMMAND FAILED ########## ";
	echo "		USAGE: brushsizenumber";
	echo "		EXAMPLE: 3";
	echo "		This would simulate an oil painting with a brush size 3.";
	echo "		1 to 5 produces the best resultes ;) ";
	echo "		Note: brushsize variable MUST be numeric ! ";
	echo "		######### COMMAND FAILED ########## ";echo " ";
else

for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
convert -paint $1 ${i:2} _${i:2};
mv _${i:2} ${i:2}
echo "Painted image ${i:2}" ;
done
fi
}

bbsolarize ()
{
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
convert -solarize ${1}% ${i:2} _${i:2};
mv _${i:2} ${i:2}
echo "Solarized image ${i:2}";
done
}

bbsepia ()
{
if [[ -z "$1" || $1 = *[^0-9]* ]] ; then
	echo " ";
	echo "		######### COMMAND FAILED ########## ";
	echo "		USAGE: sepiapercentoftone";
	echo "		EXAMPLE: 70";
	echo "		This would give a normal sepia tone.";
	echo "		0 to 100 are available options, but 70 is good ;) ";
	echo "		Note: sepia variable MUST be numeric ! ";
	echo "		######### COMMAND FAILED ########## ";echo " ";
else

for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
echo "Converting ${i:2} to Sepia Tone"; convert ${i:2} -sepia-tone ${1}% new_${i:2}; mv new_${i:2} ${i:2}
done
fi
}

bbrotate ()
{
if [[ -z "$1" || $1 = *[^0-9]* ]] ; then
	echo " ";
	echo "		######### COMMAND FAILED ########## ";
	echo "		USAGE: rotationindegrees";
	echo "		EXAMPLE: 90";
	echo "		This would rotate images 90 degrees clockwise.";
	echo "		Note: rotation variable MUST be numeric ! ";
	echo "		######### COMMAND FAILED ########## ";echo " ";
else

for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
echo "Rotating ${i:2} $1 degrees." ;convert -rotate $1 ${i:2} new_${i:2}; mv new_${i:2} ${i:2} ;
done
fi
}

bbgamma ()
{
if [ -z "$1" ] ; then
	echo " ";
	echo "		######### COMMAND FAILED ########## ";
	echo "		USAGE: $0 gamma_number";
	echo "		EXAMPLE: $0 2.0";
	echo "		Specify the value between (0.8 - 2.3) 0.8 creating darker images, 2.3 creating lighter images.";
	echo "		######### COMMAND FAILED ########## ";echo " ";
else

for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
convert -gamma $1 ${i:2} _${i:2};
mv _${i:2} ${i:2}
echo "Gamma corrected image ${i:2}" ;
done
fi
}

bbborder ()
{
if [[ -z "$1" || -z "$2" ]]; then
	echo " ";
	echo "		######### COMMAND FAILED ########## ";
	echo "		USAGE: bordercolor bordersize";
	echo "		EXAMPLE: black 6";
	echo "		######### COMMAND FAILED ########## ";echo " ";
	exit
else

for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
convert -bordercolor $1 -border $2x$2 ${i:2} _${i:2}
mv _${i:2} ${i:2}
echo "Created border on ${i:2}" ;
done
fi
}

bbflip ()
{
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
echo "Flipping ${i:2}" # Comment out this line to remove output text.
convert -flip ${i:2} new_${i:2}; mv new_${i:2} ${i:2}
done
}

bbflop ()
{
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
echo "Flopping ${i:2}"
convert -flop ${i:2} new_${i:2}; mv new_${i:2} ${i:2}
done
}

bbgzip ()
{
tar -cvf $backupname.tar $(find . -maxdepth 1 -type f -iname "*.jpg");
gzip $backupname.tar
}

bbrecom ()
{
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
echo "Comments for ${i:2}" >> /tmp/bbrecom; echo "-----------" >> /tmp/bbrecom; rdjpgcom ${i:2} >> /tmp/bbrecom; echo "-----------" >> /tmp/bbrecom;
echo "" >> /tmp/bbrecom; echo "" >> /tmp/bbrecom;
done
less /tmp/bbrecom ; rm -f /tmp/bbrecom
}

bbapcom ()
{
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
echo "Adding comment to" ${i:2}; wrjpgcom -comment "$1" ${i:2} > _${i:2} ; mv _${i:2} ${i:2};
done
}

bbwrcom ()
{
for i in $(find . -maxdepth 1 -type f -iname "*.jpg");
do
echo "Replacing comments on ${i:2}"; wrjpgcom -replace -comment "$1" ${i:2} > _${i:2} ; mv _${i:2} ${i:2}
done
}

#-------------------- END REUSABLE FUNCTIONS --------------------#





#----------------------- START Photo Gallery Funtions -----------------------#
Create_Gallery ()
{
clear
echo "    __    __    _
   / /_  / /_  (_)___  _____
  / __ \/ __ \/ / __ \/ ___/
 / /_/ / /_/ / / /_/ (__  )
/_.___/_.___/_/ .___/____/
             /_/
"
echo "----------------------------------"
echo "Bash Batch Image Processing Script"
echo "Image Gallery Creation Function"

echo "----------------------------------"

# Input the gallery name that will be displayed on the webpage.
read -p "Please enter a name for the gallery: " galleryname
echo " "
echo " "
echo "Now we need information regarding color scheme"
echo "We will need color for the background of the webpage"
echo "and the color of the borders around the images,"
echo "and text underneath the images."
echo " "
read -p "Please enter a color for the webpage background: " backgroundcolor
read -p "Please enter a color for the borders around the images: " bordercolor
read -p "Please enter a color for the text underneath the images: " textcolor
echo " "
echo " "
echo " "
# Create thumbnail gallery
echo "Thumbnail creation starting"
mkdir thumbnails
sleep 1
echo "Thumbnail directory has been created"
sleep 1
#for i in *.JPG ;
#changed to next line for various image types
#for i in *.* ;
# change [.jpg,.JPG] to something else if you want to work with some other image formats
for i in *[.jpg,.JPG] ;
do convert -size 120x120 ${i} -resize 120x120 -quality 100 tn_${i};
mv tn_${i} thumbnails/${i} ;
echo "Creating thumbnail ${i} " ;
done
echo "All thumbnails created"
echo " "
# Create white borders on images in thumbnail gallery
echo "Creating borders on all images"
echo " "
cd thumbnails
# for i in *.* ;
# change [.jpg,.JPG] to something else if you want to work with some other image formats
for i in *[.jpg,.JPG] ;
do convert -bordercolor ${bordercolor} -border 2x2 ${i} ${i}
echo "Border put on image ${i} " ;
done
echo " "
echo "Borders created on all images"
cd ..

# need check to see if an index file already exists ......
# if we are rerunning the script... the next line removes the previous version of the index file.
# rm index.html

# Create the html header
echo " "
echo "Creating index file"
# Below is the start of the html file. You can change the meta tags to reflect YOUR information if you wish.
# Spceifically the description and keywords sections.
echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" >> index.html
echo "<html>" >> index.html
echo "<head>" >> index.html
echo "<title>${galleryname} ................ Image gallery created using bbips version ${bbips_version} </title>" >> index.html
echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">" >> index.html
echo "<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">" >> index.html
echo "<meta name=\"Author\" content=\"http://www.bbips.org\">" >> index.html
echo "<meta name=\"generator\" content=\"Created by the Bash Batch Image Processing Script\">" >> index.html
echo "<meta name=\"robots\" content=\"all\">" >> index.html
echo "<meta name=\"revisit-after\" content=\"15 days\">" >> index.html
echo "<meta name=\"MSSmartTagsPreventParsing\" content=\"true\">" >> index.html
echo "<meta name=\"description\" content=\"BBIPS - a Bash Batch Image ProcessingScript.\">" >> index.html
echo "<meta name=\"keywords\" content=\"USA, LUG, Forum, usalug, Linux, bbips, bash, bashscripts.org, bbips.org, usalug.org \">" >> index.html
echo "</head>" >> index.html

echo "<body bgcolor='${backgroundcolor}' link='${textcolor}' vlink='${textcolor}' text='${textcolor}'><center>" >> index.html
echo "<br>" >> index.html
echo "<h3>${galleryname}</h3>"  >> index.html
echo "<table cellpadding='3' cellspacing='5'>"  >> index.html
echo "<tr>"  >> index.html

# Create the table of images
count=0
# for badname in *jpg
# change [.jpg,.JPG] to something else if you want to work with some other image formats
for badname in *[.jpg,.JPG] ;
do
  if [ $count -eq 5 ] ; then
    echo "</td>"  >> index.html
    echo "</tr>"  >> index.html
 echo " "  >> index.html
    echo "<tr>"  >> index.html
    echo "<td align='center'>"  >> index.html
    count=1
  else
    echo "</td>"  >> index.html
    echo "<td align='center'>"  >> index.html
    count=$(( $count + 1 ))
  fi

  rename="$(echo ${badname} | sed 's/.jpg//;s/-/ /g')"

  echo "<a href='${badname}' target=_new><img style='padding:2px' src='thumbnails/${badname}' border='0'></a>"  >> index.html
  echo "<br>"  >> index.html
  echo "<font size=-3>${rename}</font>"  >> index.html
done

echo "</td>"  >> index.html
echo "</tr>"  >> index.html
echo "</table>"  >> index.html
echo "<br>" >> index.html
echo "<br>" >> index.html
echo "<br>" >> index.html
echo "<font size=-5>Gallery created on " >> index.html;  date '+%D' >> index.html
echo "<br>" >> index.html
echo " using <a href=\"http://bbips.org\">BBIPS</a> ver.${bbips_version}" >> index.html
echo "</font></center>"  >> index.html
echo "</body>"  >> index.html
echo " "
echo "Image Gallery Created Successfully"
echo " "
echo "";
read -p "Hit RETURN to continue" temp
}

Create_BW_Gallery ()
{
clear
echo "    __    __    _
   / /_  / /_  (_)___  _____
  / __ \/ __ \/ / __ \/ ___/
 / /_/ / /_/ / / /_/ (__  )
/_.___/_.___/_/ .___/____/
             /_/
"
echo "----------------------------------"
echo "Bash Batch Image Processing Script"
echo "Black and White Gallery Creation Function"
echo ""
echo "This will create a new directory named"
echo "Black_and_White_Gallery which will contain"
echo "all the new black and white images and all"
echo "of the thumbnails and the .html page"
echo ""
echo "----------------------------------"
read -p "Please enter a name for the gallery: " galleryname
echo " "
echo " "
echo "Gallery Creation Starting"
echo " "
backgroundcolor="black"
bordercolor="white"
textcolor="white"
echo " "
echo " "
echo " "
# Create blacka and white directory
# Convert photos to black and white
mkdir bbips-Black_and_White_Gallery
# for i in *.* ;
# change [.jpg,.JPG] to something else if you want to work with some other image formats
for i in *[.jpg,.JPG] ;
do convert -colorspace gray ${i} _${i};
mv _${i} bbips-Black_and_White_Gallery/${i}
echo "bbips-Black_and_White_Gallery ${i} created." ;
done
# move into black and white directory
cd bbips-Black_and_White_Gallery
# Create thumbnail directory and thumbnails
echo "Thumbnail creation starting";
mkdir thumbnails
sleep 1
echo "Thumbnail directory has been created"
sleep 1
#for i in *.JPG ;
#changed to next line for various image types
#for i in *.* ;
# put border on thumbnails
# for i in *.jpg ;
# change [.jpg,.JPG] to something else if you want to work with some other image formats
for i in *[.jpg,.JPG] ;
do convert -size 120x120 ${i} -resize 120x120 -quality 100 tn_${i};
mv tn_${i} thumbnails/${i} ;
echo "Creating thumbnail ${i} " ;
done
echo "All thumbnails created"
echo " "
echo "Creating borders on all images"
echo " "
cd thumbnails
# for i in *.* ;
# change [.jpg,.JPG] to something else if you want to work with some other image formats
for i in *[.jpg,.JPG] ;
do convert -bordercolor white -border 2x2 ${i} ${i}
echo "Border put on image ${i} " ;
done
echo " "
echo "Borders created on all images"
cd ..
# need check to see if an index file already exists ......
# if we are rerunning the script... the next line removes the previous version of the index file.
# rm index.html

# Create the html header
echo " "
echo "Creating index file"
# Below is the start of the html file. You can change the meta tags to reflect YOUR information if you wish.
# Spceifically the description and keywords sections.
echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" >> index.html
echo "<html>" >> index.html
echo "<head>" >> index.html
echo "<title>${galleryname} ................ Image gallery created using bbips version ${bbips_version} </title>" >> index.html
echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">" >> index.html
echo "<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">" >> index.html
echo "<meta name=\"Author\" content=\"http://www.bbips.org\">" >> index.html
echo "<meta name=\"generator\" content=\"Created by the Bash Batch Image Processing Script\">" >> index.html
echo "<meta name=\"robots\" content=\"all\">" >> index.html
echo "<meta name=\"revisit-after\" content=\"15 days\">" >> index.html
echo "<meta name=\"MSSmartTagsPreventParsing\" content=\"true\">" >> index.html
echo "<meta name=\"description\" content=\"BBIPS - a Bash Batch Image ProcessingScript.\">" >> index.html
echo "<meta name=\"keywords\" content=\"USA, LUG, Forum, usalug, Linux, bbips, bash, bashscripts.org, bbips.org, usalug.org \">" >> index.html
echo "</head>" >> index.html

echo "<body bgcolor='${backgroundcolor}' link='${textcolor}' vlink='${textcolor}' text='${textcolor}'><center>" >> index.html
echo "<br>" >> index.html
echo "<h3>${galleryname}</h3>"  >> index.html
echo "<table cellpadding='3' cellspacing='5'>"  >> index.html
echo "<tr>"  >> index.html

# Create the table of images
count=0
# for badname in *jpg
# change [.jpg,.JPG] to something else if you want to work with some other image formats
for badname in *[.jpg,.JPG] ;
do
  if [ $count -eq 5 ] ; then
    echo "</td>"  >> index.html
    echo "</tr>"  >> index.html
 echo " "  >> index.html
    echo "<tr>"  >> index.html
    echo "<td align='center'>"  >> index.html
    count=1
  else
    echo "</td>"  >> index.html
    echo "<td align='center'>"  >> index.html
    count=$(( $count + 1 ))
  fi

  rename="$(echo ${badname} | sed 's/.jpg//;s/-/ /g')"

  echo "<a href='${badname}' target=_new><img style='padding:2px' src='thumbnails/${badname}' border='0'></a>"  >> index.html
  echo "<br>"  >> index.html
  echo "<font size=-3>${rename}</font>"  >> index.html
done

echo "</td>"  >> index.html
echo "</tr>"  >> index.html
echo "</table>"  >> index.html
echo "<br>" >> index.html
echo "<br>" >> index.html
echo "<br>" >> index.html
echo "<font size=-5>Gallery created on " >> index.html;  date '+%D' >> index.html
echo "<br>" >> index.html
echo " using <a href=\"http://bbips.org\">BBIPS</a> ver.${bbips_version}" >> index.html
echo "</font></center>"  >> index.html
echo "</body>"  >> index.html
echo " "
echo "Image Gallery Created Successfully"
echo " ";
read -p "Hit RETURN to continue" temp
cd ..
}

#----------------------- END Photo Gallery Funtions -----------------------#


#----------------------- START Generic Header Funtions -----------------------#

headerfile ()
{
clear
echo "    __    __    _
   / /_  / /_  (_)___  _____
  / __ \/ __ \/ / __ \/ ___/
 / /_/ / /_/ / / /_/ (__  )
/_.___/_.___/_/ .___/____/
             /_/
                          ${bbips_version}  "
echo "----------------------------------------"
echo "YOUR CURRENT WORKING DIRECTORY IS:";tput smso; pwd; tput rmso;
echo "----------------------------------------"
echo "";
}

About_BBIPS ()
{
clear
echo "----------------------------------"
echo "Project - bbips: Bash Batch Image Processing Script"
echo "Date Started: December 2, 2004"
echo "Website: http://www.bbips.org"
echo "Dave Crouse <dave NOSPAMat usalug.org>"
echo "Google Groups: http://groups-beta.google.com/group/bbips"
echo "Development Site:http://www.bashscripts.org"
echo ""
echo ""
echo "           Program versions your using on this system:"
echo ""
echo ""
echo "Version: bbips."${bbips_version} ${revision_date}
echo ${author}
echo ""
convert -version
echo ""
Check4programs
echo "----------------------------------"
echo ""
read -p "Hit RETURN to continue" temp
clear
}

BBIPS_License ()
{
clear
echo "#####################################################################################
#  AUTHOR: Dave Crouse <dave NOSPAMat usalug.org>                                   #
#      c/o USA Linux Users Group                                                    #
#          PO Box 3210                                                              #
#          Des Moines, IA 50316-0210                                                #
#          United States                                                            #
#                                                                                   #
#                                                                                   #
# Copyright (C) 2004-2006 Dave Crouse <dave NOSPAMat usalug.org>                    #
# All rights reserved.                                                              #
#                                                                                   #
# This program is free software; you can redistribute it and/or modify              #
# it under the terms of the GNU General Public License as published by              #
# the Free Software Foundation; either version 2 of the License, or                 #
# (at your option) any later version.                                               #
#                                                                                   #
# This program is distributed in the hope that it will be useful,                   #
# but WITHOUT ANY WARRANTY; without even the implied warranty of                    #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                     #
# GNU General Public License for more details.                                      #
#                                                                                   #
# You should have received a copy of the GNU General Public License                 #
# along with this program; if not, write to the Free Software                       #
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA         #
#                                                                                   #
#####################################################################################"
echo ""
read -p "Hit RETURN to continue" temp
}

BBIPS_Notes ()
{
clear
echo "This is the ABOUT BBIPS page where I try to explain what the heck bbips is.
Actually, it's just a simple (well, somewhat simple) set of bash functions all
put together in one script with a menu (of sorts) to help you work on batches
(entire directories) of images, all at once. I do some web design, and I like to
take digital pictures, and have thousands of them. While uploading images to
some fancy photogallery software is fine for a few images, I wanted to harness
the power of Linux and Imagemagick to create something that could be run from a
command line on images on a server that didn't use X, and that could run very
fast and without interaction if I wanted it to, or that could accept user input.

Why bash ? Well, because I like bash, and am still learning how to use it, and
it seemed like a good idea at the time. So, while I know of other projects that
do this, I don't know of any that use bash. I could be wrong, there very well
could be a bash script that does all this already, but it's good practical
experience anyway. I've seen some that use perl, some that use c and some that
use python, but never anything very large using bash. Bash comes installed with
almost every major Linux system, so there wouldn't be the need for php, perl,
python, or even the use of a compiler to run it. Just about the only needed
application is Imagemagick. Talk about simple :)

So basically, it's my project I'm doing to learn more about bash and it's limits
and possibilities. I don't claim it to be great programming, but it proved
useful to me on several occasions, so I thought I'd share it. If you like the
program, great, if not, feel free to suggest things or comment on it."
echo ""
read -p "Hit RETURN to continue" temp
}

BBIPS_tips ()
{
clear
echo "
TIP NUMBER 1.

Maximize your shell window. It allows the text to format correctly on your screen
and will make your display show up the way it was intended to.  :)

TIP NUMBER 2.

Create an alias.  The way to do this is to set an alias in your .bashrc
file.  Placing the alias into the .bashrc file allows you to startup bbips simply by
typing bbips. Below is the way my alias appears at the end of my .bashrc file.

alias bbips='sh /home/crouse/Scripts/bbips/bbips.sh'

You can open up any text editor and edit the .bashrc file. Simply add your alias
line to the end of the file.

Once you have the shell up and running, it's a simple matter of changing
directories and moving into the directory with the images you wish to process.
Then simply type bbips and your up and running in the correct directory. bbips
does contain a way to move up and down in the directory tree, but I find it's
easier for me to just start in the correct directory whenever possible. Making
an alias to the bbips program seems to make it easier for me to find and use.

TIP NUMBER 3.

Work on COPIES of your images. Make a copy of the directory of images you wish to process.
In case you mess something up, you always have the originals. This isn't a requirement, but
I believe it's just a good practice when working with images.

TIP NUMBER 4.

When working with entire directories of images, it's usually better to have nothing else
in the directory other than the images you wish to process.

TIP NUMBER 5

Advanced users can use the information located at the urls listed below.
http://www.cit.gu.edu.au/~anthony/graphics/imagick6/
http://www.imagemagick.org/script/command-line-options.php
"
read -p "Hit RETURN to continue" temp
}

#----------------------- END Generic Header Funtions -----------------------#


#----------------------- START Extra Funtions -----------------------#

Create_Screenshots ()
{
clear
echo "    __    __    _
   / /_  / /_  (_)___  _____
  / __ \/ __ \/ / __ \/ ___/
 / /_/ / /_/ / / /_/ (__  )
/_.___/_.___/_/ .___/____/
             /_/
"
echo "----------------------------------"
echo "Bash Batch Image Processing Script"
echo "Screenshot Creation Function"
echo ""
echo "This will allow you to take multiple"
echo "screenshots. You will be asked for the"
echo "number of screenshots you wish to take,"
echo "and the number of seconds delay between shots"
echo "You will also be asked for a name for the"
echo "screenshot directory. No spaces or special"
echo "characters should be used in the name."
echo ""
echo ""
read -p "How many screenshots do you want to take ? " numbershots
read -p "How many seconds delay between each shot ? " delayed
read -p "What would you like to name this series of screenshots ? " shotname
echo ""
echo "You may minimize this window. Screenshots will"
echo "begin 5 seconds after you hit the Enter Key"
echo ""
echo "----------------------------------"
read -p "Hit Enter to continue" temp
echo "Starting screenshots"
echo ""
mkdir bbips-screenshots
cd bbips-screenshots
mkdir ${shotname}
cd ${shotname}
sleep 5s;
# note: the resize feature available - others also available - see man import
# import -window root -resize 800x600 -snaps 10 -pause 5 bbipshot.jpg
import -window root -snaps ${numbershots} -pause ${delayed} ${shotname}.jpg
echo ""

# Rename .jpgs with numbers and correct output here
n=1
for i in *.jpg* ;
do
mv ${i} ${shotname}-$n.jpg;
n=$(( $n+1 ));
done

echo ""
echo "All screenshots created"
cd ..
cd ..
read -p "Hit RETURN to continue" temp

}


#----------------------- END Extra Funtions -----------------------#


#############################################################################
# This is the changelog and Contributors area - new changes documented here #
#############################################################################
#
#

Special_Thanks ()
{
headerfile
echo "These are contributors to BBIPS code."
echo ""
echo " ---- SourceForge Developers ----"
echo "David Crouse - Main Developer"
echo "Joshua Bailey - Coding help when I hit a mental block ;) "
echo "Frank Schiersner -German translation of version bbips-de.0.3.3.sh"
echo ""
echo " ---- Implemented Suggestions by ----"
echo "James McHale - Suggested having a Gamma correction routine"
echo "Many people - For suggesting fixing variables to allow for spaces in filenames"
echo ""
read -p "Hit RETURN to continue" temp
clear
}

BBIPS_changelog ()
{
headerfile
echo "Changelog: changes in version ${bbips_version}"
echo " "
echo "
Major code changes in several functions. Updated version number to .0.4.0

YOUR CURRENT WORKING DIRECTORY IS ~~ Made it display bold.

Added several functions to allow for spaces in filenames and directories.
Modified several functions to make use of the command line utilities that were added in.

Fixed some bash coding to make it a bit more elegant. IMHO (Still needs lots of work i know)

list_images function changed to list ONLY jpg's or JPG's

Removed the zip function.

Fixed tar and gzip functions to ONLY include the jpegs.

Image Functions now create directories with useful information at the end of the directory name.
Making it easier to keep track of what you did to the images in that directory.

Fixed bbresize -- removed the -size option... only using -resize now.

"

read -p "Hit RETURN to continue" temp
clear
}


# Future things..

# convert -implode from .1% to 2 or 3% (looks best)
# implodes pixels to center

# convert -swirl 135 DSC04528.JPG DSC04528web.JPG
# swirls pixels x degrees around center

# convert -equalize
#  perform histogram equalization to the image.

# Will incorporate the use of the command line functions to create
# much more dramatic(better) photogalleries  :) :)

#
#
########################################
#         end of changelog area        #
########################################

###########################
# Program run starts here #
###########################

Check4IM
Main_Menu
exit
