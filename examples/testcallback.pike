object iow;

void whee(mixed ... args) { werror("args: %O\n", array_sscanf(args[0], "%c")); }

int main()
{
  iow = Public.IO.IOWarrior.IOWarrior();
  write("is present: %d\n", iow->is_present());
//  iow->set_device_callback(whee);
  iow->set_report_callback(whee, 0);
  Public.ObjectiveC.add_backend_runloop();
  return -1;
}
