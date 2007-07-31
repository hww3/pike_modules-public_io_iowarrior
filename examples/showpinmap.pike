// pins 17, 19, 26, 30, 31?


array pinmap = ({ /* 40 elements */
    8388608,
    2097152,
    524288,
    131072,
    2147483648,
    536870912,
    134217728,
    128,
    32,
    8,
    2,
    32768,
    8192,
    2048,
    512,
    16777216,
    67108864,
    268435456,
    1073741824,
    65536,
    262144,
    1048576,
    4194304,
    256,
    1024,
    4096,
    16384,
    1,
    4,
    16,
    64
});

int main()
{

 object m = (module.IOWarrior());                                              

 if(!m->is_present())
 {
   werror("No IOWarrior Found!\n");
   return 1;
 }
 else
   write("IOWarrior Test\n");

 m->write_interface(0, sprintf("%c%c%c%c", 0,0,0,0));
Stdio.stdin.gets(); 
int i = 0;
do {

  foreach(pinmap;int d; int p)
  {
werror("%d\n", d);
 m->write_interface(0, sprintf("%04c", p));
sleep(0.25);
Stdio.stdin.gets();

 m->write_interface(0, sprintf("%c%c%c%c", 0,0,0,0));
/* sleep(0.1);
 sleep(0.1);
 m->write_interface(0, sprintf("%04c", p));
 sleep(0.1);
 m->write_interface(0, sprintf("%c%c%c%c", 0,0,0,0));
*/
sleep(0.25);
  }
 i++;
} while(i<10);
m->write_interface(0, sprintf("%c%c%c%c", 0,0,0,0));

return 0;
}

