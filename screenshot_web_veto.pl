#!/usr/bin/perl -w

$SOURCE_DIR ="/home/minerva/cmtuser/Minerva_v10r9p1/Tools/ControlRoomTools/SmartShift";
$LOGFILE     = "$SOURCE_DIR/logs/web_screenshot.log";
$IMAGE_DIR = "$SOURCE_DIR/images/";
#$COPY_DIR = "mnvonline\@minervagpvm02.fnal.gov:/web/sites/minerva.fnal.gov/htdocs/shift/images";
$COPY_DIR = "/web/sites/minerva.fnal.gov/htdocs/shift/images";

$MINERvA_screen = "root";
$MINERvA_screenshot = $IMAGE_DIR."VetoHVGUI.png";
$MINERvA_time = $IMAGE_DIR."veto_time.txt";

$MINERvA_screenshot_rc = $IMAGE_DIR."MINERvA_run_control.png";
$MINERvA_time_rc = $IMAGE_DIR."rc_time.txt";
$MINERvA_screenshot_minos = $IMAGE_DIR."MINOS_run_control.png";
$MINERvA_time_minos = $IMAGE_DIR."minos_time.txt";
$MINERvA_screenshot_gmbrowser = $IMAGE_DIR."GMBrowser.png";
$MINERvA_time_gmbrowser = $IMAGE_DIR."gmbrowser_time.txt";
$MINERvA_screenshot_veto = $IMAGE_DIR."VetoHVGUI.png";
$MINERvA_time_veto = $IMAGE_DIR."veto_time.txt";


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
    $command = "import -window \"$MINERvA_screen\" -crop 600x535-35+40 -frame $MINERvA_screenshot >> $LOGFILE";
#    $command = "import -window \"$MINERvA_screen\" -crop 715x440-0+30 -frame $MINERvA_screenshot >> $LOGFILE";
    system($command);
#    $command = "scp -r $MINERvA_screenshot $MINERvA_time $COPY_DIR";
    $command = "rm -f ${COPY_DIR}/MINERvA_run_control.png ${COPY_DIR}/rc_time.txt ${COPY_DIR}/MINOS_run_control.png ${COPY_DIR}/minos_time.txt ${COPY_DIR}/GMBrowser.png ${COPY_DIR}/gmbrowser_time.txt ${COPY_DIR}/VetoHVGUI.png ${COPY_DIR}/veto_time.txt";
    system($command);
#    print "rm -f ${COPY_DIR}/MINERvA_run_control.png ${COPY_DIR}/rc_time.txt ${COPY_DIR}/MINOS_run_control.png ${COPY_DIR}/minos_time.txt ${COPY_DIR}/GMBrowser.png ${COPY_DIR}/gmbrowser_time.txt ${COPY_DIR}/VetoHVGUI.png ${COPY_DIR}/veto_time.txt\n";
    $command = "cp -r $MINERvA_screenshot_rc $MINERvA_time_rc $MINERvA_screenshot_minos $MINERvA_time_minos $MINERvA_screenshot_gmbrowser $MINERvA_time_gmbrowser $MINERvA_screenshot_veto $MINERvA_time_veto $COPY_DIR";
    system($command);
    sleep $sleeptime;
}

##
# Need to Kerberize: source $HOME/mnvdaqrunscripts/Kerberize
# Run the script by doing perl web_screenshot_veto.pl
#
