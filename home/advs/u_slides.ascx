<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_slides.ascx.cs" Inherits="home_advs_u_slides" %>

<div class="content_row row vc_row wpb_row  default-style fullwidth">
    <div class="content_row_wrapper  nopadding fullwidth">
        <div class="vc_col-sm-12 wpb_column vc_column_container">
            <div class="wpb_wrapper">
                <p class="rs-p-wp-fix"></p>
                <rs-module-wrap id="rev_slider_1_1_wrapper" data-source="gallery" style="background: transparent; padding: 0; margin: 0px auto; margin-top: 0; margin-bottom: 0; max-width: ;">
				<rs-module id="rev_slider_1_1" style="" data-version="6.2.22">
					<rs-slides>
                        <asp:Repeater ID="rpitems" runat="server">
                            <ItemTemplate>
                                <rs-slide data-key="rs-60" data-title="Slide" data-thumb="/uploads/qc/<%#Eval("vcontent") %>" data-link="<%#Eval("vparam4") %>" data-target="_self" data-seoz="front" data-duration="13990" data-anim="ei:d;eo:d;s:d;r:0;t:curtain-3;sl:d;">
							<img src="/uploads/qc/<%#Eval("vcontent") %>" title="<%#Eval("vtitle") %>" width="1360" height="540" class="rev-slidebg" data-no-retina>
                		</rs-slide>
                            </ItemTemplate>
                        </asp:Repeater>
					</rs-slides>
				</rs-module>
				<script type="text/javascript">
                    setREVStartSize({ c: 'rev_slider_1_1', rl: [1240, 1024, 778, 480], el: [650], gw: [1800], gh: [650], type: 'standard', justify: '', layout: 'fullwidth', mh: "0" });
                    var revapi1,
                        tpj;
                    function revinit_revslider11() {
                        jQuery(function () {
                            tpj = jQuery;
                            revapi1 = tpj("#rev_slider_1_1");
                            if (revapi1 == undefined || revapi1.revolution == undefined) {
                                revslider_showDoubleJqueryError("rev_slider_1_1");
                            } else {
                                revapi1.revolution({
                                    duration: 5000,
                                    visibilityLevels: "1240,1024,778,480",
                                    gridwidth: 1800,
                                    gridheight: 650,
                                    spinner: "spinner4",
                                    perspective: 600,
                                    perspectiveType: "local",
                                    editorheight: "650,768,960,820",
                                    responsiveLevels: "1240,1024,778,480",
                                    progressBar: {
                                        color: "rgba(0,0,0,0.15)",
                                        vertical: "top",
                                        size: 5,
                                        x: 0,
                                        y: 0
                                    },
                                    navigation: {
                                        mouseScrollNavigation: false,
                                        onHoverStop: false,
                                        touch: {
                                            touchenabled: true,
                                            swipe_min_touches: 50
                                        },
                                        arrows: {
                                            enable: true,
                                            style: "hephaistos",
                                            hide_onmobile: true,
                                            hide_under: 600,
                                            hide_onleave: true,
                                            left: {
                                                h_offset: 30
                                            },
                                            right: {
                                                h_offset: 30
                                            }
                                        }
                                    },
                                    fallbacks: {
                                        allowHTML5AutoPlayOnAndroid: true
                                    },
                                });
                            }

                        });
                    } // End of RevInitScript
                    var once_revslider11 = false;
                    if (document.readyState === "loading") { document.addEventListener('readystatechange', function () { if ((document.readyState === "interactive" || document.readyState === "complete") && !once_revslider11) { once_revslider11 = true; revinit_revslider11(); } }); } else { once_revslider11 = true; revinit_revslider11(); }
				</script>
				<script>
                    var htmlDivCss = unescape(".rev-scroll-btn%7B%0A%20%20%20%20opacity%3A%200.4%20%21important%3B%20%20%0A%7D%0A.rev-scroll-btn%20span%20%7B%0A%20%20%20%20height%3A%206px%3B%0A%20%20%20%20width%3A%203px%3B%0A%20%20%20%20border-radius%3A%200%3B%0A%20%20%20%20left%3A%20calc%2850%25%20%2B%202px%29%3B%20%20%20%20%0A%7D");
                    var htmlDiv = document.getElementById('rs-plugin-settings-inline-css');
                    if (htmlDiv) {
                        htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
                    } else {
                        var htmlDiv = document.createElement('div');
                        htmlDiv.innerHTML = '<style>' + htmlDivCss + '</style>';
                        document.getElementsByTagName('head')[0].appendChild(htmlDiv.childNodes[0]);
                    }
				</script>
				<script>
                    var htmlDivCss = '	#rev_slider_1_1_wrapper rs-loader.spinner4 div { background-color: #FFFFFF !important; } ';
                    var htmlDiv = document.getElementById('rs-plugin-settings-inline-css');
                    if (htmlDiv) {
                        htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
                    } else {
                        var htmlDiv = document.createElement('div');
                        htmlDiv.innerHTML = '<style>' + htmlDivCss + '</style>';
                        document.getElementsByTagName('head')[0].appendChild(htmlDiv.childNodes[0]);
                    }
				</script>
				<script>
                    var htmlDivCss = unescape("%23rev_slider_1_1_wrapper%20.hephaistos.tparrows%20%7B%0A%09cursor%3Apointer%3B%0A%09background%3Argba%280%2C0%2C0%2C0.5%29%3B%0A%09width%3A40px%3B%0A%09height%3A40px%3B%0A%09position%3Aabsolute%3B%0A%09display%3Ablock%3B%0A%09z-index%3A1000%3B%0A%20%20%20%20border-radius%3A50%25%3B%0A%7D%0A%23rev_slider_1_1_wrapper%20.hephaistos.tparrows%3Ahover%20%7B%0A%09background%3A%23000000%3B%0A%7D%0A%23rev_slider_1_1_wrapper%20.hephaistos.tparrows%3Abefore%20%7B%0A%09font-family%3A%20%27revicons%27%3B%0A%09font-size%3A18px%3B%0A%09color%3A%23ffffff%3B%0A%09display%3Ablock%3B%0A%09line-height%3A%2040px%3B%0A%09text-align%3A%20center%3B%0A%7D%0A%23rev_slider_1_1_wrapper%20.hephaistos.tparrows.tp-leftarrow%3Abefore%20%7B%0A%09content%3A%20%27%5Ce82c%27%3B%0A%20%20%20%20margin-left%3A-2px%3B%0A%20%20%0A%7D%0A%23rev_slider_1_1_wrapper%20.hephaistos.tparrows.tp-rightarrow%3Abefore%20%7B%0A%09content%3A%20%27%5Ce82d%27%3B%0A%20%20%20%20margin-right%3A-2px%3B%0A%7D%0A%0A%0A");
                    var htmlDiv = document.getElementById('rs-plugin-settings-inline-css');
                    if (htmlDiv) {
                        htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
                    } else {
                        var htmlDiv = document.createElement('div');
                        htmlDiv.innerHTML = '<style>' + htmlDivCss + '</style>';
                        document.getElementsByTagName('head')[0].appendChild(htmlDiv.childNodes[0]);
                    }
				</script>
				<script>
                    var htmlDivCss = unescape("%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A");
                    var htmlDiv = document.getElementById('rs-plugin-settings-inline-css');
                    if (htmlDiv) {
                        htmlDiv.innerHTML = htmlDiv.innerHTML + htmlDivCss;
                    } else {
                        var htmlDiv = document.createElement('div');
                        htmlDiv.innerHTML = '<style>' + htmlDivCss + '</style>';
                        document.getElementsByTagName('head')[0].appendChild(htmlDiv.childNodes[0]);
                    }
				</script>
			</rs-module-wrap>
            </div>
        </div>

    </div>
</div>
