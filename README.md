# Spectre Drivers

Drivers for the spectre system.

The src/ level contains user-level drivers that directly bypass the kernel. They can then be further wrapped around/reexported by neutronapi and used by apps. This allows quite good control over certain things. Other things such as disk control relies on full memory mapping and hence "userspace fs drivers" can directly interact with it. You can either choose to use these spectre drivers for controlling spectre devices, or use neutronapi::device::{exo, DeviceMap} to implement your own drivers semi dynamically.

The src/firmware contains more specific software that can be flashed onto a spectre device through the neutron upgrade applet. The firmware usually contains logic for saving and loading states, as well as binding complex functionality to things like buttons and keys.
