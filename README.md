rpi_breakout: A Raspberry Pi Breakout Board
===========================================

In an effort to help intrepid hackers who hook their brand-new Raspberry Pi's GPIO pins to standard 5-volt maker fare and wonder why their boards stop working, we present rpi_breakout, which does the following:

  * Shifts the voltage of 16 of the 17 GPIO pins from 3.3 to a user-selectable voltage (typically 5.0), and back again from the user-selected voltage to a safe 3.3V for the Raspberry Pi. In technical terms, this is *bidirectional level translation*.
  * Provides up to 150mA of 3.3-volt power, which is significantly better than the 50mA of 3.3v power provided by the GPIO pins.
  * Includes four current-limited LEDs. One confirms that the board has been successfully connected to the Raspberry Pi. Another indicates that the GPIO pins are now being level-shifted. The remaining two are left anode-disconnected with headers left temptingly close to GPIOs #6 and #7, for easy light-blinking fun.

Instructions
============

*Note that almost nobody on Earth, including me, has a Raspberry Pi yet. Thus, these instructions are purely speculative. See Caveats below.*

These instructions will refer to the Raspberry Pi as the **RPi**. The breakout board is the **breakout board**. The **north end** of the breakout board is the short end that has the 26-pin GPIO header matching the RPi's header. The **south end** is the short end with *[sowbug.com](http://www.sowbug.com/)* printed in the center. The RPi is assumed to be component-side up, with the SD card slot pointing left and the HDMI jack pointing down, toward you.

  1. Remove all shunts, jumper connectors, wires, etc., from the breakout board.
  1. Turn off your RPi.
  1. Plug the breakout board into the 26-pin GPIO header on the top of your RPi. This board should cover a little less than half of the top of your RPi, so that the south end is over the RPi's micro-USB plug in the lower-left corner. If you plug it in any other way, then both your boards will be destroyed, your home will burn down, your friends will stop calling, and your cat will leave you. See Caveats below.
  1. Turn on your RPi. You should see the LED on the breakout board marked "CONNECTED" light up.
  1. Look at the small jumpers (JP4, "IO-PWR-EXT" and JP5, "VTG-SEL") on the northwest side of the breakout board. These two jumpers set the voltage for the I/O pins. If you need a weird voltage, such as 3.14159, then supply it yourself on JP4, which is the two-pin header. Otherwise, pick 5V by connecting the two JP5 pins labeled 5.0 and VCC, or else pick 3V by connecting JP5's 3.3 and VCC pins. Think of VCC of the part of the circuit waiting to be powered at the voltage you want, and all the other numbered voltages on the board as potential sources for VCC; it's up to you to connect the right one.
  1. If you've done the previous step correctly, then the IO-POWER LED should light up.
  1. If you need immediate gratification, find the two LEDs on the south side of the breakout board. Take a jumper wire and connect the header to the left of one of them to the pin marked GP0. Now [write some code](http://elinux.org/Rpi_Low-level_peripherals) on your RPi to enable that GPIO pin. The LED should light up.
  1. If you're wondering why you went through all this, get out a multimeter and measure the voltage of an enabled GPIO pin on the 26-pin header. It will be 3.3 volts. Now measure the same GPIO on the GP pinout of the breakout board. Its voltage should match that of VCC. Moreover, when otherwise-incompatible voltages come into the breakout board, they will be shifted safely to the 3.3 volts that the RPi needs. This last part is the important part: if you applied 5V to an RPi GPIO, the RPi would probably die. See Caveats below.

Caveats
=======

  * Messing with GPIOs is potentially dangerous to your Raspberry Pi, your possessions, and yourself. Please don't do it unless you know what you're doing and are willing to live with the consequences.
  * Level-shifting IC ports are available in powers of two. The RPi has 17 GPIOs. As you may know, 17 is not a power of two; in fact, it's a prime number. I chose to *not* level-shift the GPIO labeled **/SPI CE1**, reasoning that as the second SPI chip-select, it's going to be least frequently used. But beware: if you forget that this pin is 3.3 volts and hook it up to a 5-volt I/O source, your RPi will die.

Credits
=======

  * Board design by [Mike Tsao](http://www.sowbug.com/).
  * The [Adafruit Part Finder](http://www.ladyada.net/wiki/partfinder) for making me aware of the TXB0108.