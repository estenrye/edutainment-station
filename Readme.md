# Edutainment Station for Raspberry Pi 3 Model B

## Hardware Components
- 1 [Raspberry Pi 3 Model B v1.2](https://www.adafruit.com/product/3055)
- 1 [NXP PN7150 NFC Controller SBC Kit for Raspberry Pi](https://www.nxp.com/products/identification-and-security/nfc/nfc-reader-ics/development-kits-for-pn7150-plugn-play-nfc-controller:OM5578)
- 1 [Raspberry Pi 7" Touchscreen Display](https://www.amazon.com/gp/product/B0153R2A9I/ref=oh_aui_detailpage_o02_s00?ie=UTF8&psc=1)
- 7 [13.56 MHz RFID/NFC White Tag - 1 KB](https://www.adafruit.com/product/360)

## Requirements

| Name | Edutainment Station |
| ---- | ------------------- |
| **Purpose** | An expandable entertainment/education platform used to teach my daughter primary and secondary colors through an interactive display triggered by physical objects tagged with NFC tags. |
| **Inputs** | Seven NFC Cards, each representing a different color (Red, Blue, Yellow, Green, Purple, Orange, Rainbow) |
| **Outputs** | One 7" Touchscreen Display that displays the name of the color with that color as its background; One Buzzer that indicates whether a NFC tag has been read. |
| **Functions** | Default Mode: The edutainment station will display the animation for the last scanned tag.  If no tag has been scanned, the edutainment station will default to the rainbow animation. |
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

**Notes for next time.**
NFC Tag reads are interrupt driven.
Draw state diagram from interrupt to display update.
Draw state diagram from touch input interrupt to display update.

## System Architecture

## Component Design and Testing

## System Integration and Testing

## Block Diagrams

### Raspberry Pi 3 Block Diagram and IO Map

![Raspberry Pi 3 Block Diagram](.imgs/pi3-block-diagram-rev4.png)
[(shabaz, 2017)](https://www.element14.com/community/community/raspberry-pi/blog/2017/01/16/raspberry-pi-3-block-diagram)

![Raspberry Pi 3 IO Map](.imgs/raspberry_pi_circuit_note_fig2a.jpg)
[(Jameco Electronics, )](https://www.jameco.com/Jameco/workshop/circuitnotes/raspberry-pi-circuit-note.html)

### NXP PN7150 Block Diagram

![NXP PN7150 Block Diagram](.imgs/PN7150-Block-Diagram.PNG)

[NXP. (2018)](https://www.nxp.com/docs/en/data-sheet/PN7150.pdf)

## References

- DigiKey. (2016). [Product highlights:&nbsp;PN7150 plug-and-play NFC controller.](https://www.digikey.com/en/product-highlight/n/nxp-semi/pn7150-plug-n-play?utm_adgroup=General&slid=&gclid=Cj0KCQjw6rXeBRD3ARIsAD9ni9B7nDjbrQYIem_JmXNQUI-djQaeZzJiTdwNge0e3Wtz6qj8bwgBioQaAozsEALw_wcB)
- Jameco [Electronics.Raspberry pi pinout diagram | circuit notes.](https://www.jameco.com/Jameco/workshop/circuitnotes/raspberry-pi-circuit-note.html)
- NXP. (2018). [PN7150 Product Data Sheet.](https://www.nxp.com/docs/en/data-sheet/PN7150.pdf)
- shabaz. (2017). [Raspberry Pi 3 Block Diagram.](https://www.element14.com/community/community/raspberry-pi/blog/2017/01/16/raspberry-pi-3-block-diagram)