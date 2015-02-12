package com.wellframe.action;

import java.io.*;
import java.util.*;
import java.text.*;
import java.net.URL;

import javax.servlet.http.*;

import org.apache.log4j.*;
import org.apache.struts.action.*;
import org.apache.struts.util.*;

import com.zoomlane.util.*;

import com.wellframe.dao.*;
import com.wellframe.util.*;

public abstract class BaseAction extends com.zoomlane.struts.action.BaseAction {
    private static Logger m_log = Config.getLogger(BaseAction.class);
    public Logger getLogger() {return m_log;}

    public void debug(String message) {
        super.debug(message);
        getLogger().debug(message);
    }

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            // Set the locale to english
            request.getSession().setAttribute(org.apache.struts.Globals.LOCALE_KEY, java.util.Locale.US);

            ActionForward forward = super.execute(mapping, form, request, response);

            return forward;
        } catch (Exception e) {
            getLogger().error("Critical action error: " + Util.getStackTrace(e));
            request.setAttribute("_actionError", e);
            throw e;
        }
    }


}
