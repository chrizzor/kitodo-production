package org.goobi.production.flow.helper;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.goobi.production.flow.statistics.hibernate.IEvaluableFilter;
import org.goobi.production.flow.statistics.hibernate.UserDefinedFilter;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import de.sub.goobi.Beans.Prozess;
import de.sub.goobi.helper.Helper;

public class SearchResultGeneration {

	private String filter = "";
	private boolean showClosedProcesses = false;
	private boolean showArchivedProjects = false;

	public SearchResultGeneration(String filter, boolean showClosedProcesses, boolean showArchivedProjects) {
		this.filter = filter;
		this.showClosedProcesses = showClosedProcesses;
		this.showArchivedProjects = showArchivedProjects;
	}

	public HSSFWorkbook getResult() {
		// long start = System.currentTimeMillis();
		IEvaluableFilter myFilteredDataSource = new UserDefinedFilter(this.filter);
		Criteria crit = myFilteredDataSource.getCriteria();
		crit.add(Restrictions.eq("istTemplate", Boolean.valueOf(false)));
		if (!this.showClosedProcesses) {
			crit.add(Restrictions.not(Restrictions.eq("sortHelperStatus", "100000000")));
		}
		if (!this.showArchivedProjects) {
			crit.createCriteria("projekt", "proj");
			crit.add(Restrictions.not(Restrictions.eq("proj.projectIsArchived", true)));
		} else {
			crit.createCriteria("projekt", "proj");
		}
		Order order = Order.asc("titel");
		crit.addOrder(order);
		// 500 results for testing
		@SuppressWarnings("unchecked")
		List<Prozess> pl = crit.setFirstResult(0).setMaxResults(Integer.MAX_VALUE).list();

		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("Search results");
		HSSFRow row0 = sheet.createRow(0);
		HSSFCell headercell0 = row0.createCell(0);
		headercell0.setCellValue(Helper.getTranslation("title"));
		HSSFCell headercell1 = row0.createCell(1);
		headercell1.setCellValue(Helper.getTranslation("ID"));
		HSSFCell headercell2 = row0.createCell(2);
		headercell2.setCellValue(Helper.getTranslation("Datum"));
		HSSFCell headercell3 = row0.createCell(3);
		headercell3.setCellValue(Helper.getTranslation("CountImages"));
		HSSFCell headercell4 = row0.createCell(4);
		headercell4.setCellValue(Helper.getTranslation("CountMetadata"));
		HSSFCell headercell5 = row0.createCell(5);
		headercell5.setCellValue(Helper.getTranslation("Project"));
		HSSFCell headercell6 = row0.createCell(6);
		headercell6.setCellValue(Helper.getTranslation("Status"));

		int rowcounter = 1;
		for (Prozess p : pl) {
			HSSFRow row = sheet.createRow(rowcounter);
			HSSFCell cell0 = row.createCell(0);
			cell0.setCellValue(p.getTitel());
			HSSFCell cell1 = row.createCell(1);
			cell1.setCellValue(p.getId());
			HSSFCell cell2 = row.createCell(2);
			cell2.setCellValue(p.getErstellungsdatum().toGMTString());
			HSSFCell cell3 = row.createCell(3);
			cell3.setCellValue(p.getSortHelperImages());
			HSSFCell cell4 = row.createCell(4);
			cell4.setCellValue(p.getSortHelperDocstructs());
			HSSFCell cell5 = row.createCell(5);
			cell5.setCellValue(p.getProjekt().getTitel());

			HSSFCell cell6 = row.createCell(6);
			// if (p.getFortschritt1()==100)
			// cell6.setCellValue(p.getFortschritt1() + "% of " +
			// p.getSchritteSize() + " steps");
			cell6.setCellValue(p.getSortHelperStatus().substring(0, 3) + " / " + p.getSortHelperStatus().substring(3, 6) + " / "
					+ p.getSortHelperStatus().substring(6));
//			 cell6.setCellValue(p.getSchritteSize());

			rowcounter++;
		}
		// long end = System.currentTimeMillis();
		// System.out.println(end - start);
		return wb;
	}
}