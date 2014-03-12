<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="msi/table[@name='DrLocator']">
      <Fragment>
        <xsl:for-each select="row">
            <DirectorySearch>
                <xsl:attribute name="Id">
                    <xsl:value-of select="td[1]" /></xsl:attribute>
                <xsl:if test="td[4] != ''">
                    <xsl:attribute name="Depth">
                        <xsl:value-of select="td[4]" /></xsl:attribute>
                </xsl:if>
                <xsl:if test="td[3] != ''">
                    <xsl:attribute name="Path">
                        <xsl:value-of select="td[3]" /></xsl:attribute>
                </xsl:if>
            </DirectorySearch>
        </xsl:for-each>
      </Fragment>
    </xsl:template>
</xsl:stylesheet>