#*
    Mouse position
*#

use neutronapi::device::DeviceSettings

// needs a device table entry?

Mouse: {
    settings: DeviceSettings
    // memory mapped location async update
    // if async that is
    memory_mapped_position: *const u64

    // can be used as in a polling loop...
    // I guess you can always use dt as well even for mice
    read: (&self) -> MousePos {
        core::read(memory_mapped_position)
    }
}

MousePos: [f16; 2]
