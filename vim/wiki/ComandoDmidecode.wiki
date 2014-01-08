dmidecode exibe informações de hardware

fonte: Debian Maniaco

Informação completa sobre o Hardware com apenas um comando
Complete Computer Hardware Information with one command

Um comando bem útil para obter informações sobre o hardware de seu computador diretamente no terminal é o dmidecode.
As formas mais usadas são na seguinte sintaxe:

sudo dmidecode -s [keystring]

Essa keystring pode ser uma das seguintes que você deseje:

  bios-vendor
  bios-version
  bios-release-date
  system-manufacturer
  system-product-name
  system-version
  system-serial-number
  system-uuid
  baseboard-manufacturer
  baseboard-product-name
  baseboard-version
  baseboard-serial-number
  baseboard-asset-tag
  chassis-manufacturer
  chassis-type
  chassis-version
  chassis-serial-number
  chassis-asset-tag
  processor-family
  processor-manufacturer
  processor-version
  processor-frequency

Assim se eu digitar "sudo dmidecode -s system-manufacturer", obtenho:
Dell Inc. - o nome do fabricante de meu notebook.
Já se digito "sudo dmidecode -s system-product-name", obtenho:
Inspiron N4050 - que é o modelo do meu notebook.

sudo dmidecode --type [number]

O number pode ser qualquer um ou mesmo vários da lista abaixo:

     Type   Information
────────────────────────────────────────
          0   BIOS
          1   System
          2   Base Board
          3   Chassis
          4   Processor
          5   Memory Controller
          6   Memory Module
          7   Cache
          8   Port Connector
          9   System Slots
         10   On Board Devices
         11   OEM Strings
         12   System Configuration Options
         13   BIOS Language
         14   Group Associations
         15   System Event Log
         16   Physical Memory Array
         17   Memory Device
         18   32-bit Memory Error
         19   Memory Array Mapped Address
         20   Memory Device Mapped Address
         21   Built-in Pointing Device
         22   Portable Battery
         23   System Reset
         24   Hardware Security
         25   System Power Controls
         26   Voltage Probe
         27   Cooling Device
         28   Temperature Probe
         29   Electrical Current Probe
         30   Out-of-band Remote Access
         31   Boot Integrity Services
         32   System Boot
         33   64-bit Memory Error
         34   Management Device
         35   Management Device Component
         36   Management Device Threshold Data
         37   Memory Channel
         38   IPMI Device
         39   Power Supply
         40   Additional Information
         41   Onboard Device

Assim, se eu digitar "sudo dmidecode --type 1", obterei:
# dmidecode 2.11
SMBIOS 2.6 present.

Handle 0x0001, DMI type 1, 27 bytes
System Information
    Manufacturer: Dell Inc.
    Product Name: Inspiron N4050
    Version: Not Specified
    Serial Number: CQJ98S1
    UUID: 4C4C4544-0051-4A10-8039-C3C04F385331
    Wake-up Type: Power Switch
    SKU Number: To be filled by O.E.M.
    Family:

Posso exibir vários types como no camando:
sudo dmidecode --type 1,4,2

Divirtam-se!
