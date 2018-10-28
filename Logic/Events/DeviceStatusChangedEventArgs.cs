using System;
using Newtonsoft.Json;

namespace Logic.Events
{
    public class DeviceStatusChangedEventArgs : EventArgs
    {
        public StatusEnum DeviceStatus { get; set; }
        public string MethodName { get; set; }
        public TimeSpan ExecutionTime { get; set; }

        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}
