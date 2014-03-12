<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="/msi/table[@name='Shortcut']">

	<Fragment>
	<xsl:for-each select="row">
	    <Component>
		<xsl:attribute name="Id">
		    <xsl:value-of select="td[4]"/>
		</xsl:attribute>
		<Shortcut>
		    <xsl:attribute name="Id">
			<xsl:value-of select="td[1]"/>
		    </xsl:attribute>
		    <xsl:attribute name="Directory">
			<xsl:value-of select="td[2]"/>
		    </xsl:attribute>

		    <xsl:attribute name="Name">!(loc.<xsl:value-of select="substring-before(substring-after(td[3], '##'), '##')"/>)</xsl:attribute>

		    <xsl:if test="td[11] = 1">
			<xsl:attribute name="Show">normal</xsl:attribute>
		    </xsl:if>

		    <xsl:if test="td[11] = 3">
			<xsl:attribute name="Show">maximized</xsl:attribute>
		    </xsl:if>

		    <xsl:if test="td[11] = 7">
			<xsl:attribute name="Show">minimized</xsl:attribute>
		    </xsl:if>

		    <xsl:attribute name="Target">
			<xsl:value-of select="td[5]"/>
		    </xsl:attribute>

		    <xsl:attribute name="Icon">
			<xsl:value-of select="td[9]"/>
		    </xsl:attribute>
		    <xsl:attribute name="IconIndex">
			<xsl:value-of select="td[10]"/>
		    </xsl:attribute>
		    <xsl:attribute name="WorkingDirectory">
			<xsl:value-of select="td[12]"/>
		    </xsl:attribute>
		</Shortcut>
	    </Component>
	</xsl:for-each>
	</Fragment>
    </xsl:template>
</xsl:stylesheet>