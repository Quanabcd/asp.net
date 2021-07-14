<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_vertical_slide_menu.ascx.cs" Inherits="home_news_menu_u_vertical_slide_menu" %>

<script type="text/javascript">

                        ddsmoothmenu.init({
                        mainmenuid: "smoothmenu2", //Menu DIV id
                        orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
                        classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
                        //customtheme: ["#804000", "#482400"],
                        contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
                        
                        })
</script>
<div class='tab'>
    <div class='tab_tl'>
        <div class='tab_tr'>
            <div class='tab_tc'>Danh mục tin tức</div>
        </div>
    </div>
    <div class='tab_cl'>
        <div class='tab_cr'>
            <div class='tab_cc'>
                <div id='smoothmenu2' class='ddsmoothmenu-v'>
                    <asp:Literal ID="ltmenu" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
    <div class='tab_bl'>
        <div class='tab_br'>
            <div class='tab_bc'></div>
        </div>
    </div>
               
</div>
