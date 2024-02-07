<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:foo="whatever" version="3.0" exclude-result-prefixes="tei xhtml">

    <xsl:output method="xhtml" indent="yes"/>

    <xsl:mode on-no-match="shallow-skip"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Clara Katharina Pollaczek: Arthur Schnitzler und ich</title>
                <meta name="author" content="Pollaczek, Clara Katharina"/>
                <meta name="language" content="de"/>
                <meta name="description"
                    content="Clara Katharina Pollaczeks Erinnerungen an Arthur Schnitzler"/>
                <meta name="editor" content="Müller, Martin Anton"/>
                <meta name="editor" content="Untner, Laura"/>
                <meta name="editor" content="Mangel, Michael"/>
                <meta name="editor" content="Andorfer, Peter"/>
                <meta name="DC.Title" content="Clara Katharina Pollaczek: Arthur Schnitzler und ich"/>
                <meta name="DC.Type" content="Text"/>
                <meta name="DC.Format" content="text/html"/>
            </head>
            <body>
                <div>
                    <h1>Clara Katharina Pollaczek</h1>
                    <h1>Arthur Schnitzler und ich</h1>
                </div>
                <div>
                    <p>Herausgegeben von Martin Anton Müller, Laura Untner, Michael Mangel und Peter
                        Andorfer</p>
                </div>
                <div>
                    <p>E-Book basierend auf <a href="https://pollaczek.acdh.oeaw.ac.at/"
                            >https://pollaczek.acdh.oeaw.ac.at/</a>.</p>
                    <xsl:variable name="currentDate" select="current-date()"/>
                    <p>Stand: <xsl:value-of select="foo:format-date-german($currentDate)"/>.</p>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:function name="foo:format-date-german">
        <xsl:param name="date" as="xs:date"/>
        <xsl:variable name="year" select="format-number(year-from-date($date), '0000')"/>
        <xsl:variable name="month" select="month-from-date($date)"/>
        <xsl:variable name="day" select="day-from-date($date)"/>
        <xsl:variable name="month-name" as="xs:string" select="
                (
                'Januar', 'Februar', 'März', 'April', 'Mai', 'Juni',
                'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember'
                )[$month]"/>
        <xsl:sequence select="concat($day, '. ', $month-name, ' ', $year)"/>
    </xsl:function>

</xsl:stylesheet>
