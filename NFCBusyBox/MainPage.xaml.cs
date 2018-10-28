using NdefLibrary.Ndef;
using System;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using Windows.Networking.Proximity;
using Windows.Devices.Gpio;
using Windows.UI;
using Windows.UI.Core;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Media;
using Logic;
using Logic.Events;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=402352&clcid=0x409

namespace NFCBusyBox
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class MainPage : Page
    {
        private Display display;
        private GpioPin DebugModePin = null;

        public MainPage()
        {
            this.InitializeComponent();

            display = new Display();
            DataContext = display;

            //var gpioController = GpioController.GetDefault();
            //DebugModePin = gpioController.OpenPin(7, GpioSharingMode.SharedReadOnly);
            //DebugModePin.ValueChanged += Pin_ValueChanged;
            //var debugModeValue = DebugModePin.Read();
            //DebugMode = debugModeValue == GpioPinValue.High;
        }


        private void Pin_ValueChanged(GpioPin sender, GpioPinValueChangedEventArgs args)
        {
            if (sender.PinNumber == 7)
            {
                if (args.Edge == GpioPinEdge.FallingEdge)
                {
                    
                }
            }
        }
    }
}
