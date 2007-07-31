object iow;

void whee() { werror("whee\n"); }

int main()
{
  iow = Public.IO.IOWarrior.IOWarrior();
  iow->set_device_callback(whee);
  Public.ObjectiveC.add_backend_runloop();
  return -1;
}
