/*
 * OpenURP, Agile University Resource Planning Solution.
 *
 * Copyright © 2014, The OpenURP Software.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful.
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
/**
 *
 */
package org.openurp.basic.edu.base.code.service;

import org.beangle.commons.dao.EntityDao;
import org.openurp.edu.base.code.model.ExternExamTime;

/**
 * @author zhouqi 2017年12月13日
 *
 */
public class ExternExamTimeImporter extends IdentificationAppBaseCodeImporterListener<ExternExamTime> {

  public ExternExamTimeImporter(EntityDao entityDao) {
    super(entityDao);
  }

  @Override
  protected boolean beforeItemStart() {
    return validaty.checkTemplate("code", "name", "beginOn", "endOn");
  }
}
