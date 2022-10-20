#*
    Assorted driver code
*#

// event listener for hardware polled IO?

# this has exclusive read access to hardware polled memory
events[Events]: () -> Events {
    // collect all registered devices events?
}

// A device is registered with neutron somewhere, maybe spx:system
// or spx:device or just an in memory buffer with spx:system

events: (devices: &[Device]) {}
