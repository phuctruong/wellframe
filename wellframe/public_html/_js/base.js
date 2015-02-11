var reload_section_id = "";

function $(e){if(typeof e=='string')e=document.getElementById(e);return e};
function collect(a,f){var n=[];for(var i=0;i<a.length;i++){var v=f(a[i]);if(v!=null)n.push(v)}return n};

var ajaxobj = null;
ajax={};
ajax.x=function(){try{ajaxobj = new ActiveXObject('Msxml2.XMLHTTP'); return ajaxobj;}catch(e){try{ajaxobj = new ActiveXObject('Microsoft.XMLHTTP'); return ajaxobj;}catch(e){ajaxobj = new XMLHttpRequest(); return ajaxobj;}}};
ajax.serialize=function(f){var g=function(n){return f.getElementsByTagName(n)};var nv=function(e){if(e.name)return encodeURIComponent(e.name)+'='+encodeURIComponent(e.value);else return ''};var i=collect(g('input'),function(i){if((i.type!='radio'&&i.type!='checkbox')||i.checked)return nv(i)});var s=collect(g('select'),nv);var t=collect(g('textarea'),nv);return i.concat(s).concat(t).join('&');};
ajax.send=function(u,f,m,a){var x=ajax.x();x.open(m,u,true);x.onreadystatechange=function(){if(x.readyState==4)f(x.responseText)};if(m=='POST')x.setRequestHeader('Content-type','application/x-www-form-urlencoded');x.send(a)};
ajax.sends=function(u,m,a){var x=ajax.x();x.open(m,u,false);if(m=='POST')x.setRequestHeader('Content-type','application/x-www-form-urlencoded');x.send(a);return x.responseText};
ajax.get=function(url,func){ajax.send(url,func,'GET')};
ajax.gets=function(url){var x=ajax.x();x.open('GET',url,false);x.send(null);return x.responseText};
ajax.post=function(url,func,args){ajax.send(url,func,'POST',args)};
ajax.posts=function(url,args){return ajax.sends(url,'POST',args)};
ajax.update=function(url,elm){var e=$(elm);var f=function(r){e.innerHTML=r};ajax.get(url,f)};
ajax.updates=function(url,func,elm){var e=$(elm);e.innerHTML=ajax.gets(url);func(e.innerHTML)};
ajax.submit=function(url,elm,frm){var e=$(elm);var f=function(r){e.innerHTML=r};ajax.post(url,f,ajax.serialize(frm))};
ajax.submitf=function(url,frm,f){ajax.post(url,f,ajax.serialize(frm))};
ajax.submitfs=function(url,frm,f){f(ajax.posts(url,ajax.serialize(frm)))};

function abortAjax() {
    if (ajaxobj && ajaxobj != null) {
        ajaxobj.abort();
    }
}
function handleAjaxResponse(responseText) {
	if (responseText != null) {
		document.getElementById(reload_section_id).innerHTML = responseText;
		historyStorage.put(reload_section_id, responseText);
	} else {
		alert('There was a problem with the request.');
	}
}
function setSectionHtml(id, html) {
	if (document.getElementById(id) != null) {
		document.getElementById(id).innerHTML = html;
	}

}
function handleBackButton(reload_section_id) {
	if (historyStorage.get(reload_section_id) != null) {
		if (document.getElementById(reload_section_id) != null) {
			document.getElementById(reload_section_id).innerHTML = historyStorage.get(reload_section_id);
		}
	}
}
function reloadSection(sectionName, url, params) {
	reload_section_id = sectionName;
	if (params == null) {
		params = '';
	}
	ajax.post(url, handleAjaxResponse, params);
}
function reloadSectionSynchronously(sectionName, url, params) {
    reload_section_id = sectionName;
    if (params == null) {
        params = '';
    }
    ajax.updates(url+"?"+params, handleAjaxResponse, sectionName);
}
function reloadSectionWithForm(sectionName, form, url) {
	reload_section_id = sectionName;
	if (url == null) {
		url = form.action;
	}
    ajax.submitf(url, form, handleAjaxResponse);
}
function reloadSectionWithFormAndWait(sectionName, form, url) {
    reload_section_id = sectionName;
    if (url == null) {
        url = form.action;
    }
    ajax.submitfs(url, form, handleAjaxResponse);
}
function highlight(sectionName, delay) {
	if (delay == null) {
		delay = 300;
	}
	var command = "new Effect.Highlight('" + sectionName + "', {startcolor: '#d7faba', endcolor:'#ffffff'});";
	window.setTimeout(command, delay);
}
function ajaxHandleBackButton() {
	dhtmlHistory.initialize();
	dhtmlHistory.addListener(historyChange);
	for (var i=0;i<document.getElementsByTagName('*').length;i++) {
	  var id = document.getElementsByTagName('*')[i].id;
	  if (fnStartsWith(id, "ajax_")) {
		var element = document.getElementsByTagName('*')[i];
		handleBackButton(element.id);
	  }
	}
}
function fnStartsWith(value, startsWith) {
  var startsWithLength = startsWith.length;
  if (value.length > startsWithLength && value.substring(0, startsWithLength) == startsWith) return true;
  return false;
}

function historyChange() {
}

 function checkMaxInput(allowedLength,display) {
      var maxLen = allowedLength;  
      var displayer=document.getElementById(display); 
      var form = document.forms['f_brag'];
      var textValue = form.elements['brag_comments'].value;
      if (textValue.length > maxLen)
      { 
      displayer.className='fieldError';
      displayer.style.fontWeight='bold';
      displayer.innerHTML = 'You are over by '+(Math.abs(maxLen - textValue.length))+' characters';
      }
      else
      { 
      displayer.className='';
      displayer.style.fontWeight='normal';
      displayer.innerHTML = (maxLen - textValue.length) + ' characters remaining';
    }
    }

// function parameters are: 
// field - the string field, count - the field for remaining characters number and max - the maximum number of characters
function CountLeft(field, count, max) {
	// if the length of the string in the input field is greater than the max value, trim it
	if (field.value.length > max)
	field.value = field.value.substring(0, max);
	else
	// calculate the remaining characters
	count.value = max - field.value.length;
}
function confirmTrade(formName) {
	var form = document.forms[formName];
	var isLimitOrder = getRadioButtonGroupValue(form, "vo(isLimitOrder)");
	if (isLimitOrder == "false") {
		form.submit();
	} else {
		var currentPrice = form.elements["currentPrice"];
		currentPrice = currentPrice.value;
		var orderLimitPrice = form.elements["vo(orderLimitPrice)"];
		if (orderLimitPrice != null) {
			orderLimitPrice = orderLimitPrice.value;
			orderLimitPrice = parseFloat(orderLimitPrice);
			if (!(orderLimitPrice > 0)) {
				alert("You must enter a valid limit price");
				return;
			}
		} else {
			alert("You must enter a limit price");
			return;
		}

		form.submit();

		/*
		if (formName == "FORM_BUY_STOCK") {
			if (orderLimitPrice < currentPrice) {
				if (confirm('Warning. You entered a limit price that is lower than the current market price for your buy order. Is this o.k.?')) {
					form.submit();
				}
			} else {
				form.submit();
			}
		} else if (formName == "FORM_BUY_TO_COVER_STOCK") {
				if (orderLimitPrice < currentPrice) {
					if (confirm('Warning. You entered a limit price that is lower than the current market price for your buy to cover order. Is this o.k.?')) {
						form.submit();
					}
				} else {
					form.submit();
				}
		} else if (formName == "FORM_SELL_STOCK") {
				if (orderLimitPrice > currentPrice) {
					if (confirm('Warning. You entered a limit price that is higher than the current market price for your sell order. Is this o.k.?')) {
						form.submit();
					}
				} else {
					form.submit();
				}
		} else if (formName == "FORM_SELL_SHORT_STOCK") {
				if (orderLimitPrice > currentPrice) {
					if (confirm('Warning. You entered a limit price that is higher than the current market price for your sell short order. Is this o.k.?')) {
						form.submit();
					}
				} else {
					form.submit();
				}
		}
		*/

	}
}
function closeShadowbox() {
	window.parent.setTimeout('Shadowbox.close();');
}
function getParent() {
	return window.parent;
}

function submitTopAction(formName) {
	var form = document.forms[formName];
	
	var choice = fnGetSelectedOption(formName, "actionType");
	
	if (choice == "quotes") {  
	    form.action="searchStocks.do";
		form.submit();
	} 
		else if (choice == "trade") {
		form.action="tradeStock.do"; 
		form.submit();
	} 
		else if (choice == "create") {
		form.action="makeStockPick.do";
		form.submit();
	} 
		else if (choice == "add") {
		form.action="addToWatchList.do";
		form.submit();
	} 
	return false; 
}

function updateTotal(formName) {
	var form = document.forms[formName];
	var currentPrice = form.elements["currentPrice"];
    currentPrice = currentPrice.value;
	var price = currentPrice;
	var orderType = getRadioButtonGroupValue(form, "vo(orderType)");
	var limitText = "";
	if (orderType == "2") {
		var orderLimitPrice = form.elements["vo(orderLimitPrice)"];
		if (orderLimitPrice != null) {
			orderLimitPrice = orderLimitPrice.value;
			if (orderLimitPrice != null && parseFloat(orderLimitPrice) > 0) {
				price = parseFloat(orderLimitPrice);
				limitText = " (based on limit price)";
			}
		}
	} else if (orderType == "3") {
		var orderLimitPrice = form.elements["vo(orderStopPrice)"];
		if (orderLimitPrice != null) {
			orderLimitPrice = orderLimitPrice.value;
			if (orderLimitPrice != null && parseFloat(orderLimitPrice) > 0) {
				price = parseFloat(orderLimitPrice);
				limitText = " (based on stop price)";
			}
		}
	}

	var totalShares = form.elements["vo(totalShares)"];
	if (totalShares.value == null || totalShares.value == '') {
		return;
	}

    var totalCost = form.elements["totalCost"];
	var totalProceeds = form.elements["totalProceeds"];
    var totalValue = form.elements['totalValue'];

	if (parseInt(totalShares.value) > 0) {	
		var value = price * totalShares.value;
//		alert("current price: " + price + ", " + totalShares.value + ", " + (price * totalShares.value));
		value = formatCurrency(value);
		totalValue.value = value;

        if (typeof totalCost != "undefined") {
			value = (price * totalShares.value) + 100;
			value = formatCurrency(value);
            totalCost.value = value + limitText;
		}
        if (typeof totalProceeds != "undefined") {
			value = (price * totalShares.value) - 100;
			value = formatCurrency(value);
			totalProceeds.value = value + limitText;
		}


	} else {
        totalValue.value = "";
        if (typeof totalCost != "undefined") {
            totalCost.value = "";
		}
        if (typeof totalProceeds != "undefined") {
			totalProceeds.value = "";
		}
	}

}
function formatCurrency(num) {
	num = num.toString().replace(/\$|\,/g,'');
	if(isNaN(num))
	num = "0";
	sign = (num == (num = Math.abs(num)));
	num = Math.floor(num*100+0.50000000001);
	cents = num%100;
	num = Math.floor(num/100).toString();
	if(cents<10)
	cents = "0" + cents;
	for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	num = num.substring(0,num.length-(4*i+3))+','+
	num.substring(num.length-(4*i+3));
	return (((sign)?'':'-') + '$' + num + '.' + cents);
}
function showTip() {
}
function go() {
}
function cancelTrade(tradeNumber) {
	if (confirm('Are you sure you want to cancel this trade?')) {
		document.location="cancelTrade.do?id=" + tradeNumber;
    }
}
function updateSaveStockPick(formName) {
	var form = document.forms[formName];
	var value = form.elements["vo(saveStockPick)"];
	if (value.checked) {
		form.elements["vo(pickTypeKey)"].disabled = false;
		form.elements["vo(targetPrice)"].disabled = false;
		form.elements["vo(timeFrameKey)"].disabled = false;
		form.elements["vo(headline)"].disabled = false;
		form.elements["vo(analysis)"].disabled = false;
	} else {
		form.elements["vo(pickTypeKey)"].disabled = true;
		form.elements["vo(targetPrice)"].disabled = true;
		form.elements["vo(timeFrameKey)"].disabled = true;
		form.elements["vo(headline)"].disabled = true;
		form.elements["vo(analysis)"].disabled = true;
	}
}
function showIfNotBlank(id) {
	if (document.getElementById(id).innerHTML.length > 0) {
		fnShow(id);
	}
}
function fnChangeStyleClass(id, newClass) {
	var section = document.getElementById(id);
	if (section != null) {
		section.className = newClass;
	}
}
function fnFocus(form, elementName) {
	for (i = 0; i < form.elements.length; i++) {
		if ((form.elements[i].name == elementName)) {
			form.elements[i].focus();
			break;
		 }
	}
}
function fnShow(id) {
	var section = document.getElementById(id);
	if (section != null) {
		if (section.style.display == 'none') {
			section.style.display = '';
		}
	}
}
function fnHide(id) {
	var section = document.getElementById(id);
	if (section != null) {
		section.style.display = 'none';
	}
}
function fnToggleShowHide(id) {
	var section = document.getElementById(id);
	if (section != null) {
		if (section.style.display == 'none') {
			section.style.display = '';
		} else {
			section.style.display = 'none';
		}
	}
}

function updatePortfolioChart(type){
	var form = document.forms['chartData'];
	var portfolioValueDates = form.elements[type + ".portfolioValueDates"].value;
	var portfolioValues = form.elements[type + ".portfolioValues"].value;
	var indexValueDates = form.elements[type + ".indexValueDates"].value;
	var indexValues = form.elements[type + ".indexValues"].value;

	if (type == "since_start") {
		document.chart1.setParam("titleString", "Performance Since Start");
	} else {
		document.chart1.setParam("titleString", "Performance Month to Date");
	}

	document.chart1.setParam("replaceDataset0DateValues", portfolioValueDates);
	document.chart1.setParam("replaceDataset0YValues", portfolioValues);
	document.chart1.setParam("replaceDataset1DateValues", indexValueDates);
	document.chart1.setParam("replaceDataset1YValues", indexValues);
	document.chart1.setParam("dwellLabelDateFormat", "MMM d");
	document.chart1.updateParams();
}
function addListItems(formName, fromListName, toListName) {
	var form = document.forms[formName];
	var fromList = form.elements[fromListName];
	var toList = form.elements[toListName];
	moveItems(fromList, toList);
	selectAllItems(toList);
}
function removeListItems(formName, fromListName, toListName) {
	var form = document.forms[formName];
	var fromList = form.elements[fromListName];
	var toList = form.elements[toListName];
	moveItems(toList, fromList);
	selectAllItems(toList);
}
function selectAllItems(fromList)
{
  for(i = 0; i < fromList.length; i++)
  {
	if (fromList.options[i].value == "-1") {
		fromList.options[i].selected = false;
	} else {
		fromList.options[i].selected = true;
	}
  }
}
function moveItems(fromList, toList)
{
  for(i = 0; i < fromList.length; i++)
  {
	if (fromList.options[i].value == "-1") {
		fromList.options[i].selected = false;
	}
    if(fromList.options[i].selected)
    {
      //alert(fromList.options[i].text + " : " + fromList.options[i].value)
      toList.options[toList.length] = new Option(fromList.options[i].text, fromList.options[i].value)
    }
  }

  for(i = fromList.length-1; i >= 0; i--)
  {
    if(fromList.options[i].selected)
    {
      fromList.options[i] = null;
    }
  }

//  sortList(fromList)
//  sortList(toList)

  //history.go(0)
}

function trim(stringToTrim) {
	return stringToTrim.replace(/^\s+|\s+$/g,"");
}
function ltrim(stringToTrim) {
	return stringToTrim.replace(/^\s+/,"");
}
function rtrim(stringToTrim) {
	return stringToTrim.replace(/\s+$/,"");
}
function setMultivalue(formName, splitCharacter) {
   var form   = document.forms[formName];
   for (var i = 0; i < form.elements.length; i++) {
      var field = form.elements[i];
      if (field.type == 'select-multiple') {
         var result = "";         
         for (var j = 0;j < field.options.length;j++) {
            if (field.options[j].selected == true) {
               if (result == "") {
                  result = field.options[j].value;
               } else {
                  result = result + splitCharacter + field.options[j].value;
               }
               field.options[j].selected = false;
            }
         }
		 field.options[0].value = result;
		 field.options[0].selected = true;
//		 alert("here: "+ field.name + ", " + field.options[0].value);
      }
   }
}
function getCheckboxes(formName) {
   var result = ""
   var form   = document.forms[formName]

   for (var i = 0; i < form.elements.length; i++) {
      if (form.elements[i].type == 'checkbox') {
         result += form.elements[i].name 
         result += ";"
      }
   }

   return result
}
function getRadioButtons(formName)
{
   var result = ""
   var form   = document.forms[formName]

   for (var i = 0; i < form.elements.length; i++) {
      if (form.elements[i].type == 'radio') {
         result += form.elements[i].name
         result += ";"
      }
   }

   return result
}

function fnSetSelectedOption(formName, objName, objValue) {
   if (document.forms[formName].elements[objName] == null) {
      //No need for this alert to be in production! - pmq 05/22/2003
      //alert("SelectList.js (fnSetSelectValue): Cannot set select value for: " + objName + ", select box does not exist");
      return;
   }

   if (document.forms[formName].elements[objName].options == null) {
      //No need for this alert to be in production! - pmq 05/22/2003
      //alert("SelectList.js (fnSetSelectValue): Cannot set select value for: " + objName + ", select options do not exist");
      return;
   }

   var x;
   
   for (x=0;x < document.forms[formName].elements[objName].options.length;x++)
      // Select the option value or the option text if the value is not set
      if (document.forms[formName].elements[objName].options[x].value == objValue || 
          (document.forms[formName].elements[objName].options[x].value == "" && 
           document.forms[formName].elements[objName].options[x].text == objValue)) {
         document.forms[formName].elements[objName].options[x].selected = true;
      }
}

function getRadioButtonGroupValue(form, property_){
   var i;
   if (form[property_]!=null) {
      for ( i=0; i<form[property_].length; i++) {
         if ( form[property_][i].checked) {
            return form[property_][i].value;
         }
      }
   }
   // default (non selected)
   return null;
}

function isInteger(val) {
   var digits="1234567890";
   for (var i=0; i < val.length; i++) {
      if (digits.indexOf(val.charAt(i))==-1) {
         return false;
      }
   }
   return true;
}

// returns date of form mm/dd/yy or mm/dd/yyyy
// (yy -> 20yy). Returns 0 if it is not a date.
function getDateMmDdYyyy(val) {
   if (val==null) {
      return null;  // fail (bad format)
   }
   var dateParts = val.split("/");
   if (dateParts.length != 3) {
      return null;  // fail (bad format)
   }
   if (!isInteger(dateParts[0]) || !isInteger(dateParts[1]) || !isInteger(dateParts[2])) {
      return null;  // fail (bad format)
   }
   if (dateParts[0] < 1 || dateParts[0] > 12) {
      return null; // fail (bad month)
   }
   if (dateParts[1] < 1 || dateParts[1] > 31) {
      return null; // fail (bad day)
   }
   if (dateParts[2] >= 0  &&  dateParts[2] <= 50) {
      dateParts[2] = 2000 + eval(dateParts[2]);
   } else if (dateParts[2] > 50 && dateParts[2] < 100) {
      dateParts[2] = 1900 + eval(dateParts[2]);
   } else if (dateParts[2] < 1000  || dateParts[2] > 3000) {
      return null;  // fail (bad year)
   }
   var newdate =new Date(dateParts[2],dateParts[0]-1,dateParts[1],0,0,0);
   return newdate;
}

/** 
  * Encode a field name into vo notation.
  * 
  * Examples:
  *    vo(field)     => vo(field)
  *    vo(field[])   => vo(field[value-of-counter])
  *    vo(field.bar) => vo(field-bar)
  */
function encode(input, counter) {
   var result = input

   /** Replace [] with counter value */
   if (counter != null) {
      var replace = "[" + counter + "]"

      result = result.replace(/\[\]/g, replace)
   }

   /** Replace []. with {}- */
   result = result.replace(/\[/g, "{")
result = result.replace(/\]/g, "}")
result = result.replace(/\./g, "-")

return result
}

function fnGetSelectedOption(formName, objName){
if (document.forms[formName].elements[objName] == null){
alert("SelectList.js (fnSetSelectValue): Cannot set select value for: " + objName + ", select box does not exist");
return;
}

if (document.forms[formName].elements[objName].options == null){
alert("SelectList.js (fnSetSelectValue): Cannot set select value for: " + objName + ", select options do not exist");
return;
}

var x;

for (x=0;x < document.forms[formName].elements[objName].options.length;x++){
// Select the option value or the option text if the value is not set
if(document.forms[formName].elements[objName].options[x].selected == true){
return document.forms[formName].elements[objName].options[x].value;
}
}
}

// This function adds a value into select box
function fnRemoveAllSelectBoxOptions(formName, targetSelectBoxName){

var targetSelectBox = document.forms[formName].elements[targetSelectBoxName];
targetSelectBox.length = 0;
}

// This function adds a value into select box
function fnAddSelectOption(formName, targetSelectBoxName, value, text){
var targetSelectBox = document.forms[formName].elements[targetSelectBoxName];
var isAdded = false;

// Check to see if the option is already there
for (var i = 0; i < targetSelectBox.options.length; i++){
if (targetSelectBox.options[i].value == value &&
   targetSelectBox.options[i].text == text){              
return;
}
}

for (var i = 0; i < targetSelectBox.options.length; i++){
if (targetSelectBox.options[i].value == ''){
targetSelectBox.options[i].value = value;
targetSelectBox.options[i].text = text;                              
isAdded = true;
}
}

if (isAdded == false){
targetSelectBox.length = targetSelectBox.length + 1;
targetSelectBox.options[targetSelectBox.length - 1].value = value;
targetSelectBox.options[targetSelectBox.length - 1].text = text;
isAdded = true;
}
}
function addRequestParameter(jsp, name, value){
var separator = "&"
var index     = jsp.lastIndexOf("?");

if (index == -1)
separator = "?"

return jsp + separator + name + "=" + value
}

/* 
* Return true if the field is a radio button or checkbox and
* it is checked
*/
function isChecked(field){
return isCheckedWithValue(field, "true")
}

/* 
* Return true if the field is a radio button or checkbox and
* it is checked
*/
function isCheckedWithValue(field, value){
if (field.type == "checkbox")
return field.checked


if ((field.length > 0) && (field[0].type != "radio"))  
return false

for (i = 0; i < field.length; i++){
if (field[i].checked){
if (value == null)
return true

if (field[i].value == value)
return true
}
}

return false
}

/* 
 * Return true if the field is a radio button or checkbox and
 * it is checked. For radio buttons, this means any radio button
 * selected.
 */
function isAnyChecked(field){
return isCheckedWithValue(field, null)
}

function  setChecked(form, name, value, flag, skipIfChecked){
var field = form.elements[name]

if (! field){
/**alert('No field with ' + name + ' exists')*/
return
}

if (skipIfChecked && isAnyChecked(field))
return

if (field.length && (field.length > 0)) {
for (i = 0; i < field.length; i++)
if ((value == null) || (field[i].value == value)){
field[i].checked = flag
}
}
else{
field.checked = flag
}
} 

function setAllChecked(form, name, flag, skipIfChecked){
setChecked(form, name, null, flag, skipIfChecked)
}
function findIndex(input){
return findIndexInternal(input, "{", "}")
}

function findIndexInternal(input, startDelimiter, endDelimiter){
var start =  input.indexOf(startDelimiter)
if (start == -1)
return null

var end =  input.indexOf(endDelimiter)
if (end == -1)
return null

return input.substring(start + 1, end)
}

function findField(name){
var form  = getMainForm()
var field = encode(name)

return form.elements[field]
}
function clearNonHiddenFields(form){
for (var i = 0; i < form.elements.length;i++){
var field = form.elements[i]

if (isHiddenField(field))
continue

if (isRadioButton(field)){
clearRadioButton(field)
continue
}

field.value = ''
}  
}
/** Return true if this field is a radio button, false otherwise */
function isRadioButton(field){
return field.type != null && field.type == "radio"
}

/** Return true if this field is hidden, false otherwise */
function isHiddenField(field){
return field.type != null && field.type == "hidden"
}

/** Clear all the radio button values */
function clearRadioButton(field){
if (! isRadioButton(field))
return

for (var i = 0; i < field.length; i++){
field[i].value = ''
}
}
/** Remove the value from the named dropdown */
function removeFromDropdownByName(dropdownName, value){
var form = getMainForm()

removeFromDropdown(form.elements[dropdownName], value)
}

/** Remove the value from the dropdown. */
function removeFromDropdown(dropdown, value){
for (var i = 0; i < dropdown.options.length; i++){
if (dropdown.options[i].value == value)
dropdown.options[i] = null
}
}

/** Add the new value to the dropdown at the specified position. */
function addToDropdown(dropdown, text, value, position){
/** Already present? */
if (dropdown.options[position].value == value)
return

/** Move all existing options */
for (var i = dropdown.options.length - 1; i >= 0; i--){
if (position > i)
break

dropdown.options[i + 1] = new Option(dropdown.options[i].text, dropdown.options[i].value)
}

/** Add the new option */
dropdown.options[position] = new Option(text, value)
}

/** Form input button style **/
function hov(loc,cls){
   if(loc.className)
      loc.className=cls;
}
      
      
/**
 * FusionCharts: Flash Player detection and Chart embedding.
 * Version: 1.2 (1st November, 2007) - Added Player detection, New conditional fixes for IE, New FORM fixes for IE 
 * Version: 1.1 (29th June, 2007) - Added Player detection, New conditional fixes for IE
 *
 * Morphed from SWFObject (http://blog.deconcept.com/swfobject/) under MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 *
 */
if(typeof infosoftglobal == "undefined") var infosoftglobal = new Object();
if(typeof infosoftglobal.FusionChartsUtil == "undefined") infosoftglobal.FusionChartsUtil = new Object();
infosoftglobal.FusionCharts = function(swf, id, w, h, debugMode, registerWithJS, c, scaleMode, lang, detectFlashVersion, autoInstallRedirect){
	if (!document.getElementById) { return; }
	
	//Flag to see whether data has been set initially
	this.initialDataSet = false;
	
	//Create container objects
	this.params = new Object();
	this.variables = new Object();
	this.attributes = new Array();
	
	//Set attributes for the SWF
	if(swf) { this.setAttribute('swf', swf); }
	if(id) { this.setAttribute('id', id); }
	if(w) { this.setAttribute('width', w); }
	if(h) { this.setAttribute('height', h); }
	
	//Set background color
	if(c) { this.addParam('bgcolor', c); }
	
	//Set Quality	
	this.addParam('quality', 'high');
	
	//Add scripting access parameter
	this.addParam('allowScriptAccess', 'always');
	
	//Pass width and height to be appended as chartWidth and chartHeight
	this.addVariable('chartWidth', w);
	this.addVariable('chartHeight', h);

	//Whether in debug mode
	debugMode = debugMode ? debugMode : 0;
	this.addVariable('debugMode', debugMode);
	//Pass DOM ID to Chart
	this.addVariable('DOMId', id);
	//Whether to registed with JavaScript
	registerWithJS = registerWithJS ? registerWithJS : 0;
	this.addVariable('registerWithJS', registerWithJS);
	
	//Scale Mode of chart
	scaleMode = scaleMode ? scaleMode : 'noScale';
	this.addVariable('scaleMode', scaleMode);
	
	//Application Message Language
	lang = lang ? lang : 'EN';
	this.addVariable('lang', lang);
	
	//Whether to auto detect and re-direct to Flash Player installation
	this.detectFlashVersion = detectFlashVersion?detectFlashVersion:1;
	this.autoInstallRedirect = autoInstallRedirect?autoInstallRedirect:1;
	
	//Ger Flash Player version 
	this.installedVer = infosoftglobal.FusionChartsUtil.getPlayerVersion();
	
	if (!window.opera && document.all && this.installedVer.major > 7) {
		// Only add the onunload cleanup if the Flash Player version supports External Interface and we are in IE
		infosoftglobal.FusionCharts.doPrepUnload = true;
	}
}

infosoftglobal.FusionCharts.prototype = {
	setAttribute: function(name, value){
		this.attributes[name] = value;
	},
	getAttribute: function(name){
		return this.attributes[name];
	},
	addParam: function(name, value){
		this.params[name] = value;
	},
	getParams: function(){
		return this.params;
	},
	addVariable: function(name, value){
		this.variables[name] = value;
	},
	getVariable: function(name){
		return this.variables[name];
	},
	getVariables: function(){
		return this.variables;
	},
	getVariablePairs: function(){
		var variablePairs = new Array();
		var key;
		var variables = this.getVariables();
		for(key in variables){
			variablePairs.push(key +"="+ variables[key]);
		}
		return variablePairs;
	},
	getSWFHTML: function() {
		var swfNode = "";
		if (navigator.plugins && navigator.mimeTypes && navigator.mimeTypes.length) { 
			// netscape plugin architecture			
			// PHUC: CHANGED CODE BELOW, ADDED WMODE=TRANSPARENT to both "embed" and "params"
			swfNode = '<embed type="application/x-shockwave-flash" src="'+ this.getAttribute('swf') +'" wmode="transparent" width="'+ this.getAttribute('width') +'" height="'+ this.getAttribute('height') +'"  ';
			swfNode += ' id="'+ this.getAttribute('id') +'" name="'+ this.getAttribute('id') +'" ';
			var params = this.getParams();
			 for(var key in params){ swfNode += [key] +'="'+ params[key] +'" '; }
			var pairs = this.getVariablePairs().join("&");
			 if (pairs.length > 0){ swfNode += 'flashvars="wmode=transparent&amp;'+ pairs +'"'; }
			swfNode += '/>';
		} else { // PC IE			
			swfNode = '<object id="'+ this.getAttribute('id') +'" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'+ this.getAttribute('width') +'" height="'+ this.getAttribute('height') +'">';
			swfNode += '<param name="movie" value="'+ this.getAttribute('swf') +'" />';
			var params = this.getParams();
			for(var key in params) {
			 swfNode += '<param name="'+ key +'" value="'+ params[key] +'" />';
			}
			var pairs = this.getVariablePairs().join("&");			
			if(pairs.length > 0) {swfNode += '<param name="flashvars" value="'+ pairs +'" />';}
			swfNode += "</object>";
		}
		return swfNode;
	},
	setDataURL: function(strDataURL){
		//This method sets the data URL for the chart.
		//If being set initially
		if (this.initialDataSet==false){
			this.addVariable('dataURL',strDataURL);
			//Update flag
			this.initialDataSet = true;
		}else{
			//Else, we update the chart data using External Interface
			//Get reference to chart object
			var chartObj = infosoftglobal.FusionChartsUtil.getChartObject(this.getAttribute('id'));
			chartObj.setDataURL(strDataURL);
		}
	},
	setDataXML: function(strDataXML){
		//If being set initially
		if (this.initialDataSet==false){
			//This method sets the data XML for the chart INITIALLY.
			this.addVariable('dataXML',strDataXML);
			//Update flag
			this.initialDataSet = true;
		}else{
			//Else, we update the chart data using External Interface
			//Get reference to chart object
			var chartObj = infosoftglobal.FusionChartsUtil.getChartObject(this.getAttribute('id'));
			chartObj.setDataXML(strDataXML);
		}
	},
	setTransparent: function(isTransparent){
		//Sets chart to transparent mode when isTransparent is true (default)
		//When no parameter is passed, we assume transparent to be true.
		if(typeof isTransparent=="undefined") {
			isTransparent=true;
		}			
		//Set the property
		if(isTransparent)
			this.addParam('WMode', 'transparent');
		else
			this.addParam('WMode', 'Opaque');
	},
	
	render: function(elementId){
		//First check for installed version of Flash Player - we need a minimum of 8
		if((this.detectFlashVersion==1) && (this.installedVer.major < 8)){
			if (this.autoInstallRedirect==1){
				//If we can auto redirect to install the player?
				var installationConfirm = window.confirm("You need Adobe Flash Player 8 (or above) to view the charts. It is a free and lightweight installation from Adobe.com. Please click on Ok to install the same.");
				if (installationConfirm){
					window.location = "http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash";
				}else{
					return false;
				}
			}else{
				//Else, do not take an action. It means the developer has specified a message in the DIV (and probably a link).
				//So, expect the developers to provide a course of way to their end users.
				//window.alert("You need Adobe Flash Player 8 (or above) to view the charts. It is a free and lightweight installation from Adobe.com. ");
				return false;
			}			
		}else{
			//Render the chart
			var n = (typeof elementId == 'string') ? document.getElementById(elementId) : elementId;
			n.innerHTML = this.getSWFHTML();
			
			//Added <FORM> compatibility
			//Check if it's added in Mozilla embed array or if already exits 
			if(!document.embeds[this.getAttribute('id')] && !window[this.getAttribute('id')])
		      	window[this.getAttribute('id')]=document.getElementById(this.getAttribute('id')); 
				//or else document.forms[formName/formIndex][chartId]			
			return true;		
		}
	}
}

/* ---- detection functions ---- */
infosoftglobal.FusionChartsUtil.getPlayerVersion = function(){
	var PlayerVersion = new infosoftglobal.PlayerVersion([0,0,0]);
	if(navigator.plugins && navigator.mimeTypes.length){
		var x = navigator.plugins["Shockwave Flash"];
		if(x && x.description) {
			PlayerVersion = new infosoftglobal.PlayerVersion(x.description.replace(/([a-zA-Z]|\s)+/, "").replace(/(\s+r|\s+b[0-9]+)/, ".").split("."));
		}
	}else if (navigator.userAgent && navigator.userAgent.indexOf("Windows CE") >= 0){ 
		//If Windows CE
		var axo = 1;
		var counter = 3;
		while(axo) {
			try {
				counter++;
				axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash."+ counter);
				PlayerVersion = new infosoftglobal.PlayerVersion([counter,0,0]);
			} catch (e) {
				axo = null;
			}
		}
	} else { 
		// Win IE (non mobile)
		// Do minor version lookup in IE, but avoid Flash Player 6 crashing issues
		try{
			var axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
		}catch(e){
			try {
				var axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
				PlayerVersion = new infosoftglobal.PlayerVersion([6,0,21]);
				axo.AllowScriptAccess = "always"; // error if player version < 6.0.47 (thanks to Michael Williams @ Adobe for this code)
			} catch(e) {
				if (PlayerVersion.major == 6) {
					return PlayerVersion;
				}
			}
			try {
				axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
			} catch(e) {}
		}
		if (axo != null) {
			PlayerVersion = new infosoftglobal.PlayerVersion(axo.GetVariable("$version").split(" ")[1].split(","));
		}
	}
	return PlayerVersion;
}
infosoftglobal.PlayerVersion = function(arrVersion){
	this.major = arrVersion[0] != null ? parseInt(arrVersion[0]) : 0;
	this.minor = arrVersion[1] != null ? parseInt(arrVersion[1]) : 0;
	this.rev = arrVersion[2] != null ? parseInt(arrVersion[2]) : 0;
}
// ------------ Fix for Out of Memory Bug in IE in FP9 ---------------//
/* Fix for video streaming bug */
infosoftglobal.FusionChartsUtil.cleanupSWFs = function() {
	var objects = document.getElementsByTagName("OBJECT");
	for (var i = objects.length - 1; i >= 0; i--) {
		objects[i].style.display = 'none';
		for (var x in objects[i]) {
			if (typeof objects[i][x] == 'function') {
				objects[i][x] = function(){};
			}
		}
	}
}
// Fixes bug in fp9
if (infosoftglobal.FusionCharts.doPrepUnload) {
	if (!infosoftglobal.unloadSet) {
		infosoftglobal.FusionChartsUtil.prepUnload = function() {
			__flash_unloadHandler = function(){};
			__flash_savedUnloadHandler = function(){};
			window.attachEvent("onunload", infosoftglobal.FusionChartsUtil.cleanupSWFs);
		}
		window.attachEvent("onbeforeunload", infosoftglobal.FusionChartsUtil.prepUnload);
		infosoftglobal.unloadSet = true;
	}
}
/* Add document.getElementById if needed (mobile IE < 5) */
if (!document.getElementById && document.all) { document.getElementById = function(id) { return document.all[id]; }}
/* Add Array.push if needed (ie5) */
if (Array.prototype.push == null) { Array.prototype.push = function(item) { this[this.length] = item; return this.length; }}

/* Function to return Flash Object from ID */
infosoftglobal.FusionChartsUtil.getChartObject = function(id)
{
  var chartRef=null;
  if (navigator.appName.indexOf("Microsoft Internet")==-1) {
    if (document.embeds && document.embeds[id])
      chartRef = document.embeds[id]; 
	else
	chartRef  = window.document[id];
  }
  else {
    chartRef = window[id];
  }
  if (!chartRef)
	chartRef  = document.getElementById(id);
  
  return chartRef;
}
/* Aliases for easy usage */
var getChartFromId = infosoftglobal.FusionChartsUtil.getChartObject;
var FusionCharts = infosoftglobal.FusionCharts;

function drawChartOld(location, divToUse, width, height, uniqueID) {
	// All parameters are strings. uniqueID must be a string not used in any other call to
	// drawChart() on the same page.
	var myChart = new FusionCharts(location, uniqueID, width, height, "0", "0");
    myChart.render(divToUse);
}



function drawPieChart(dataUrl, divToUse, width, height) {
	var so = new SWFObject("flash/charts/ampie.swf", "ampie", width, height, "8", "#FFFFFF");
	so.addVariable("path", "flash/charts/");
	so.addVariable("settings_file", encodeURIComponent("flash/charts/pie_settings.xml"));
	so.addVariable("data_file", encodeURIComponent(dataUrl));
	so.write(divToUse);
}




function drawChart(dataUrl, divToUse, width, height) {
	var so = new SWFObject("flash/charts/amline.swf", "amline", width, height, "8", "#FFFFFF");
	so.addVariable("path", "flash/charts/");
	so.addVariable("settings_file", encodeURIComponent("flash/charts/profile_settings.xml"));
	so.addVariable("data_file", encodeURIComponent(dataUrl));

	so.write(divToUse);
}

/* Dynamically update stock analyses section below portfolio and watch list */
function updatePortfolioAnalysesDropdown(selectId, ajaxId, ajaxHeadingId, allUrl, filterUrl, symbol) {
    var selectObj = document.getElementById(selectId);
    var ajaxObj = document.getElementById(ajaxId);
    var ajaxHeadingObj = document.getElementById(ajaxHeadingId);
    
    if (symbol && symbol != '') {
        highlight(ajaxId, 500);
        for (var i = 0; i < selectObj.options.length; i++) {
            if (selectObj.options[i].value == symbol) {
                selectObj.selectedIndex = i;
            }
        }
        ajaxHeadingObj.innerHTML=' (Filtered By '+symbol+')'; 
        reloadSection(ajaxId, filterUrl, 'symbol='+symbol);
    } else if (selectObj.selectedIndex == 0) {
        highlight(ajaxId, 500); 
        ajaxHeadingObj.innerHTML=''; 
        reloadSection(ajaxId, allUrl, '');
    } else {
        highlight(ajaxId, 500); 
        ajaxHeadingObj.innerHTML=' (Filtered By '+selectObj.options[selectObj.selectedIndex].value+')'; 
        reloadSection(ajaxId, filterUrl, 'symbol='+selectObj.options[selectObj.selectedIndex].value);
    }
}

/* Used by user contest invitation page */
function combineUserGroupKeys(frm) {
    var userGroupKeys = frm.elements['userGroupKeys'];
    for (var i = 0; i < frm.elements.length; i++) {
        if (frm.elements[i].type == 'checkbox' &&
            frm.elements[i].name == "userGroupKey") {
            if (frm.elements[i].checked == true) {
                userGroupKeys.value += frm.elements[i].value + ",";
            }
        }
    }
}

function getURL(){
  var href = window.location.href; 
  
  if (href.indexOf("/theupdown/") >= 0) {
      href = href.substring(0, href.indexOf("/theupdown/") + 11);
  } else {
      href = href.substring(0, href.indexOf(href.indexOf("//")+2, "/") + 1);
  }
  
  return href;
}

function setCookie(name, value, expires) {
document.cookie = name + "=" + escape(value) + "; path=/" + ((expires == null) ? "" : "; expires=" + expires.toGMTString());
} 

function getCookie (name) {
    var dc = document.cookie;
    var cname = name + "=";

    if (dc.length > 0) {
      begin = dc.indexOf(cname);
      if (begin != -1) {
        begin += cname.length;
        end = dc.indexOf("", begin);
        if (end == -1) end = dc.length;
        return unescape(dc.substring(begin, end));
        }
      }
    return null;
}

function goto(uri) {
    document.location = document.getElementsByTagName('base')[0].href + uri;
}

function updatePortfolioView(type) {
    var exp = new Date();
    exp.setTime(exp.getTime() + (1000 * 60 * 60 * 24 * 365));

    if (type == 'total') {
        $('portfolioViewToday').style.display='none';
        $('portfolioViewTotal').style.display='block';
        setCookie('portfolio_view', 'total', exp);
        $('todayLink').style.fontWeight='normal';
        $('totalLink').style.fontWeight='bold';
    } else {
        $('portfolioViewToday').style.display='block';
        $('portfolioViewTotal').style.display='none';
        setCookie('portfolio_view', 'today', exp);
        $('todayLink').style.fontWeight='bold';
        $('totalLink').style.fontWeight='normal';
    }
}

function toggleFriend(event, item, expandedItem, userKey) { 
    var target;
    if (event.target) target = event.target;
    else if (event.srcElement) target = event.srcElement;
    if (target.nodeType == 3) // defeat Safari bug
        target = targ.parentNode;

    if (target != null && target.tagName == 'A' && (target.id == null || target.id.indexOf('toggle') < 0)) {
        return;
    }
    if (target != null && target.parentNode.tagName == 'A') {
        return;
    }
    
    var e = $(item);
    var e2 = $(expandedItem);
    if (e.style.display != 'none') {
        if (e2.innerHTML.length == 0) {
            reloadSectionSynchronously(expandedItem, 'ajax-friend-row.do', 'id='+userKey);
        }
        e.style.display = 'none';
        e2.style.display = 'block';
    } else {
        e2.style.display = 'none';
        e.style.display = 'block';
    }
}

function findSuggestions(element, displayId, uri, param) {
    abortAjax();
    if (element.value == '') {
        fnHide(displayId);
        return;
    }
    fnShow(displayId);
    reloadSectionSynchronously(displayId, uri, param + "=" + element.value);
}
function isNumeric(strString) {
   var strValidChars = "0123456789.-";
   var strChar;
   var blnResult = true;

   if (strString.length == 0) return false;

   //  test strString consists of valid characters listed above
   for (i = 0; i < strString.length && blnResult == true; i++)
      {
      strChar = strString.charAt(i);
      if (strValidChars.indexOf(strChar) == -1)
         {
         blnResult = false;
         }
      }
   return blnResult;
}


function JSFX_FloatDiv(id, sx, sy)
{
	var el=d.getElementById?d.getElementById(id):d.all?d.all[id]:d.layers[id];
	var px = document.layers ? "" : "px";
	window[id + "_obj"] = el;
	if(d.layers)el.style=el;
	el.cx = el.sx = sx;el.cy = el.sy = sy;
	el.sP=function(x,y){this.style.left=x+px;this.style.top=y+px;};
    var oy = el.offsetTop;

	el.floatIt=function()
	{
		var pX, pY;
		pX = (this.sx >= 0) ? 0 : ns ? innerWidth : 
		document.documentElement && document.documentElement.clientWidth ? 
		document.documentElement.clientWidth : document.body.clientWidth;
		pY = ns ? pageYOffset : document.documentElement && document.documentElement.scrollTop ? 
		document.documentElement.scrollTop : document.body.scrollTop;
        pY = pY - oy;
        if (pY < 0) pY = 0;
		if(this.sy<0) 
		pY += ns ? innerHeight : document.documentElement && document.documentElement.clientHeight ? 
		document.documentElement.clientHeight : document.body.clientHeight;

        var lastCy = this.cy;

		this.cx += (pX + this.sx - this.cx)/8;this.cy += (pY + this.sy - this.cy)/8;
		this.sP(this.cx, this.cy);

		setTimeout(this.id + "_obj.floatIt()", 40);
	}
	return el;
}

function recordOutboundLink(link, category, action) {
    _gat._getTrackerByName()._trackEvent(category, action);
    setTimeout('document.location = "' + link.href + '"', 100);
  }