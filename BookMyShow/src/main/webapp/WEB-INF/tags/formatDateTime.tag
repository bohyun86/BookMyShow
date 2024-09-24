<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ tag import="java.time.format.DateTimeFormatter" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="date" required="true" type="java.time.temporal.TemporalAccessor" %>
<%@ attribute name="pattern" required="true" type="java.lang.String" %>
<%= DateTimeFormatter.ofPattern(pattern).format(date) %>