/*
 * (c) Kitodo. Key to digital objects e. V. <contact@kitodo.org>
 *
 * This file is part of the Kitodo project.
 *
 * It is licensed under GNU General Public License version 3 or later.
 *
 * For the full copyright and license information, please read the
 * GPL3-License.txt file that was distributed with this source code.
 */

package de.sub.goobi.config;

import de.sub.goobi.helper.FilesystemHelper;
import de.sub.goobi.helper.Helper;

import java.io.File;
import java.util.concurrent.TimeUnit;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.joda.time.Duration;
import org.kitodo.config.ConfigMain;

public class ConfigCore extends ConfigMain {
    private static final Logger myLogger = Logger.getLogger(ConfigCore.class);
    private static String imagesPath = null;

    /**
     * Request selected parameter from configuration.
     *
     * @return Parameter as String
     */
    public static String getParameter(String inParameter) {
        try {
            return getConfig().getString(inParameter);
        } catch (RuntimeException e) {
            myLogger.error(e);
            return "- keine Konfiguration gefunden -";
        }
    }

    /**
     * Request selected parameter with given default value from configuration.
     *
     * @return Parameter as String
     */
    public static String getParameter(String inParameter, String inDefaultIfNull) {
        try {
            return getConfig().getString(inParameter, inDefaultIfNull);
        } catch (RuntimeException e) {
            return inDefaultIfNull;
        }
    }

    /**
     * Request int-parameter from Configuration with default-value.
     *
     * @return Parameter as Int
     */
    public static int getIntParameter(String inParameter, int inDefault) {
        try {
            return getConfig().getInt(inParameter, inDefault);
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * den Pfad für die temporären Images zur Darstellung zurückgeben.
     */
    public static String getTempImagesPath() {
        return "/pages/imagesTemp/";
    }

    /**
     * den absoluten Pfad für die temporären Images zurückgeben.
     */
    public static String getTempImagesPathAsCompleteDirectory() {
        FacesContext context = FacesContext.getCurrentInstance();
        String filename;
        if (imagesPath != null) {
            filename = imagesPath;
        } else {
            HttpSession session = (HttpSession) context.getExternalContext().getSession(false);
            filename = session.getServletContext().getRealPath("/pages/imagesTemp") + File.separator;

            /* den Ordner neu anlegen, wenn er nicht existiert */
            try {
                FilesystemHelper.createDirectory(filename);
            } catch (Exception ioe) {
                myLogger.error("IO error: " + ioe);
                Helper.setFehlerMeldung(Helper.getTranslation("couldNotCreateImageFolder"), ioe.getMessage());
            }
        }
        return filename;
    }

    public static void setImagesPath(String path) {
        imagesPath = path;
    }

    /**
     * Request boolean parameter from configuration, default if missing: false.
     *
     * @return Parameter as String
     */
    public static boolean getBooleanParameter(String inParameter) {
        return getBooleanParameter(inParameter, false);
    }

    /**
     * Request boolean parameter from configuration.
     *
     * @return Parameter as String
     */
    public static boolean getBooleanParameter(String inParameter, boolean inDefault) {
        return getConfig().getBoolean(inParameter, inDefault);
    }

    /**
     * Request long parameter from configuration.
     *
     * @return Parameter as Long
     */
    public static long getLongParameter(String inParameter, long inDefault) {
        return getConfig().getLong(inParameter, inDefault);
    }

    /**
     * Request Duration parameter from configuration.
     *
     * @return Parameter as Duration
     */
    public static Duration getDurationParameter(String inParameter, TimeUnit timeUnit, long inDefault) {
        long duration = getLongParameter(inParameter, inDefault);
        return new Duration(TimeUnit.MILLISECONDS.convert(duration, timeUnit));
    }

    /**
     * Request String[]-parameter from Configuration.
     *
     * @return Parameter as String[]
     */
    public static String[] getStringArrayParameter(String inParameter) {
        return getConfig().getStringArray(inParameter);
    }
}
