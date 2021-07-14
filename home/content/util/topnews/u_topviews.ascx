<%@ Control Language="C#" ClassName="u_topviews" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    string lang = WEB.Common.Lang;
    string weburl = WEB.Common.Weburl;
    protected void Page_Load(object sender, EventArgs e)
    {
        getlist();
    }
    public string getimg(string img, string alt)
    {
        return "<img alt='" + alt + "' src='" + weburl + "uploads/news/" + img + "'>";
    }
    void getlist()
    {
        DataTable dt = new DataTable();
        string[] searchf = { };
        string condition = "vcode='MNW'";
        dt = WEB.Items.getlistitembypage(searchf, "", condition, 0, 6, "iviews desc");
        rp_item.DataSource = dt;
        rp_item.DataBind();
    }
    public string Cutleft(string value, int count)
    {
        string _value = value;
        if (_value.Length >= count)
        {
            string ValueCut = _value.Substring(0, count - 3);
            string[] valuearray = ValueCut.Split(' ');
            string valuereturn = "";
            for (int i = 0; i < valuearray.Length - 1; i++)
            {
                valuereturn = valuereturn + " " + valuearray[i];
            }
            return valuereturn + "...";
        }
        else
        {
            return _value;
        }
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
                            <h2>Tin xem nhiều nhất</h2></div>
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
                        <asp:Repeater ID="rp_item" runat="server">
                            <ItemTemplate>
                                <div class="item_news">
                                    <div class="item_news_left">
                                         <a href="<%=weburl%><%#WEB.Common.GetNewTitle(Eval("vtitle").ToString())%>-dn-<%#Eval("iid") %>"><%#getimg(Eval("vimg").ToString(),Eval("vtitle").ToString()) %></a>
                                        <div style=" clear:both;"></div>
                                    </div>
                                    <div class="item_news_right">
                                        <a href="<%=weburl%><%#WEB.Common.GetNewTitle(Eval("vtitle").ToString())%>-dn-<%#Eval("iid") %>"><%#Cutleft(Eval("vtitle").ToString(),50) %></a>
                                        <div style=" clear:both;"></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
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