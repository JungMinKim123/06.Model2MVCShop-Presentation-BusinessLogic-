<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 
<%@page import="java.util.*"%>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.service.domain.Product"%>
<%//@page import="com.model2.mvc.service.purchase.vo.PurchaseVO"%>
<%@page import="com.model2.mvc.common.Search"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<Product> list =(List<Product>)request.getAttribute("list");
	Search search=(Search)request.getAttribute("search");
	Page resultPage = (Page)request.getAttribute("resultPage");
	//Purchase pur = new Purchase();
	String menu = (String)request.getAttribute("menu");
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
%>
--%>

<html>
<head>
<title>惑前 格废炼雀</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

	function fncGetUserList(currentPage) {
		
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

			<c:if test="${ menu=='manage' }">
		<form name="detailForm" action="/listProduct.do?menu=${ menu }"
			method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">惑前 包府</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					
					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">
							<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" } >惑前疙</option>
					</select> <input type="text" name="searchKeyword" value="${ search.searchKeyword }" class="ct_input_g"
						style="width: 200px; height: 19px" /></td>
							
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="javascript:fncGetUserList('1');">八祸</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">傈眉 ${ resultPage.totalCount } 扒荐, 泅犁 ${ resultPage.currentPage } 其捞瘤
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">惑前疙</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">啊拜</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">殿废老</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">泅犁惑怕</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<c:set var="i" value="0"/>
				<c:forEach var="prod" items="${list}">
					<c:set var='i' value="${i+1}"/> 
				<tr class="ct_list_pop">
					<td align="center">${ i }</td>
					<td></td>

					<td align="left"><a
						href="/updateProductView.do?prodNo=${ prod.prodNo }&menu=${ menu }">${ prod.prodName }</a></td>

					<td></td>
					<td align="left">${ prod.price }</td>
					<td></td>
					<td align="left">${ prod.manuDate }</td>
					<td></td>
					<td align="left"><c:if test="${ ! empty prod.proTranCode }">
									 <c:if test="${ fn:trim(prod.proTranCode)==1}">
									 	备概肯丰 <a href="/updateTranCode.do?prodNo=${ prod.prodNo }&tranCode=2">硅价窍扁</a>
									 </c:if>
									 <c:if test="${ fn:trim(prod.proTranCode)==2}">
									 	硅价吝
									 </c:if>
									 <c:if test="${ fn:trim(prod.proTranCode)==3}">
									 	硅价肯丰
									 </c:if>
									 </c:if>
									 <c:if test="${ empty prod.proTranCode }">
									 	魄概吝
									 </c:if>
					</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				</c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
						<input type= "hidden" id = "currentPage" name="currentPage" value = ""/>
					
					<jsp:include page="../common/pageNavigator.jsp"/>
					
					</td>
				</tr>
			</table>
			<!--  其捞瘤 Navigator 场 -->

		</form>
		
		</c:if>
		<c:if test="${ menu=='search'}">
		<form name="detailForm" action="/listProduct.do?menu=${ menu }"
			method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">惑前 格废炼雀</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">
							<option value="1" ${ !empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" } >惑前疙</option>
					</select> <input type="text" name="searchKeyword" value="${ search.searchKeyword }" class="ct_input_g"
						style="width: 200px; height: 19px" /></td>
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="javascript:fncGetUserList('1');">八祸</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">傈眉 ${ resultPage.totalCount } 扒荐, 泅犁 ${ resultPage.currentPage } 其捞瘤
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">惑前疙</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">啊拜</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">殿废老</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">泅犁惑怕</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				<c:set var="i" value="0" />
				<c:forEach var="prod" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr class="ct_list_pop">
					<td align="center">${ i }</td>
					<td></td>

					<td align="left"><a
						href="/getProduct.do?prodNo=${ prod.prodNo }&menu=${ menu }">${ prod.prodName }</a></td>

					<td></td>
					<td align="left">${ prod.price }</td>
					<td></td>
					<td align="left">${ prod.manuDate }</td>
					<td></td>
					<td align="left"><c:if test="${ !empty prod.proTranCode }">
									 <c:if test="${ fn:trim(prod.proTranCode)==3 }">
											犁绊绝澜
									</c:if>
									 <c:if test="${ fn:trim(prod.proTranCode) !=3 }">
										犁绊绝澜
									</c:if>
									</c:if>
									<c:if test="${ empty prod.proTranCode }">
										魄概吝
									</c:if>
					</td>
				</tr>
				<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				</c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
						<jsp:include page="../common/pageNavigator.jsp" />
						
					</td>
				</tr>
			</table>
			<!--  其捞瘤 Navigator 场 -->
			</c:if>
		</form>
	</div>

</body>
</html>
