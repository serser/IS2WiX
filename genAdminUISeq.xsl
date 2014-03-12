<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
<xsl:template match="/">
   <Fragment>
<AdminUISequence>
    <xsl:for-each select="/table/row">
&lt;<xsl:value-of select="td[1]"/> Sequence="<xsl:value-of select="td[3]" />"&gt;   <xsl:if test="td[2] != ''">
<![CDATA[<![CDATA[]]><xsl:value-of select="td[2]" /><![CDATA[]]]]><![CDATA[>]]>
  </xsl:if>&lt;/<xsl:value-of select="td[1]"/>&gt;
</xsl:for-each>
</AdminUISequence>
</Fragment>
</xsl:template>
</xsl:stylesheet>