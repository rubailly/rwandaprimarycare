<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="resources/touchscreenHeader.jsp"%>

<% org.openmrs.Location workstationLocation = PrimaryCareBusinessLogic.getLocationLoggedIn(session); %>


<%@page import="org.openmrs.module.rwandaprimarycare.PrimaryCareBusinessLogic"%>
<c:set var="logout"><spring:message code="rwandaprimarycare.logout"/></c:set>
<div style="float: right;"><touchscreen:button label="${logout}" href="${pageContext.request.contextPath}/module/rwandaprimarycare/login/logout.form"/></div>
<div style="background-color: #f0f0f0; border: 1px black solid; padding: 5px">
	<span style="font-size: 2em"><spring:message code="rwandaprimarycare.touchscreen.hello"/> ${authenticatedUser.personName.givenName}.</span> <br/>
	<span style="font-size: 1.5em"><spring:message code="rwandaprimarycare.touchscreen.loggedInAs"/>  <i>${authenticatedUser}</i> <% if (workstationLocation != null) { %><spring:message code="rwandaprimarycare.touchscreen.at"/> <i><%= workstationLocation.getName() %></i><% } %>.</span>
</div>

<div align="center">
	<br/>
	
	<c:set var="searchByNameStr"><spring:message code="rwandaprimarycare.touchscreen.searchByName"/></c:set>
	<c:set var="searchByIdStr"><spring:message code="rwandaprimarycare.touchscreen.searchById"/></c:set>
	<c:set var="offlinePrinting"><spring:message code="rwandaprimarycare.offlineBarcodePrinting"/></c:set>
	<c:set var="bulkIdGeneration"><spring:message code="rwandaprimarycare.bulkIdGeneration"/></c:set>
	<c:set var="myPropertiesStr"><spring:message code="rwandaprimarycare.touchscreen.myProperties"/></c:set>
	<c:set var="goToDiagnosisApp"><spring:message code="rwandaprimarycare.goToDiagnosisApplication"/></c:set>
	
	<c:set var="buy"><spring:message code="rwandaprimarycare.touchscreen.buy"/></c:set>	
	<c:set var="sell"><spring:message code="rwandaprimarycare.touchscreen.sell"/></c:set>	
	<c:set var="review"><spring:message code="rwandaprimarycare.touchscreen.review"/></c:set>
	
	
	<%-- <touchscreen:button label="${searchByIdStr}" href="findPatientById.form"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<touchscreen:button label="${searchByNameStr}" href="findPatientByName.form"/>

	<openmrs:hasPrivilege privilege="Print Registration Barcodes Offline">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<touchscreen:button label="${offlinePrinting}" href="prePrintBarcodes.form"/>
	</openmrs:hasPrivilege>
	
	
	<openmrs:hasPrivilege privilege="Generate Bulk Primary Care Ids All Locations">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<touchscreen:button label="${bulkIdGeneration}" href="bulkGenerateIds.form"/>
	</openmrs:hasPrivilege> --%>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<touchscreen:button label="${buy}" href="buy.form"/>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<touchscreen:button label="${sell}" href="sell.form"/>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<touchscreen:button label="${review}" href="review.form"/>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<touchscreen:button label="${myPropertiesStr}" href="myProperties.form"/>
	
	<!-- this is here so that providers who see the diagnosis capture app can jump between registration and diagnoses -->
	<c:if test="${!empty showDiagnosisLink}">
		<openmrs:hasPrivilege privilege="Diagnosis Capture">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<touchscreen:button label="${goToDiagnosisApp}" cssClass="dark" href="${pageContext.request.contextPath}/module/diagnosiscapturerwanda/diagnosisHomepage.list"/>
		</openmrs:hasPrivilege>
	</c:if>
	<br/>
	<br/>
	<br/>
	<br/>
	<c:if test="${fn:length(recentlyViewedPatients.list) > 0}">
		<c:set var="recentPatientsStr"><spring:message code="rwandaprimarycare.touchscreen.recentPatients"/></c:set>
		<touchscreen:patientList patients="${recentlyViewedPatients.list}" title="${recentPatientsStr}" maxResults="5"/>
	</c:if>
</div>

<%@ include file="resources/touchscreenFooter.jsp"%>