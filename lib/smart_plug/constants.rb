module SmartPlug
# Based on information from
# https://github.com/softScheck/tplink-smartplug/blob/master/tplink-smarthome-commands.txt
  class SystemCommands
    System_info = {system: {get_sysinfo: :null}}
    Reboot      = {system: {reboot: {delay: 1}}}
    Reset_Factory_Settings = {system:{reset: {delay: 1}}}
    Turn_on = {system: {set_relay_state: {state: 1}}}
    Turn_off = {system: {set_relay_state: {state: 0}}}
    Turn_off_led = {"system":{"set_led_off":{"off":1}}}
    Turn_on_led = {"system":{"set_led_off":{"off":0}}}
    Device_alias = {"system":{"set_dev_alias":{"alias":"supercool plug"}}}
    Mac_ddress = {"system":{"set_mac_addr":{"mac":"50-C7-BF-01-02-03"}}}
    Device_id = {"system":{"set_device_id":{"deviceId":"0123456789ABCDEF0123456789ABCDEF01234567"}}}
    Hardware_id = {"system":{"set_hw_id":{"hwId":"0123456789ABCDEF0123456789ABCDEF"}}}
    Location = {"system":{"set_dev_location":{"longitude":6.9582814,"latitude":50.9412784}}}
    Bootloader_check = {"system":{"test_check_uboot": :null}}
    Device_icon = {"system":{"get_dev_icon": :null}}
    Change_device_icon = {"system":{"set_dev_icon":{"icon":"xxxx","hash":"ABCD"}}}
    Test_mode = {"system":{"set_test_mode":{"enable":1}}}
    Download_firmware_from_url ={"system":{"download_firmware":{"url":"http://...."}}}
    Download_state = {"system":{"get_download_state":{}}}
    Flash_downloaded_firmware = {"system":{"flash_firmware":{}}}
    Check_config = {"system":{"check_new_config": :null}}
  end
end
#
#
#
#
# WLAN Commands
# ========================================
# Scan for list of available APs
# {"netif":{"get_scaninfo":{"refresh":1}}}
#
# Connect to AP with given SSID and Password
# {"netif":{"set_stainfo":{"ssid":"WiFi","password":"secret","key_type":3}}}
#
#
# Cloud Commands
# ========================================
# Get Cloud Info (Server, Username, Connection Status)
# {"cnCloud":{"get_info":null}}
#
# Get Firmware List from Cloud Server
# {"cnCloud":{"get_intl_fw_list":{}}}
#
# Set Server URL
# {"cnCloud":{"set_server_url":{"server":"devs.tplinkcloud.com"}}}
#
# Connect with Cloud username & Password
# {"cnCloud":{"bind":{"username":"your@email.com", "password":"secret"}}}
#
# Unregister Device from Cloud Account
# {"cnCloud":{"unbind":null}}
#
#
# Time Commands
# ========================================
# Get Time
# {"time":{"get_time":null}}
#
# Get Timezone
# {"time":{"get_timezone":null}}
#
# Set Timezone
# {"time":{"set_timezone":{"year":2016,"month":1,"mday":1,"hour":10,"min":10,"sec":10,"index":42}}}
#
#
# EMeter Energy Usage Statistics Commands
# (for TP-Link HS110)
# ========================================
# Get Realtime Current and Voltage Reading
# {"emeter":{"get_realtime":{}}}
#
# Get EMeter VGain and IGain Settings
# {"emeter":{"get_vgain_igain":{}}}
#
# Set EMeter VGain and Igain
# {"emeter":{"set_vgain_igain":{"vgain":13462,"igain":16835}}}
#
# Start EMeter Calibration
# {"emeter":{"start_calibration":{"vtarget":13462,"itarget":16835}}}
#
# Get Daily Statistic for given Month
# {"emeter":{"get_daystat":{"month":1,"year":2016}}}
#
# Get Montly Statistic for given Year
# {"emeter":{""get_monthstat":{"year":2016}}}
#
# Erase All EMeter Statistics
# {"emeter":{"erase_emeter_stat":null}}
#
#
# Schedule Commands
# (action to perform regularly on given weekdays)
# ========================================
# Get Next Scheduled Action
# {"schedule":{"get_next_action":null}}
#
# Get Schedule Rules List
# {"schedule":{"get_rules":null}}
#
# Add New Schedule Rule
# {"schedule":{"add_rule":{"stime_opt":0,"wday":[1,0,0,1,1,0,0],"smin":1014,"enable":1,"repeat":1,"etime_opt":-1,"name":"lights on","eact":-1,"month":0,"sact":1,"year":0,"longitude":0,"day":0,"force":0,"latitude":0,"emin":0},"set_overall_enable":{"enable":1}}}
#
# Edit Schedule Rule with given ID
# {"schedule":{"edit_rule":{"stime_opt":0,"wday":[1,0,0,1,1,0,0],"smin":1014,"enable":1,"repeat":1,"etime_opt":-1,"id":"4B44932DFC09780B554A740BC1798CBC","name":"lights on","eact":-1,"month":0,"sact":1,"year":0,"longitude":0,"day":0,"force":0,"latitude":0,"emin":0}}}
#
# Delete Schedule Rule with given ID
# {"schedule":{"delete_rule":{"id":"4B44932DFC09780B554A740BC1798CBC"}}}
#
# Delete All Schedule Rules and Erase Statistics
# {"schedule":{"delete_all_rules":null,"erase_runtime_stat":null}}
#
#
# Countdown Rule Commands
# (action to perform after number of seconds)
# ========================================
# Get Rule (only one allowed)
# {"count_down":{"get_rules":null}}
#
# Add New Countdown Rule
# {"count_down":{"add_rule":{"enable":1,"delay":1800,"act":1,"name":"turn on"}}}
#
# Edit Countdown Rule with given ID
# {"count_down":{"edit_rule":{"enable":1,"id":"7C90311A1CD3227F25C6001D88F7FC13","delay":1800,"act":1,"name":"turn on"}}}
#
# Delete Countdown Rule with given ID
# {"count_down":{"delete_rule":{"id":"7C90311A1CD3227F25C6001D88F7FC13"}}}
#
# Delete All Coundown Rules
# {"count_down":{"delete_all_rules":null}}
#
#
# Anti-Theft Rule Commands (aka Away Mode)
# (period of time during which device will be randomly turned on and off to deter thieves)
# ========================================
# Get Anti-Theft Rules List
# {"anti_theft":{"get_rules":null}}
#
# Add New Anti-Theft Rule
# {"anti_theft":{"add_rule":{"stime_opt":0,"wday":[0,0,0,1,0,1,0],"smin":987,"enable":1,"frequency":5,"repeat":1,"etime_opt":0,"duration":2,"name":"test","lastfor":1,"month":0,"year":0,"longitude":0,"day":0,"latitude":0,"force":0,"emin":1047},"set_overall_enable":1}}
#
# Edit Anti-Theft Rule with given ID
# {"anti_theft":{"edit_rule":{"stime_opt":0,"wday":[0,0,0,1,0,1,0],"smin":987,"enable":1,"frequency":5,"repeat":1,"etime_opt":0,"id":"E36B1F4466B135C1FD481F0B4BFC9C30","duration":2,"name":"test","lastfor":1,"month":0,"year":0,"longitude":0,"day":0,"latitude":0,"force":0,"emin":1047},"set_overall_enable":1}}
#
# Delete Anti-Theft Rule with given ID
# {"anti_theft":{"delete_rule":{"id":"E36B1F4466B135C1FD481F0B4BFC9C30"}}}
#
# Delete All Anti-Theft Rules
# "anti_theft":{"delete_all_rules":null}}
