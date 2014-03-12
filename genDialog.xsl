<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
	<!--Tables: Dialog, Control, ControlCondition-->
	<!--Problems to fix: Disable to disable, TabSkip, Text to transparent, space to CDATA, space end tag-->
	<!--OVERFLOW under VS 2010, need to be refactored!-->
    <!--UPPER LOWER CASE CONVERSION-->
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
    <!--Max Row variables-->
    <xsl:variable name="controlRow">
        <xsl:value-of select="count(/msi/table[@name='Control']/row)" /></xsl:variable>
    <xsl:variable name="controlConditionRow">
        <xsl:value-of select="count(/msi/table[@name='ControlCondition']/row)" /></xsl:variable>
    <!--Find out Control condition elements -->
    <xsl:template name="getControlCondition">
        <xsl:param name="i" />
        <xsl:param name="ockey" />
        <xsl:param name="odkey" />
        <xsl:param name="inc" />
        <xsl:param name="max" />
        <xsl:param name="dkey" />
        <xsl:param name="ckey" />
        <!--ID Match, make it a child element -->
        <xsl:if test="$i &lt;= $max">
            <!-- TEST <xsl:value-of select="$ockey" />,
            <xsl:value-of select="$ckey" />,
            <xsl:value-of select="$odkey" />,
            <xsl:value-of select="$dkey" />-->
            <xsl:if test="$ockey = $ckey and $odkey = $dkey">
                <Condition>
                    <xsl:attribute name="Action">
                        <xsl:value-of select="translate(/msi/table[@name='ControlCondition']/row[$i]/td[3], $smallcase, $uppercase)" /></xsl:attribute>
                    <xsl:text disable-output-escaping="yes">
                        <![CDATA[<![CDATA[]]>
                    </xsl:text>
                    <xsl:value-of select="/msi/table[@name='ControlCondition']/row[$i]/td[4]" />
                    <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                </Condition>
            </xsl:if>
            <!--Recursive call control condition-->
            <xsl:call-template name="getControlCondition">
                <xsl:with-param name="i" select="$i + $inc" />
                <xsl:with-param name="inc" select="$inc" />
                <xsl:with-param name="max" select="$max" />
                <xsl:with-param name="ockey" select="$ockey" />
                <xsl:with-param name="odkey" select="$odkey" />
                <xsl:with-param name="dkey" select="/msi/table[@name='ControlCondition']/row[$i + $inc]/td[1]" />
                <xsl:with-param name="ckey" select="/msi/table[@name='ControlCondition']/row[$i + $inc]/td[2]" /></xsl:call-template>
        </xsl:if>
    </xsl:template>
    <!-- Find out control elements -->
    <xsl:template name="getControl">
        <xsl:param name="i" />
        <xsl:param name="key" />
        <xsl:param name="inc" />
        <xsl:param name="max" />
        <xsl:param name="ckey" />
        <xsl:if test="$i &lt;= $max">
            <xsl:if test="$key = $ckey ">
                <Control>
                    <xsl:attribute name="Id">
                        <xsl:value-of select="/msi/table[@name='Control']/row[$i]/td[2]" /></xsl:attribute>
                    <xsl:attribute name="Type">
                        <xsl:value-of select="/msi/table[@name='Control']/row[$i]/td[3]" /></xsl:attribute>
                    <xsl:attribute name="X">
                        <xsl:value-of select="/msi/table[@name='Control']/row[$i]/td[4]" /></xsl:attribute>
                    <xsl:attribute name="Y">
                        <xsl:value-of select="/msi/table[@name='Control']/row[$i]/td[5]" /></xsl:attribute>
                    <xsl:attribute name="Width">
                        <xsl:value-of select="/msi/table[@name='Control']/row[$i]/td[6]" /></xsl:attribute>
                    <xsl:attribute name="Height">
                        <xsl:value-of select="/msi/table[@name='Control']/row[$i]/td[7]" /></xsl:attribute>
<xsl:if test="/msi/table[@name='Control']/row[$i]/td[9] != ''">
                    <xsl:attribute name="Property">
                        <xsl:value-of select="/msi/table[@name='Control']/row[$i]/td[9]" /></xsl:attribute>
</xsl:if>
<xsl:if test="/msi/table[@name='Control']/row[$i]/td[10] != ''">
                    <xsl:attribute name="Text">!(loc.<xsl:value-of select="substring-before(substring-after(/msi/table[@name='Control']/row[$i]/td[10], '##'), '##')" />)</xsl:attribute>
</xsl:if>
<xsl:if test="/msi/table[@name='Control']/row[$i]/td[16] != ''">
                    <xsl:attribute name="Text"><xsl:value-of select="td[16]"/></xsl:attribute>
</xsl:if>
                    <!-- Call getControlCondition -->
                    <xsl:call-template name="getControlCondition">
                        <xsl:with-param name="i" select="1" />
                        <xsl:with-param name="inc" select="1" />
                        <xsl:with-param name="max" select="$controlConditionRow" />
                        <xsl:with-param name="ockey" select="/msi/table[@name='Control']/row[$i]/td[2]" />
                        <xsl:with-param name="odkey" select="td[1]" />
                        <xsl:with-param name="dkey" select="/msi/table[@name='ControlCondition']/row[1]/td[1]" />
                        <xsl:with-param name="ckey" select="/msi/table[@name='ControlCondition']/row[1]/td[2]" /></xsl:call-template>
                </Control>
            </xsl:if>
            <!-- Recursive call of getControl -->
            <xsl:call-template name="getControl">
                <xsl:with-param name="i" select="$i + $inc" />
                <xsl:with-param name="inc" select="$inc" />
                <xsl:with-param name="max" select="$max" />
                <xsl:with-param name="key" select="$key" />
                <xsl:with-param name="ckey" select="/msi/table[@name='Control']/row[$i + $inc]/td[1]" /></xsl:call-template>
        </xsl:if>
    </xsl:template>
    <!--msi-->
    <xsl:template match="/msi/table[@name='Dialog']">
        <!-- <xsl:value-of select="$controlConditionRow" />-->
        <xsl:for-each select="row">
            <Dialog>
                <xsl:attribute name="Id">
                    <xsl:value-of select="td[1]" /></xsl:attribute>
                <xsl:attribute name="Width">
                    <xsl:value-of select="td[4]" /></xsl:attribute>
                <xsl:attribute name="Height">
                    <xsl:value-of select="td[5]" /></xsl:attribute>
                <xsl:attribute name="Title">!(loc.<xsl:value-of select="substring-before(substring-after(td[7], '##'), '##')" />)</xsl:attribute> 
                <!--Find out related Control elements -->
                <xsl:call-template name="getControl">
                    <xsl:with-param name="i" select="1" />
                    <xsl:with-param name="inc" select="1" />
                    <xsl:with-param name="key" select="td[1]" />
                    <xsl:with-param name="max" select="$controlRow" />
                    <xsl:with-param name="ckey" select="/msi/table[@name='Control']/row[1]/td[1]" /></xsl:call-template>
                <!--<xsl:value-of select="$controlRow" />--></Dialog>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>