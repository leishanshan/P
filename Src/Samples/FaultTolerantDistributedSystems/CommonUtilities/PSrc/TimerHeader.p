//Interfaces and model types
type ITimer(ITimerClient) = { eStartTimer, eCancelTimer };
type ITimerClient() = { eTimeOut, eCancelSuccess, eCancelFailure }; 
type TimerPtr = ITimer;

// events from client to timer
event eStartTimer: int;
event eCancelTimer;
// events from timer to client
event eTimeOut: TimerPtr;
event eCancelSuccess: TimerPtr;
event eCancelFailure: TimerPtr;
