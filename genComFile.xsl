<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:variable name="createFolderRow">
        <xsl:value-of select="count(msi/table[@name='CreateFolder']/row)" /></xsl:variable>
    <xsl:variable name="filesRow">
        <xsl:value-of select="count(msi/table[@name='File']/row)" /></xsl:variable>
    <!--getCreateFolder by Component Rountine-->
    <xsl:template name="getCreateFolder">
        <xsl:param name="i" />
        <xsl:param name="inc" />
        <xsl:param name="max" />
        <xsl:param name="key" />
        <xsl:param name="ckey" />
        <xsl:if test="$i &lt;= $max">
            <xsl:if test="$key = $ckey">
                <CreateFolder>
                    <xsl:attribute name="Directory">
                        <xsl:value-of select="/msi/table[@name='CreateFolder']/row[$i]/td[1]" /></xsl:attribute>
                </CreateFolder>
            </xsl:if>
            <xsl:call-template name="getCreateFolder">
                <xsl:with-param name="i" select="$i + $inc" />
                <xsl:with-param name="inc" select="$inc" />
                <xsl:with-param name="max" select="$max" />
                <xsl:with-param name="key" select="$key" />
                <xsl:with-param name="ckey" select="/msi/table[@name='CreateFolder']/row[$i+$inc]/td[2]" /></xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xsl:template name="getFiles">
        <xsl:param name="i" />
        <xsl:param name="inc" />
        <xsl:param name="max" />
        <xsl:param name="key" />
        <xsl:param name="ckey" />
        <xsl:if test="$i &lt;= $max">
            <xsl:if test="$key = $ckey">
                <File>
                    <xsl:attribute name="Id">
                        <xsl:value-of select="/msi/table[@name='File']/row[$i]/td[1]" /></xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="contains(/msi/table[@name='File']/row[$i]/td[3], '|')">
                            <xsl:attribute name="Name">
                                <xsl:value-of select="substring-after(/msi/table[@name='File']/row[$i]/td[3], '|')" /></xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="contains(/msi/table[@name='File']/row[$i]/td[3], ':')">
                                    <xsl:attribute name="ShortName">
                                        <xsl:value-of select="substring-after(substring-before(/msi/table[@name='File']/row[$i]/td[3], '|'), ':')" /></xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="ShortName">
                                        <xsl:value-of select="substring-before(/msi/table[@name='File']/row[$i]/td[3], '|')" /></xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="Name">
                                <xsl:value-of select="/msi/table[@name='File']/row[$i]/td[3]" /></xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:attribute name="Source">
                        <xsl:value-of select="/msi/table[@name='File']/row[$i]/td[9]" /></xsl:attribute>
                </File>
            </xsl:if>
            <xsl:call-template name="getFiles">
                <xsl:with-param name="i" select="$i + $inc" />
                <xsl:with-param name="inc" select="$inc" />
                <xsl:with-param name="max" select="$max" />
                <xsl:with-param name="key" select="$key" />
                <xsl:with-param name="ckey" select="/msi/table[@name='File']/row[$i+$inc]/td[2]" /></xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xsl:template match="/">
        <Fragment>
            <xsl:for-each select="msi/table[@name='Component']/row">
                <Component>
                    <xsl:choose>
                        <xsl:when test="td[4] = 8">
                            <xsl:attribute name="Id">
                                <xsl:value-of select="td[1]" /></xsl:attribute>
                            <xsl:attribute name="Guid">
                                <xsl:value-of select="td[2]" /></xsl:attribute>
                            <xsl:attribute name="Directory">
                                <xsl:value-of select="td[3]" /></xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                    <!--call getCreateFolder-->
                    <xsl:call-template name="getCreateFolder">
                        <xsl:with-param name="i" select="1" />
                        <xsl:with-param name="inc" select="1" />
                        <xsl:with-param name="max" select="$createFolderRow" />
                        <xsl:with-param name="key" select="td[1]" />
                        <xsl:with-param name="ckey" select="/msi/table[@name='CreateFolder']/row[1]/td[2]" /></xsl:call-template>
                    <xsl:call-template name="getFiles">
                        <xsl:with-param name="i" select="1" />
                        <xsl:with-param name="inc" select="1" />
                        <xsl:with-param name="max" select="$filesRow" />
                        <xsl:with-param name="key" select="td[1]" />
                        <xsl:with-param name="ckey" select="/msi/table[@name='File']/row[1]/td[2]" /></xsl:call-template>
                </Component>
            </xsl:for-each>
        </Fragment>
    </xsl:template>
</xsl:stylesheet>