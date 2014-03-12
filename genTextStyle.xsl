<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="/msi/table[@name='TextStyle']">
	<UI>
	    <xsl:for-each select="row">
		<TextStyle>
		    <xsl:attribute name="Id">
			<xsl:value-of select="td[1]" />
		    </xsl:attribute>
		    <xsl:attribute name="FaceName">
			<xsl:value-of select="td[2]" />
		    </xsl:attribute>
		    <xsl:attribute name="Size">
			<xsl:value-of select="td[3]" />
		    </xsl:attribute>
		    <xsl:if test="td[4] != ''">
			<xsl:attribute name="Blue">
			    <xsl:value-of select="floor(td[4] div 65536) " />
			</xsl:attribute>
			<xsl:attribute name="Green">
			    <xsl:value-of select="floor((td[4] mod 65536 - (td[4] mod 256) ) div 256)" />
			</xsl:attribute>
			<xsl:attribute name="Red">
			    <xsl:value-of select="td[4] mod 256" />
			</xsl:attribute>
		    </xsl:if>
		    <xsl:if test="td[5] = 1">
			<xsl:attribute name="Bold">yes</xsl:attribute>
		    </xsl:if>
		    <xsl:if test="td[5] = 2">
			<xsl:attribute name="Italic">yes</xsl:attribute>
		    </xsl:if>
		    <xsl:if test="td[5] = 4">
			<xsl:attribute name="Underline">yes</xsl:attribute>
		    </xsl:if>
		    <xsl:if test="td[5] = 8">
			<xsl:attribute name="Strike">yes</xsl:attribute>
		    </xsl:if>
		</TextStyle>
	    </xsl:for-each>
	</UI>
    </xsl:template>
</xsl:stylesheet>