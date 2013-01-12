//! provides a uniform interface independent of the underlying 
//! IOWarrior support library.

#if constant (.IOWarriorIOKit) /* IOWarriorIOKit for Darwin */
inherit .IOWarriorIOKit;

#elseif constant (IOWarriorDevice) /* IOWarriorDevice for Linux */
inherit .IOWarriorDevice;

#endif

