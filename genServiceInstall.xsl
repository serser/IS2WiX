<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template name="getServiceControl">
	<xsl:param name="comp"/>
	<xsl:for-each select="/msi/table[@name='ServiceControl']/row">
	    <xsl:if test="td[6] = $comp">
		<ServiceControl>
		    <xsl:attribute name="Id">
			<xsl:value-of select="td[1]"/>
		    </xsl:attribute>
		    <xsl:attribute name="Name">
			<xsl:value-of select="td[2]"/>
		    </xsl:attribute>
		    <xsl:if test="td[3]=2">
			<xsl:attribute name="Start">install</xsl:attribute>
		    </xsl:if>
		    <xsl:if test="td[3]=160">
			<xsl:attribute name="Stop">uninstall</xsl:attribute>
		    </xsl:if>
		    <xsl:if test="td[5]!=1">
			<xsl:attribute name="Wait">no</xsl:attribute>
		    </xsl:if>
		    <xsl:attribute name="Remove">uninstall</xsl:attribute>
		</ServiceControl>
	    </xsl:if>
	</xsl:for-each>
    </xsl:template>
    <xsl:template match="msi/table[@name='ServiceInstall']">
	<Fragment>
	<!--FIX THE DUPLICATED COMPONENTS PROBLEM-->
	<xsl:for-each select="row">
	    <Component>
		<xsl:attribute name="Id">
		    <xsl:value-of select="td[12]"/>
		</xsl:attribute>

		<xsl:call-template name="getServiceControl">
		    <xsl:with-param name="comp" select="td[12]"></xsl:with-param>
		</xsl:call-template>
		
		<ServiceInstall>
		    <xsl:attribute name="Id">
			<xsl:value-of select="td[1]"/>
		    </xsl:attribute>
		    <xsl:attribute name="Name">
			<xsl:value-of select="td[2]"/>
		    </xsl:attribute>
		    <xsl:attribute name="Type">
			<xsl:if test="td[4] = 16">shareProcess</xsl:if>
			<xsl:if test="td[4] = 272">ownProcess</xsl:if>
		    </xsl:attribute>
		    <xsl:attribute name="Start">
			<xsl:if test="td[5] = 2">auto</xsl:if>
		    </xsl:attribute>
		    <xsl:attribute name="ErrorControl">
			<xsl:if test="td[6] = 0">ignore</xsl:if>
			<xsl:if test="td[6] = 1">normal</xsl:if>
			<xsl:if test="td[6] = 3">critical</xsl:if>
		    </xsl:attribute>
		    <xsl:attribute name="Arguments">
			<xsl:value-of select="td[11]"/>
		    </xsl:attribute>
		    <xsl:if test="td[13] != ''">
		    <xsl:attribute name="Description">!(loc.<xsl:value-of select="substring-before(substring-after(td[13], '##'), '##')"/>)</xsl:attribute>
		    </xsl:if>
		</ServiceInstall>
	    </Component>
	</xsl:for-each>
	</Fragment>
    </xsl:template>
</xsl:stylesheet>
