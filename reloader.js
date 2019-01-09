function reloadGraph() {
   var now = new Date();

   document.images['graph_rc'].src = 'images/MINERvA_run_control.png?' + now.getTime();
   document.images['graph_gmbrowser'].src = 'images/GMBrowser.png?' + now.getTime();
   document.images['graph_minos'].src = 'images/MINOS_run_control.png?' + now.getTime();
   document.images['graph_veto'].src = 'images/VetoHVGUI.png?' + now.getTime();

   // Start new timer (10 s)
   timeoutID = setTimeout('reloadGraph()', 6000);
}

function GetClock(){
var d=new Date();
var nday=d.getDay(),nmonth=d.getMonth(),ndate=d.getDate(),nyear=d.getYear();
if(nyear<1000) nyear+=1900;
var nhour=d.getHours(),nmin=d.getMinutes(),nsec=d.getSeconds(),ap;

if(nmin<=9) nmin="0"+nmin;
if(nsec<=9) nsec="0"+nsec;

document.getElementById('clockbox').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+" (update ~every 10s)";
document.getElementById('clockbox2').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+" (update ~every 2m)";
document.getElementById('clockbox3').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+" (update ~every 5m)";
document.getElementById('clockbox4').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+" (update ~every 10m)";
document.getElementById('clockbox5').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+" (update ~every 8h)";
}

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}
addLoadEvent(reloadGraph);
addLoadEvent(GetClock);
addLoadEvent(function() {
})

