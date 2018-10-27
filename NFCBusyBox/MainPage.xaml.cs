using NdefLibrary.Ndef;
using System;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
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
        private long subscriptionIdNdef = 0;

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
            if (subscriptionIdNdef != 0)
            {
                sender.StopSubscribingForMessage(subscriptionIdNdef);
                subscriptionIdNdef = 0;
            }
        }

        private void ProximityDevice_DeviceArrived(ProximityDevice sender)
        {
            UpdateDisplay_DeviceStatus(StatusEnum.DeviceArrived);
            if (subscriptionIdNdef == 0)
            {
                subscriptionIdNdef = sender.SubscribeForMessage("NDEF", ProximityDevice_MessageReceivedHandler);
            }
        }

        private void ProximityDevice_MessageReceivedHandler(ProximityDevice sender, ProximityMessage message)
        {
            var rawMessage = message.Data.ToArray();

            NdefMessage ndefMessage;
            try
            {
                ndefMessage = NdefMessage.FromByteArray(rawMessage);
            }
            catch(NdefException e)
            {
                UpdateDisplay_DeviceStatus(StatusEnum.InvalidNdefMessage);
                UpdateDisplay_DeviceMessage(e.Message);
                return;
            }

            foreach(NdefRecord record in ndefMessage)
            {
                UpdateDisplay_DeviceStatus(StatusEnum.MessageReceived);

                if (record.Id != null)
                {
                    var id = Encoding.UTF8.GetString(record.Id, 0, record.Id.Length);
                    UpdateDisplay_DeviceId(id);
                }

                var specializedType = record.CheckSpecializedType(true);

                if (NdefTextRecord.IsRecordType(record))
                {
                    NdefTextRecord textRecord = new NdefTextRecord(record);
                    var textMessage = textRecord.Text;
                    UpdateDisplay_DeviceMessage(textMessage);
                    UpdateDisplay_MessageReceived(textMessage);
                }
            }

        }

        private void UpdateDisplay_MessageReceived(string message)
        {
            var result = coreDispatcher.RunAsync(CoreDispatcherPriority.Normal, () =>
            {

                var button = (Button)null;
                switch(message.ToLower())
                {
                    case "red":
                        button = RedButton;
                        break;
                    case "orange":
                        button = OrangeButton;
                        break;
                    case "yellow":
                        button = YellowButton;
                        break;
                    case "green":
                        button = GreenButton;
                        break;
                    case "blue":
                        button = BlueButton;
                        break;
                    case "purple":
                        button = PurpleButton;
                        break;
                    case "rainbow":
                        button = RainbowButton;
                        break;
                    default:
                        return;
                }
                backgroundCanvas.Background = button.Background;
                ForegroundText.Text = button.Content.ToString();
            });
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

        private void UpdateDisplay_DeviceMessage(string message)
        {
            var result = coreDispatcher.RunAsync(CoreDispatcherPriority.Normal, () =>
            {
                if (Message != null)
                {
                    Message.Text = message;
                }
            });
        }

        private void UpdateDisplay_DeviceId(string id)
        {
            var result = coreDispatcher.RunAsync(CoreDispatcherPriority.Normal, () =>
            {
                if (Id != null)
                {
                    Id.Text = $"Id: {id}";
                }
            });
        }

    }
}
