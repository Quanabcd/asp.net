<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" EnableViewState="false" EnableEventValidation="false" EnableViewStateMac="false" EnableSessionState="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="vi-vn" lang="vi-vn">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="robots" content="index, follow" />
    <meta http-equiv="Content-Language" content="vi" />
    <meta name="copyright" content="Copyright" />
    <link rel='stylesheet' href='/templates/home/css/style.min.css' type='text/css' media='all' />
    <link rel='stylesheet' href='/templates/home/css/form.min.css' type='text/css' media='all' />
    <link rel='stylesheet' href='/templates/home/css/rs6.css' type='text/css' media='all' />
    <link rel='stylesheet' href='/templates/home/css/app.min.css' type='text/css' media='all' />
    <link rel='stylesheet' href='/templates/home/css/mejs-skin.min.css' type='text/css' media='all' />
    <link rel='stylesheet' href='/templates/home/css/fontello.css' type='text/css' media='all' />
    <link rel='stylesheet' href='/templates/home/css/default.min.css' type='text/css' media='all' />
    <link rel='stylesheet' href='/templates/home/css/js_composer.min.css' type='text/css' media='all' />
    <link rel='stylesheet' href='/templates/home/css/dynamic-style.css' type='text/css' media='all' />
    <script type='text/javascript' src='/templates/home/js/jquery.min.js' id='jquery-core-js'></script>
    <script type='text/javascript' src='/templates/home/js/jquery-migrate.min.js' id='jquery-migrate-js'></script>
    <script type='text/javascript' src='/templates/home/js/rbtools.min.js' id='tp-tools-js'></script>
    <script type='text/javascript' src='/templates/home/js/rs6.min.js' id='revmin-js'></script>
    <style type="text/css" id="wp-custom-css">
        .top-header.stuck {
            position: fixed;
            width: 100%;
            z-index: 299;
            top: 0;
            -webkit-transform: translateZ(0);
            -webkit-transition: top .4s ease;
            -o-transition: top .4s ease;
            transition: top .4s ease;
            -webkit-box-shadow: 0 2px 2px rgba(0,0,0,.07);
            box-shadow: 0 2px 2px rgba(0,0,0,.07);
            height: 90px;
        }

            .top-header.stuck #navigation > li > a, .top-header.stuck .header-widget {
                line-height: 90px;
            }

        h1, h2, h3, h4, h5, h6 {
            margin-top: 10px;
        }

        .default-style, .default-style *, .default-style *:before, .default-style *:after, .default-style:before, .default-style:after, .default-style .button_.color:hover, .default-style .row table > tbody > tr > td {
            border-color: #f4f4f4;
        }

        html .formcraft-css .simple_button:hover {
            box-shadow: 0 0 30px rgba(0, 0, 0, 0) inset;
        }

        .default-style input[type="submit"], .default-style input[type="button"], .default-style button:not(.button_), .default-style .comment-reply a, .default-style .comment-reply-title small > a, .default-style button.button, .default-style input.button, .default-style #respond input#submit, .default-style .cart_totals a.button {
            background-color: #ec8500;
        }


        .default-style, .default-style *, .default-style *:before, .default-style *:after, .default-style:before, .default-style:after, .default-style .button_.color:hover, .default-style .row table > tbody > tr > td {
            border-color: #ec8500;
        }

        textarea {
            line-height: 1.4em;
            padding: 11px 30px;
            height: auto;
        }

        .wpProQuiz_toplistTable th {
            background: #9BBB59 !important;
        }

        button, input, optgroup, select, textarea {
            color: inherit;
            margin: 0;
            font-size: 15px;
            font-family: arial;
        }

        .wpProQuiz_toplistTable th {
            background: #ec8500 !important;
        }

        .default-style, .default-style *, .default-style *:before, .default-style *:after, .default-style:before, .default-style:after, .default-style .button_.color:hover, .default-style .row table > tbody > tr > td {
            border-color: #f2f2f2;
        }


        .select2-container .select2-choice, input[type=date], input[type=datetime-local], input[type=email], input[type=input], input[type=month], input[type=number], input[type=password], input[type=search], input[type=tel], input[type=text], input[type=time], input[type=url], select, textarea {
            padding: 12px 10px;
            border-width: 1px;
            border-style: solid;
            background-color: rgb(236, 133, 0);
            line-height: 100%;
            height: 37px;
            -webkit-appearance: none;
            -webkit-border-radius: 0;
            border-radius: 0;
        }

        div.toggle-title:hover {
            background-color: #27e1ec
        }

        .row table > tbody > tr > td {
            border-color: #0000;
        }

        .row table > tbody > tr > td {
            border-color: #0000;
        }

        .default-style, .default-style *, .default-style *:before, .default-style *:after, .default-style:before, .default-style:after, .default-style .button_.color:hover, .default-style .row table > tbody > tr > td {
            border-color: #f2f2f200;
        }
    </style>
</head>
<body class="">
    <div id="container">
        <form id="fwrp" runat="server">
            <div id="fb-root"></div>
            <script>(function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) return;
                    js = d.createElement(s); js.id = id;
                    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));</script>
            <asp:PlaceHolder ID="phtop" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="ph_control" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="phfooter" runat="server"></asp:PlaceHolder>
            <asp:Literal ID="ltremarketing" runat="server"></asp:Literal>
            <asp:Literal ID="ltlivechat" runat="server"></asp:Literal>
        </form>
    </div>
    <asp:PlaceHolder ID="phmenubm" runat="server"></asp:PlaceHolder>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400" rel="stylesheet" property="stylesheet" media="all" type="text/css" />
    <script type='text/javascript' src='/templates/home/js/mediaelement-and-player.min.js' id='mediaelement-core-js'></script>
    <script type='text/javascript'>
    /* <![CDATA[ */
        var rt_theme_params = { "ajax_url": "", "rttheme_template_dir": "", "popup_blocker_message": "", "wpml_lang": "", "theme_slug": "", "home_url": "", "page_loading": "", "page_leaving": "" };
    /* ]]> */
    </script>
    <script type='text/javascript' src='/templates/home/js/app.min.js' id='rt-theme-scripts-js'></script>
</body>
</html>
