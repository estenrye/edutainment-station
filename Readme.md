# Edutainment Station for Raspberry Pi 3 Model B

## Requirements

![Front Panel of Edutainment Station](.imgs/Design.PNG)

| Name | Edutainment Station |
| ---- | ------------------- |
| **Purpose** | An expandable entertainment/education platform used to teach my daughter primary and secondary colors through an interactive display triggered by physical objects tagged with NFC tags. |
| **Inputs** | Seven NFC Cards, each representing a different color (Red, Blue, Yellow, Green, Purple, Orange, Rainbow) |
| **Outputs** | One 7" Touchscreen Display that displays the name of the color with that color as its background; One Buzzer that indicates whether a NFC tag has been read. |
| **Functions** | Default Mode: The edutainment station will display the animation for the last scanned tag.  If no tag has been scanned, the edutainment station will default to the ready animation. |
| | When a NFC tag is brought in proximity of the NFC reader, the edutainment station will sound a single beep on the Buzzer to indicate the NFC tag has been read. |
| | When a NFC tag is brought in proximity of the NFC reader, the edutainment station will select and display an animation for the scanned tag. |
| | When the Touchscreen on the edutainment station is touched, the animation will toggle between any avaialbe secondary animations and the main animation. |
| **Performance** | The target user for the system is a toddler, so typical human factors constraints apply to ensure the toddler maintains interest.  Buzzer should sound within 100 ms of the NFC tag having been read; Touchscreen display should display screen output within 100 ms of the NFC tag having been read;  Input from the touchscreen display, if used, should notify the user input has been received within 100 ms. |
| **Manufacturing Cost** | The electronic components for this device should cost no more than $200 USD. |
| **Power** | The device should be able to run continuously for at least 30 minutes on battery power. The device should be able to run for at least 4 hours of moderate use on battery power. The device should be able to charge and run simultaneously when on AC power. |
| **Physical Size and Weight** | Small enough to embed into the top of a small desk sized appropriately to a toddler. |

## Specification

![Edutainment System Class Diagram](.imgs/ClassDiagram.svg)

The Tag class represents the physical objects with embedded NFC tags.  These objects will have one or more `animationIds` transmitted to the TagReader class when the object reaches close enough proximity to the NFC Controller's antenna.  The TagReader class encapsulates the NFC Controller logic into a single interface class.  When the `OnTagAdded` event is triggered, `HandleTag` will read the data on the NFC tag and notify the `Controller` class the tag has been read using the `NotifyTagRead` method.  Upon notification of a NFC tag read, the `Controller` class activates the `Buzzer` using the `Buzz` method and updates the `Display` by passing the first `animationId` to the `UpdateDisplay` method.  If the user touches the display, the `Display` class will notify the `Controller` class using the `NotifyTouchInput` method.  The `Controller` class will determine the next `animationId` to send to the `Display` class using `UpdateDisplay`.  If only one `animationId` is available, it will be sent again.

### Hardware Components
- 1 [Raspberry Pi 3 Model B v1.2](https://www.adafruit.com/product/3055)
- 1 [NXP PN7150 NFC Controller SBC Kit for Raspberry Pi](https://www.nxp.com/products/identification-and-security/nfc/nfc-reader-ics/development-kits-for-pn7150-plugn-play-nfc-controller:OM5578)
- 1 [Raspberry Pi 7" Touchscreen Display](https://www.amazon.com/gp/product/B0153R2A9I/ref=oh_aui_detailpage_o02_s00?ie=UTF8&psc=1)
- 7 [13.56 MHz RFID/NFC White Tag - 1 KB](https://www.adafruit.com/product/360)

### Software Packages

- [Windows Driver Kit (WDK)](https://docs.microsoft.com/en-us/windows-hardware/drivers/download-the-wdk)

## System Architecture

![State Diagram](.imgs/State_Diagram.PNG)

- The system is driven by aperiodic inputs, NFC tag reads.  The reading of NFC Tags can be served by an interrupt driven routine that will select and display the appropriate screen based on the Tag that has been read.
- Display changes can be handled by a dedicated UI thread.  This thread will respond to events triggered by the interrupt routine.

### Miscellaneous Constraints Placed on the Hardware by the Software

- Hardware must support Windows IOT Core 
- The hardware must support an operating system that is to run both .Net Core UWP and .Net Framework UWP Applications as the developer is most familiar with the Microsoft Universal Windows Platform (UWP) framework for UI programming and design.
- The hardware must support an operating system that enables remote debugging using the Visual Studio Remote Debugger.
- The hardware must support an operating system that provides native touch and NFC driver support.

### Miscellanous Constraints Placed on the Software by the Hardware

- Software must be tolerant of being forcefully shutdown by the user.
- Software must use the Windows.Networking.Proximity Namespace to communicate with the NFC device.
- Software must design the UI to be clearly visible on a 7-inch LCD touch screen with a maximum resolution of 800 x 480 pixels.
- Software must trigger the buzzer when an NFC Tag is read as the Buzzer and NFC device are separate hardware units.

### Processor Evaluation

Five processors/development boards were evaluated for selection as part of this project.  The table below summarizes their capabilities.

| Criteria | Raspberry Pi 3 Model B | Raspberry Pi 3 Model B+ | MinnowBoard Turbot Quad-Core | Dragonboard 410c | AAEON Up Squared |
| --- | --- | --- | --- | --- | --- |
| Price | $35 | $35 | $189.95 | $75 | $149 |
| Actual Cost | $0 (development board available on-hand) | $35 | $189.95 | $75 | $149 |
| Main Processor | Broadcom BCM2837, ARM Cortex A53 | Broadcom BCM2837B0, ARM Cortex A53 | Quad-Core Intel Atom E3845 | Qualcomm Snapdragon 410, ARM Cortex A53 | Intel Celeron N3350 |
| Clock Speed | 1.2 GHz | 1.4 GHz | 1.91 GHz | 1.2 GHz | 2.4 GHz |
| Core Count | 4 | 4 | 4 | 4 | 2 |
| Volatile Memory | 1 GB | 1 GB | 2 GB | 1 GB | 2 GB |
| Non-Volatile Memory | 0 MB on chip.  SD Card Slot | 0 MB on chip.  SD Card Slot | 8 MB SPI Flash, mPcie/SATA/USB | 8 MB eMMC Flash, SD Card Slot | 32 GB eMMC Flash, SATA3 |
| Video Core Clock Speed | 400 MHz | 400 MHz | 542 MHz | 400 MHz | 200 MHz |
| Supports Windows IOT Core | Yes | Technical Preview | Yes | Yes | Yes |
| Graphics Connectivity | HDMI (Full), Display DSI Connector | HDMI (Full), Display DSI Connector | HDMI (Micro) | HDMI (Full) | HDMI, DisplayPort |
| Communication Standards | 100 Mbps Ethernet, 2.4 GHz 802.11 a/b/n, BLE | 300 Mbps Ethernet, 2.4 GHz/5 GHz 802.11 b/g/n/ac, BLE | 1 Gbps Ethernet | 2.4 GHz 802.11 b/g/n, BLE | Dual Gigabit Ethernet |
| GPIO Pins | 40 | 40 | 26 | 40 | 40 |
| Datasheets | [Raspberry Pi 3 Model B](https://www.adafruit.com/product/3055) | [Raspberry Pi 3 B+](https://static.raspberrypi.org/files/product-briefs/Raspberry-Pi-Model-Bplus-Product-Brief.pdf) | [MinnowBoard Turbot Quad-Core](https://minnowboard.org/minnowboard-turbot/technical-specs) [Intel Atom E38xx Data Sheet](https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-e3800-family-datasheet.pdf) | [DragonBoard 410c](https://developer.qualcomm.com/hardware/dragonboard-410c) [Qualcomm SnapDragon 410c datasheet](https://www.qualcomm.com/media/documents/files/snapdragon-410-processor-product-brief.pdf) [Adreno Wikipedia](https://en.wikipedia.org/wiki/Adreno) | [Datasheet](https://up-board.org/wp-content/uploads/datasheets/UP-Square-DatasheetV0.5.pdf) [UP Shop](https://up-shop.org/home/270-up-squared.html#/95-up_squared_board-celeron_duo_core_2gb_memory_32gb_emmc) [Intel Datasheet](https://ark.intel.com/products/95598/Intel-Celeron-Processor-N3350-2M-Cache-up-to-2-4-GHz-) |

The key selection criteria for the processer were the following:

* Does the processor/development board support Windows IOT Core?
* What is the actual cost to acquire the processor/development board?
* What communications technologies are available on the development board?  How can I connect a remote debugger to the device?
* Does the processor/development board include a graphics co-processor?  How fast is it?
* How fast is the main processor?

| Criteria | Raspberry Pi 3 Model B | Raspberry Pi 3 Model B+ | MinnowBoard Turbot Quad-Core | Dragonboard 410c | AAEON Up Squared |
| --- | --- | --- | --- | --- | --- |
| Actual Cost              |  5 |  4 |  1 |  3 |  1 |
| Clock Speed              |  2 |  3 |  4 |  2 |  5 |
| Video Core Clock Speed   |  4 |  4 |  5 |  4 |  1 |
| Supports IOT Core        |  5 |  3 |  5 |  5 |  5 |
| Communications Standards |  5 |  5 |  1 |  3 |  1 |
| Total                    | 21 | 19 | 16 | 17 | 13 |

The processor selected for this project was the Broadcom BCM2837 ARM Cortex A53 on the Raspberry Pi 3 Model B.

### A/D Converter and DAC Evaluation

The A/D and DAC utilized in this project is embedded within the NFC Device selected for the project.  Two NFC devices were evaluated as part of this project.  Both of these devices were freely available to the developer.

| Criteria | NXP OM5577 | NXP PN532 |
| --- | --- | --- |
| Natively Supported by Windows IOT Core | Yes | No |
| Price | $27 | $39.95 |
| Actual Cost | $0 (Supplied by NXP) | $0 (Available on Hand) |
| PI HAT Form Factor | Yes | No |

Prototypes were built using each of the NFC devices, but ultimately the NXP OM5577 was selected for its ease of implemntation and native support for Windows IOT Core.

## Component Design and Testing

The processor used in this project was selected for its support of the Microsoft Universal Windows Platform (UWP) development tools.  Microsoft provides Visual Studio Community Edition as part of the UWP free of charge to its developers and includes robust emulation, debugging and performance anlaysis tools.  Testing for this project will primarily be performed on the microcontroller hardware using the Remote Debugging Tools provided by Visual Studio Community Edition.  Use cases will be verified to be functional through a series of manual tests.

### Processor Bandwidth Estimation

As part of the selection process for the processor, an initial prototype of the application was developed and key use cases were tested in an emulator to verify the processor had enough bandwidth to support the project.  Below is a graph demonstrating those results:

![CPU Utilization Graph](.imgs/CPU_Utilization.PNG)

We can see in the first 2.5 seconds of the application's lifecycle, we can expect it to utilize 43% of all available processors as it loads the application and framework into memory and initializes the devices and UI.  After this initialization period, the CPU remains idle until an interrupt is triggered by the arrival of a NFC tag.  When this occurs, CPU utilization spikes to a maximum of 10% of all available processors as the application selects the next visualization and draws it on the screen.  Based on this simulation, there is suficient bandwidth for the current functionality and future development of the project

### Volatile Memory Estimation

The memory usage of the application was also profiled in an emulator prior to selecting the processor.  Below is a graph demonstrating those results:

![Memory Utilization Graph](.imgs/Memory_Utilization.PNG)

We can see in the first 5 seconds of the application's lifecycle, we can expect it to use 7.4 MB of volatile memory as it loads the application and framework into memory and initializes the devices and UI.  After this initialization period, the memory usage remains constant until an interrupt is triggered by the arrival of a NFC tag.  When this occurs, volatile memory usage temporarily spikes to 7.7 MB and then settles at 7.5 MB.  This memory usage is well below the 1 GB of available memory indicating there is sufficient volatile memory for the current functionality and future development.

### Non-Volatile Memory Estimation

The device is currently provisioned with a 32 GB Micro SD Card.  1.64 GB is consumed by the Windows IOT Core operating system and drivers.  0.16 GB is consumed by the application.

## System Integration and Testing

Testing will be performed manually by programming several NFC tags with expected and unexpected inputs.  The following use cases will be tested:

| Tag Id  | Expected Output |
| ------- | --------------- |
| red     | red background with word `RED` in white capital letters displayed on the screen. |
| orange  | orange background with word `ORANGE` in white capital letters displayed on the screen. |
| yellow  | yellow background with word `YELLOW` in white capital letters displayed on the screen. |
| green   | green background with word `GREEN` in white capital letters displayed on the screen. |
| blue    | blue background with word `BLUE` in white capital letters displayed on the screen. |
| purple  | purple background with word `PURPLE` in white capital letters displayed on the screen. |
| brown   | brown background with word `BROWN` in white capital letters displayed on the screen. |
| rainbow | horizontal gradient rainbow background from red to violet with word `RAINBOW` in white capital letters displayed on the screen. |
| other   | black background with word `OTHER` in white capital letters displayed on the screen. |

## Block Diagrams

![Component Diagram](.imgs/Block-Component-Diagram.PNG)

### Raspberry Pi 3 Block Diagram and IO Map

![Raspberry Pi 3 Block Diagram](.imgs/pi3-block-diagram-rev4.png)
[(shabaz, 2017)](https://www.element14.com/community/community/raspberry-pi/blog/2017/01/16/raspberry-pi-3-block-diagram)

![Raspberry Pi 3 IO Map](.imgs/raspberry_pi_circuit_note_fig2a.jpg)
[(Jameco Electronics, )](https://www.jameco.com/Jameco/workshop/circuitnotes/raspberry-pi-circuit-note.html)

### NXP PN7150 Block Diagram

![NXP PN7150 Block Diagram](.imgs/PN7150-Block-Diagram.PNG)

[NXP. (2018)](https://www.nxp.com/docs/en/data-sheet/PN7150.pdf)

## Memory Map

![Memory Map](.imgs/Memory_Map.PNG)

[Broadcom. (2012)](https://web.stanford.edu/class/cs140e/docs/BCM2837-ARM-Peripherals.pdf)

## References

- Adafruit. (2016). Raspberry pi 3 - model B - ARMv8 with 1G RAM. Retrieved from https://www.adafruit.com/product/3055
- Broadcom. (2012). BCM2837 ARM peripherals. Retrieved from https://web.stanford.edu/class/cs140e/docs/BCM2837-ARM-Peripherals.pdf
- DigiKey. (2016). Product highlights: PN7150 plug-and-play NFC controller. Retrieved from https://www.digikey.com/en/product-highlight/n/nxp-semi/pn7150-plug-n-play?utm_adgroup=General&slid=&gclid=Cj0KCQjw6rXeBRD3ARIsAD9ni9B7nDjbrQYIem_JmXNQUI-djQaeZzJiTdwNge0e3Wtz6qj8bwgBioQaAozsEALw_wcB
- Jameco Electronics.Raspberry pi pinout diagram | circuit notes. Retrieved from https://www.jameco.com/Jameco/workshop/circuitnotes/raspberry-pi-circuit-note.html
- NXP.OM5578: Development kits for PN7150 plug’n play NFC controller. Retrieved from https://www.nxp.com/products/identification-and-security/nfc/nfc-reader-ics/development-kits-for-pn7150-plugn-play-nfc-controller:OM5578
- NXP. (2017). PN71x0 windows IoT porting guidelines. Retrieved from https://www.nxp.com/docs/en/application-note/AN11767.pdf
- NXP. (2018). PN7150 product data sheet. Retrieved from https://www.nxp.com/docs/en/data-sheet/PN7150.pdf
- shabaz. (2017). Raspberry pi 3 blcok diagram. Retrieved from https://www.element14.com/community/community/raspberry-pi/blog/2017/01/16/raspberry-pi-3-block-diagram