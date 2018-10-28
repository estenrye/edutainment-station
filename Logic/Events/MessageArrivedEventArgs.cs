using System;

namespace Logic.Events
{
    public class MessageArrivedEventArgs : DeviceStatusChangedEventArgs
    {
        public string Message { get; set; }
    }
}
