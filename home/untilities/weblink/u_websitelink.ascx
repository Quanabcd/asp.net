<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_websitelink.ascx.cs" Inherits="home_untilities_weblink_u_websitelink" %>
<div class="mdlpro">
    <div class="proindex">
        <div class="cBox tableft">
            <div class="bT_sR">
                <div class="bT_sBG">
                    <div class="bT_lL">
                        <div class="bT_lR">
                            <div class="bT_lBG">
                                <h2>Liên kết website</h2>
                            </div>
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
                    <div style="padding: 0px 3px 7px 3px;">
                       <div class='w_link'>
                <asp:DropDownList ID="ddllink" runat="server" Width="170" AutoPostBack="true" 
                    onselectedindexchanged="ddllink_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    </div>
                </div>
            </div>
            <div style="clear: both;">
            </div>
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
