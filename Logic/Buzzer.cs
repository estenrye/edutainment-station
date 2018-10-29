using Logic.Events;
using System.Threading.Tasks;
using Windows.Devices.Gpio;

namespace Logic
{
    public class Buzzer
    {
        private GpioPin Pin = null;
        const int GPIO_22 = 22;

        public Buzzer()
        {
            var gpioController = GpioController.GetDefault();
            Pin = gpioController.OpenPin(GPIO_22, GpioSharingMode.Exclusive);
            Pin.SetDriveMode(GpioPinDriveMode.Output);
            Pin.Write(GpioPinValue.Low);
        }

        public void OnDevicesStatusChanged(object sender, DeviceStatusChangedEventArgs e)
        {
            if (e.DeviceStatus == StatusEnum.DeviceArrived)
            {
                Pin.Write(GpioPinValue.High);
                Task.Delay(5).Wait();
                Pin.Write(GpioPinValue.Low);
            }
        }

    }
}
