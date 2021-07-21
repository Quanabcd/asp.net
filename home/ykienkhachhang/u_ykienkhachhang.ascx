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
<div class="content_row row vc_row wpb_row  default-style fullwidth">
    <div class="content_row_wrapper  default" style="padding-top: 50px; padding-bottom: 50px; padding-left: 50px; padding-right: 50px;">
        <div class="vc_col-sm-12 wpb_column vc_column_container">
            <div class="wpb_wrapper">
                <div class="rt_heading_wrapper style-4">
                    <h3 class="rt_heading  style-4"><%=WEB.Common.Getlabel("lb_title_COMMENTS","HỌ NÓI GÌ VỀ CHÚNG TÔI",WEB.Common.Lang )%></h3>
                </div>
                <div id="slider-testimonial-dynamicID-644093" class="rt-carousel rt-image-carousel carousel-holder clearfix testimonial-carousel testimonials center big" data-item-width="1" data-nav="true" data-dots="false" data-margin="15" data-autoplay="true" data-timeout="5500" data-loop="true" data-tablet-item-width="" data-mobile-item-width="1">
                    <div class="owl-carousel">
                        <asp:Repeater ID="rpitems" runat="server">
                            <ItemTemplate>
                                <div>
                                    <div class="testimonial item">

                                        <div class="client_image gradient">
                                            <%#getimg(Eval("vimg").ToString(),Eval("vtitle").ToString()) %>
                                        </div>


                                        <div class="text with_image">
                                            <p>
                                                <span class="icon-quote-left"></span>
                                                <%#Eval("vdesc") %>                                            
                                            </p>
                                            <div class="client_info">
                                                Anh <%#Eval("vtitle") %> 
		                                    - <span><%#Eval("vcontent") %></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>