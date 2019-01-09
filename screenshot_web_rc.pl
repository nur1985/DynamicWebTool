#!/usr/bin/perl -w

$SOURCE_DIR ="/home/minerva/cmtuser/Minerva_v10r9p1/Tools/ControlRoomTools/SmartShift";
$LOGFILE     = "$SOURCE_DIR/logs/web_screenshot.log";
$IMAGE_DIR = "$SOURCE_DIR/images/";
$COPY_DIR = "mnvonline\@minervagpvm01.fnal.gov:/web/sites/minerva.fnal.gov/htdocs/shift/images";

#$MINERvA_screen = "MINERvA run control";
$MINERvA_screen = "root";
$MINERvA_screenshot = $IMAGE_DIR."MINERvA_run_control.png";
$MINERvA_time = $IMAGE_DIR."rc_time.txt";

print "log file is $LOGFILE\n";
print "Copy dir is $COPY_DIR\n";
$sleeptime = 9;
while (1) {
    print "Created screenshot and copied files at: ";
    $command="date";
    system($command);
    $command="date > $MINERvA_time";
    system($command);
#    $command = "import -window \"$MINERvA_screen\" -frame $MINERvA_screenshot >> $LOGFILE";
    $command = "import -window \"$MINERvA_screen\" -crop 890x842-0+25 -frame $MINERvA_screenshot >> $LOGFILE";
#    system($command);
#    $command = "scp -r $MINERvA_screenshot $MINERvA_time $COPY_DIR";
    system($command);
    sleep $sleeptime;
}

##
# Need to Kerberize: source $HOME/mnvdaqrunscripts/Kerberize
# Run the script by doing perl web_screenshot_rc.pl
#
