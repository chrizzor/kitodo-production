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

package org.kitodo.api.generator;

public interface GeneratorInterface {

    /**
     *
     * @param namespace
     *            the URN-namespace (usually unique within an organisation).
     * @param identifier
     *            the identifier of the specific object to which the URN points.
     * @return a valid URN (including check digit).
     */
    String generateUnifiedResourceName(String namespace, String identifier);

}
