# Simduino - run an Arduino sketch from the command-line

![HelloWorld.gif](https://github.com/koppi/simduino/wiki/HelloWorld.gif)

Features

* Test out a sketch without the hardware, or prior to purchasing hardware.
* Simulated Hardware:
 * Light bulb (POV-Ray rendered icon)
 * 16x2 LCD HD44780 controller

Supported Arduinos

* Atmega8

## Documentation

Checkout the Simduino repository:

```bash
$ git clone git://github.com/koppi/simduino.git
```

Build Simduino the test sketches:

```bash
$ cd simduino
$ make all
 Building Tutorial/02-Blink
  cc main.cpp
  cc AFMotor.cpp
  cc AccelStepper.cpp
  cc Arduino.cpp
  cc HardwareSerial.cpp
  cc I2CIO.cpp
  cc LCD.cpp
  cc LCD_I2C.cpp
  cc Print.cpp
  cc Stream.cpp
  cc WString.cpp
  cc Wire.cpp
  ld libSimduino.a
 Built libSimduino.a
  ld 00-BareMinimum.exe
 Building Tutorial/02-Blink
  cc main.cpp
  cc sim.cpp
  ld 01-Blink.exe
[...]
```

![02-Blink.gif](https://github.com/koppi/simduino/wiki/02-Blink.gif)

Run a test sketch from the command-line:

```bash
$ Tests/AccelStepper/Bounce/Bounce.exe
 pinMode(2, 1)
 pinMode(3, 1)
 pinMode(4, 1)
 pinMode(5, 1)
setup() begin
setup() end
loop() enter
 digitalWrite(2, 0)
 digitalWrite(3, 1)
 digitalWrite(4, 1)
 digitalWrite(5, 0)
 digitalWrite(2, 0)
 digitalWrite(3, 1)
 digitalWrite(4, 0)
 digitalWrite(5, 1)
[...]
^C shutdownSim(2)
```

Press CTRL+C to terminate the program. Have fun!

# Authors

* © 2012-2013 [Jakob Flierl](https://github.com/koppi)
