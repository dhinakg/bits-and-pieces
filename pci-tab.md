# Adding things to the PCI Tab in System Profiler/Information
1. Find the PCI path of the device you want to add using [gfxutil](https://github.com/acidanthera/gfxutil).
2. Add it to your config.plist under Devices > Properties for Clover or DevicesProperties > Properties on OpenCore.
3. As a sibling of it, add the following properties (all strings):
    * `AAPL,slot-type`: The value whose presence controls whether the device shows up in the PCI tab or not. It can be anything. Usually the values on Macs are `Built In` or `Slot-X` (where is 1, 2, 3, etc.) 
    * `model`: *Optional* This will control the name of the device. It can be anything. This can have far-reaching effects (ie. it'll also change the name in About This Mac for a graphics card, if you change the name of a I2C controller VoodooI2C will see the changed name). This will not work on Ethernet kexts; haven't done much research, but guessing that the Ethernet kexts also injects model and it overrides what the bootloader injects.
    * `device_type`: *Optional*  This will control the device type. It can also be anything.
4. Save and reboot.

A finished product:
![System Profiler screenshot]()
