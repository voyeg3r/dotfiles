### Introdução

### reiniciar agora
     shutdown -r 0

####  desligar as 17:00

     shutdown -h 17:00

### desligar em 30 segundos

     shutdown -h +30

### Desligar máquina windows remotamente

``` sh
net rpc shutdown -I ipAddressOfWindowsPC -U username%password
net rpc shutdown -r : reboot the Windows machine
net rpc abortshutdown : abort shutdown of the Windows machine
```

