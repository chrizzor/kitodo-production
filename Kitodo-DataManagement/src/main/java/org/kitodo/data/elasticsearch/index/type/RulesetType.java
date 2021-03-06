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

package org.kitodo.data.elasticsearch.index.type;

import java.util.LinkedHashMap;

import org.apache.http.HttpEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.nio.entity.NStringEntity;
import org.json.simple.JSONObject;
import org.kitodo.data.database.beans.Ruleset;

/**
 * Implementation of Ruleset Type.
 */
public class RulesetType extends BaseType<Ruleset> {

    @SuppressWarnings("unchecked")
    @Override
    public HttpEntity createDocument(Ruleset ruleset) {

        LinkedHashMap<String, String> orderedRulesetMap = new LinkedHashMap<>();
        orderedRulesetMap.put("title", ruleset.getTitle());
        orderedRulesetMap.put("file", ruleset.getFile());
        orderedRulesetMap.put("fileContent", "");
        JSONObject rulesetObject = new JSONObject(orderedRulesetMap);

        return new NStringEntity(rulesetObject.toJSONString(), ContentType.APPLICATION_JSON);
    }
}
