package com.wellframe.util;

import java.util.*;
import java.io.*;
import java.math.*;
import java.net.*;
import java.sql.ResultSet;
import java.text.*;

import javax.servlet.http.*;
import javax.servlet.jsp.*;

import javax.mail.internet.MimeMessage;

import org.jasen.JasenScanner;
import org.jasen.core.engine.Jasen;
import org.jasen.error.EmptyErrorHandler;
import org.jasen.error.ErrorHandlerBroker;
import org.jasen.event.JasenScanListener;
import org.jasen.interfaces.JasenScanResult;

import org.apache.log4j.Logger;
import org.apache.commons.beanutils.*;
import org.apache.struts.util.*;

import com.zoomlane.database.*;
import com.zoomlane.util.*;

import com.wellframe.dao.*;

public class AppUtil {
    private static Logger m_log = Config.getLogger(AppUtil.class);

    public static void main(String[] arg) {
        try {
            /*
            String email = Util.readFileIntoString("../doc/spam/00001.7848dde101aa985090474a91ec93fcf0");
            System.out.println("TEST: " + AppUtil.checkSpam(email));
            */
            testMessages("../doc/spam", 10);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            // Close the scanner
            JasenScanner.getInstance().destroy();
        }

    }

    public static void testMessages(String directory, int maxFilesToProcess) throws Exception {
        File spamDir = new File(directory);
        String[] files = spamDir.list();
        System.out.println("Total Spam Files");
        for (int i = 0;i < files.length;i++) {
            if (i > maxFilesToProcess) break;

            String fileName = files[i];
            System.out.println("Scanning: " + (i + 1) + " -> " + fileName);
            long start = System.currentTimeMillis();
            String result = AppUtil.checkSpam(Util.readFileIntoString(directory + "/" + fileName));
            System.out.println("      -> " + (System.currentTimeMillis() - start) + " ms -> " + result);
        }
    }

    protected static JasenScanner m_jasenScanner;
    /**
     * This method is not synchronized for performance
     */
    public static JasenScanner getJasenScanner() throws Exception {
        if (m_jasenScanner != null) return m_jasenScanner;
        initJasenScanner();
        return m_jasenScanner;
    }

    /**
     * This method is synchronized in order to be thread safe.  The scanner will only be synchronized once
     **/
    private static synchronized JasenScanner initJasenScanner() throws Exception {
        if (m_jasenScanner != null) return m_jasenScanner;

        System.out.println ("Initialising jASEN ...");

        m_jasenScanner = JasenScanner.getInstance();
        m_jasenScanner.init();

        // Optionally specify an error handler
        ErrorHandlerBroker.getInstance().setErrorHandler(new EmptyErrorHandler());

        return m_jasenScanner;
    }

    public static String checkSpam(String message) throws Exception {
        InputStream inputStream = new ByteArrayInputStream(message.getBytes());
        MimeMessage mm = new MimeMessage(null, inputStream);

        // Scan the message
        JasenScanner jasenScanner = AppUtil.getJasenScanner();
        JasenScanResult scanResult = jasenScanner.scan(mm);

        // Get the probability of spam
        //System.out.println ("Spam Probability: " + scanResult.getProbability());

        String result;
        if (scanResult.getProbability() >= 0.9) {
            result = "Most likely SPAM";
        } else if (scanResult.getProbability() <= 0.1) {
            result = "Most likely HAM";
        } else {
            result = "Can't be sure.  Borderline case";
        }
        return result;
    }

}
