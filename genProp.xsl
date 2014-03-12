<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="/msi/table[@name='Property']">
	<xsl:variable name="secure">
	    <xsl:value-of select="row/td[text()='SecureCustomProperties']/following-sibling::td[1]" />
	</xsl:variable>
	<Product>
	    <xsl:for-each select="row">
		<xsl:choose>
		    <xsl:when test="td[1] != 'SecureCustomProperties'">
			<Property>
			    <xsl:attribute name="Id">
				<xsl:value-of select="td[1]" />
			    </xsl:attribute>
			    <xsl:if test="contains($secure, td[1])">
				<xsl:attribute name="Secure">yes</xsl:attribute>
			    </xsl:if>
			    <xsl:choose>
				<xsl:when test="starts-with(td[2],'##') ">!(loc.<xsl:value-of select="substring-before(substring-after(td[2], '##'), '##')"/>)</xsl:when>
				<xsl:otherwise>
				    <xsl:value-of select="td[2]"/>
				</xsl:otherwise>
			    </xsl:choose>
			</Property>
		    </xsl:when>
		</xsl:choose>		
	    </xsl:for-each>
	</Product>
    </xsl:template>
</xsl:stylesheet>