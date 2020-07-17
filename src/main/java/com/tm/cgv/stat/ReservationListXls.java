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

@Component("reservationListStat")
public class ReservationListXls extends AbstractXlsView {

    @Override
    protected void buildExcelDocument(
        Map<String, Object> model, Workbook workbook,
        HttpServletRequest request, HttpServletResponse response) throws Exception {

    	//헤더의 설정 변경
        response.setHeader("Content-Disposition", "attachment;filename=\"reservation.xls\"");
        
        //컨트롤러에서 받은 model값 
        List<ReservationVO> voList = (List<ReservationVO>)model.get("reservationList");

        //셀 스타일 지정
        CellStyle numberCellStyle = workbook.createCellStyle();
        
        DataFormat numberDataFormat = workbook.createDataFormat();
        numberCellStyle.setDataFormat(numberDataFormat.getFormat("#,##0"));
        
        //시트 생성(시트 제목)
        Sheet sheet = workbook.createSheet("sheet01");

        //vo의 크기 만큼 반복하며 각 셀에 값 지정
        //reservationVO : num,uid,filmType,cinemaName,theaterName,seats,common,teenager,preference,totalPrice,creatAt
        //movieInfoVO : title,runTime
        //movieTimeVO : screenTime,screenDate,
        //paymentVO : imp_uid,merchant_uid,pg,pay_method,apply_num
        
        for (int i = 0 ; i < voList.size() ; i++) {
            ReservationVO stat = voList.get(i);
            Row row = sheet.createRow(i);
            
            Cell cell0 = row.createCell(0);
            cell0.setCellValue(stat.getNum());

            Cell cell1 = row.createCell(1);
            cell1.setCellValue(stat.getUid());

            Cell cell2 = row.createCell(2);
            cell2.setCellValue(stat.getFilmType());
            
            Cell cell3 = row.createCell(3);
            cell3.setCellValue(stat.getCinemaName());

            Cell cell4 = row.createCell(4);
            cell4.setCellValue(stat.getTheaterName());

            Cell cell5 = row.createCell(5);
            cell5.setCellValue(stat.getSeats());
            
            Cell cell6 = row.createCell(6);
            cell6.setCellValue(stat.getCommon());
            
            Cell cell7 = row.createCell(7);
            cell7.setCellValue(stat.getTeenager());
            
            Cell cell8 = row.createCell(8);
            cell8.setCellValue(stat.getPreference());
            
            Cell cell9 = row.createCell(9);
            cell9.setCellType(CellType.NUMERIC);
            cell9.setCellValue(stat.getTotalPrice());
            cell9.setCellStyle(numberCellStyle);
            
            Cell cell10 = row.createCell(10);
            cell10.setCellValue(stat.getCreateAt());
            
            //movieInfoVO
            Cell cell11 = row.createCell(11);
            cell11.setCellValue(stat.getMovieInfoVO().getTitle());
            
            Cell cell12 = row.createCell(12);
            cell12.setCellValue(stat.getMovieInfoVO().getRuntime());
            
            //MovieTimeVO
            Cell cell13 = row.createCell(13);
            cell13.setCellValue(stat.getMovieTimeVO().getScreenTime());
            
            Cell cell14 = row.createCell(14);
            cell14.setCellValue(stat.getMovieTimeVO().getScreenDate());
            
            //PaymentVO
            Cell cell15 = row.createCell(15);
            cell15.setCellValue(stat.getPaymentVO().getImp_uid());
            
            Cell cell16 = row.createCell(16);
            cell16.setCellValue(stat.getPaymentVO().getMerchant_uid());
            
            Cell cell17 = row.createCell(17);
            cell17.setCellValue(stat.getPaymentVO().getPg());
            
            Cell cell18 = row.createCell(18);
            cell18.setCellValue(stat.getPaymentVO().getPay_method());
            
            Cell cell19 = row.createCell(19);
            cell19.setCellValue(stat.getPaymentVO().getApply_num());
            
            
        }

    }

}