//! provides a uniform interface independent of the underlying 
//! IOWarrior support library.

#if constant (.IOWarriorIOKit) /* IOWarriorIOKit for Darwin */
inherit .IOWarriorIOKit;

#elseif constant (IOWarriorDevice) /* IOWarriorDevice for Linux */
inherit .IOWarriorDevice;

function report_callback;
int thread_exit;
Thread.Thread report_thread;


//!
void set_report_callback(function cb, int index)
{
  report_callback = cb;
  if(cb)
  {
    thread_exit = 0;
    set_read_timeout(1000);
    report_thread = Thread.Thread(cb, index);
  }
  else
  {
    thread_exit = 1;
  }
}

void run_callback_thread()
{
  while(!thread_exit)
  {
    string s = read_interface0();
    if(s)
    {
      report_callback(s);
    }
  }  
}

#endif

