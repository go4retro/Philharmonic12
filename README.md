# Philharmonic 12 - A 12 Voice Hardware Music Synthesizer for the TANDY Color Computer and Dragon
This cartridge reproduces the functionality of the Speech Systems "Symphony 12" cartridge.
## Changes
Although the schematic on page 27 of the Owner's Manual was followed to implement this reproduction, the schematic was incomplete, and so a few changes were made to minimize parts count and fill in the gaps.

The decoding of the MC6821 /CS2 line was defined as "pin 15 74ls138 $ff60", which implied that $ff60 would represent a low level on pin 15 of the IC (a 3-8 decoder), which is value "0".  That meant input lines A,B, and C must be low levels.  Since address lines 0 and 1 select the specific MC6821 register, it is assumed address lines 2,3, and 4 are sent to inputs A, B, and C.  Furthermore, since the unit decodes to $ff60, which is above the /SCS space, a full address decode must be done.  A 74LS30 8 input NAND gate was used to decode an $ffxx access, and that output was used to gate the '138.  Address lines 7, 6, and 5 were still not decoded, but must be set to 011.  Thus, A7 was sent to a negative select line on the '138, while A5 and A6 were sent to active high select lines on the MC6821 (which are tied to +5V on the original schematic).  Functionality, this should not affect operation.

Another difference lies in the clock signal for the sound ICs.  The original schematic ties the sound clock to 6809 E clock, which provides a stable .895MHz signal on all computers except for the Color Computer 3.  On the CoCo 3, the E clock can be set to .895MHz or 1.79MHz.  This will affect the pitch of the audio considerably.  Thus, a stable .895MHz oscillator was included on the PCB design, though a jumper cna still be used to select the E clock if desired.

Finally, the AY-3-8912 ICs used in the original design are harder to find that the larger cousin, the AY-3-8910.  Thus, this design used the larger and cheaper ICs.

## License
Copyright (C) 2018  RETRO Innovations

These files are free designs; you can redistribute them and/or modify
them under the terms of the Creative Commons Attribution-ShareAlike 
4.0 International License.

You should have received a copy of the license along with this
work. If not, see <http://creativecommons.org/licenses/by-sa/4.0/>.

These files are distributed in the hope that they will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
license for more details.


