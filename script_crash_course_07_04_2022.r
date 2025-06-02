<!DOCTYPE html>

<html lang="de" class="ct-default">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no">

<title>Moodle - Universität Graz</title>

<link rel="stylesheet"  type="text/css" href="/theme/unigraz/css/login.css" media="all">

<link rel="stylesheet"  type="text/css" href="https://static.uni-graz.at/dist/unigraz/themes_landingpages.css" media="all">

<script defer src="https://static.uni-graz.at/dist/unigraz/Components.js"></script>

</head>

<body>
    <header>
        <div id="topbar">
            <div class="container"><ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <ug-dropdown-widget
                     options='[
                       {"value":"fs-sm","label":{"de":"kleine Schriftgröße","en":"small font size"},"Title":"kleine Schriftgröße", "icon":"icon-fontsize-small"},
                       {"value":"fs-base","label":{"de":"normale Schriftgröße","en":"normal font size"},"Title":"normale Schriftgröße", "icon":"icon-fontsize-normal"},
                       {"value":"fs-lg","label":{"de":"große Schriftgröße","en":"big font size"},"Title":"große schrift Größe", "icon":"icon-fontsize-big"}

                     ]'
                     action='{
                         "type":"css-cookie",
                         "cookie": {"name":"accessibility-fs","domain":"uni-graz.at"},
                         "target": "html"
                     }'
                     icons="topbar-icons"
                     icon="icon-fontsize"
                     title='{"de":"Schriftgröße","en":"fontsize"}'
                     icon_only
                     direction="horizontal"
                     css="https://static.uni-graz.at/dist/unigraz/themes_landingpages.css"
                     class="accessibility-fs"
                     id="menu-fontsize"
                    ></ug-dropdown-widget>
                </li>
                 <li class="nav-item dropdown">
                     <ug-dropdown-widget
                     options='[
                       {"value":"ct-default","label":{"de":"normaler Kontrast","en":"default contrast"},"Title":"default contrast", "icon":"icon-placeholder"},
                       {"value":"ct-blue-yellow","label":{"de":"blau-gelb  Kontrast","en":"blue-yellow contrast"},"Title":"blue-yellow contrast", "icon":"icon-placeholder"},
                       {"value":"ct-yellow-blue","label":{"de":"gelb-blau Kontrast","en":"yellow-blue contrast"},"Title":"yellow-blue contrast", "icon":"icon-placeholder"},
                       {"value":"ct-black-yellow","label":{"de":"shwarz-gelb Kontrast","en":"black-yellow contrast"},"Title":"black-yellow contrast", "icon":"icon-placeholder"},
                       {"value":"ct-yellow-black","label":{"de":"gelb-shwarz Kontrast","en":"yelloe-black contrast"},"Title":"yellow-black contrast", "icon":"icon-placeholder"},
                       {"value":"ct-black-white","label":{"de":"schwarz-weiß Kontrast","en":"black-white contrast"},"Title":"black-white contrast", "icon":"icon-placeholder"},
                       {"value":"ct-white-black","label":{"de":"weiß-schwarz Kontrast","en":"white-black contrast"},"Title":"white-black contrast", "icon":"icon-placeholder"}
                     ]'
                     action='{
                         "type":"css-cookie",
                         "cookie": {"name":"accessibility-ct", "domain":"uni-graz.at"},
                         "target": "html"
                     }'
                     icons="topbar-icons"
                     icon="icon-contrast"
                     title="contrast"
                     icon_only
                     direction="horizontal"
                     css="https://static.uni-graz.at/dist/unigraz/themes_landingpages.css"
                     id="menu-contrast"
                     class="accessibility-ct"
                    ></ug-dropdown-widget>
                </li>
                <li class="nav-item dropdown">
                    <ug-dropdown-widget
                     options='[{"value":"de","label":"Deutsch","Title":"Deutsch"},{"value":"en","label":"English","Title":"English"}]'
                     action='{
                         "type":"js",
                         "cookie": {"name":"language"},
                         "target": "switchLanguage"
                     }'
                     icon="icon-language"
                     icons="topbar-icons"
                     css="https://static.uni-graz.at/dist/unigraz/themes_landingpages.css"

                     id="menu-language"
                    ></ug-dropdown-widget>
                </li>
            </ul></div>
       </div>
    </header>
    <div class="container">
        <div class="row">
        <div class="col-md-6 col-sm-12 my-5" >

        <ug-login
          title_text='{"de":"Anmelden","en":"Login"}'
          login_links='[{"text":{"de":"Login","en":"Login"},"url":"/auth/saml2/login.php"},{"text":{"de":"Extern","en":"Extern"},"url":"#loginformpopup"}]'
          bg_image='//moodle.uni-graz.at/pluginfile.php/1/theme_unigraz/landingbackgroundimage/1746814079/main-kl.png'
          lang="de"
          image_overflow="left-overflow"
          image_justify="left"
          css="https://static.uni-graz.at/dist/unigraz/themes_landingpages.css"
         >
          <p>Du kannst dich mit deinem uniACCOUNT anmelden</p>
                        <p slot="de">Du kannst dich mit deinem uniACCOUNT anmelden</p>
                        <p slot="en">You can log in with your uniACCOUNT</p>
                  </ug-login>

        </div>
          <div class="col-md-6 col-sm-12" >


              <ug-feature-list
                title='Moodle'
                css='https://static.uni-graz.at/dist/unigraz/themes_landingpages.css'
                icons="icons"
                lang="de"
                features='[{"icon":"e-learning-book-smartphone-school-learning","title":{"de":"Interaktive Lernaktivitäten","en":"Interactive learning activities"},"description":{"de":"","en":""}},{"icon":"folder-download-files-folders","title":{"de":"Unterlagen bereitstellen","en":"Provide materials"},"description":{"de":"","en":""}},{"icon":"group-folder-icon","title":{"de":"Kollaboration","en":"Collaboration"},"description":{"de":"","en":""}},{"icon":"synchronize-arrow-1-interface-essential","title":{"de":"Schnittstelle zu UNIGRAZonline","en":"Interface to UNIGRAZonline"},"":{"de":"","en":""}}]'
                links='[{"icon":"chatbot-icon","link":"https://ask.uni-graz.at/?identityId=d2a0cc18-8e97-4e87-9c4f-c1b3190844fc&process=lern","text":{"de":"Digitaler Assistent (Studierende)","en":"Digital assistant (Students)"}},{"icon":"chatbot-icon","link":"https://intranet.uni-graz.at/einheiten/715/Pages/ASK_lern.aspx","text":{"de":"Digitaler Assistent (Lehrende)","en":"Digital assistant (Teachers)"}},{"icon":"info-icon","link":"https://servicedesk.uni-graz.at/servicedesk/customer/portal/4","text":{"de":"Technischer Support (uniIT)","en":"Technical support (uniIT)"}},{"icon":"info-icon","link":"https://digitales-lehren-und-lernen.uni-graz.at/de/","text":{"de":"Didaktischer Support (ZDLL)","en":"Didactic support (ZDLL)"}}]'

              >
                  <div><p>Moodle ist die zentrale E-Learning Plattform der Uni Graz. Als Ergänzung zur Präsenzlehre werden den Lehrenden und Studierenden aller Fakultäten online Kursräume zur Verfügung gestellt.</p></div>
                                        <div slot="de"><p>Moodle ist die zentrale E-Learning Plattform der Uni Graz. Als Ergänzung zur Präsenzlehre werden den Lehrenden und Studierenden aller Fakultäten online Kursräume zur Verfügung gestellt.</p></div>
                                        <div slot="en"><p>Moodle is the central e-learning platform of the University of Graz. As a supplement to face-to-face teaching, online course rooms are made available to teachers and students of all faculties.</p></div>
                                </ug-feature-list>


          </div>


        <div>
    </div>
</div>
</div>


<div id="loginformpopup" class="overlay odal-dialog  border border-primary rounded p-3" role="document"><a class="cancel" href="#"></a><div id="unigraz" class="loginpopup"><div role="main"><span id="maincontent"></span><div class="loginform">
        <h1 class="login-heading mb-4">Login bei 'Moodle'</h1>
    <div id="theme_boost_union-loginorder">
    <div id="theme_boost_union-loginorder-local" class="theme_boost_union-loginmethod">
    <div class="login-divider"></div>
    <form class="login-form" action="https://moodle.uni-graz.at/login/index.php" method="post" id="login">
        <input id="anchor" type="hidden" name="anchor" value="">
        <script>document.getElementById('anchor').value = location.hash;</script>
        <input type="hidden" name="logintoken" value="3bBjHrvSWny9HqVEFDcJHHBrfOYceM0f">
        <div class="login-form-username mb-3">
            <label for="username" class="sr-only">
                    Anmeldename oder E-Mail
            </label>
            <input type="text" name="username" id="username" class="form-control form-control-lg" value="" placeholder="Anmeldename oder E-Mail" autocomplete="username">
        </div>
        <div class="login-form-password mb-3">
            <label for="password" class="sr-only">Kennwort (Password)</label>
            <input type="password" name="password" id="password" value="" class="form-control form-control-lg" placeholder="Kennwort (Password)" autocomplete="current-password">
        </div>
        <div class="login-form-submit mb-3">
            <button class="btn btn-primary btn-lg" type="submit" id="loginbtn">Login</button>
        </div>
        <div class="login-form-forgotpassword mb-3">
            <a href="https://moodle.uni-graz.at/login/forgot_password.php">Kennwort vergessen?</a>
        </div>
    </form>
    </div>
    <div id="theme_boost_union-loginorder-firsttimesignup" class="theme_boost_union-loginmethod">
    </div>
    <div id="theme_boost_union-loginorder-guest" class="theme_boost_union-loginmethod">
        <div class="login-divider"></div>
        <h2 class="login-heading">Kurse können für Gäste offen sein</h2>
        <form action="https://moodle.uni-graz.at/login/index.php" method="post" id="guestlogin">
            <input type="hidden" name="logintoken" value="3bBjHrvSWny9HqVEFDcJHHBrfOYceM0f">
            <input type="hidden" name="username" value="guest" />
            <input type="hidden" name="password" value="guest" />
            <button class="btn btn-secondary" type="submit" id="loginguestbtn">Anmelden als Gast</button>
        </form>
    </div>
    </div>
    <div class="login-divider"></div>
    <div class="d-flex">
            <div class="login-languagemenu">
                <div class="action-menu moodle-actionmenu" id="action-menu-0" data-enhance="moodle-core-actionmenu">
                
                        <div class="menubar d-flex " id="action-menu-0-menubar">
                
                            
                
                
                                <div class="action-menu-trigger">
                                    <div class="dropdown">
                                        <a
                                            href="#"
                                            tabindex="0"
                                            class=" dropdown-toggle icon-no-margin"
                                            id="action-menu-toggle-0"
                                            aria-label="Deutsch ‎(de)‎"
                                            data-toggle="dropdown"
                                            role="button"
                                            aria-haspopup="true"
                                            aria-expanded="false"
                                            aria-controls="action-menu-0-menu"
                                        >
                                            
                                            Deutsch ‎(de)‎
                                                
                                            <b class="caret"></b>
                                        </a>
                                            <div class="dropdown-menu menu dropdown-menu-right" id="action-menu-0-menu" data-rel="menu-content" aria-labelledby="action-menu-toggle-0" role="menu">
                                                                                                <a href="#" class="dropdown-item menu-action" role="menuitem" tabindex="-1" >
                                                <span class="menu-action-text">Deutsch ‎(de)‎</span>
                                        </a>
                                                                                                <a href="https://moodle.uni-graz.at/login/index.php?lang=en" class="dropdown-item menu-action" data-lang="en" lang="en" role="menuitem" tabindex="-1" >
                                                <span class="menu-action-text">English ‎(en)‎</span>
                                        </a>
                                                                                                <a href="https://moodle.uni-graz.at/login/index.php?lang=es" class="dropdown-item menu-action" data-lang="es" lang="es" role="menuitem" tabindex="-1" >
                                                <span class="menu-action-text">Español - Internacional ‎(es)‎</span>
                                        </a>
                                                                                                <a href="https://moodle.uni-graz.at/login/index.php?lang=fr" class="dropdown-item menu-action" data-lang="fr" lang="fr" role="menuitem" tabindex="-1" >
                                                <span class="menu-action-text">Français ‎(fr)‎</span>
                                        </a>
                                                                                                <a href="https://moodle.uni-graz.at/login/index.php?lang=hr" class="dropdown-item menu-action" data-lang="hr" lang="hr" role="menuitem" tabindex="-1" >
                                                <span class="menu-action-text">Hrvatski ‎(hr)‎</span>
                                        </a>
                                                                                                <a href="https://moodle.uni-graz.at/login/index.php?lang=it" class="dropdown-item menu-action" data-lang="it" lang="it" role="menuitem" tabindex="-1" >
                                                <span class="menu-action-text">Italiano ‎(it)‎</span>
                                        </a>
                                                                                                <a href="https://moodle.uni-graz.at/login/index.php?lang=hu" class="dropdown-item menu-action" data-lang="hu" lang="hu" role="menuitem" tabindex="-1" >
                                                <span class="menu-action-text">magyar ‎(hu)‎</span>
                                        </a>
                                                                                                <a href="https://moodle.uni-graz.at/login/index.php?lang=sl" class="dropdown-item menu-action" data-lang="sl" lang="sl" role="menuitem" tabindex="-1" >
                                                <span class="menu-action-text">Slovenščina ‎(sl)‎</span>
                                        </a>
                                                                                                <a href="https://moodle.uni-graz.at/login/index.php?lang=ru" class="dropdown-item menu-action" data-lang="ru" lang="ru" role="menuitem" tabindex="-1" >
                                                <span class="menu-action-text">Русский ‎(ru)‎</span>
                                        </a>
                                            </div>
                                    </div>
                                </div>
                
                        </div>
                
                </div>
            </div>
            <div class="divider border-left align-self-center mx-3"></div>
        <button type="button" class="btn btn-secondary"  data-modal="alert" data-modal-title-str='["cookiesenabled", "core"]'  data-modal-content-str='["cookiesenabled_help_html", "core"]'>Cookie-Hinweis</button>
    </div>
</div></div></div></div>
<ug-footer
id="footer"
class="theme-unigraz"
css="https://static.uni-graz.at/dist/unigraz/themes_landingpages.css"
navigation='[{"text":{"de":"Impressum","en":"Imprint"},"link":{"de":"https://www.uni-graz.at/de/impressum/","en":"https://www.uni-graz.at/en/imprint/"}},{"text":{"de":"Kontakt","en":"Contact"},"link":{"de":"https://www.uni-graz.at/de/kontakt-anfahrt/","en":"https://www.uni-graz.at/en/contact-and-arriving/"}},{"text":{"de":"Datenschutzerklärung","en":"Data protection declaration"},"link":{"de":"https://www.uni-graz.at/de/datenschutzerklaerung/","en":"https://www.uni-graz.at/de/datenschutzerklaerung/"}},{"text":{"de":"Barrierefreiheitserklärung","en":""},"link":{"de":"https://www.uni-graz.at/de/barrierefreiheitserklaerung/","en":""}}]'
>
</ug-footer>

<template id="icons">
    <div style="display:none">
    <svg id="elearning-book-laptop"  xmlns="http://www.w3.org/2000/svg" viewBox="-5 -5 58 58"><rect x="3.5" y="3.001" width="17" height="12" rx="1" ry="1" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/><path d="M4.409 15a1.025 1.025 0 00-.883.5l-2.385 4a1 1 0 00.883 1.5h19.952a1 1 0 00.883-1.5l-2.385-4a1.025 1.025 0 00-.883-.5M9.5 19.001h5M12 6.7s.92-1.291 3.983-1.424a.5.5 0 01.517.5v5.3a.5.5 0 01-.492.5C12.925 11.7 12 13 12 13V6.7s-.92-1.291-3.983-1.424a.5.5 0 00-.517.5v5.3a.5.5 0 00.492.5C11.075 11.7 12 13 12 13" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/></svg>
    <svg id="folder-download-files-folders"  xmlns="http://www.w3.org/2000/svg" viewBox="-5 -5 58 58"><g transform="scale(2)"><path d="M20.5 8.5v-4a1 1 0 00-1-1H9.618a1 1 0 01-.894-.553l-.948-1.894A1 1 0 006.882.5H1.5a1 1 0 00-1 1v15a1 1 0 001 1h7" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/><circle cx="17.5" cy="17.5" r="6" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M17.5 14.5v6M17.5 20.5l-2.25-2.25M17.5 20.5l2.25-2.25"/></g></svg>
    <svg id="group-folder-icon"  xmlns="http://www.w3.org/2000/svg" width="48" height="48"><path fill="none" d="M0 0h48v48H0z"/><path d="M14 20a4 4 0 114-4 4 4 0 01-4 4zm0-6a2 2 0 102 2 2 2 0 00-2-2zM12 38a1 1 0 01-.992-.876L10.117 30H9a1 1 0 01-1-1v-3a6.007 6.007 0 016-6 1 1 0 010 2 4 4 0 00-4 4v2h1a1 1 0 01.992.876L12.883 36H16a1 1 0 010 2zM34 20a4 4 0 114-4 4 4 0 01-4 4zm0-6a2 2 0 102 2 2 2 0 00-2-2zM32 38a1 1 0 010-2h3.117l.891-7.124A1 1 0 0137 28h1v-2a4 4 0 00-4-4 1 1 0 010-2 6.007 6.007 0 016 6v3a1 1 0 01-1 1h-1.117l-.891 7.124A1 1 0 0136 38zM24 18a5 5 0 115-5 5.005 5.005 0 01-5 5zm0-8a3 3 0 103 3 3 3 0 00-3-3z"/><path d="M21 40a1 1 0 01-.995-.9l-.911-9.1H17a1 1 0 01-1-1v-3a8 8 0 0116 0v3a1 1 0 01-1 1h-2.095l-.911 9.1a1 1 0 01-.995.9zm5.095-2l.911-9.1A1 1 0 0128 28h2v-2a6 6 0 00-12 0v2h2a1 1 0 01.995.9l.909 9.1z"/></svg>
    <svg id="synchronize-arrow-1-interface-essential"  xmlns="http://www.w3.org/2000/svg" viewBox="-5 -5 58 58"><g transform="scale(2)"><path d="M13.5 22a9.75 9.75 0 10-9.75-9.75V13" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" d="M.75 9.997l3 3 3-3"/></g></svg>
    <svg id="chatbot-icon"  xmlns="http://www.w3.org/2000/svg" width="48" height="48"><path fill="rgba(255,255,255,0)" d="M0 0h48v48H0z"/><g transform="translate(-17.604 -50.098)"><path d="M58.88 73.927H58a16.94 16.94 0 00-5.821-9.048v-4.47a2.327 2.327 0 10-.958.008v3.747a16.856 16.856 0 00-19.069-.112V60.4a2.327 2.327 0 10-.958.008v4.342a16.945 16.945 0 00-5.981 9.177h-.883a2.732 2.732 0 00-2.73 2.724v7.03a2.732 2.732 0 002.728 2.719h2.148a.928.928 0 00.928-.928V74.855a.928.928 0 00-.714-.9 15.469 15.469 0 0129.828 0 .928.928 0 00-.714.9v10.62a.928.928 0 00.928.928h2.148a2.732 2.732 0 002.72-2.722v-7.03a2.732 2.732 0 00-2.72-2.724zm-28.6-15.806a1.371 1.371 0 111.371 1.371 1.373 1.373 0 01-1.369-1.371zm20.027.013a1.371 1.371 0 111.371 1.371 1.373 1.373 0 01-1.369-1.371z" fill-rule="evenodd"/><circle cx="1.556" cy="1.556" r="1.556" transform="rotate(-45 111.696 -1.33)"/><circle cx="1.556" cy="1.556" r="1.556" transform="rotate(-45 117.218 -14.66)"/><path d="M41.606 83.533a3.018 3.018 0 003.232-2.743h-6.465a3.018 3.018 0 003.233 2.743z" fill-rule="evenodd"/><path d="M42.571 64.257h-1.929a12.905 12.905 0 00-12.868 12.868v6.083a10.408 10.408 0 00.32 2.642 15.585 15.585 0 005.933 2.35 1.4 1.4 0 11-.077 1.118 15.409 15.409 0 01-5.208-1.781c1.932 3.652 6.546 4.866 11.9 4.866h1.933c7.077 0 12.868-2.119 12.868-9.2V77.12a12.905 12.905 0 00-12.872-12.863zm10.7 15.612c0 3.139-2.226 5.707-4.946 5.707H34.883c-2.72 0-4.946-2.568-4.946-5.707s2.226-5.707 4.946-5.707h13.442c2.72 0 4.946 2.568 4.946 5.707z" fill-rule="evenodd"/></g></svg>
    <svg id="info-icon"  height="48" width="48" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h48v48H0z" fill="none"/><path d="M24 8.5a16 16 0 1016 16 16 16 0 00-16-16zm.333 6.667a2 2 0 11-2 2 2 2 0 012-2zm3 18H22a1.333 1.333 0 010-2.667h1a.333.333 0 00.333-.333v-6a.333.333 0 00-.333-.334h-1a1.333 1.333 0 010-2.667h1.333A2.667 2.667 0 0126 23.833v6.333a.333.333 0 00.333.333h1a1.333 1.333 0 010 2.667z"/></svg>
    <svg id="e-learning-book-smartphone-school-learning"  xmlns="http://www.w3.org/2000/svg" viewBox="-5 -5 58 58"><g transform="scale(2)"><path d="M5.5 19.751h-3a2 2 0 01-2-2v-15a2 2 0 012-2h7a2 2 0 012 2v4M.5 3.751h11M.5 16.751h5" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/><path d="M15.5 11.251s1.716-2.58 7.481-2.727a.51.51 0 01.519.5v11a.5.5 0 01-.5.5c-5.783.141-7.5 2.728-7.5 2.728v-12s-1.716-2.58-7.481-2.727a.51.51 0 00-.519.5v11a.5.5 0 00.5.5c5.783.141 7.5 2.728 7.5 2.728" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/></g></svg>
</div>
</template>


<template id="topbar-icons">
    <div style="display:none">
        <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 26.227 17.8" id="icon-fontsize"><path d="M6.934,0,0,17.8H3.813l1.469-4.043H12.4L13.95,17.8h3.908L10.733,0ZM6.387,10.757l2.4-6.6,2.453,6.6Z"></path><path d="M20.881,4.45H18.032l-2.391,6.136,1.673,4.18h4.815l1.166,3.033h2.932Zm-3.258,8.068,1.8-4.955,1.839,4.952H17.62Z"></path></svg>
        <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 17.54 12.852" id="icon-fontsize-small" preserveAspectRatio="xMidYMid"><path d="M3.726,7.542l2.178-5.99H5.94L8.082,7.546ZM5.004,0,0,12.852H1.746l1.44-3.87H8.622l1.4,3.87h1.89L6.894,0Z"></path><path d="M12.34,2.128v1.44h5.2V2.128Z"></path></svg>
        <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 17.54 12.852" id="icon-fontsize-normal" preserveAspectRatio="xMidYMid"><path d="M4.14,8.38,6.56,1.72H6.6L8.98,8.38ZM5.56,0,0,14.28H1.94l1.6-4.3H9.58l1.56,4.3h2.1L7.66,0Z"></path></svg>
        <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 27.968 20.144" id="icon-fontsize-big" preserveAspectRatio="xMidYMid"><path d="M4.968,13.064l2.9-7.992H7.92l2.856,7.992Zm1.7-10.056L0,20.144H2.328l1.92-5.16h7.248l1.872,5.16h2.52L9.188,3.008Z"></path><path d="M22.736,5.256V0H21.104V5.256H15.872V6.888h5.232v5.256h1.632V6.888h5.232V5.256Z"></path></svg>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 29.40721 20.00016" id="icon-contrast"><path d="M28.51419,5.83407l-1.607.714a8.264,8.264,0,0,1,.717,3.393c0,.298-.06.536-.06.774l1.72595.179a5.9462,5.9462,0,0,1,.117-.952A9.81632,9.81632,0,0,0,28.51419,5.83407Z"></path><path d="M25.4202,4.40505l1.25-1.186-.119-.119A10.33792,10.33792,0,0,0,22.44418.4761l-.537,1.667a7.86591,7.86591,0,0,1,3.394,2.143Z"></path><path d="M25.0032,15.95009c-.238.183-.476.421-.714.6l1.072,1.369a4.80041,4.80041,0,0,0,.83294-.719,9.52874,9.52874,0,0,0,2.26105-3.215l-1.607-.714A8.3007,8.3007,0,0,1,25.0032,15.95009Z"></path><path d="M19.29123,18.15706a6.28182,6.28182,0,0,1-1.488-.119l-.3,1.726a9.69561,9.69561,0,0,0,1.845.179,9.50015,9.50015,0,0,0,3.158-.536l-.536-1.667A8.38308,8.38308,0,0,1,19.29123,18.15706Z"></path><path d="M12.02621,3.39309a9.65,9.65,0,0,0,0,13.156,6.00039,6.00039,0,0,0,2.8-1.726,6.60906,6.60906,0,0,0,2.022-4.822,6.84386,6.84386,0,0,0-2.02405-4.882A7.59977,7.59977,0,0,0,12.02621,3.39309Z"></path><path d="M20.00021,9.91988a9.93612,9.93612,0,0,0-3.60278-7.62353,8.49226,8.49226,0,0,1,2.89179-.57025V.00008a10.60948,10.60948,0,0,0-4.63446,1.13635A9.9098,9.9098,0,0,0,10.00021.00008a10.15223,10.15223,0,0,0-7.083,2.917,9.90007,9.90007,0,0,0-2.917,7.083q-.00018.04011,0,.08014a9.96,9.96,0,0,0,10,9.91986,10.152,10.152,0,0,0,7.083-2.916,9.8999,9.8999,0,0,0,2.917-7.084Q20.00041,9.96,20.00021,9.91988ZM15.8342,15.835a8.007,8.007,0,0,1-5.834,2.441,8.27506,8.27506,0,1,1,5.834-14.109q.0411.04056.08166.08161A8.193,8.193,0,0,1,15.8342,15.835Z"></path></svg>
        <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 20 20" id="icon-language"><path d="M19.976,9.333A10,10,0,0,0,10.667.023V0H9.333V.023a10,10,0,0,0-9.31,9.31H0v1.333H.023a10,10,0,0,0,9.311,9.309V20h1.333v-.024a10,10,0,0,0,9.309-9.309H20V9.333ZM6.26,2.18A10.60006,10.60006,0,0,0,4.692,5.333h-2A8.712,8.712,0,0,1,6.26,2.18ZM2,6.667H4.341a15.83494,15.83494,0,0,0-.328,2.667H1.359A8.592,8.592,0,0,1,2,6.667Zm-.639,4H4.013a15.83494,15.83494,0,0,0,.328,2.667H2a8.592,8.592,0,0,1-.641-2.667Zm1.336,4h2A10.57106,10.57106,0,0,0,6.26,17.82a8.70008,8.70008,0,0,1-3.565-3.153Zm6.639,3.915c-1.371-.367-2.551-1.839-3.267-3.915H9.333Zm0-5.248H5.692a14.90079,14.90079,0,0,1-.345-2.667H9.333Zm0-4H5.347a14.90079,14.90079,0,0,1,.345-2.667H9.333Zm0-4H6.067c.716-2.076,1.9-3.548,3.267-3.913Zm7.972,0H15.311A10.57186,10.57186,0,0,0,13.74,2.18a8.721,8.721,0,0,1,3.565,3.153ZM10.667,1.42c1.369.365,2.551,1.837,3.267,3.913H10.667Zm0,5.247h3.64a15.02137,15.02137,0,0,1,.347,2.667H10.667Zm0,4h3.987a14.77959,14.77959,0,0,1-.347,2.667h-3.64Zm0,7.915V14.667h3.267c-.717,2.076-1.898,3.548-3.267,3.914Zm3.073-.761a10.652,10.652,0,0,0,1.571-3.153h1.995A8.711,8.711,0,0,1,13.74,17.82ZM18,13.333H15.659a15.83494,15.83494,0,0,0,.328-2.667H18.64A8.55309,8.55309,0,0,1,18,13.333Zm-2.016-4a15.83494,15.83494,0,0,0-.328-2.667H18a8.592,8.592,0,0,1,.639,2.667Z"></path></svg>
        <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 1 1" id="icon-placeholder"></svg>
    </div>
</template>

    <script>
    function switchLanguage(lang){

       document.querySelectorAll("ug-dropdown-widget").forEach(el => {
            el.setAttribute("lang",lang)
        });
        document.querySelectorAll("ug-login").forEach(el => {
            el.setAttribute("lang",lang)
        });
        document.querySelectorAll("ug-feature-list").forEach(el => {
            el.setAttribute("lang",lang)
        });
        document.querySelectorAll("ug-footer").forEach(el => {
            el.setAttribute("lang",lang)
        });
    }
    document.getElementById('menu-language').value = navigator.language.substr(0,2);
    document.getElementsByClassName('login-form-forgotpassword')[0].getElementsByTagName("a")[0].href += "#loginformpopup";
    </script>

</body></html>