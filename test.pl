#!/usr/bin/perl -w

#$SOURCE_DIR ="/home/minerva/cmtuser/Minerva_v10r9p1/Tools/ControlRoomTools/SmartShift";

$sleeptime = 28754;
#$sleeptime = 20900;
#$sleeptime = 300;
while (1) {
#    $command="at 0625 1425 2225 1321 <<_EOF_";
#    system($command);
    print "Starting to create shift summary plots at: ";
    $command="date";
#    system($command);
#    $command = "source /home/minerva/cmtuser/Minerva_v10r9p1/Tools/ControlRoomTools/SmartShift/kerberize_instant";
    system($command);
    $command = "echo Test1 is done at `date` | at 12:16";
    system($command);
    $command = "echo Test2 is done at `date` | at 12:18 ";
    system($command);
    sleep $sleeptime;
#    $command="_EOF_";
#    system($command);
_EOF_
}

##
# Need to Kerberize: source $HOME/mnvdaqrunscripts/Kerberize
# Run the script by doing perl web_screenshot_veto.pl
#
