<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="msi/table[@name='CustomAction']">
      <Fragment>
        <xsl:for-each select="row">
            <CustomAction>
			        <xsl:attribute name="Id">
                            <xsl:value-of select="td[1]" /></xsl:attribute>
				     	<xsl:choose>
                 <!-- FIXME: THERE ARE SOME TYPES LIKE 61, 226 etc. UNSOLVED !!! -->
                 <xsl:when test="td[2] = 1">
                        <xsl:attribute name="DllEntry">
                            <xsl:value-of select="td[4]" /></xsl:attribute>
                        <xsl:attribute name="BinaryKey">
                            <xsl:value-of select="td[3]" /></xsl:attribute>
                 </xsl:when>
                 <xsl:when test="td[2] = 2">
                        <xsl:attribute name="ExeCommand">
                            <xsl:value-of select="td[4]" />
                        </xsl:attribute>
                        <xsl:attribute name="BinaryKey">
                            <xsl:value-of select="td[3]" />
                        </xsl:attribute>
                 </xsl:when>
                 <xsl:when test="td[2] = 19">
                    <xsl:attribute name="Error">
                        <xsl:value-of select="td[4]" /></xsl:attribute>
                 </xsl:when>
                 <xsl:when test="td[2] = 51">
                        <xsl:attribute name="Property">
                            <xsl:value-of select="td[3]" /></xsl:attribute>
                        <xsl:attribute name="Value">
                            <xsl:value-of select="td[4]" /></xsl:attribute>
                  </xsl:when>					        
                  <xsl:when test="td[2] = 65">
                      <xsl:attribute name="DllEntry">
                          <xsl:value-of select="td[4]" /></xsl:attribute>
                      <xsl:attribute name="BinaryKey">
                          <xsl:value-of select="td[3]" /></xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="ExeCommand">
                      <xsl:value-of select="td[4]" />
                    </xsl:attribute>
                    <xsl:attribute name="Directory">
                      <xsl:value-of select="td[3]" />
                    </xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
            </CustomAction>
        </xsl:for-each>
      </Fragment>
    </xsl:template>
</xsl:stylesheet>