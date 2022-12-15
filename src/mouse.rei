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

// listeners on mouse changes can also be interrupted?
// or just let them read at their own disposal? at a stall?
// process_input() basically stalls until the interrupt handler updates the value
// process_input() basically just uses that riscv wait for event instruction

// OR
// directly register a callback on the specific interrupt type (mouse0)

// handler for mouse interrupt based on Hz
register_interrupt_mouse: (x: f16, y: f16) -> MousePos {
    [x, y]
}

// possibly what the firmware does
/*
clock interrupt -> 
*/

Handler: () -> ()

Interrupts: {
    interrupt_table: InterruptTable

    # register a certain clock interrupt
    # up to N clock interrupts can be registered?
    clock_interrupt: (&mut self, freq: Freq, handler: Handler) {
        self.interrupt_table[freq].push(handler)
    }
}
