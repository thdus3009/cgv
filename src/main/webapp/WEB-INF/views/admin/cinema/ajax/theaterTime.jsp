<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	

		  	      
<c:forEach items="${totalInfo}" var="i">
	<%-- timetable.addEvent('${i[0]}', '${i[1]}', new Date(${i[2]},${i[3]},${i[4]},${i[5]},${i[6]}), new Date(${i[7]},${i[8]},${i[9]},${i[10]},${i[11]});
 --%>
 ${i[0]}
  ${i[1]}
   ${i[2]}
    ${i[3]}
     ${i[4]}
      ${i[5]}
       ${i[6]}
        ${i[7]}
         ${i[8]}
          ${i[9]}
          ${i[10]}
          ${i[11]}
          
</c:forEach>