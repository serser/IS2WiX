<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />
	<xsl:template match="/msi/table[@name='Error']">
		<UI>
			<xsl:for-each select="row">
				<Error>
					<xsl:attribute name="Id">
						<xsl:value-of select="td[1]"/>
					</xsl:attribute>!(loc.<xsl:value-of select="substring-before(substring-after(td[2], '##'), '##')"/>)</Error>
			</xsl:for-each>
		</UI>
	</xsl:template>
</xsl:stylesheet>