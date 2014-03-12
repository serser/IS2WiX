<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="msi/table[@name='Feature']">
	<Fragment>
	    <xsl:for-each select="row">
		<xsl:if test="td[2] != ''">
		    <Feature>
			<xsl:attribute name="Id">
			    <xsl:value-of select="td[1]" />
			</xsl:attribute>
			<xsl:if test="td[3] != ''">
			    <xsl:attribute name="Title">!(loc.<xsl:value-of select="substring-before(substring-after(td[3],'##'),'##')" />)</xsl:attribute>
			</xsl:if>
			<xsl:if test="td[4] != ''">
			    <xsl:attribute name="Description">!(loc.<xsl:value-of select="substring-before(substring-after(td[4],'##'),'##')" />)</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="Display">
			    <xsl:value-of select="td[5]" />
			</xsl:attribute>
			<xsl:attribute name="Level">
			    <xsl:value-of select="td[6]" />
			</xsl:attribute>
			<xsl:attribute name="ConfigurableDirectory">
			    <xsl:value-of select="td[7]" />
			</xsl:attribute>
		    </Feature>
		</xsl:if>
	    </xsl:for-each>
	</Fragment>
    </xsl:template>
</xsl:stylesheet>