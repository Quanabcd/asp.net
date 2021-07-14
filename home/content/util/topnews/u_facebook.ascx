<%@ Control Language="C#" ClassName="u_facebook" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<div class="mdlpro">
    <div class="proindex">
        <div class="cBox tableft">
            <div class="bT_sR">
                <div class="bT_sBG">
                    <div class="bT_lL">
                        <div class="bT_lR">
                            <div class="bT_lBG">
                            <h2>Facebook</h2></div>
                        </div>
                    </div>
                    <div class="bT_sC">
                        <!---->
                    </div>
                    <div class="bT_RSS">
                        <!--viewall-->
                    </div>
                    <div style="clear: both">
                    </div>
                </div>
            </div>
            <div class="bC_BG">
                <div class="bC_I">
                    <div style="padding: 7px 3px 7px 7px;">

                    </div>
                </div>
            </div>
            <div style="clear:both;"></div>
            <div class="bB_L">
                <div class="bB_R">
                    <div class="bB_BG">
                        <!---->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>