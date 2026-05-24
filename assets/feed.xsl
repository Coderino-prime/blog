<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  exclude-result-prefixes="atom">

  <xsl:output method="html" encoding="utf-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width,initial-scale=1"/>
        <title><xsl:value-of select="/atom:feed/atom:title"/></title>
        
        <xsl:choose>
          <xsl:when test="/atom:feed/atom:icon">
            <link rel="icon" type="image/png">
              <xsl:attribute name="href">
                <xsl:value-of select="/atom:feed/atom:icon"/>
              </xsl:attribute>
            </link>
          </xsl:when>
          <xsl:when test="/atom:feed/atom:logo">
            <link rel="icon" type="image/png">
              <xsl:attribute name="href">
                <xsl:value-of select="/atom:feed/atom:logo"/>
              </xsl:attribute>
            </link>
          </xsl:when>
        </xsl:choose>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;display=swap" rel="stylesheet"/>

        <style type="text/css">
          :root{
            /* Framework / common colors (from provided SCSS) */
            color-scheme: dark;
            --bg: var(--main-bg, rgb(27 27 30));
            --main-bg: rgb(27 27 30);
            --mask-bg: rgb(68 69 70);
            --main-border-color: rgb(44 45 45);

            --text: var(--text-color, rgb(175 176 177));
            --text-color: rgb(175 176 177);
            --muted: var(--text-muted-color, #868686);
            --text-muted-color: #868686;
            --text-muted-highlight-color: #aeaeae;
            --heading-color: #cccccc;
            --label-color: #a7a7a7;
            --blockquote-border-color: rgb(66 66 66);
            --blockquote-text-color: #868686;

            --link: var(--link-color, rgb(138 180 248));
            --link-color: rgb(138 180 248);
            --link-underline-color: rgb(82 108 150);

            --button-bg: #1e1e1e;
            --btn-border-color: #2e2f31;
            --btn-backtotop-color: var(--text-color);
            --btn-backtotop-border-color: #212122;
            --card-header-bg: #292929;

            --checkbox-color: rgb(118 120 121);
            --checkbox-checked-color: var(--link-color);

            --img-bg: radial-gradient(circle, rgb(22 22 24) 0%, rgb(32 32 32) 100%);
            --shimmer-bg: linear-gradient(90deg, rgba(255,255,255,0) 0%, rgba(58,55,55,0.4) 50%, rgba(255,255,255,0) 100%);

            /* Sidebar / topbar */
            --site-title-color: #717070;
            --site-subtitle-color: #868686;
            --sidebar-bg: #1e1e1e;
            --sidebar-border-color: #292929;
            --sidebar-muted-color: #868686;
            --sidebar-active-color: rgba(255,255,255,0.95);
            --sidebar-hover-bg: #262626;
            --sidebar-btn-bg: #232328;
            --sidebar-btn-color: #787878;
            --avatar-border-color: rgba(206,206,206,0.9);

            --topbar-bg: rgba(27,27,30,0.64);
            --topbar-text-color: var(--text-color);
            --search-border-color: rgb(55 55 55);
            --search-icon-color: rgb(100 102 105);
            --input-focus-border-color: rgb(112 114 115);

            /* Posts / cards / misc */
            --post-list-text-color: rgb(175 176 177);
            --btn-patinator-text-color: var(--text-color);
            --btn-paginator-hover-color: #2e2e2e;

            --toc-highlight: rgb(116 178 243);
            --toc-popup-border-color: #373737;
            --tag-hover: rgb(43 56 62);
            --tb-odd-bg: #252526;
            --tb-even-bg: rgb(31 31 34);
            --tb-border-color: var(--tb-odd-bg);
            --footnote-target-bg: rgb(63 81 181);
            --btn-share-color: #6c757d;
            --btn-share-hover-color: #bfc1ca;
            --card-bg: #1e1e1e;
            --card-hover-bg: #464d51;
            --card-shadow: rgba(21,21,21,0.72) 0 6px 18px 0, rgba(137,135,135,0.24) 0 0 0 1px;

            --kbd-wrap-color: #6a6a6a;
            --kbd-text-color: #d3d3d3;
            --kbd-bg-color: #242424;

            --prompt-text-color: rgba(216,212,212,0.75);
            --prompt-tip-bg: rgba(22,60,36,0.64);
            --prompt-tip-icon-color: rgba(15,164,15,0.81);
            --prompt-info-bg: rgba(7,59,104,0.8);
            --prompt-info-icon-color: #0075d1;
            --prompt-warning-bg: rgba(90,69,3,0.88);
            --prompt-warning-icon-color: rgba(255,165,0,0.8);
            --prompt-danger-bg: rgba(86,28,8,0.8);
            --prompt-danger-icon-color: #cd0202;

            /* Tags / categories / archive */
            --tag-border: rgb(59 79 88);
            --tag-shadow: rgb(32 33 33);
            --dash-color: rgb(63 65 68);
            --search-tag-bg: #292828;
            --categories-border: rgba(64,66,69,0.5);
            --categories-hover-bg: rgb(73 75 76);
            --categories-icon-hover-color: white;
            --timeline-node-bg: rgb(150 152 156);
            --timeline-color: rgb(63 65 68);
            --timeline-year-dot-color: var(--timeline-color);

            /* Code highlight */
            --language-border-color: #2d2d2d;
            --highlight-bg-color: #151515;
            --highlighter-rouge-color: #c9def1;
            --highlight-lineno-color: #808080;
            --inline-code-bg: rgba(255,255,255,0.05);
            --code-color: #b0b0b0;
            --code-header-text-color: #6a6a6a;
            --code-header-muted-color: #353535;
            --code-header-icon-color: #565656;
            --clipboard-checked-color: #2bcc2b;
            --filepath-text-color: #cacaca;

            /* layout tokens */
            --radius: 12px;
            --max-width: 880px;
          }

          /* base layout */
          html,body{height:100%;margin:0;background:var(--main-bg);color:var(--text-color);font-family:Inter,system-ui,-apple-system,"Segoe UI",Roboto,Arial,sans-serif;-webkit-font-smoothing:antialiased;line-height:1.6}
          .wrap{max-width:var(--max-width);margin:40px auto;padding:20px}
          header{display:flex;flex-direction:column;gap:6px;margin-bottom:22px}
          .title{font-size:1.4rem;font-weight:700;color:var(--site-title-color)}
          .subtitle{color:var(--site-subtitle-color);font-size:0.95rem}
          .list{display:flex;flex-direction:column;gap:14px}
          article{background:#1e1e1e;border-radius:var(--radius);padding:18px;box-shadow:var(--card-shadow);border:1px solid rgba(255,255,255,0.02)}
          article h2{margin:0 0 8px 0;font-size:1.05rem;color:var(--heading-color)}
          .meta{color:var(--muted);font-size:0.9rem;margin-bottom:8px}
          article p{margin:0;color:var(--text);opacity:0.95}
          a{color:var(--link-color);text-decoration:none}
          a:hover{text-decoration:underline}
          .footer{color:var(--muted);font-size:0.85rem;margin-top:28px;text-align:center}
          .logo-row{display:flex;align-items:center;gap:12px;margin-bottom:8px}
          .logo{width:44px;height:44px;border-radius:8px;overflow:hidden;flex:0 0 44px;border:0px solid var(--avatar-border-color)}
          .logo img{width:100%;height:100%;object-fit:cover;display:block}
          @media (max-width:640px){ .wrap{margin:20px 12px} .title{font-size:1.15rem} }

          /* Categories &amp; list-group adjustments to match theme */
          .categories.card,
          .list-group-item {
            background-color: var(--card-bg);
          }
          .categories .card-header {
            background-color: var(--card-header-bg);
          }
          .categories .list-group-item {
            border-left: none;
            border-right: none;
            padding-left: 2rem;
            border-color: var(--categories-border);
          }
          .categories .list-group-item:last-child {
            border-bottom-color: var(--card-bg);
          }

          /* Archives odd rows gradient (from SCSS) */
          #archives li:nth-child(odd) {
            background-image: linear-gradient(
              to left,
              rgb(26 26 30),
              rgb(39 39 45),
              rgb(39 39 45),
              rgb(39 39 45),
              rgb(26 26 30)
            );
          }

          /* Disqus thread */
          #disqus_thread { color-scheme: none; }

          /* Syntax highlight (rouge base16.dark) */
          .highlight .gp { color: #87939d; }
          .highlight table td { padding: 5px; }
          .highlight table pre { margin: 0; }
          .highlight, .highlight .w { color: #d0d0d0; background-color: #151515; }
          .highlight .err { color: #151515; background-color: #ac4142; }
          .highlight .c, .highlight .ch, .highlight .cd, .highlight .cm, .highlight .cpf, .highlight .c1, .highlight .cs { color: #848484; }
          .highlight .cp { color: #f4bf75; }
          .highlight .nt { color: #f4bf75; }
          .highlight .o, .highlight .ow { color: #d0d0d0; }
          .highlight .p, .highlight .pi { color: #d0d0d0; }
          .highlight .gi { color: #90a959; }
          .highlight .gd { color: #f08a8b; background-color: #320000; }
          .highlight .gh { color: #6a9fb5; background-color: #151515; font-weight: bold; }
          .highlight .k, .highlight .kn, .highlight .kp, .highlight .kr, .highlight .kv { color: #aa759f; }
          .highlight .kc { color: #d28445; }
          .highlight .kt { color: #d28445; }
          .highlight .kd { color: #d28445; }
          .highlight .s, .highlight .sb, .highlight .sc, .highlight .dl, .highlight .sd, .highlight .s2, .highlight .sh, .highlight .sx, .highlight .s1 { color: #90a959; }
          .highlight .sa { color: #aa759f; }
          .highlight .sr { color: #75b5aa; }
          .highlight .si { color: #b76d45; }
          .highlight .se { color: #b76d45; }
          .highlight .nn { color: #f4bf75; }
          .highlight .nc { color: #f4bf75; }
          .highlight .no { color: #f4bf75; }
          .highlight .na { color: #6a9fb5; }
          .highlight .m, .highlight .mb, .highlight .mf, .highlight .mh, .highlight .mi, .highlight .il, .highlight .mo, .highlight .mx { color: #90a959; }
          .highlight .ss { color: #90a959; }

        </style>
      </head>

      <body>
        <div class="wrap">
          <header>
            <div class="logo-row">
              <div class="logo">
                <xsl:if test="/atom:feed/atom:icon">
                  <img>
                    <xsl:attribute name="src"><xsl:value-of select="/atom:feed/atom:icon"/></xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="/atom:feed/atom:title"/></xsl:attribute>
                  </img>
                </xsl:if>
              </div>
              <div>
                <div class="title"><xsl:value-of select="/atom:feed/atom:title"/></div>
                <div class="subtitle"><xsl:value-of select="/atom:feed/atom:subtitle"/></div>
              </div>
            </div>
          </header>

          <section class="list">
            <xsl:for-each select="/atom:feed/atom:entry">
              <article>
                <h2>
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="atom:link[not(@rel) or @rel='alternate'][1]/@href"/>
                    </xsl:attribute>
                    <xsl:value-of select="atom:title"/>
                  </a>
                </h2>

                <div class="meta">
                  <xsl:choose>
                    <xsl:when test="atom:updated">
                      <xsl:value-of select="substring(atom:updated,1,10)"/>
                    </xsl:when>
                    <xsl:when test="atom:published">
                      <xsl:value-of select="substring(atom:published,1,10)"/>
                    </xsl:when>
                  </xsl:choose>
                  <xsl:text> • </xsl:text>
                  <xsl:choose>
                    <xsl:when test="atom:author/atom:name">
                      <xsl:value-of select="atom:author/atom:name"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="/atom:feed/atom:author/atom:name"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </div>

                <xsl:choose>
                  <xsl:when test="atom:summary">
                    <p><xsl:value-of select="atom:summary" disable-output-escaping="yes"/></p>
                  </xsl:when>
                  <xsl:otherwise>
                    <p><xsl:copy-of select="atom:content/node()"/></p>
                  </xsl:otherwise>
                </xsl:choose>
              </article>
            </xsl:for-each>
          </section>

          <div class="footer">
            <xsl:text>Updated: </xsl:text><xsl:value-of select="substring(/atom:feed/atom:updated,1,10)"/>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
