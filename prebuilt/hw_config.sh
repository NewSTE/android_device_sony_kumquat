# HW configuration file for kumquat
# Touch FW loader
dev=/sys/bus/spi/devices/spi9.0
fw=ttsp_fw.hex
app_id=`cat  $dev/appid`
case `cat /data/ttsp_fw_update` in
        "in_progress") flags=-force ;;
        *) flags="" ;;
esac
case "$app_id" in
	"0x3030") flags=-force ;;
	*) echo $app_id > /data/ttsp_appid ;;
esac

echo "in_progress" > /data/ttsp_fw_update
cyttsp_fwloader -dev $dev -fw /system/etc/firmware/$fw $flags
echo "done" > /data/ttsp_fw_update


# Audio jack configuration
dev=/sys/devices/platform/simple_remote.0
echo 0,301,1901 > $dev/accessory_min_vals
echo 300,1900  > $dev/accessory_max_vals
echo 0,51,251,511,851 > $dev/button_min_vals
echo 50,250,510,850,5000  > $dev/button_max_vals

# Proximity sensor configuration
dev=/sys/bus/i2c/devices/2-0054/
val_cycle=2
val_nburst=0
val_freq=2
val_threshold=5
val_filter=0

echo $val_cycle > $dev/cycle    # Duration Cycle. Valid range is 0 - 3.
echo $val_nburst > $dev/nburst  # Numb er of pulses in burst. Valid range is 0 - 15.
echo $val_freq > $dev/freq      # Burst frequency. Valid range is 0 - 3.
echo $val_threshold > $dev/threshold # sensor threshold. Valid range is 0 - 15 (0.12V - 0.87V)
echo $val_filter > $dev/filter  # RFilter. Valid range is 0 - 3.
