<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <!--FIX SPACE PROBLEM WHILE USING TIDYUP of jsfiddle-->
    <xsl:template match="/msi/table[@name='ControlEvent']">
	<UI>
        <xsl:for-each select="row">
            <xsl:choose>
                <xsl:when test="td[2] != ''">
                    <Publish>
                        <xsl:attribute name="Dialog">
                            <xsl:value-of select="td[1]"/></xsl:attribute>
                        <xsl:attribute name="Control">
                            <xsl:value-of select="td[2]"/></xsl:attribute>
                        <xsl:attribute name="Event">
                            <xsl:value-of select="td[3]"/></xsl:attribute>
                        <xsl:attribute name="Value">
                            <xsl:value-of select="td[4]"/></xsl:attribute>
                        <xsl:if test="td[6] != ''">
			    <xsl:attribute name="Order">
				    <xsl:value-of select="td[6]" />
			    </xsl:attribute>
                        </xsl:if><![CDATA[<![CDATA[]]><xsl:value-of select="td[5]" /><![CDATA[]]]]><![CDATA[>]]></Publish>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
	</UI>
    </xsl:template>
</xsl:stylesheet>