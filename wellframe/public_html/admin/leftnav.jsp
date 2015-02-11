<HTML>
<BODY BGCOLOR="lightgrey">
<LINK REL="STYLESHEET" TYPE="text/css" HREF="../_css/javawriter.css">

<SCRIPT type="text/javascript" SRC="../js/menu.js">
</SCRIPT>
<SCRIPT type="text/javascript">
function findAll(action) {
    document.forms['findAll'].action.value=action;
    document.forms['findAll'].submit();
}
</SCRIPT>

<SCRIPT type="text/javascript" SRC="../_js/app_utils.js">
</SCRIPT>
<script type="text/javascript" src="../_js/tree_control.js">
</script>
<!-- Execution of the code that actually builds the specific tree -->
<SCRIPT TYPE="text/javascript">
  USETEXTLINKS = 1;
  var imageSettingsBug = new ImageSettings("icon_bug.gif", "icon_bug.gif",
                                         "minus_sign.gif", "minus_sign_last.gif",
                                         "plus_sign.gif", "plus_sign_last.gif",
                                         "node_connect.gif", "node_connect_last.gif",
                                         "indent_spacer.gif", "vertical_line.gif",
                                         "icon_bug.gif", "../images/tree_control/");
  var imageSettingsNote = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icon_note.gif", "../images/tree_control/");
  var imageSettingsMailTo = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icon_mailto.gif", "../images/tree_control/");
  var imageSettingsForm = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icon_form.gif", "../images/tree_control/");
  var imageSettingsText = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icon_text.gif", "../images/tree_control/");
  var imageSettingsDisk = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icon_disk.gif", "../images/tree_control/");
  var imageSettingsNews = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icon_news.gif", "../images/tree_control/");
  var imageSettingsGlobe = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icon_globe.gif", "../images/tree_control/");
  var imageSettingsToolbox = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icon_news.gif", "../images/tree_control/");
  var imageSettingsTools = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icon_tools.gif", "../images/tree_control/");
  var imageSettingsTools2 = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icons/tools2.gif", "../images/tree_control/");											
  var imageSettingsWrench = new ImageSettings("folder_opened.gif", "folder_closed.gif",
                                            "minus_sign.gif", "minus_sign_last.gif",
                                            "plus_sign.gif", "plus_sign_last.gif",
                                            "node_connect.gif", "node_connect_last.gif",
                                            "indent_spacer.gif", "vertical_line.gif",
                                            "icons/wrench.gif", "../images/tree_control/");
  
</script>
<SCRIPT TYPE="text/javascript" id="tree">
level_0 = gFld("<font class=leftnav>Admin</font>", "instructions.html", imageSettingsBug, "right")

level_1000 = insFld(level_0, gFld("<font class=leftnav>Manage Users</font>", "", imageSettingsNote));
insDoc(level_1000, gLnk("right", "<font class=leftnav>User</font>", "../base/displaySearchUser.do", imageSettingsText))

level_2000 = insFld(level_0, gFld("<font class=leftnav>Manage Events</font>", "", imageSettingsNote));
insDoc(level_2000, gLnk("right", "<font class=leftnav>Event</font>", "../base/displaySearchEvent.do", imageSettingsText))



</SCRIPT>
<script TYPE="text/javascript">
  initializeDocument()
</script>
<script TYPE="text/javascript" id="openNodes">
  clickOnNode(1);
</script>
<FORM NAME="menuInfo" ACTION="menu.htm" METHOD="post">
  <INPUT TYPE="hidden" NAME="level" VALUE=""><INPUT TYPE="hidden" NAME="object_name" VALUE="">
  <INPUT TYPE="hidden" NAME="action" VALUE="">
</FORM>


<FORM NAME="findAll" ACTION="" METHOD="post" TARGET="right">
</FORM>

</BODY>
</HTML>
