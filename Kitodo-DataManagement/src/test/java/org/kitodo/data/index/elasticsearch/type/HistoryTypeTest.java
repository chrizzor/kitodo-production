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

package org.kitodo.data.index.elasticsearch.type;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.util.EntityUtils;

import org.joda.time.LocalDate;

import org.junit.Test;

import org.kitodo.data.database.beans.History;
import org.kitodo.data.database.beans.Process;

import static org.junit.Assert.*;

/**
 * Test class for HistoryType.
 */
public class HistoryTypeTest {

    private static List<History> prepareData() {

        List<History> histories = new ArrayList<>();

        Process firstProcess = new Process();
        firstProcess.setId(1);

        Process secondProcess = new Process();
        secondProcess.setId(2);

        History firstHistory = new History();
        firstHistory.setId(1);
        firstHistory.setNumericValue(1.0);
        firstHistory.setStringValue("1");
        LocalDate localDate = new LocalDate(2017,1,14);
        firstHistory.setDate(localDate.toDate());
        firstHistory.setProcess(firstProcess);
        histories.add(firstHistory);

        History secondHistory = new History();
        secondHistory.setId(2);
        secondHistory.setNumericValue(2.0);
        secondHistory.setStringValue("2");
        secondHistory.setHistoryType(org.kitodo.data.database.helper.enums.HistoryType.grayScale);
        secondHistory.setProcess(secondProcess);
        histories.add(secondHistory);

        return histories;
    }

    @Test
    public void shouldCreateDocument() throws Exception {
        HistoryType historyType = new HistoryType();

        History history = prepareData().get(0);
        HttpEntity document = historyType.createDocument(history);
        String actual = EntityUtils.toString(document);
        //again ordering is not kept but it can be caused by EntityUtils
        String excepted = "{\"date\":\"Sat Jan 14 00:00:00 CET 2017\",\"numericValue\":\"1.0\",\"stringValue\":\"1\","
                + "\"process\":\"1\",\"type\":\"unknown\"}";
        assertEquals("History JSON string doesn't match to given plain text!", excepted, actual);

        history = prepareData().get(1);
        document = historyType.createDocument(history);
        actual = EntityUtils.toString(document);
        //again ordering is not kept but it can be caused by EntityUtils
        excepted = "{\"date\":\"null\",\"numericValue\":\"2.0\",\"stringValue\":\"2\",\"process\":\"2\","
                + "\"type\":\"grayScale\"}";
        assertEquals("History JSON string doesn't match to given plain text!", excepted, actual);
    }

    @Test
    public void shouldCreateDocuments() throws Exception {
        HistoryType historyType = new HistoryType();

        List<History> histories = prepareData();
        HashMap<Integer, HttpEntity> documents = historyType.createDocuments(histories);
        assertEquals("HashMap of documents doesn't contain given amount of elements!", 2, documents.size());
    }
}
