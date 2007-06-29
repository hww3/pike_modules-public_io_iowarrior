
array map = allocate(40);

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

int i = 1;   
 for(int j = 0; j < 32; j++)
 {
   write("Testing pin " + (j+1) + "\n");

   m->write_interface(0, sprintf("%04c", i));
   sleep(0.5);

   do
   {
     write("What LED is currently lit (1 = leftmost, etc)?\n");
     string k = Stdio.stdin.gets();


     if(map[(int)k -1]) werror("LED " + (int)k + " is already mapped.\n");
     else
     {
	   map[(int)k -1] = "p" + i;
           break;
     }
   } while(1);

   m->write_interface(0, sprintf("%04c", 0));
   sleep(0.25);

 i<<=1;
 }

  werror("%O", map);

  return 0;
}
