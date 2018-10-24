using System;
using Windows.Networking.Proximity;
using Windows.UI.Core;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=402352&clcid=0x409

namespace NFCBusyBox
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class MainPage : Page
    {
        private ProximityDevice proximityDevice;
        private CoreDispatcher coreDispatcher;

        public MainPage()
        {
            this.InitializeComponent();

            coreDispatcher = CoreWindow.GetForCurrentThread().Dispatcher;
            proximityDevice = ProximityDevice.GetDefault();
            if (proximityDevice != null)
            {
                proximityDevice.DeviceArrived += ProximityDevice_DeviceArrived;
                proximityDevice.DeviceDeparted += ProximityDevice_DeviceDeparted;
            }
        }

        private void ProximityDevice_DeviceDeparted(ProximityDevice sender)
        {
            UpdateDisplay_DeviceStatus(StatusEnum.DeviceDeparted);
        }

        private void ProximityDevice_DeviceArrived(ProximityDevice sender)
        {
            UpdateDisplay_DeviceStatus(StatusEnum.DeviceArrived);
        }

        private void UpdateDisplay_Click(object sender, RoutedEventArgs e)
        {
            var button = (Button)sender;
            backgroundCanvas.Background = button.Background;
            ForegroundText.Text = button.Content.ToString();
        }

        private void UpdateDisplay_DeviceStatus(StatusEnum status)
        {
            var result = coreDispatcher.RunAsync(CoreDispatcherPriority.Normal, () =>
            {
                if (DeviceStatus != null)
                {
                    DeviceStatus.Text = Enum.GetName(typeof(StatusEnum), status);
                }
            });
        }
    }
}
