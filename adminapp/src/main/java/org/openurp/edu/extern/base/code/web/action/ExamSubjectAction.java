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
package org.openurp.edu.extern.base.code.web.action;

import org.beangle.commons.entity.Entity;
import org.openurp.edu.extern.code.model.ExamCategory;
import org.openurp.edu.extern.code.model.ExamSubject;

/**
 * @author zhouqi 2018年11月21日
 */
public class ExamSubjectAction extends ExternBaseCodeAction {

  protected String getEntityName() {
    return ExamSubject.class.getName();
  }

  protected void indexSetting() {
    put("examCategories", codeService.getCodes(ExamCategory.class));
  }

  protected void editSetting(Entity<?> entity) {
    indexSetting();
  }
}
