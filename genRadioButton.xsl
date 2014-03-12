<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template name="groupButtons">
	<xsl:param name="count"/>
	<xsl:param name="index"/>
	<xsl:if test="$index &lt;= $count">
	    <RadioButton>
		<xsl:attribute name="Value">
		    <xsl:value-of select="following-sibling::row[$index]/td[3]"/>
		</xsl:attribute>
		<xsl:attribute name="X">
		    <xsl:value-of select="following-sibling::row[$index]/td[4]"/>
		</xsl:attribute>
		<xsl:attribute name="Y">
		    <xsl:value-of select="following-sibling::row[$index]/td[5]"/>
		</xsl:attribute>
		<xsl:attribute name="Width">
		    <xsl:value-of select="following-sibling::row[$index]/td[6]"/>
		</xsl:attribute>
		<xsl:attribute name="Height">
		    <xsl:value-of select="following-sibling::row[$index]/td[7]"/>
		</xsl:attribute>
		<xsl:attribute name="Text">!(loc.<xsl:value-of select="substring-before(substring-after(following-sibling::row[$index]/td[8], '##'), '##')" />)</xsl:attribute>
	    </RadioButton>
	    <xsl:call-template name="groupButtons">
		<xsl:with-param name="count" select="$count"></xsl:with-param>
		<xsl:with-param name="index" select="$index + 1"></xsl:with-param>
	    </xsl:call-template>
	</xsl:if>
    </xsl:template>
    <xsl:template match="/msi/table[@name='RadioButton']">
	<!--Need to be correctly GROUPPED-->
	<UI>
	    <xsl:for-each select="row">
		<xsl:if test="preceding-sibling::row[1]/td[1] != td[1]">
		    <Property>
			<xsl:attribute name="Id">
			    <xsl:value-of select="td[1]" />
			</xsl:attribute>
			<xsl:value-of select="td[3]" />
		    </Property>
		    <RadioButtonGroup>
			<xsl:attribute name="Property">
			    <xsl:value-of select="td[1]" />
			</xsl:attribute>
			<xsl:value-of select="count(//td[text() = td[1]])"/>
			<xsl:for-each select="../td[text() = td[1]]">
			    <RadioButton>
				<xsl:attribute name="Value">
				    <xsl:value-of select="../td[3]"/>
				</xsl:attribute>
				<xsl:attribute name="X">
				    <xsl:value-of select="../td[4]"/>
				</xsl:attribute>
				<xsl:attribute name="Y">
				    <xsl:value-of select="../td[5]"/>
				</xsl:attribute>
				<xsl:attribute name="Width">
				    <xsl:value-of select="../td[6]"/>
				</xsl:attribute>
				<xsl:attribute name="Height">
				    <xsl:value-of select="../td[7]"/>
				</xsl:attribute>
				<xsl:attribute name="Text">!(loc.<xsl:value-of select="substring-before(substring-after(../td[8], '##'), '##')" />)</xsl:attribute>
			    </RadioButton>
			</xsl:for-each>
			<!--
			<xsl:call-template name="groupButtons">
			    <xsl:with-param name="count" select="count(td['text()=td[1]'])"/>
			    <xsl:with-param name="index" select="1"/>
			</xsl:call-template>-->
		    </RadioButtonGroup>
		</xsl:if>
	    </xsl:for-each>
	</UI>
    </xsl:template>
</xsl:stylesheet>