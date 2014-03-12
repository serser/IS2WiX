<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" /> 
   
<xsl:template match="/">
<UI>
<xsl:for-each select="table/row">
<DialogRef>
<xsl:attribute name="Id">
<xsl:value-of select="td[1]"/>
</xsl:attribute>
<Control>
<xsl:attribute name="Id">
<xsl:value-of select="td[2]"/>
</xsl:attribute>
<Subscribe>
<xsl:attribute name="Event">
<xsl:value-of select="td[3]"/>
</xsl:attribute>
<xsl:attribute name="Attribute">
<xsl:value-of select="td[4]"/>
</xsl:attribute>
</Subscribe>
</Control>
</DialogRef>
</xsl:for-each>
</UI>
</xsl:template>

</xsl:stylesheet>