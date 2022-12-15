#*
    USB Drivers
*#

// everything on the system itself is connected via a PCIe/AMBA-like system bus with packet/network semantics
// modular components like mice and keyboards can be plugged into usb ports which are connected to a few usb controllers. Those usb controllers are directly connected to the system via Quantii-Hard-Interconnect (QHI)

Usb: ()

// Usb request types
/*
    Interrupt transfers for mouse and keyboard, small amounts of data with error correction

    Isochronous transfers no error correction, high continous data volumes. Good for streaming

    Bulk transfers at once with error correction. Good for disk IO

    Control transfers identification and configuration. Not big payloads, uses message based stuff and always on endpoint 0
*/

UsbRequest: enum {
    InterruptTransfer
    IsochronousTransfer
    BulkTransfer
    ControlTransfer
}

// a mouse read of position would be basically an interrupt transfer on wait for event

# for quick reads of rapidly changing state and highly latency sensitive events such as mouse/kb/mic/controller/webcam inputs
wait_for_usb_change: (usb_device: &UsbDevice) {
    // wfe instruction, from core::wfe. Only available on spectre ISA (riscv64S)
    core::wfe(usb_device)
}

// note: wfe on a usb device allows anything to change to be subscribed to
// you can configure the device itself so that things such as lighting can change but isnt pushed to the controller/listened to by the usb controller on polling?
