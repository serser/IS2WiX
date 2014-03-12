<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="/msi/table[@name='ISString']">
	<WixLocalization>
	    <xsl:for-each select="row">
		<String>
		    <xsl:attribute name="Id">
			<xsl:value-of select="td[1]" />
		    </xsl:attribute>
		    <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
		    <xsl:value-of select="td[3]" />	
		    <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
		</String>
	    </xsl:for-each>
	</WixLocalization>
    </xsl:template>
</xsl:stylesheet>