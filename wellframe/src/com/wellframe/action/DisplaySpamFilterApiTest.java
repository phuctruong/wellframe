package com.wellframe.action;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.log4j.*;
import org.apache.struts.action.*;
import org.apache.struts.util.*;

import com.google.gson.*;
import com.wellframe.gson.request.*;
import com.wellframe.gson.response.*;

import com.wellframe.dao.*;
import com.wellframe.util.*;
import com.zoomlane.util.*;
import com.zoomlane.util.jsp.*;
import com.zoomlane.struts.form.*;

public class DisplaySpamFilterApiTest extends BaseAction {

    private static Logger m_log = Config.getLogger(DisplaySpamFilterApiTest.class);
    public Logger getLogger() {return m_log;}

    public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String spamDir = Config.getProperty("spam.dir");
        String[] spamFiles = new File(spamDir).list();
        request.setAttribute("spamSample", Util.readFileIntoString(spamDir + "/" + Util.randomText(spamFiles)));

        String hamDir = Config.getProperty("ham.dir");
        String[] hamFiles = new File(hamDir).list();
        request.setAttribute("hamSample", Util.readFileIntoString(hamDir + "/" + Util.randomText(hamFiles)));

        return mapping.findForward("DISPLAY_PAGE");
    }

}

