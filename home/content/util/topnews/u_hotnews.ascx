<%@ Control Language="C#" ClassName="u_hotnews" %>
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
        string[]searchf={};
        string condition = "vparam4 like '%1|%' and vcode='MNW'";
        dt = WEB.Items.getlistitembypage(searchf, "",condition, 0, 15, "dupdate desc");
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
<div class="Hiring_item">
			<div class="div_newstop"><h2>Tin mới nhất</h2></div>
            <div class="div_newstop_block">
               <asp:Repeater ID="rp_item" runat="server">
                   <ItemTemplate>
                    <div class="div_news_item">
                        <div style=" display:inline-block; width:100%;">
                            <div class="div_news_item_left">
                                <a href="<%=weburl%><%#WEB.Common.GetNewTitle(Eval("vtitle").ToString())%>-dn-<%#Eval("iid") %>"><%#getimg(Eval("vimg").ToString(),Eval("vtitle").ToString()) %></a>
                                <div style=" clear:both;"></div>
                            </div>
                            <div class="div_news_item_right">
                                 <a href="<%=weburl%><%#WEB.Common.GetNewTitle(Eval("vtitle").ToString())%>-dn-<%#Eval("iid") %>"><%#Cutleft(Eval("vtitle").ToString(),50) %></a>
                                <div style=" clear:both;"></div>
                            </div>
                        </div>
                        <div style=" clear:both;"></div>
                    </div>
                   </ItemTemplate>
               </asp:Repeater>
            </div>
		</div>