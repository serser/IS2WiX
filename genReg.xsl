<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="msi/table[@name='Registry']">
	<Fragment>
	<DirectoryRef Id="INSTALLDIR">
	    <!--FIXME: HAVE TO AVOID DUPLICATE COMPONENTS !!!-->

	    <xsl:for-each select="row">
		<Component>
		    <xsl:attribute name="Id">
			<xsl:value-of select="td[3]" />
		    </xsl:attribute>
		    <RegistryKey>
			<xsl:if test="td[2] = 2">
			    <xsl:attribute name="Root">HKLM</xsl:attribute>
			</xsl:if>
			<!--FIXME: ADD THE REST TYPE-->
			<xsl:attribute name="Key">
			    <xsl:value-of select="td[3]" />
			</xsl:attribute>
			<RegistryValue>
			    <xsl:attribute name="Name">
				<xsl:value-of select="td[4]" />
			    </xsl:attribute>
			    <xsl:attribute name="Value">
				<xsl:value-of select="td[5]" />
			    </xsl:attribute>
			</RegistryValue>

		    </RegistryKey>
		</Component>
	    </xsl:for-each>

	</DirectoryRef>
	</Fragment>
    </xsl:template>
</xsl:stylesheet>