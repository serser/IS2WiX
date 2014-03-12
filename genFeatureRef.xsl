<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="msi/table[@name='FeatureComponents']">
	<Fragment>
	    <xsl:for-each select="row">
		<xsl:if test="td[2] != ''">
		    <FeatureRef>
			<xsl:attribute name="Id">
			    <xsl:value-of select="td[1]"/>
			</xsl:attribute>

			<ComponentRef>
			    <xsl:attribute name="Id">
				<xsl:value-of select="td[2]"/>
			    </xsl:attribute>
			</ComponentRef>

		    </FeatureRef>
		</xsl:if>
	    </xsl:for-each>
	</Fragment>
    </xsl:template>
</xsl:stylesheet>
