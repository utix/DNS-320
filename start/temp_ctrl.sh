#!/ffp/bin/sh

# PROVIDE: temp_ctrl
# REQUIRE: LOGIN

. /ffp/etc/ffp.subr

name="temp_ctrl"
start_cmd="temp_ctrl_start"
stop_cmd="temp_ctrl_stop"
status_cmd="temp_ctrl_status"

temp_ctrl_start()
{
    # Kill the old fan controller
    PID=$(/bin/pidof fan_control)
    if [ -n "$PID" ]
    then
        kill -9 $PID
    fi
    temp_ctrl&
}

temp_ctrl_restart() {
    proc_stop temp_ctrl
    temp_ctrl&
}

temp_ctrl_stop()
{
    proc_stop temp_ctrl
}

temp_ctrl_status()
{
    proc_status temp_ctrl
}

run_rc_command "$1"
