<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="msi/table[@name='MsiEmbeddedChainer']">
		<Fragment>
		<xsl:for-each select="row">
			<EmbeddedChainer>
				<xsl:attribute name="Id">
					<xsl:value-of select="td[1]" />
				</xsl:attribute>
				<xsl:attribute name="CommandLine">
					<xsl:value-of select="td[3]" />
				</xsl:attribute>
				<xsl:attribute name="BinarySource">
					<xsl:value-of select="td[4]" />
				</xsl:attribute><![CDATA[<![CDATA[]]><xsl:value-of select="td[2]"/><![CDATA[]]]]><![CDATA[>]]></EmbeddedChainer>
		</xsl:for-each>
		</Fragment>
	</xsl:template>
</xsl:stylesheet>