/*
calendar.js

TO USE:

in document, insert:
<script src="javascript/calendar.js"></script> 


Then, where you want the "calendar" link to be:


<a href=javascript:function calendar () {return 0;} onClick='popCalendar(document.forms[0].TextboxThatNeedsaDate, 'graphics_url')'>Calendar</a>
                                                                                                                       ^^^^
Look --> ---------------------------------------------------------------------------------------------------------------^

Must pass graphics_url as second argument so that arrow gifs will appear.

Date will be stuck into form element that is the argument of popCalendar


FUNCTIONS:

popCalendar(thing): opens up a calendar window, thing is the form element that needs a date value from user
drawCalendar(day): //draws a Calendar of month which day is in. day is a Date() object
nextDrawCalendar(month, year): call drawCalendar with month++. Opposite of backDrawCalendar
writeMonth(month): return name of month, where month is 0 - 11
stick(day, month year) : put given date into form element thing  (thing is global set by popCalendar);
*/



today=new Date();


function stick(day, month, year) {
  year=year.toString();
  month++;
  window.thing.value=month.toString()+'/'+day.toString()+'/'+year.substring(2,4);
  calendarWindow.close();
}


//open up the calendar. 

function popCalendar(thing, graphics_url) {
  window.thing=thing;
  calendarWindow=window.open("", "calendarWindow", 'height=255,width=225')
  //use the current month and year to start calendar
  calendarWindow.graphics_url=graphics_url;
  drawCalendar(today, graphics_url);
  calendarWindow.focus();
  return;
}

//go forward one month
function nextDrawCalendar(month,year) {
  if (month==11) { year++; month=0; }
  else month++;
  day = new Date(year, month,1);
  drawCalendar(day, calendarWindow.graphics_url);
  return;
}

//go back one month
function backDrawCalendar(month,year) {
  if (month==0) { year--; month=11; }
  else month--;
  day = new Date(year, month,1);
  drawCalendar(day, calendarWindow.graphics_url);
  return;
}



var daysInMonth = new Array(12);
daysInMonth[1]=31;
daysInMonth[2] = 28;
daysInMonth[3] = 31;
daysInMonth[4] = 30;
daysInMonth[5] = 31;
daysInMonth[6] = 30;
daysInMonth[7] = 31;
daysInMonth[8] = 31;
daysInMonth[9] = 30;
daysInMonth[10] = 31;
daysInMonth[11] = 30;
daysInMonth[12] = 31;

 
function drawCalendar(day, graphics_url) {
  firstday=day.getDay();
  firstdate=day.getDate();
  // find first day of month

  //find day of week on which month starts. Back up one day until 
  while((firstdate%7)!=1) {
    firstdate--;
    firstday=(firstday%7)-1;
    if (firstday==-1) { firstday=6; }
  }
 
  calendarWindow.document.open();
  calendarWindow.document.write('<html><title>Calendar</title>');
  calendarWindow.document.write('<body bgcolor=#FFFFCC><form name=flip>');
  calendarWindow.document.write('<table border=0 width=100% bgcolor= cellpadding=0 cellspacing=0><tr bgcolor=#9999cc>');
  calendarWindow.document.write('<td align=left><a href="javascript: function back(){return 0;}" onclick="window.opener.backDrawCalendar('+day.getMonth()+','+day.getFullYear()+');"><img src="'+graphics_url+'calendar/left.gif" border=0></a></td>\n');
  calendarWindow.document.write('<td align=center><font style=bold size=+1><select name=month onChange="window.opener.jump('+day.getFullYear()+')";><option value='+writeMonth(day.getMonth())+ '>'+writeMonth(day.getMonth())+'</option><option value="0">January<option value="1">February<option value="2">March<option value="3">April<option value="4">May<option value="5">June<option value="6">July<option value="7">August<option value="8">September<option value="9">October<option value="10">November<option value="11">December</select>');

calendarWindow.document.write(day.getFullYear()+'</font></td>');
  
  calendarWindow.document.write('<td align=right><a href="javascript: function next(){return 0;}" onclick="window.opener.nextDrawCalendar('+day.getMonth()+','+day.getFullYear()+');"><img src="'+graphics_url+'calendar/right.gif" border=0></a></td>');
  
  
  calendarWindow.document.write('</table></form>'); 
  
  calendarWindow.document.write('<table border=0 align=center><tr><td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td></tr>');
  calendarWindow.document.write('<tr>');
  currday=0;
  while (currday!=firstday) {
    calendarWindow.document.write('<td></td>');
    currday++;
  }


  if (((day.getYear())%4) == 0) { daysInMonth[2] = 29; }
  else { daysInMonth[2] = 28; }

  for (days=1; days<=daysInMonth[day.getMonth()+1]; days++) {

    if (!currday) { calendarWindow.document.write('</tr><tr>'); }

    if (days==today.getDate() && today.getMonth()==day.getMonth()) {
      calendarWindow.document.write('<td align=center bgcolor=tan><a href="javascript:function cal(){window.close();}" onclick=window.opener.stick('+days+','+day.getMonth()+','+day.getFullYear()+')>'+days+'</a></td>\n');
    } else {
      calendarWindow.document.write('<td align=center><a href="javascript:function cal(){window.close();}" onclick="window.opener.stick('+days+','+day.getMonth()+','+day.getFullYear()+')">'+days+'</a></td>\n');
    }
    currday=(currday+1)%7;
  }
	
  while (currday!=0) {
    calendarWindow.document.write('<td></td>');
    currday=(currday+1)%7;
  }
  calendarWindow.document.write('</tr>');	
  calendarWindow.document.write('</table>');

  //instructions, ugh

  calendarWindow.document.write('<p align=center><font size = -1><i>Choose a date to be entered into field.</i></font>');
  calendarWindow.document.write('</body></html>');
  //calendarWindow.document.close();
  calendarWindow.graphics_url=graphics_url;
}

function writeMonth(m) {
  switch (m) {
    case 0: return "January";
    case 1: return "February";
    case 2: return "March";
    case 3: return "April";
    case 4: return "May";
    case 5: return "June";
    case 6: return "July";
    case 7: return "August";
    case 8: return "September";
    case 9: return "October";
    case 10: return "November";
    case 11: return "December";
  }
}

function jump(year) {

month=calendarWindow.document.flip.month.options[calendarWindow.document.flip.month.selectedIndex].value;
today= new Date;

day= new Date(year, month, 1);
drawCalendar(day, calendarWindow.graphics_url);
}


