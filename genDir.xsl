<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <xsl:template match="/msi/table[@name='Directory']">
<Fragment>
        <xsl:for-each select="row">
            <xsl:choose>
                <xsl:when test="td[2] != ''">
                    <DirectoryRef>
                        <xsl:attribute name="Id">
                            <xsl:value-of select="td[2]" /></xsl:attribute>
                        <Directory>
                            <xsl:attribute name="Id">
                                <xsl:value-of select="td[1]" /></xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="contains(td[3],':')">
								<xsl:choose>

                                <xsl:when test="contains(td[3],'|')">
                                    <xsl:attribute name="ShortName">
                                        <xsl:value-of select="substring-before(substring-after(td[3],':'),'|')" /></xsl:attribute>

                                    <xsl:attribute name="Name">
                                        <xsl:value-of select="substring-after(td[3],'|')" /></xsl:attribute> 

								</xsl:when>
									<xsl:otherwise>
										 <xsl:attribute name="Name">
											<xsl:value-of select="substring-after(td[3],':')" /></xsl:attribute>
									</xsl:otherwise>
								 </xsl:choose>
														   
								</xsl:when>    
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="contains(td[3],'|')">
                                            <xsl:attribute name="Name">
                                                <xsl:value-of select="substring-after(td[3],'|')" /></xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="Name">
                                                <xsl:value-of select="td[3]" /></xsl:attribute>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </Directory>
                    </DirectoryRef>
                </xsl:when>
                <xsl:otherwise>
                    <Directory>
                        <xsl:attribute name="Id">
                            <xsl:value-of select="td[1]" /></xsl:attribute>
                        <xsl:attribute name="Name">
                            <xsl:value-of select="td[3]" /></xsl:attribute>
                    </Directory>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
</Fragment>
    </xsl:template>
</xsl:stylesheet>