# DNS-320

All scripts done for DNS230 with fun plug.
Test with 0.5 version.

## fan\_control.sh


Three temperature limits are set for disk and system
Halt: to stop the fan
Slow: to set fan speed to slow
High: to set fan speed to high.

The mecanism is a simple hysteris:

```
         ^
Fan speed|
         |
         |
         |
         |
         X                                               +------------+
         |                                               |
         |                                               |
         |                                               |
         |                                               |
         |                                               |
         |                                               |
         X                   +------<------+-------------+
         |                   |             |
         |                   v             ^
         |                   |             |
         |                   |             |
         +-------------------+------->-----+-------------X---------->
                                                                    Temp
                            Halt           Slow          High

```
If one temperature is over the High limit, fan speed is set to high.
As soon as a temperatur reaches the  Slow limit, fan speed is set to slow.
Only when all temperature are lower than the Halt limit the fans is stopped.

All speed change are logged into syslog.
The script write to /var/tmp/fan the actual fan speed setting.
This information can be used by a munin plugins to monitor fan speed, see [Munin Plugins](https://github.com/utix/munin-plugins)
