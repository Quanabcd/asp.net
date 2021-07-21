<%@ Control Language="C#" %>
<script runat="server">
    public string WebURL = WEB.Common.Weburl;
    public string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        WEB.Layout.LoadControlToPlaceholder(ref phslider, "~/home/advs/u_slides.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref phqc, "~/home/advs/u_adv1.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref phnews, "~/home/news/util/topnews/topnewnews.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref phalbums, "~/home/advs/u_adv2.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref phyk, "~/home/ykienkhachhang/u_ykienkhachhang.ascx");
        WEB.Layout.LoadControlToPlaceholder(ref phdoitac, "~/home/advs/u_doitac.ascx");
    }
</script>
<script type="text/javascript">function setREVStartSize(e) {
        //window.requestAnimationFrame(function() {				 
        window.RSIW = window.RSIW === undefined ? window.innerWidth : window.RSIW;
        window.RSIH = window.RSIH === undefined ? window.innerHeight : window.RSIH;
        try {
            var pw = document.getElementById(e.c).parentNode.offsetWidth,
                newh;
            pw = pw === 0 || isNaN(pw) ? window.RSIW : pw;
            e.tabw = e.tabw === undefined ? 0 : parseInt(e.tabw);
            e.thumbw = e.thumbw === undefined ? 0 : parseInt(e.thumbw);
            e.tabh = e.tabh === undefined ? 0 : parseInt(e.tabh);
            e.thumbh = e.thumbh === undefined ? 0 : parseInt(e.thumbh);
            e.tabhide = e.tabhide === undefined ? 0 : parseInt(e.tabhide);
            e.thumbhide = e.thumbhide === undefined ? 0 : parseInt(e.thumbhide);
            e.mh = e.mh === undefined || e.mh == "" || e.mh === "auto" ? 0 : parseInt(e.mh, 0);
            if (e.layout === "fullscreen" || e.l === "fullscreen")
                newh = Math.max(e.mh, window.RSIH);
            else {
                e.gw = Array.isArray(e.gw) ? e.gw : [e.gw];
                for (var i in e.rl) if (e.gw[i] === undefined || e.gw[i] === 0) e.gw[i] = e.gw[i - 1];
                e.gh = e.el === undefined || e.el === "" || (Array.isArray(e.el) && e.el.length == 0) ? e.gh : e.el;
                e.gh = Array.isArray(e.gh) ? e.gh : [e.gh];
                for (var i in e.rl) if (e.gh[i] === undefined || e.gh[i] === 0) e.gh[i] = e.gh[i - 1];

                var nl = new Array(e.rl.length),
                    ix = 0,
                    sl;
                e.tabw = e.tabhide >= pw ? 0 : e.tabw;
                e.thumbw = e.thumbhide >= pw ? 0 : e.thumbw;
                e.tabh = e.tabhide >= pw ? 0 : e.tabh;
                e.thumbh = e.thumbhide >= pw ? 0 : e.thumbh;
                for (var i in e.rl) nl[i] = e.rl[i] < window.RSIW ? 0 : e.rl[i];
                sl = nl[0];
                for (var i in nl) if (sl > nl[i] && nl[i] > 0) { sl = nl[i]; ix = i; }
                var m = pw > (e.gw[ix] + e.tabw + e.thumbw) ? 1 : (pw - (e.tabw + e.thumbw)) / (e.gw[ix]);
                newh = (e.gh[ix] * m) + (e.tabh + e.thumbh);
            }
            if (window.rs_init_css === undefined) window.rs_init_css = document.head.appendChild(document.createElement("style"));
            document.getElementById(e.c).height = newh + "px";
            window.rs_init_css.innerHTML += "#" + e.c + "_wrapper { height: " + newh + "px }";
        } catch (e) {
            console.log("Failure at Presize of Slider:" + e)
        }
        //});
    };
</script>
<div class="go-to-top icon-up-open"></div>


<div id="main_content">
    <asp:PlaceHolder ID="phslider" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phqc" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phnews" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phalbums" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phyk" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phdoitac" runat="server"></asp:PlaceHolder>
    <div class="content_row row vc_row wpb_row  default-style fullwidth" style="background-color: #f57d27;">

        <div class="content_row_wrapper  fullwidth" style="padding-top: 2px; padding-bottom: 3px;">
            <div class="vc_col-sm-12 wpb_column vc_column_container">
                <div class="wpb_wrapper">
                </div>
            </div>

        </div>
    </div>
</div>


