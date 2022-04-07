<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:tei ="http://www.tei-c.org/ns/1.0">

    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <!--Struttura dell'HTML-->
    <xsl:template match="/">
        <html>
            <head>
                <script src="javascript.js"></script>
                <link rel="stylesheet" type="text/css" href="stile.css"/>
                <title>
                    <xsl:value-of select="//tei:titleStmt/tei:title"/>
                </title>
            </head>
        </html>
        <body>
            <div id="titolo"> <!--titleStmt-->
                <xsl:apply-templates select="//tei:titleStmt"/>
            </div>

            <div id="istruzioni"> <!--Legenda e istruzioni per poter leggere adeguatamente il testo-->
                <h3>Istruzioni per la corretta fruizione della versione elettronica</h3>
                <p>
                    I vari interventi effettuati da Ferdinand De Saussure sul manoscritto originale sono stati messi 
                    in evidenza usando diversi colori e segni grafici.<br/>
                    Per facilitare la lettura, le abbreviazioni sono state espanse. 
                    Posizionando il cursore sulla parola è possibile 
                    leggere la corrispettiva abbreviazione 
                    (esempio: <span class="abbr" hoverText="abbr">abbreviazione</span>). <br/>
                    Le parole aggiunte dall'autore sono di colore rosso 
                    (esempio: <span class="add">aggiunta</span>). <br/>
                    Le parole cancellate dall'autore sono barrate  
                    (esempio: <del>parole cancellate</del>); quando la parola cancellata non è chiaramente leggibile, è sostituita da "undefined" 
                    (esempio: <del>undefined</del>). <br/>
                    Le parole sottolineate dall'autore sono sottolineate anche nel testo trascritto
                    (esempio: <u>sottolineatura</u>). <br />
                    Le note sono evidenziate in rosso (esempio: <a class="noteLista">n</a>). Cliccando sulla n nel testo si potrà visualizzare la relativa nota. <br/>
                    Infine, gli elementi terminologici sono evidenziati in giallo 
                    (esempio: <term>elemento terminologico</term>). Cliccando sul termine si potrà visualizzare la relativa definizione nel glossario. <br/>
                    Cliccando su un punto qualsiasi dell'immagine si verrà rimandati alla riga corrispondente nel testo. 
                </p>
            </div>

            <br/>

            <div id="navBar"> <!--Menu-->
                <ul id="menu">
                    <li><a href="#pag2">Pagina 2</a></li>
                    <li><a href="#pag3">Pagina 3</a></li>
                    <li><a href="#manoscritto">Informazioni sul manoscritto</a></li>
                    <li><a href="#codifica">Informazioni sulla codifica</a></li>
                </ul>
            </div>

            <br/>

            <!--PAGINA 2-->
            <div id="pag2">
                <h2 class="inizioPag">PAGINA 2</h2>
                <xsl:apply-templates select="//tei:surface[@xml:id='facspage2']"/> <!--Immagine-->
                <div class="testo"> <!--Testo-->
                <h3>Testo</h3> 
                <xsl:apply-templates select="//tei:div[@xml:id='TestoTradPag2']/tei:fw"/>
                <xsl:apply-templates select="//tei:div[@xml:id='TestoTradPag2']" mode="testo"/> 
                </div>
                <div class="trad">
                <!--Pulsanti per mostrare e nascondere la traduzione-->
                <input type="button" class="yes" id="mostraTrad2" value="Mostra traduzione"/>
                <input type="button" class="no" id="nascondiTrad2" value="Nascondi traduzione"/>

                <div class="no" id="trad2"> <!--Traduzione-->
                    <h3>Traduzione</h3>
                    <xsl:apply-templates select="//tei:div[@xml:id='TestoTradPag2']" mode="traduzione"/> 
                </div>
            </div>
            </div>

            <div id="glossario2"><!--Glossario degli elementi terminologici nella pagina 2-->
                <br/>
                <h3>Glossario:</h3>
                <xsl:apply-templates select="//tei:div[@xml:id='glossary_pg2']"/>
            </div>

            <div id="note2"><!--Note nella pagina 2-->
                <h3>Note:</h3>
                <xsl:apply-templates select="//tei:div[@xml:id='notes_pg2']"/>
            </div>
            <br/>

            <!--PAGINA 3-->
            <div id="pag3">
                <h2 class="inizioPag">PAGINA 3</h2>
                <xsl:apply-templates select="//tei:surface[@xml:id='facspage3']"/> <!--Immagine-->
                <div class="testo"> <!--Testo-->
                <h3>Testo</h3>
                <xsl:apply-templates select="//tei:div[@xml:id='TestoTradPag3']/tei:fw"/>
                <xsl:apply-templates select="//tei:div[@xml:id='TestoTradPag3']" mode="testo"/>
                </div>
                <div class="trad">
                <!--Pulsanti per mostrare e nascondere la traduzione-->
                <input type="button" class="yes" id="mostraTrad3" value="Mostra traduzione"/>
                <input type="button" class="no" id="nascondiTrad3" value="Nascondi traduzione"/>

                <div class="no" id="trad3"> <!--Traduzione-->
                    <h3>Traduzione</h3>
                    <xsl:apply-templates select="//tei:div[@xml:id='TestoTradPag3']" mode="traduzione"/>
                </div>
                </div>
            </div>

            <div id="glossario3"><!--Glossario degli elementi terminologici nella pagina 3-->
                <br/>
                <h3>Glossario:</h3>
                <xsl:apply-templates select="//tei:div[@xml:id='glossary_pg3']"/>
            </div>

            <div id="note3"><!--Note nella pagina 3-->
                <h3>Note:</h3>
                <xsl:apply-templates select="//tei:div[@xml:id='notes_pg3']"/>
            </div>

            <div id="info"> <!--sourceDesc-->
                <div id="manoscritto">
                    <h2>Informazioni sul manoscritto</h2>
                    <p>
                        <xsl:apply-templates select="//tei:msIdentifier"/><!--msIdentifier-->
                        <xsl:apply-templates select="//tei:msContents"/><!--msContents-->
                    </p>
                    <p>
                        <xsl:apply-templates select="//tei:physDesc"/><!--physDesc-->
                    </p>
                </div>

                <div id="codifica">
                    <h2>Informazioni sulla codifica</h2>
                    <p>
                        <xsl:apply-templates select="//tei:projectDesc"/><!--encodingDesc-->
                        <xsl:apply-templates select="//tei:publicationStmt"/><!--publicationStmt-->
                        <xsl:apply-templates select="//tei:bibl"/><!--listBibl (fonti di trascrizione in francese, traduzione in italiano e note)-->
                        Le immagini del manoscritto originale sono state estratte dall'
                        <a href="https://archives.bge-geneve.ch/archives/archives/fonds/saussure_ferdinand_de/view:5892/n:89">Archives Ferdinand De Saussure</a>,
                        messo a disposizione dalla Bibliothèque de Genève. 
                    </p>
                </div>
            </div>


        </body>
    </xsl:template>


    <!--titleStmt-->
    <xsl:template match="//tei:titleStmt">
        <h1> <!--Titolo-->
            <xsl:value-of select="./tei:title"/>
        </h1>
        <br/>
        <h2> <!--A cura di-->
            Manoscritto originale di: Ferdinand De Saussure <br/>
            <xsl:for-each select="./tei:respStmt">
                <xsl:value-of select="concat(./tei:resp,' ')"/>
                <xsl:choose>
                <xsl:when test="count(./tei:name)=2">
                    <xsl:value-of select="concat(./tei:name,', ',./tei:name[last()])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="./tei:name"/>
                </xsl:otherwise>
                </xsl:choose>
                <br/>
            </xsl:for-each>
        </h2>
        <br/>
    </xsl:template>

    <!--PAGINA 2-->
    <xsl:template match="//tei:surface[@xml:id='facspage2']"> <!--Immagine pagina 2-->
        <div class="immagini">
        <img alt="Foto pagina 2" usemap="#map2">
            <xsl:attribute name="src">
                <xsl:value-of select="./tei:graphic/@url"/>
            </xsl:attribute>
        </img>

        <map name="map2">
            <xsl:for-each select="//tei:surface[@xml:id='facspage2']//tei:zone">
                <xsl:element name="area" use-attribute-sets="attrMap"/>
            </xsl:for-each>
        </map>
        </div>
    </xsl:template>

    <!--Testo pagina 2-->
    <xsl:template match="//tei:div[@xml:id='TestoTradPag2']/tei:fw"> <!--Numeri 2 in alto a sinistra-->
        <xsl:value-of select="."/> &#160;
    </xsl:template>

    <xsl:template match="//tei:div[@xml:id='TestoTradPag2']" mode="testo">
        <xsl:call-template name="templateTesto"/> 
    </xsl:template> 

    <!--Traduzione pagina 2-->
    <xsl:template match="//tei:div[@xml:id='TestoTradPag2']" mode="traduzione">
        <xsl:call-template name="templateTrad"/>
    </xsl:template> 

    <!--Glossario pagina 2-->
    <xsl:template match="//tei:div[@xml:id='glossary_pg2']">
        <xsl:call-template name="templateGlossario"/>
    </xsl:template>

    <!--Note pagina 2-->
    <xsl:template match="//tei:div[@xml:id='notes_pg2']">
        <xsl:call-template name="templateNote"/>
    </xsl:template>


    <!--PAGINA 3-->
    <xsl:template match="//tei:surface[@xml:id='facspage3']"> <!--Immagine pagina 3-->
        <div class="immagini">
        <img id="img_pg3" alt="Foto pagina 3" usemap="#map3">
            <xsl:attribute name="src">
                <xsl:value-of select="./tei:graphic/@url"/>
            </xsl:attribute>
        </img>

        <map name="map3">
            <xsl:for-each select="//tei:surface[@xml:id='facspage3']//tei:zone">
                <xsl:element name="area" use-attribute-sets="attrMap"/>
            </xsl:for-each>
        </map>
        </div>
    </xsl:template>

    <!--Testo pagina 3-->
    <xsl:template match="//tei:div[@xml:id='TestoTradPag3']/tei:fw"> <!--Numero 3 in alto a sinistra-->
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="//tei:div[@xml:id='TestoTradPag3']" name="templateTesto" mode="testo">
        <p>
            <xsl:for-each select=".//tei:div[@type='text']"> 

                <xsl:for-each select="./tei:p//node()"> 

                    <xsl:choose>

                        <xsl:when test="name()='lb'"> <!--line beginning-->
                            <br/> <xsl:element name="span" use-attribute-sets="attrFreccia">
                            > 
                            </xsl:element>
                        </xsl:when> 

                        <xsl:when test="name()='subst'"> <!--sostituzioni-->
                            <xsl:element name="del"> <!--cancellazioni-->
                                <xsl:value-of select="concat(./tei:del , ' ')"/>
                            </xsl:element>
                            <xsl:if test=".//tei:gap"> <!--cancellazioni non leggibili-->
                                <xsl:element name="del">
                                    undefined
                                </xsl:element>
                            </xsl:if>
                            
                            <xsl:if test="not(./tei:add/tei:hi/tei:term[@ref='#mutabilite']) and not(./tei:add/tei:choice) and not(./tei:add/tei:del)"> 
                                <xsl:element name="span" use-attribute-sets="attrAdd"><!--aggiunte-->
                                    <xsl:value-of select="concat(./tei:add , ' ')"/>
                                </xsl:element>
                            </xsl:if>
                        </xsl:when>

                        <xsl:when test="name()='del'"> <!--cancellazioni non sostituite-->
                            <xsl:if test="name(..)='p'">
                                <xsl:if test="not(.='')">
                                    <xsl:element name="del">
                                        <xsl:value-of select="concat(. , ' ')"/>
                                    </xsl:element> 
                                </xsl:if>
                                <xsl:if test=".//tei:gap"> <!--cancellazioni non leggibili-->
                                    <xsl:element name="del">
                                        undefined
                                    </xsl:element> 
                                </xsl:if>  
                            </xsl:if>
                            <xsl:if test="name(..)='add'"> <!--cancellazioni di parole aggiunte-->
                                <xsl:if test="not(.='')">
                                    <xsl:element name="del" use-attribute-sets="attrAdd">
                                        <xsl:value-of select="concat(. , ' ')"/>
                                    </xsl:element>
                                </xsl:if>
                                <xsl:if test=".//tei:gap"> <!--cancellazioni di parole aggiunte e non leggibili-->
                                    <xsl:element name="del" use-attribute-sets="attrAdd">
                                        undefined
                                    </xsl:element> 
                                </xsl:if>
                            </xsl:if>
                        </xsl:when>

                        <xsl:when test="name()='add'"> <!--aggiunte-->
                            <xsl:if test="name(..)='p' and not(.//tei:choice) and not(.//tei:term) and not(./tei:del)">
                                <xsl:element name="span" use-attribute-sets="attrAdd">
                                    <xsl:value-of select="concat(. , ' ')"/>
                                </xsl:element> 
                            </xsl:if>
                        </xsl:when>

                        <xsl:when test="name()='choice'"> <!--choice-->
                            <xsl:choose>
                                <xsl:when test="name(..)='p'">
                                    <xsl:if test="name(./*)='abbr' and not(.//tei:term)"> <!--abbreviazioni-->
                                        <xsl:element name="span" use-attribute-sets="attrAbbr">
                                            <xsl:value-of select="concat(./tei:expan , ' ')"/>
                                        </xsl:element>
                                    </xsl:if>

                                    <xsl:if test="name(./*)='sic' and not(.//tei:term)"> <!--errori-->
                                        <xsl:element name="span">
                                            <xsl:value-of select="concat(./tei:corr , ' ')"/>
                                        </xsl:element> 
                                    </xsl:if>
                                </xsl:when>

                                <xsl:when test="name(..)='add' or name(../..)='add'"> <!--parole abbreviate e aggiunte-->
                                    <xsl:if test=".//tei:abbr and not(.//tei:term)">
                                        <xsl:element name="span" use-attribute-sets="attrAbbrSottoAdd">
                                            <xsl:value-of select="concat(./tei:expan , ' ')"/>
                                        </xsl:element>
                                        <xsl:if test="./@xml:id='note1'">
                                            <a class="noteLista" href="#n1">n1</a> 
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:when>

                        <xsl:when test="name()='unclear'"> <!--testo non chiaro-->
                            <xsl:if test="name(..)='p'">
                                <xsl:value-of select="concat(. , ' ')"/>
                            </xsl:if>
                        </xsl:when>

                        <xsl:when test="name()='hi'"> <!--sottolineature-->
                            <xsl:if test="name(..)='p' and not(name(./*)='term')">
                                <u><xsl:value-of select="concat(. , ' ')"/></u>
                            </xsl:if>
                            <xsl:if test="./@xml:id='note2'">
                                <a class="noteLista" href="#n2">n2</a> 
                            </xsl:if>
                        </xsl:when>

                        <xsl:when test="name()='term'"> <!--elementi terminologici-->
                            <xsl:choose>
                                <xsl:when test="@ref='#mutabilite'"> <!--caso particolare (term, aggiunta, sottolineatura)-->
                                    <u><xsl:element name="a" use-attribute-sets="terminiTesto">
                                        <xsl:attribute name="class">termSottoAdd</xsl:attribute>mutabilité
                                    </xsl:element></u>
                                </xsl:when>

                                <xsl:when test="name(./*)='hi'"> <!--term è sottolineato-->
                                    <xsl:element name="a" use-attribute-sets="terminiTesto">
                                        <u><xsl:value-of select="concat(. , ' ')"/></u>
                                    </xsl:element>
                                </xsl:when>

                                <xsl:when test="name(..)='hi'"> <!--term è parte di una sottolineatura-->
                                    <u><xsl:value-of select="../node()"/>
                                    <xsl:element name="a" use-attribute-sets="terminiTesto">
                                        <xsl:value-of select="concat(. , ' ')"/>
                                    </xsl:element>
                                    </u>
                                </xsl:when>

                                <xsl:when test="name(..)='expan'"> <!--term è un'abbreviazione-->
                                    <xsl:choose>
                                        <xsl:when test="name(../../..)='add'"> <!--term è un'abbreviazione e un'aggiunta-->
                                            <xsl:element name="a" use-attribute-sets="attrTermAddAbbr">
                                                <xsl:value-of select="concat(. , ' ')"/>
                                            </xsl:element>
                                        </xsl:when>

                                        <xsl:otherwise>
                                            <xsl:element name="a" use-attribute-sets="attrTermSottoAbbr">
                                                <xsl:value-of select="concat(. , ' ')"/>
                                            </xsl:element>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                
                                <xsl:when test="name(..)='add' or name(../../..)='add'"> <!--term è un'aggiunta-->
                                    <xsl:element name="a" use-attribute-sets="attrTermSottoAdd">
                                        <xsl:value-of select="concat(. , ' ')"/>
                                    </xsl:element>
                                </xsl:when>

                                <xsl:otherwise>
                                    <xsl:element name="a" use-attribute-sets="terminiTesto">
                                        <xsl:value-of select="concat(. , ' ')"/>
                                    </xsl:element>
                                </xsl:otherwise>  
                            </xsl:choose>
                            <xsl:if test="./@xml:id='note5'">
                                <a class="noteLista" href="#n5">n5</a>
                            </xsl:if>
                        </xsl:when>

                        <xsl:when test="name()='surname'"> <!--nomi di persona-->
                            <xsl:choose>
                                <xsl:when test="name(./*)='choice'"> <!--il nome è un'abbreviazione-->
                                    <xsl:element name="span" use-attribute-sets="attrAbbr">
                                        <xsl:value-of select="concat(.//tei:expan,' ')"/>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="."/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>

                        <xsl:when test="name()='seg'"> <!--testo semplice-->
                        <xsl:if test="not(name(..)='del')">
                            <xsl:choose>
                                <xsl:when test="name(..)='add' or name(../..)='add' or name(../../..)='add'">
                                    <xsl:if test="not(..[@ref='#mouvement']) and not(..[@ref='#unite'])">
                                        <xsl:element name="span" use-attribute-sets="attrAdd">
                                            <xsl:value-of select="concat(. , ' ')"/> 
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat(. , ' ')"/> 
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="./@xml:id='note3'">
                                <a class="noteLista" href="#n3">n3</a>
                            </xsl:if>
                            <xsl:if test="./@xml:id='note4'">
                                <a class="noteLista" href="#n4">n4</a>
                            </xsl:if>
                        </xsl:if>
                        </xsl:when>

                        <xsl:when test="name()='pc'"> <!--segni di punteggiatura-->
                            <xsl:value-of select="concat(. , ' ')"/>      
                        </xsl:when>

                    </xsl:choose>
                    
                </xsl:for-each>
                
            </xsl:for-each>
            
        </p>
    </xsl:template>


    <!--Traduzione pagina 3-->
    <xsl:template match="//tei:div[@xml:id='TestoTradPag3']" name="templateTrad" mode="traduzione">
        <p>
            <xsl:for-each select=".//tei:div[@type='translation']">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </p>
    </xsl:template>

    <!--Glossario pagina 3-->
    <xsl:template match="//tei:div[@xml:id='glossary_pg3']" name="templateGlossario">
        <ul>
            <xsl:for-each select=".//tei:item">
                <li>
                    <xsl:element name="term" use-attribute-sets="terminiLista"><xsl:value-of select="./tei:term"/></xsl:element>:
                    <xsl:value-of select="./tei:gloss"/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <!--Note pagina 3-->
    <xsl:template match="//tei:div[@xml:id='notes_pg3']" name="templateNote">
        <ul>
            <xsl:for-each select=".//tei:item">
                <li>
                    <xsl:element name="note" use-attribute-sets="noteLista"><xsl:value-of select="./tei:note/@xml:id"/></xsl:element>: 
                    <xsl:value-of select="./tei:note"/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <!--Informazioni sul manoscritto-->
    <xsl:template match="//tei:msIdentifier">
        Il manoscritto <i><xsl:value-of select="./tei:msName"/></i> (<xsl:value-of select="./tei:idno"/>) è conservato presso la <xsl:value-of select="./tei:repository"/> 
        (<xsl:value-of select="./tei:settlement"/>, <xsl:value-of select="./tei:country"/>). <br/>
    </xsl:template>

    <xsl:template match="//tei:msContents">
        <xsl:value-of select="./tei:summary"/>
    </xsl:template>

    <xsl:template match="//tei:physDesc">
        Materiale: <xsl:value-of select="//tei:material"/>.
        <br/>
        Dimensione: <xsl:value-of select="//tei:extent"/>.
        <br/>
        Condizioni: <xsl:value-of select="//tei:condition"/>.
    </xsl:template>

    <!--Informazioni sulla codifica-->
    <xsl:template match="//tei:projectDesc">
        <xsl:value-of select="//tei:projectDesc"/>.<br/>
    </xsl:template>
    <xsl:template match="//tei:publicationStmt">
        Il manoscritto è stato codificato da <xsl:value-of select="./tei:authority"/> in data <xsl:value-of select="./tei:date"/>.
        Questa edizione digitale è distribuita da <xsl:value-of select="./tei:distributor"/>.<br/>
    </xsl:template>
    <xsl:template match="//tei:bibl">
        <xsl:if test="./@xml:id='bibl1'">
            La trascrizione del testo in francese è tratta da <i><xsl:value-of select="concat(./tei:title,' (',./tei:publisher,', ',./tei:date,')')"/></i> 
            di <xsl:value-of select="./tei:author"/>, a cura di <xsl:value-of select="concat(./tei:editor,' e ',./tei:editor[last()])"/>.<br/>
        </xsl:if>
        <xsl:if test="./@xml:id='bibl2'"> 
            La traduzione in italiano e le note sono tratte da <i><xsl:value-of select="concat(./tei:title[@type='main'],', ',./tei:title[@type='sub'],' (',./tei:publisher,', ',./tei:date,')')"/></i>
            di <xsl:value-of select="./tei:author"/>. 
        </xsl:if>
    </xsl:template>
    
    <!--ATTRIBUTI-->
    <!--Attributi di ogni elemento <area> all'interno di <map>-->
    <xsl:attribute-set name="attrMap">
        <xsl:attribute name="shape">rect</xsl:attribute>
        <xsl:attribute name="coords"><xsl:value-of select="concat(./@ulx,',',./@uly,',',./@lrx,',',./@lry)"/></xsl:attribute>
        <xsl:attribute name="href"><xsl:value-of select="concat('##',./@xml:id)"/></xsl:attribute>
    </xsl:attribute-set>

    <!--Attributi di ogni elemento <span> che segna l'inizio di una nuova riga-->
    <xsl:attribute-set name="attrFreccia">
        <xsl:attribute name="id"><xsl:value-of select="./@facs"/></xsl:attribute>
    </xsl:attribute-set>

    <!--Attributi di ogni aggiunta-->
    <xsl:attribute-set name="attrAdd">
        <xsl:attribute name="class">add</xsl:attribute>
    </xsl:attribute-set>

    <!--Attributi di ogni abbreviazione-->
    <xsl:attribute-set name="attrAbbr">
        <xsl:attribute name="class">abbr</xsl:attribute>
        <xsl:attribute name="hoverText"><xsl:value-of select=".//tei:abbr"/></xsl:attribute>
    </xsl:attribute-set> 

    <!--Attributi di ogni abbreviazione + aggiunta-->
    <xsl:attribute-set name="attrAbbrSottoAdd">
        <xsl:attribute name="class">abbrSottoAdd</xsl:attribute>
        <xsl:attribute name="hoverText"><xsl:value-of select="./tei:abbr"/></xsl:attribute>
    </xsl:attribute-set>

    <!--Attributi di ogni elemento terminologico + aggiunta-->
    <xsl:attribute-set name="attrTermSottoAdd">
        <xsl:attribute name="class">termSottoAdd</xsl:attribute>
        <xsl:attribute name="href"><xsl:value-of select="./@ref"/></xsl:attribute>
    </xsl:attribute-set>

    <!--Attributi di ogni elemento terminologico + abbreviazione-->
    <xsl:attribute-set name="attrTermSottoAbbr">
        <xsl:attribute name="class">termSottoAbbr</xsl:attribute>
        <xsl:attribute name="hoverText"><xsl:value-of select="../../tei:abbr"/></xsl:attribute>
        <xsl:attribute name="href"><xsl:value-of select="./@ref"/></xsl:attribute>
    </xsl:attribute-set>

    <!--Attributi di ogni elemento terminologico + abbreviazione + aggiunta-->
    <xsl:attribute-set name="attrTermAddAbbr">
        <xsl:attribute name="class">termAddAbbr</xsl:attribute>
        <xsl:attribute name="hoverText">
            <xsl:choose>
                <xsl:when test="../../tei:abbr/tei:choice">
                    <xsl:value-of select="../../tei:abbr/tei:choice/tei:corr"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="../../tei:abbr"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="href"><xsl:value-of select="./@ref"/></xsl:attribute>
    </xsl:attribute-set>

    <!--Attributi di ogni elemento terminologico-->
    <xsl:attribute-set name="terminiTesto"> 
        <xsl:attribute name="href"><xsl:value-of select="./@ref"/></xsl:attribute>
    </xsl:attribute-set>

    <!--Attributi di ogni elemento terminologico all'interno del glossario-->
    <xsl:attribute-set name="terminiLista">
        <xsl:attribute name="id"><xsl:value-of select="./tei:term/@xml:id"/></xsl:attribute>
    </xsl:attribute-set>

    <!--Attributi di ogni nota all'interno della lista delle note-->
    <xsl:attribute-set name="noteLista">
        <xsl:attribute name="id"><xsl:value-of select="./tei:note/@xml:id"/></xsl:attribute>
        <xsl:attribute name="class">noteLista</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>