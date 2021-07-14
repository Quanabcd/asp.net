<%@ Control Language="C#" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    string WebURL = WEB.Common.Weburl;
    string lang = WEB.Common.Lang;
    protected void Page_Load(object sender, EventArgs e)
    {
        getlist();
    }
    public string getimg(string img, string alt)
    {
        return "<img alt='" + alt + "' src='" + WebURL + "uploads/ykienkh/" + img + "'>";
    }
    void getlist()
    {
        DataTable dt = new DataTable();
        string[] searchf = { };
        string condition = "";
        dt = TN.Items.GetListItemInCateByPage("-1", searchf, "", "YKH", lang, condition, "1", 0, 10, "iparam1 asc,dcreatedate desc");
        rpitems.DataSource = dt;
        rpitems.DataBind();

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





<section class="awe-section-5">
    <div class="section_tour-holiday">
        <div class="container">
            <div class="row">
                <div class="section_tour-new_title">
                    <h2><%=WEB.Common.Getlabel("lb_title_COMMENTS","COMMENTS",WEB.Common.Lang )%></h2>
                    <div class="title-line">
                        <div class="tl-1"></div>
                        <div class="tl-2"></div>
                        <div class="tl-3"></div>
                    </div>

                </div>
            </div>
            <div class="ykkh owl-carousel ">
                <asp:Repeater ID="rpitems" runat="server">
                    <ItemTemplate>
                        <div class="item">
                            <div class="ykkh-img">
                                <%#getimg(Eval("vimg").ToString(),Eval("vtitle").ToString()) %>
                            </div>
                            <div class="ykkh-content">
                                <div class="ykkh-title">
                                    <p><%#Eval("vtitle") %>   - </p>
                                    <span><%#Eval("vcontent") %> </span>
                                </div>
                                <div class="ykkh-desc">
                                    <%#Eval("vdesc") %>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="comment_button"><a href="/ykienbinhluan"><%=WEB.Common.Getlabel("lb_title_comentarios","Comments",WEB.Common.Lang )%></a></div>
        </div>
    </div>
</section>
