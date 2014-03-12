<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!--TO BE SERIOUSLY REFACTORED!-->
    <xsl:template match="table/row">
	<xsl:element name="utilXmlFile">
	    <xsl:attribute name="Id">
		<xsl:value-of select="td[1]"/>
	    </xsl:attribute>
	    <xsl:attribute name="Action">setValue</xsl:attribute>
	    <xsl:attribute name="ElementPath"></xsl:attribute>
	    <xsl:attribute name="File">
		[<xsl:value-of select="td[3]"/>]<xsl:value-of select="td[4]"/>
	    </xsl:attribute>
	</xsl:element>
    </xsl:template>
</xsl:stylesheet>