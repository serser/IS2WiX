<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="msi/table[@name='AdminExecuteSequence']">
        <Fragment>
            <AdminExecuteSequence>
                <xsl:for-each select="row">
                  <xsl:element name="{td[1]}">
                    <xsl:attribute name="Sequence">
                      <xsl:value-of select="td[3]"/>
                    </xsl:attribute>
                    <xsl:if test="td[2] != ''"><![CDATA[<![CDATA[]]><xsl:value-of select="td[2]" /><![CDATA[]]]]><![CDATA[>]]></xsl:if>
                  </xsl:element>
                  <!--Old way of generating elments with dyname name
                    &lt;<xsl:value-of select="td[1]" />Sequence="<xsl:value-of select="td[3]" />"&gt;
                    &lt;/<xsl:value-of select="td[1]" />&gt;-->
                </xsl:for-each>
            </AdminExecuteSequence>
        </Fragment>
    </xsl:template>
</xsl:stylesheet>