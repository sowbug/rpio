RPio: A Raspberry Pi Breakout Board
===========================================

In an effort to help intrepid hackers who hook their brand-new Raspberry Pi's GPIO pins to standard 5-volt maker fare and wonder why their boards stop working, we present RPio, which does the following:

  * Shifts the voltage of 15 of the 17 GPIO pins from 3.3 to a user-selectable voltage (typically 5.0), and back again from the user-selected voltage to a safe 3.3V for the Raspberry Pi. In technical terms, this is *bidirectional level translation*. For the remaining two, pulls up in an I2C-compatible fashion.
  * Provides up to 150mA of 3.3-volt power, which is significantly more than the 50mA of 3.3v power provided by the GPIO pins. It's not enough to drive a robot up a hill, but it is enough to safely power a few ICs while writing data to an SD card.
  * Includes five current-limited LEDs, two for status and three for experimenting. One confirms that the board has been successfully connected to the Raspberry Pi. Another indicates that the level-shifted GPIO pins are live. The remaining three are cathode-grounded, anode-disconnected with headers ready to connect to GPIOs, for easy light-blinking fun.

Instructions
============

*Note that almost nobody on Earth, including me, has a Raspberry Pi yet. Thus, these instructions are purely speculative. See Caveats below.*

These instructions will refer to the Raspberry Pi as the **RPi**. The breakout board is the **RPio**. The **north end** of the RPio is the end that has the 26-pin GPIO header matching the RPi's header. The **south end** is the other end. The RPi is assumed to be component-side up, with the SD card slot pointing left and the HDMI jack pointing down, toward you.

We're also assuming that you have already soldered either pin or socket headers to the GPIOs on your RPi, and soldered mating connectors to the RPio. The RPi reportedly won't ship with these GPIO pins soldered (except for the first batch of 2,000, which include male headers), so the kind that gets soldered on your board is a decision you get to make.

  1. Remove all shunts, jumper connectors, wires, etc., from the RPio.
  1. Turn off your RPi.
  1. Plug the RPio into the 26-pin GPIO header on the top of your RPi. This board should cover a little less than half of the top of your RPi in the east-west dimension, so that the south side of the board covers the RPi's SD receptacle. If you plug it in any other way, then both your boards will be destroyed, your home will burn down, your friends will stop calling, and your cat will leave you. See Caveats below.
  1. Turn on your RPi. You should see the LED on the RPio marked "CONNECTED" light up.
  1. Look at the small jumpers (IO-PWR-EXT and VTG-SEL) on the RPio. These two jumpers set the voltage for the I/O pins. If you need a weird voltage, such as 3.14159, then supply it yourself on IO-PWR-EXT, which is the two-pin header. Otherwise, pick 5V by connecting the two VTG-SEL pins labeled 5.0 and VIO, or else pick 3V by connecting VTG-SEL's 3.3 and VIO pins. If this is confusing, think of VIO as the part of the RPio waiting to be powered at the voltage you want, and the other numbered voltages on the RPio as potential sources for VIO; it's up to you to connect the right one and set VIO to the right voltage.
  1. If you've done the previous step correctly, then the IO-POWER LED should light up.
  1. If you need immediate gratification, find the LEDs on the south side of the RPio. Take a jumper wire and connect the header to the left of one of them to the pin marked GP0. Now [write some code](http://elinux.org/Rpi_Low-level_peripherals) on your RPi to enable that GPIO pin. The LED should light up.
  1. If you're wondering why you went through all this, get out a multimeter and measure the voltage of an enabled GPIO pin on the 26-pin header. It will be 3.3 volts. Now measure the same GPIO on the GP pinout of the RPio. Its voltage should match that of VIO. Moreover, when otherwise-incompatible voltages come into the RPio, they will be shifted safely to the 3.3 volts that the RPi needs. This last part is the important part: if you applied 5V to an RPi GPIO, the RPi would probably die. See Caveats below.
  1. Note that the pins marked SCL and SDA are special in that they're I2C compatible. They use a [MOSFET-based pullup](http://ics.nxp.com/support/documents/interface/pdf/an97055.pdf) that allows safe connection of external I2C lines at varying voltages. The compromise for this built-in pullup convenience is that these lines can't be used as GPIOs, but are largely dedicated to I2C functionality.

Caveats
=======

  * Messing with GPIOs is potentially dangerous to your Raspberry Pi, your possessions, and yourself. Please don't do it unless you know what you're doing and are willing to live with the consequences.

Credits
=======

  * Board design by [Mike Tsao](http://www.sowbug.com/) and [Dennis Gentry](https://github.com/dgentry).
  * Thanks to the [Adafruit Part Finder](http://www.ladyada.net/wiki/partfinder) for making us aware of the TXB0108.
