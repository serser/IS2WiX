<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="/msi/table[@name='InstallUISequence']">
	<UI>
	<InstallUISequence>
	    <xsl:for-each select="row">
		<xsl:choose>
		    <!--NON CUSTOM ACTIONS HAVE COMMENTS COLUMN-->
		    <xsl:when test="td[4] != ''">
			<xsl:element name="{td[1]}">
			    <xsl:attribute name="Sequence">
				<xsl:value-of select="td[3]"/>
			    </xsl:attribute>
			</xsl:element>
		    </xsl:when>
		    <!--CUSTOM ACTIONS-->
		    <xsl:otherwise>
			<Custom>
			    <xsl:attribute name="Action">
				<xsl:value-of select="td[1]" />
			    </xsl:attribute>
			    <xsl:attribute name="Sequence">
				<xsl:value-of select="td[3]"/>
			    </xsl:attribute><xsl:if test="td[2] != ''"><![CDATA[<![CDATA[]]><xsl:value-of select="td[2]"/><![CDATA[]]]]><![CDATA[>]]></xsl:if></Custom>
		    </xsl:otherwise>
		</xsl:choose>
	    </xsl:for-each>
	</InstallUISequence>
	</UI>
    </xsl:template>
</xsl:stylesheet>