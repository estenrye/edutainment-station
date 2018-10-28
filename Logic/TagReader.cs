using System;
using System.Linq;
using Windows.Networking.Proximity;
using Logic.Events;
using System.Diagnostics;
using NdefLibrary.Ndef;
using System.Runtime.InteropServices.WindowsRuntime;

namespace Logic
{
    public class TagReader
    {
        private ProximityDevice proximityDevice;
        private bool Debug;
        private long subscriptionIdNdef = 0;
        public event EventHandler<DeviceStatusChangedEventArgs> OnDeviceStatusChanged;
        public event EventHandler<MessageArrivedEventArgs> OnMessageArrived;

        public TagReader()
        {
            proximityDevice = ProximityDevice.GetDefault();
            if (proximityDevice != null)
            {
                proximityDevice.DeviceArrived += OnDeviceArrived;
                proximityDevice.DeviceDeparted += OnDeviceDeparted;
            }
        }

        public void ToggleDebug(object sender, DebugStatusChangedEventArgs args)
        {
            Debug = args.DebugStatus;
        }

        private void OnDeviceDeparted(ProximityDevice sender)
        {
            var stopwatch = (Stopwatch)null;
            if (Debug)
            {
                stopwatch = new Stopwatch();
                stopwatch.Start();
            }

            if (subscriptionIdNdef != 0)
            {
                sender.StopSubscribingForMessage(subscriptionIdNdef);
                subscriptionIdNdef = 0;
            }

            var args = new DeviceStatusChangedEventArgs()
            {
                DeviceStatus = StatusEnum.DeviceDeparted
            };

            if (Debug)
            {
                stopwatch.Stop();
                args.ExecutionTime = stopwatch.Elapsed;
                args.MethodName = "TagReader.OnDeviceDeparted";
            }

            OnDeviceStatusChanged(this, args);
        }

        private void OnDeviceArrived(ProximityDevice sender)
        {
            var stopwatch = (Stopwatch)null;
            if (Debug)
            {
                stopwatch = new Stopwatch();
                stopwatch.Start();
            }

            if (subscriptionIdNdef == 0)
            {
                subscriptionIdNdef = sender.SubscribeForMessage("NDEF", OnMessageReceived);
            }

            var args = new DeviceStatusChangedEventArgs()
            {
                DeviceStatus = StatusEnum.DeviceArrived
            };

            if (Debug)
            {
                stopwatch.Stop();
                args.ExecutionTime = stopwatch.Elapsed;
                args.MethodName = "TagReader.OnDeviceArrived";
            }

            OnDeviceStatusChanged(this, args);
        }

        private void OnMessageReceived(ProximityDevice sender, ProximityMessage message)
        {
            var stopwatch = (Stopwatch)null;
            if (Debug)
            {
                stopwatch = new Stopwatch();
                stopwatch.Start();
            }

            var rawMessage = message.Data.ToArray();

            NdefMessage ndefMessage;
            try
            {
                ndefMessage = NdefMessage.FromByteArray(rawMessage);
            }
            catch (NdefException e)
            {
                var exceptionArgs = new DeviceStatusChangedEventArgs()
                {
                    DeviceStatus = StatusEnum.DeviceArrived
                };
                if (Debug)
                {
                    stopwatch.Stop();
                    exceptionArgs.ExecutionTime = stopwatch.Elapsed;
                }
                OnDeviceStatusChanged(this, exceptionArgs);
                return;
            }

            var args = new MessageArrivedEventArgs()
            {
                DeviceStatus = StatusEnum.MessageReceived
            };

            foreach (NdefRecord record in ndefMessage)
            {
                if (NdefTextRecord.IsRecordType(record))
                {
                    NdefTextRecord textRecord = new NdefTextRecord(record);
                    args.Message = textRecord.Text;
                    break;
                }
            }

            if (Debug)
            {
                stopwatch.Stop();
                args.ExecutionTime = stopwatch.Elapsed;
                args.MethodName = "TagReader.OnMessageReceived";
            }

            OnDeviceStatusChanged(this, args);
            OnMessageArrived(this, args);
        }
    }
}
