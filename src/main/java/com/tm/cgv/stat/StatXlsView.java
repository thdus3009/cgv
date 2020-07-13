package com.tm.cgv.stat;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.tm.cgv.reservation.ReservationVO;

@Component("statXls")
public class StatXlsView extends AbstractXlsView {

    @Override
    protected void buildExcelDocument(
        Map<String, Object> model, Workbook workbook,
        HttpServletRequest request, HttpServletResponse response) throws Exception {

        response.setHeader("Content-Disposition", "attachment; filename=\"reservation.xls\"");
        
        //컨트롤러에서 받은 model값 
        List<ReservationVO> voList = (List<ReservationVO>)model.get("rows");

        //셀 스타일 지정
        CellStyle numberCellStyle = workbook.createCellStyle();
        DataFormat numberDataFormat = workbook.createDataFormat();
        numberCellStyle.setDataFormat(numberDataFormat.getFormat("#,##0"));
        
        //시트 생성(시트 제목)
        Sheet sheet = workbook.createSheet("sheet01");
        

        //vo의 크기 만큼 반복하며 값 지정
        for (int i = 0 ; i < voList.size() ; i++) {
            ReservationVO stat = voList.get(i);
            Row row = sheet.createRow(i);
            Cell cell0 = row.createCell(0);
            cell0.setCellValue(stat.getUid());


            Cell cell1 = row.createCell(1);
            cell1.setCellType(CellType.STRING);
            cell1.setCellValue(stat.getCinemaName());
            cell1.setCellStyle(numberCellStyle);

            Cell cell2 = row.createCell(2);
            cell2.setCellType(CellType.NUMERIC);
            cell2.setCellValue(stat.getCreateAt());
            cell2.setCellStyle(numberCellStyle);
        }

    }

}