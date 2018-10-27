// CreatorID=MSFT	CreatorRev=5.0.0
// FileLength=5351	FileChkSum=0x74

DefinitionBlock("DSDT.AML", "DSDT", 0x05, "MSFT", "EDK2", 0x00000002)
{
    Scope(\_SB_)
    {
        Device(PEPD)
        {
            Name(_HID, "BCM2854")
            Name(_CID, "BCM2854")
            Name(_UID, Zero)
            Name(_CRS, ResourceTemplate()
            {
            })
            Name(_GPI, Buffer(0x48)
            {
	0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5c, 0x00, 0x5f, 0x00,
	0x53, 0x00, 0x42, 0x00, 0x2e, 0x00, 0x43, 0x00, 0x50, 0x00, 0x55, 0x00,
	0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name(_GCI, Buffer(0xe0)
            {
	0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
            })
            Name(_GDI, Buffer(0x74)
            {
	0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5c, 0x00, 0x5f, 0x00,
	0x53, 0x00, 0x42, 0x00, 0x2e, 0x00, 0x49, 0x00, 0x32, 0x00, 0x43, 0x00,
	0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
        }
        Device(SDC1)
        {
            Name(_HID, "BCM2847")
            Name(_CID, "ARASAN")
            Name(_UID, Zero)
            Name(_S1D, One)
            Name(_S2D, One)
            Name(_S3D, One)
            Name(_S4D, One)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f300000, 0x100)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {0x5e}
                })
                Return(RBUF)
            }
            Device(WLAN)
            {
                Method(_ADR, 0x0, NotSerialized)
                {
                    Return(Zero)
                }
                Method(_RMV, 0x0, NotSerialized)
                {
                    Return(Zero)
                }
            }
        }
        Device(SDC2)
        {
            Name(_HID, "BCM2855")
            Name(_CID, "SDHST")
            Name(_UID, Zero)
            Name(_S1D, One)
            Name(_S2D, One)
            Name(_S3D, One)
            Name(_S4D, One)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f202000, 0x100)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {0x58}
                })
                Return(RBUF)
            }
            Device(SDMM)
            {
                Method(_ADR, 0x0, NotSerialized)
                {
                    Return(Zero)
                }
                Method(_RMV, 0x0, NotSerialized)
                {
                    Return(Zero)
                }
            }
        }
        Device(CPU0)
        {
            Name(_HID, "ACPI0007")
            Name(_UID, Zero)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
        }
        Device(CPU1)
        {
            Name(_HID, "ACPI0007")
            Name(_UID, One)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
        }
        Device(CPU2)
        {
            Name(_HID, "ACPI0007")
            Name(_UID, 0x2)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
        }
        Device(CPU3)
        {
            Name(_HID, "ACPI0007")
            Name(_UID, 0x3)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
        }
        Device(USB0)
        {
            Name(_HID, "BCM2848")
            Name(_CID, "DWC_OTG")
            Name(_UID, Zero)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f980000, 0x1000)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {0x29}
                })
                Return(RBUF)
            }
        }
        Device(GPU0)
        {
            Name(_HID, "BCM2850")
            Name(_CID, "VC4")
            Name(_UID, Zero)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3fc00000, 0x1000)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {0x2a}
                    Memory32Fixed(ReadWrite, 0x3f400000, 0x6000)
                    Memory32Fixed(ReadWrite, 0x3f807000, 0x100)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {0x4a}
                    Memory32Fixed(ReadWrite, 0x3f902000, 0x600)
                    Memory32Fixed(ReadWrite, 0x3f808000, 0x100)
                    I2CSerialBus(0x50, ControllerInitiated, 0x186a0, AddressingMode7Bit, "\\_SB.I2C2", 0, ResourceConsumer, , )
                    I2CSerialBus(0x30, ControllerInitiated, 0x186a0, AddressingMode7Bit, "\\_SB.I2C2", 0, ResourceConsumer, , )
                })
                Return(RBUF)
            }
            Method(PMCD, 0x0, NotSerialized)
            {
                Name(RBUF, Package(0x3)
                {
                    One,
                    One,
                    Package(0x1)
                    {
                        Package(0x7)
                        {
                            Zero,
                            Zero,
                            Zero,
                            Buffer(0x10)
                            {
	0x26, 0x1e, 0x2d, 0x9b, 0x75, 0x15, 0x47, 0x47, 0x8f, 0xc0, 0xb9, 0xeb,
	0x4b, 0xaa, 0x2d, 0x2b
                            },
                            "VC4_Engine_00",
                            0x2,
                            Package(0x2)
                            {
                                Package(0x3)
                                {
                                    Zero,
                                    Zero,
                                    0x127690
                                },
                                Package(0x3)
                                {
                                    0x2710,
                                    0x2710,
                                    0x4
                                }
                            }
                        }
                    }
                })
                Return(RBUF)
            }
        }
        Device(RPIQ)
        {
            Name(_HID, "BCM2849")
            Name(_CID, "RPIQ")
            Name(_UID, Zero)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f00b880, 0x24)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {0x61}
                })
                Return(RBUF)
            }
        }
        Device(VCIQ)
        {
            Name(_HID, "BCM2835")
            Name(_CID, "VCIQ")
            Name(_UID, Zero)
            Name(_DEP, Package(0x1)
            {
                "\\_SB.RPIQ"
            })
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f00b840, 0x10)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {0x62}
                })
                Return(RBUF)
            }
        }
        Device(VCSM)
        {
            Name(_HID, "BCM2856")
            Name(_CID, "VCSM")
            Name(_UID, Zero)
            Name(_DEP, Package(0x1)
            {
                "\\_SB.VCIQ"
            })
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
        }
        Device(FT54)
        {
            Name(_HID, "FTSC5406")
            Name(_CID, "FTSC5406")
            Name(_UID, Zero)
            Name(_DEP, Package(0x1)
            {
                "\\_SB.RPIQ"
            })
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadOnly, 0x3e40a860, 0x40)
                })
                Return(RBUF)
            }
        }
        Device(GPI0)
        {
            Name(_HID, "BCM2845")
            Name(_CID, "BCMGPIO")
            Name(_UID, Zero)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f200000, 0xb4)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0x51}
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0x53}
                })
                Return(RBUF)
            }
        }
        Device(I2C1)
        {
            Name(_HID, "BCM2841")
            Name(_CID, "BCMI2C")
            Name(_UID, One)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f804000, 0x20)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0x55}
                    VendorLong() {00, 0x60, 0x44, 0xd5, 0xf3, 0x1f, 0x11, 0x60, 0x4a, 0xb8, 0xb0, 0x9c, 0x2d, 0x23, 0x30, 0xdd, 0x2f, 0x8d, 0x1d, 00, 0x1, 0x10, 00, 0x1, 0x4, 00, 0x12, 00, 00, 0x16, 00, 0x20, 00, 00, 00, 0x2, 00, 0x3, 00, 0x5c, 0x5f, 0x53, 0x42, 0x2e, 0x47, 0x50, 0x49, 0x30, 00}
                })
                Return(RBUF)
            }
        }
        Device(I2C2)
        {
            Name(_HID, "BCM2841")
            Name(_CID, "BCMI2C")
            Name(_UID, 0x2)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f805000, 0x20)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0x55}
                })
                Return(RBUF)
            }
        }
        Device(SPI0)
        {
            Name(_HID, "BCM2838")
            Name(_CID, "BCMSPI0")
            Name(_UID, Zero)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f204000, 0x20)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0x56}
                    VendorLong() {00, 0x60, 0x44, 0xd5, 0xf3, 0x1f, 0x11, 0x60, 0x4a, 0xb8, 0xb0, 0x9c, 0x2d, 0x23, 0x30, 0xdd, 0x2f, 0x8d, 0x1f, 00, 0x1, 0x10, 00, 0x2, 0x4, 00, 0x12, 00, 00, 0x18, 00, 0x22, 00, 00, 00, 0x9, 00, 0xa, 00, 0xb, 00, 0x5c, 0x5f, 0x53, 0x42, 0x2e, 0x47, 0x50, 0x49, 0x30, 00}
                    VendorLong() {00, 0x60, 0x44, 0xd5, 0xf3, 0x1f, 0x11, 0x60, 0x4a, 0xb8, 0xb0, 0x9c, 0x2d, 0x23, 0x30, 0xdd, 0x2f, 0x8d, 0x1b, 00, 0x1, 0x10, 00, 0x1, 0x4, 00, 0x12, 00, 00, 0x14, 00, 0x1e, 00, 00, 00, 0x8, 00, 0x5c, 0x5f, 0x53, 0x42, 0x2e, 0x47, 0x50, 0x49, 0x30, 00}
                    VendorLong() {00, 0x60, 0x44, 0xd5, 0xf3, 0x1f, 0x11, 0x60, 0x4a, 0xb8, 0xb0, 0x9c, 0x2d, 0x23, 0x30, 0xdd, 0x2f, 0x8d, 0x1b, 00, 0x1, 0x10, 00, 0x1, 0x4, 00, 0x12, 00, 00, 0x14, 00, 0x1e, 00, 00, 00, 0x7, 00, 0x5c, 0x5f, 0x53, 0x42, 0x2e, 0x47, 0x50, 0x49, 0x30, 00}
                })
                Return(RBUF)
            }
        }
        Device(SPI1)
        {
            Name(_HID, "BCM2839")
            Name(_CID, "BCMAUXSPI")
            Name(_UID, One)
            Name(_DEP, Package(0x1)
            {
                "\\_SB.RPIQ"
            })
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f215080, 0x40)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0x3d}
                    VendorLong() {00, 0x60, 0x44, 0xd5, 0xf3, 0x1f, 0x11, 0x60, 0x4a, 0xb8, 0xb0, 0x9c, 0x2d, 0x23, 0x30, 0xdd, 0x2f, 0x8d, 0x1f, 00, 0x1, 0x10, 00, 0x2, 0x3, 00, 0x12, 00, 00, 0x18, 00, 0x22, 00, 00, 00, 0x13, 00, 0x14, 00, 0x15, 00, 0x5c, 0x5f, 0x53, 0x42, 0x2e, 0x47, 0x50, 0x49, 0x30, 00}
                    VendorLong() {00, 0x60, 0x44, 0xd5, 0xf3, 0x1f, 0x11, 0x60, 0x4a, 0xb8, 0xb0, 0x9c, 0x2d, 0x23, 0x30, 0xdd, 0x2f, 0x8d, 0x1b, 00, 0x1, 0x10, 00, 0x2, 0x3, 00, 0x12, 00, 00, 0x14, 00, 0x1e, 00, 00, 00, 0x10, 00, 0x5c, 0x5f, 0x53, 0x42, 0x2e, 0x47, 0x50, 0x49, 0x30, 00}
                })
                Return(RBUF)
            }
        }
        Device(PWM0)
        {
            Name(_HID, "BCM2844")
            Name(_CID, "ACPIBCM2844")
            Name(_UID, Zero)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f007b00, 0x100)
                    Memory32Fixed(ReadWrite, 0x3f20c000, 0x28)
                    Memory32Fixed(ReadWrite, 0x7e20c000, 0x28)
                    Memory32Fixed(ReadWrite, 0xff20c000, 0x28)
                    Memory32Fixed(ReadWrite, 0x3f1010a0, 0x8)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {0x3b}
                    FixedDMA(5, 11, Width32Bit)
                })
                Return(RBUF)
            }
        }
        Device(DSEN)
        {
            Name(_HID, "DSN3832")
            Name(_CID, "ACPIDSN3832")
            Name(_UID, Zero)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
        }
        Device(URT0)
        {
            Name(_HID, "BCM2837")
            Name(_CID, "HID3123")
            Name(_UID, 0x4)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f201000, 0x1000)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {0x59}
                })
                Return(RBUF)
            }
        }
        Device(URTM)
        {
            Name(_HID, "BCM2836")
            Name(_CID, "MINIUART")
            Name(_UID, Zero)
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, ResourceTemplate()
                {
                    Memory32Fixed(ReadWrite, 0x3f215000, 0x70)
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0x3d}
                })
                Return(RBUF)
            }
        }
        Device(BTH0)
        {
            Name(_HID, "BCM2EA6")
            Name(_CID, "BCM2EA6")
            Method(_STA, 0x0, NotSerialized)
            {
                Return(0xf)
            }
            Method(_CRS, 0x0, NotSerialized)
            {
                Name(RBUF, Buffer(0x45)
                {
	0x8e, 0x1d, 0x00, 0x01, 0x00, 0x03, 0x02, 0x34, 0x00, 0x01, 0x0a, 0x00,
	0x00, 0xc2, 0x01, 0x00, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00, 0x5c, 0x5f,
	0x53, 0x42, 0x2e, 0x55, 0x52, 0x54, 0x30, 0x00, 0x8c, 0x20, 0x00, 0x01,
	0x01, 0x01, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,
	0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x80, 0x00, 0x5c, 0x5f, 0x53,
	0x42, 0x2e, 0x52, 0x50, 0x49, 0x51, 0x00, 0x79, 0x00
                })
                Return(RBUF)
            }
        }
        Device(RHPX)
        {
            Name(_HID, "MSFT8000")
            Name(_CID, "MSFT8000")
            Name(_UID, One)
            Name(_CRS, ResourceTemplate()
            {
                SPISerialBus(0, PolarityLow, FourWireMode, 0x8, ControllerInitiated, 0x3d0900, ClockPolarityLow, ClockPhaseFirst, "\\_SB.SPI0", 0, ResourceConsumer, , )
                SPISerialBus(0x1, PolarityLow, FourWireMode, 0x8, ControllerInitiated, 0x3d0900, ClockPolarityLow, ClockPhaseFirst, "\\_SB.SPI0", 0, ResourceConsumer, , )
                I2CSerialBus(0xffff, ControllerInitiated, 0, AddressingMode7Bit, "\\_SB.I2C1", 0, ResourceConsumer, , )
                SPISerialBus(0x2, PolarityLow, FourWireMode, 0x8, ControllerInitiated, 0x3d0900, ClockPolarityLow, ClockPhaseFirst, "\\_SB.SPI1", 0, ResourceConsumer, , )
                GpioIO(Shared, PullUp, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x2}
                GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x2}
                GpioIO(Shared, PullUp, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x3}
                GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x3}
                GpioIO(Shared, PullUp, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x4}
                GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x4}
                GpioIO(Shared, PullUp, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x5}
                GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x5}
                GpioIO(Shared, PullUp, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x6}
                GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x6}
                GpioIO(Shared, PullUp, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x7}
                GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x7}
                GpioIO(Shared, PullUp, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x8}
                GpioInt(Edge, ActiveBoth, Shared, PullUp, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x8}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x9}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x9}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0xa}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0xa}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0xb}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0xb}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0xc}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0xc}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0xd}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0xd}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x10}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x10}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x11}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x11}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x12}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x12}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x13}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x13}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x14}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x14}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x15}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x15}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x16}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x16}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x17}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x17}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x18}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x18}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x19}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x19}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x1a}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x1a}
                GpioIO(Shared, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x1b}
                GpioInt(Edge, ActiveBoth, Shared, PullDown, 0, "\\_SB.GPI0", 0, ResourceConsumer, , ) {0x1b}
            })
            Name(_DSD, Package(0x2)
            {
                Buffer(0x10)
                {
	0x14, 0xd8, 0xff, 0xda, 0xba, 0x6e, 0x8c, 0x4d, 0x8a, 0x91, 0xbc, 0x9b,
	0xbf, 0x4a, 0xa3, 0x01
                },
                Package(0xc)
                {
                    Package(0x2)
                    {
                        "bus-SPI-SPI0",
                        Package(0x2)
                        {
                            Zero,
                            One
                        }
                    },
                    Package(0x2)
                    {
                        "SPI0-MinClockInHz",
                        0x1dcd
                    },
                    Package(0x2)
                    {
                        "SPI0-MaxClockInHz",
                        0x7735940
                    },
                    Package(0x2)
                    {
                        "SPI0-SupportedDataBitLengths",
                        Package(0x1)
                        {
                            0x8
                        }
                    },
                    Package(0x2)
                    {
                        "bus-I2C-I2C1",
                        Package(0x1)
                        {
                            0x2
                        }
                    },
                    Package(0x2)
                    {
                        "GPIO-PinCount",
                        0x36
                    },
                    Package(0x2)
                    {
                        "GPIO-UseDescriptorPinNumbers",
                        One
                    },
                    Package(0x2)
                    {
                        "GPIO-SupportedDriveModes",
                        0xf
                    },
                    Package(0x2)
                    {
                        "bus-SPI-SPI1",
                        Package(0x1)
                        {
                            0x3
                        }
                    },
                    Package(0x2)
                    {
                        "SPI1-MinClockInHz",
                        0x772f
                    },
                    Package(0x2)
                    {
                        "SPI1-MaxClockInHz",
                        0x1312d00
                    },
                    Package(0x2)
                    {
                        "SPI1-SupportedDataBitLengths",
                        Package(0x1)
                        {
                            0x8
                        }
                    }
                }
            })
        }
        Device(NFCD)
        {
            Name(_HID, "PN71x0")
            Name(_CID, "ACPI\PN71x0")
            Name(_CRS, ResourceTemplate()
                {
                    I2CSerialBus(0x28, ControllerInitiated, 0x61a80, AddressingMode7Bit, "\\_SB.I2C1", 0, ResourceConsumer,,)
                    GpioInt(Edge, ActiveHigh, Exclusive, PullDefault, 0, "\\_SB.GPI0", 0, ResourceConsumer,,) {23}
                }
            )
            Name(NFCP, ResourceTemplate()
                {
                    GpioIO(Exclusive, PullDefault, 0, 0, IoRestrictionNone, "\\_SB.GPI0", 0, ResourceConsumer,,) {24}
                }
            )
            Scope(GPI0)
            {
                OperationRegion(NFPO, GeneralPurposeIO, Zero, One)
            }
            Field(\_SB_.GPI0.NFPO, ByteAcc, NoLock, Preserve)
            {
                Connection(\_SB_.NFCD.NFCP), MGPE, 1
            }
            Method(POON, 0x0, NotSerialized)
            {
                Store(One, MGPE)
            }
            Method(POOF, 0x0, NotSerialized)
            {
                Store(Zero, MGPE)
            }
            Method(_DSM, 0x4, NotSerialized)
            {
                Store("Method NFC _DSM begin", Debug)
                If(LEqual(Arg0, Buffer(0x10)
                        {
                            0xc4, 0xf6, 0xe7, 0xa2, 0x38, 0x96, 0x85, 0x44, 0x9f, 0x12, 0x6b, 0x4e, 0x20, 0xb6, 0x0d, 0x63
                        }
                    )
                )
                {
                    If(LEqual(Arg2, Zero))
                    {
                        Store("Method NFC _DSM QUERY", Debug)
                        If(LEqual(Arg1, One))
                        {
                            \_SB_.NFCD.POOF()
                            Sleep(0x14)
                            Return(Buffer(One)
                                {
                                    0x0F
                                }
                            )
                        }
                    }
                    If(LEqual(Arg2, 0x2))
                    {
                        Store("Method NFC _DSM SETPOWERMODE", Debug)
                        If(LEqual(Arg3, One))
                        {
                            \_SB_.NFCD.POON()
                            Sleep(0x14)
                        }
                        If(LEqual(Arg3, Zero))
                        {
                            \_SB_.NFCD.POOF()
                            Sleep(0x14)
                        }
                    }
                    If(LEqual(Arg2, 0x3))
                    {
                        Store("Method NFC _DSM EEPROM Config", Debug)
                        Return(Buffer(0x13)
                            {
                                0x9c, 0x1f, 0x38, 0x19, 0xa8, 0xb9, 0x4b, 0xab, 0xa1, 0xba, 0xd0, 0x20, 0x76, 0x88, 0x2a, 0xe0,
                                0x3, 0x1, 0x8
                            }
                        )
                    }
                }
            }
        }
    }
}
