using Logic.Common;
using Logic.Events;
using System;
using System.Diagnostics;
using Windows.UI;
using Windows.UI.Core;
using Windows.UI.Xaml.Media;

namespace Logic
{
    public class Display : BindableBase
    {
        private TagReader tagReader;
        private CoreDispatcher coreDispatcher;
        private DebugSwitch debugSwitch;
        private bool Debug = false;

        private string deviceStatus;
        public string DeviceStatus
        {
            get { return deviceStatus; }
            set { SetProperty(ref deviceStatus, value); }
        }

        private string message;
        public string Message
        {
            get { return message; }
            set { SetProperty(ref message, value); }
        }

        private string log;
        public string Log
        {
            get { return log; }
            set { SetProperty(ref log, value); }
        }

        private Brush background;
        public Brush Background
        {
            get { return background; }
            set { SetProperty(ref background, value); }
        }

        private string foreground;
        public string Foreground
        {
            get { return foreground; }
            set { SetProperty(ref foreground, value); }
        }

        public event EventHandler<DebugStatusChangedEventArgs> OnToggleDebug;

        public Display()
        {
            tagReader = new TagReader();
            tagReader.OnDeviceStatusChanged += OnDevicesStatusChanged;
            tagReader.OnMessageArrived += OnMessageArrived;
            OnToggleDebug += tagReader.ToggleDebug;
            coreDispatcher = CoreWindow.GetForCurrentThread().Dispatcher;
            debugSwitch = new DebugSwitch();
            debugSwitch.DebugStatusChagned += DebugSwitch_DebugStatusChagned;

            Log = string.Empty;
            Background = SelectBackgroundFromMessage(null);
            Foreground = "READY";
            Message = "Please scan a tag.";
        }

        private void DebugSwitch_DebugStatusChagned(object sender, DebugStatusChangedEventArgs e)
        {
            Debug = e.DebugStatus;
        }

        private void OnMessageArrived(object sender, MessageArrivedEventArgs e)
        {
            var result = coreDispatcher.RunAsync(CoreDispatcherPriority.Normal, () =>
            {
                var stopwatch = (Stopwatch)null;
                if (Debug)
                {
                    stopwatch.Start();
                }

                DeviceStatus = Enum.GetName(typeof(StatusEnum), e.DeviceStatus);
                Message = e.Message;
                Foreground = e.Message.ToUpper();
                Background = SelectBackgroundFromMessage(e.Message);

                if (Debug)
                {
                    Log += $"{e.ToString()}\n";
                    stopwatch.Stop();
                    Log += $"{{\"Display.OnMessageArrived\":{{ \"ExecutionTime\":\"{stopwatch.Elapsed.ToString()}\" }} }}\n";
                }
            });
        }

        private void OnDevicesStatusChanged(object sender, DeviceStatusChangedEventArgs e)
        {
            var result = coreDispatcher.RunAsync(CoreDispatcherPriority.Normal, () =>
            {
                var stopwatch = (Stopwatch)null;
                if (Debug)
                {
                    stopwatch.Start();
                }

                DeviceStatus = Enum.GetName(typeof(StatusEnum), e.DeviceStatus);

                if (Debug)
                {
                    Log += $"{e.ToString()}\n";
                    stopwatch.Stop();
                    Log += $"{{\"Display.OnMessageArrived\":{{ \"ExecutionTime\":\"{stopwatch.Elapsed.ToString()}\" }} }}\n";
                }
            });
        }

        private static Brush SelectBackgroundFromMessage(string message)
        {
            if (message == null)
            {
                return new SolidColorBrush(Colors.Black);
            }

            switch (message.ToLower())
            {
                case "red":
                    return new SolidColorBrush(Colors.Red);
                case "orange":
                    return new SolidColorBrush(Colors.Orange);
                case "yellow":
                    return new SolidColorBrush(Colors.Yellow);
                case "green":
                    return new SolidColorBrush(Colors.Green);
                case "blue":
                    return new SolidColorBrush(Colors.Blue);
                case "purple":
                    return new SolidColorBrush(Colors.Purple);
                case "brown":
                    return new SolidColorBrush(Colors.Brown);
                case "rainbow":
                    return new LinearGradientBrush(new GradientStopCollection()
                        {
                            new GradientStop() { Color = Colors.Red, Offset=0.0 },
                            new GradientStop() { Color = Colors.Orange, Offset=0.17 },
                            new GradientStop() { Color = Colors.Yellow, Offset=0.33 },
                            new GradientStop() { Color = Colors.Green, Offset=0.5 },
                            new GradientStop() { Color = Colors.Blue, Offset=0.67 },
                            new GradientStop() { Color = Colors.Indigo, Offset=0.83 },
                            new GradientStop() { Color = Colors.Violet, Offset=1.0 }
                        }, 90);
                default:
                    return new SolidColorBrush(Colors.Black);
            }
        }
    }
}
