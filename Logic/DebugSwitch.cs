using Logic.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.Devices.Gpio;

namespace Logic
{
    public class DebugSwitch
    {
        private GpioPin Pin = null;
        const int GPIO_4 = 4;

        public event EventHandler<DebugStatusChangedEventArgs> DebugStatusChagned;

        public DebugSwitch()
        {
            var gpioController = GpioController.GetDefault();
            Pin = gpioController.OpenPin(GPIO_4, GpioSharingMode.SharedReadOnly);
            Pin.SetDriveMode(GpioPinDriveMode.InputPullDown);
            Pin.ValueChanged += OnValueChanged;
        }

        private void OnValueChanged(GpioPin sender, GpioPinValueChangedEventArgs args)
        {
            var eventArgs = new DebugStatusChangedEventArgs()
            {
                DebugStatus = (args.Edge == GpioPinEdge.RisingEdge)
            };
            DebugStatusChagned(this, eventArgs);
        }
    }
}
