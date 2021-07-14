<%@ control language="C#" autoeventwireup="true" inherits="admin_report_report, App_Web_3soieqmr" %>
<script type="text/javascript" src="/templates/admin/js/highcharts.js"></script>
<div class="rpor" style="min-height:800px;background:#fff">
    <h1 style="padding:20px;font-weight:bold;color:#000;font-size:20px;">Biểu đồ thống kê truy cập</h1>
    <span style="font-size:11px;color:#888;padding:0px 20px;">Để thống kê chi tiết lượt truy cập vào website bạn nên tích hợp công cụ Google Analytic vào website. Xem hướng dẫn tích hợp google analytic vào website <a target="_blank" href='http://tamnghia.com/huong-dan-tich-hop-google-analytic-vao-website'>tại đây</a> </span>
    <div style="padding:20px">
        <div class="row">
            <div class="col-sm-6">
                 <asp:RadioButton ID="rdmonth" Checked="true" runat="server" GroupName="rd" /> Xem theo tháng  &nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlmonth" runat="server" CssClass="inputbox"></asp:DropDownList> &nbsp;&nbsp;
    <asp:DropDownList ID="ddlyear" runat="server" CssClass="inputbox"></asp:DropDownList> &nbsp;&nbsp;
    <asp:Button ID="btndisplaybymonth" OnClick="btndisplaybymonth_Click" runat="server" CssClass="btn btn1" Text="Hiển thị" />
            </div>
            <div class="col-sm-6">
                 <asp:RadioButton ID="rdyear" runat="server" GroupName="rd" /> Xem theo năm &nbsp;&nbsp;&nbsp;
     <asp:DropDownList ID="ddlyea1" runat="server" CssClass="inputbox"></asp:DropDownList> &nbsp;&nbsp;
     <asp:Button ID="btndisplaybyyear" OnClick="btndisplaybyyear_Click"  CssClass="btn btn1" runat="server" Text="Hiển thị" />
            </div>
        </div>
   
  
   
        </div>
 <div class="chart-container">
                    <script>
                        $(function () {
                            chart = new $('#dimple-line-horizontal-multiple').highcharts({
                                title: {
                                    text: 'Lưu Lượng Truy Cập',
                                    x: -20 //center
                                },
                                subtitle: {
                                    text: 'Thống kê truy cập',
                                    x: -20
                                },
                                xAxis: {
                                    categories: [<%=x%>]
                                },
                                yAxis: {
                                    title: {
                                        text: 'Tổng Truy cập'
                                    },
                                    plotLines: [{
                                        value: 0,
                                        width: 1,
                                        color: '#808080'
                                    }]
                                },
                                tooltip: {
                                    valueSuffix: ' Lượt'
                                },
                                plotOptions: {
                                    column: {
                                        pointPadding: 0.2,
                                        borderWidth: 0
                                    }
                                },
                                series: [{
                                    type: 'line',
                                    name: 'Tổng truy cập',
                                    data: [<%=y%>]
                                }
                                ]

                            });
                        });
</script>
                    <div class="chart" id="dimple-line-horizontal-multiple" data-highcharts-chart="0">
                       
                    </div>
     </div>
    </div>