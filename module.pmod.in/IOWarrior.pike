//! provides a uniform interface independent of the underlying 
//! IOWarrior support library.

#if constant (.IOWarriorIOKit) /* IOWarriorIOKit for Darwin */
inherit .IOWarriorIOKit;

static void create()
{
  ::create();

  Public.ObjectiveC.add_backend_runloop();
}

#elseif constant (.IOWarriorDevice) /* IOWarriorDevice for Linux */
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
werror("set read timeout.\n");
    report_thread = Thread.Thread(run_callback_thread, 10);
werror("created thread.\n");
  }
  else
  {
    thread_exit = 1;
  }
}

void run_callback_thread(int index)
{
  while(!thread_exit)
  {
write("reading.\n"); 
   string s;
    s = read_interface0();
    if(stringp(s))
    {
      report_callback(s);
    }
  }  
}

#endif

