<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/msi/table[@name='ActionText']">
	<UI>
	    <xsl:for-each select="row">
		<ProgressText>
		    <xsl:attribute name="Action">
			<xsl:value-of select="td[1]"/>
		    </xsl:attribute>
		    <xsl:if test="td[3] != ''">
			<xsl:attribute name="Template">
			    <xsl:value-of select="'!(loc.'"/>
			    <xsl:value-of select="substring-before(substring-after(td[3], '##'), '##')"/>
			    <xsl:value-of select="')'"/>
			</xsl:attribute>
		    </xsl:if>
		    <xsl:value-of select="'!(loc.'"/>
		    <xsl:value-of select="substring-before(substring-after(td[2], '##'), '##')"/>
		    <xsl:value-of select="')'"/>
		</ProgressText>
	    </xsl:for-each>
	</UI>
    </xsl:template>
</xsl:stylesheet>