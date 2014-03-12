<?xml version="1.0" encoding="UTF-8"?>
<!--Author: Bo Zhang
    Company: Fabbricadigitale s.r.l.
    Project Started: Jan 20, 2014
    Last Update: March 2014
-->
<!--WARNING: THE OUTPUT MIGHT INCLUDE ESCAPED CHARACTERS LIKE 
    &amp; &lt; &gt; BE AWARE OF SUBSTITUTING THEM (BUT NOT &quot;)
-->
<!--NOTE: THIS STYLESHEET APPLIES TO THE SETUP PROJECT FILE .ism 
    GENEREATED BY InstallShield 2011 Version 17
    
    CURRENT VERSION IS VERY UNSTABLE, USE WITH CAUTION.
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--The is to generate all table name (including empty table)
    <xsl:import href="fetchTbName.xsl"/>
    -->
    <xsl:import href="genAdminExeSeq.xsl"/>
    <xsl:import href="genBinary.xsl"/>
    <!--Causing Stack Overflow in VS 2010! (multiple recursive call)	
	<xsl:import href="genComFile.xsl"/>-->

    <xsl:import href="genCustomAction.xsl"/>
    <xsl:import href="genDialog.xsl"/>
    <xsl:import href="genDir.xsl"/>
    <xsl:import href="genDirSearch.xsl"/>
    <xsl:import href="genEmbeddedChainner.xsl"/>
    <xsl:import href="genErr.xsl"/>
    <xsl:import href="genFeature.xsl"/>
    <xsl:import href="genFeatureRef.xsl"/>
    <xsl:import href="genInstallExeSeq.xsl"/>
    <xsl:import href="genInstallUISeq.xsl"/>
    <xsl:import href="genProgressText.xsl"/>
    <xsl:import href="genProp.xsl"/>
    <xsl:import href="genPublish.xsl"/>
    <xsl:import href="genRadioButton.xsl"/>
    <xsl:import href="genReg.xsl"/>
    <xsl:import href="genServiceInstall.xsl"/>
    <xsl:import href="genString.xsl"/>
    <xsl:import href="genTextStyle.xsl"/>
    <xsl:import href="genUIText.xsl"/>
    <xsl:import href="genShortcut.xsl"/>
    <!--dynamically modify xml file
    <xsl:import href="genXMLFile.xsl"/>
    -->

    <xsl:output method="xml" />

    <xsl:template match="/">
	<Wix>
	    <xsl:apply-templates select="msi/table[@name='AdminExecuteSequence']"/>
	    <xsl:apply-templates select="msi/table[@name='Binary']"/>
	    <xsl:apply-templates select="msi/table[@name='CustomAction']"/>
	    <!--Stack overflow (alternative: use firefox to do the job)
	    <xsl:apply-templates select="msi/table[@name='Component']"/>
	    <xsl:apply-templates select="msi/table[@name='Dialog']"/>-->
	    <xsl:apply-templates select="msi/table[@name='Directory']"/>
	    <xsl:apply-templates select="msi/table[@name='DrLocator']"/>
	    <xsl:apply-templates select="msi/table[@name='MsiEmbeddedChainer']"/>
	    <xsl:apply-templates select="msi/table[@name='Error']"/>
	    <xsl:apply-templates select="msi/table[@name='Feature']"/>
	    <xsl:apply-templates select="msi/table[@name='FeatureComponents']"/>
	    <xsl:apply-templates select="msi/table[@name='InstallExecuteSequence']"/>
	    <xsl:apply-templates select="msi/table[@name='InstallUISequence']"/>
	    <xsl:apply-templates select="msi/table[@name='ActionText']"/>
	    <xsl:apply-templates select="msi/table[@name='Property']"/>
	    <xsl:apply-templates select="msi/table[@name='ControlEvent']"/>
	    <xsl:apply-templates select="msi/table[@name='RadioButton']"/>
	    <xsl:apply-templates select="msi/table[@name='Registry']"/>
	    <xsl:apply-templates select="msi/table[@name='ServiceInstall']"/>
	    <xsl:apply-templates select="msi/table[@name='ISString']"/>
	    <xsl:apply-templates select="msi/table[@name='TextStyle']"/>
	    <xsl:apply-templates select="msi/table[@name='UIText']"/>
	    <xsl:apply-templates select="msi/table[@name='Shortcut']"/>
	    <!--TO BE DONE-->
	    
	</Wix>
    </xsl:template>
</xsl:stylesheet>