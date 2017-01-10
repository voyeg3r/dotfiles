# dicas android

``` markdown
File:		 AnDroid.md
Created:	 ter 10 jan 2017 13:12:38 BRT
Last Change: ter 10 jan 2017 13:12:56 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

### Como instalar o cynogenmod no moto g
https://www.youtube.com/watch?v=m-AkLX_HfFA

https://fralef.me/reroot-android-using-gnulinux-sdk-tools-and-twrp.html

Rom CM13 moto G2 2014 http://adf.ly/1TKTrC

Rom CM13 moto G1 http://adf.ly/1TKTua

Rom CM13 moto G 4G http://adf.ly/1TKU0q

Rom cm13 moto E2 http://adf.ly/1TKU4o

Rom CM 13 unoficial moto E1 http://adf.ly/1Tm64n

Rom CM13 moto X2 2014 http://adf.ly/1TKUF6

baixar Gapps para moto G1/G2/G 4G/E1/E2/X2 http://adf.ly/1TKUMX baixar a versao pico ou aqui http://adf.ly/1UnrYn

Como Desbloquear bootloader aqui https://www.youtube.com/watch?v=THU4Y...

como instalar recovery twrp aqui https://www.youtube.com/watch?v=ijHei...


### como saber a versão do android

We recommended to use firmware version from your own region.
To check phone version you can follow two way :

    Tap or Type *#1234#
    Go to Setting - About Phone - see Baseband version

### onde obter os rooms modificados

	http://www.cyanogenmod.org/

### android tools
      yaourt -S android-tools

Listar os dispositivos conectados via usb

        adb devices

### Reiniciar com o fastboot (veja no script de instalação)

      sudo adb reboot bootloader

### reiniciar o aparelho

      sudo fastboot reboot

Para pegar o código que será enviado para o site da motorola
neste link: https://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-b

      sudo fastboot oem get_unlock_data
      ...
    (bootloader) 3A55940646931947#00000000000000
    (bootloader) 00000000585431303639000000#47B4
    (bootloader) F5FFC71EDAD55334BFDF26B46541C2F
    (bootloader) C2795#84C187060F000000000000000
    (bootloader) 0000000

Obs: O código dever ser limpo tirando (bootloader)  e espaços

Daí a motorola manda um código para o seu e-mail
e o comando final ficar mais ou menos assim:

    sudo fastboot oem unlock PT4SFSVXCDCN4HLKVUYD

No comando acima colei o meu código

### Flash 'TWRP' as the custom recovery image

    sudo fastboot flash recovery ~/Downloads/openrecovery-twrp-2.8.2.0-hammerhead.img
    sudo fastboot flash recovery twrp-2.8.6.0-titan.img

    boot in recover mode


### How block fastbook again

source: http://forum.cyanogenmod.org/topic/64232-security-benefit-to-fastboot-oem-lock-after-rom-installation/

Initially, I thought to myself, "Oh, I guess this won't work." However, I
noticed at least one guide I found on "fastboot oem lock" specified getting
into bootloader via ADB, so I tried it again with the following commands:

    $ adb reboot bootloader
    $ fastboot oem lock
    ...
    (bootloader) Bootloader is locked now.
    OKAY [  1.644s]
    finished. total time: 1.644s
