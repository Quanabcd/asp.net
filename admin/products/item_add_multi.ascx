<%@ Control Language="C#" AutoEventWireup="true" CodeFile="item_add_multi.ascx.cs" Inherits="admin_products_item_edit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<script src="<%=WEB.Common.Weburl %>templates/admin/js/lang.js"></script>
<script src="<%=WEB.Common.Weburl %>templates/admin/js/jquery.fineuploader.js"></script>
<script src="<%=WEB.Common.Weburl %>templates/admin/js/js.upload.js"></script>
<link rel="stylesheet" href="<%=WEB.Common.Weburl %>templates/admin/css/jquery.modal.min.css" />
<asp:Literal ID="ltdetailmsg" runat="server"></asp:Literal>
<div class="widget-title">
    <h4><i class="icon-reorder-items">
        <asp:Literal ID="lttitle" runat="server"></asp:Literal></i></h4>
    <div class="ui-widget-content ui-corner-top ui-corner-bottom">
        <div id="toolbox">
            <div style="float: right; margin-right: 10px;" class="toolbox-content">
                <table class="toolbar">
                    <tr>
                        <td align="center">
                            <asp:LinkButton ID="lnkupdate" runat="server" CssClass="toolbar" OnClick="lnkupdate_Click">
							<span class="icon-ok-update"></span>
							Lưu thông tin
                            </asp:LinkButton>
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="lnkclose" runat="server" CssClass="toolbar" OnClick="lnkclose_Click">
						<span class="icon-ok-close"></span>
							Đóng
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</div>

<div id="element-box">
    <div class="m">
        <div id="adminForm1">
            <div id="parentHorizontalTabcontent">
                    <ul class="resp-tabs-list hor_1">
                        <li>Thông tin sản phẩm</li>
                    </ul>
                    <div class="resp-tabs-container hor_1" >
                       
                        
                        
                         <div>
                            <div class="wrapper-content  ps-relative" id="divProductVariants">
                                <label class="title-product-main  block-display mb20">Thêm nhanh các sản phẩm ở bên dưới( <span style="font-size:11px;font-weight:normal;color:#888">Chọn nút "Thêm mới" để thêm các hàng tiếp theo</span> )</label>
                                <div class="pull-right pos-add-edit-btn">
                                    
                                    <a class="btn-add-prdt ml10" data-toggle="modal" >Thêm mới</a>
                                    
                                </div>
                                <div class="" style="clear:both">
                                   
                                    <div class="table-wrap overflow-auto">
                                        <table class="table p-none tabprdm">
                                            <thead>
                                                <tr>
                                                    <th class="col-sm-1"><b>Hình ảnh</b></th>
                                                    <th class="col-sm-2"><b>Mã sản phẩm</b></th>
                                                    <th class="col-sm-4 p-none"><b>Tên sản phẩm</b></th>
                                                    <th class="col-sm-2"><b>Giá bán</b></th>
                                                    <th class="col-sm-2"><b>Giá cũ</b></th>
                                                    <th class="col-sm-1"></th>
                                                </tr>
                                            </thead>


                                           <tbody>
                                                 <tr id="trsub-1" class="record">
                                                     <td>
                                                         <div class="box">
                                                             <input type="file" class="inputfile" name="file-1" id="file-1" />
                                                             
                                                             <label>
                                                                 <img src="../../uploads/products/thumbs/default.png" id="imgsrc-1" class="img-responsive imgprd" alt="Hình ảnh sản phẩm" />
                                                                 <span>Chọn ảnh</span>
                                                                 <input type="hidden" class="tempimg" name="tempimg-1" id="tempimg-1" value="" />
                                                             </label>
                                                         </div>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control inline prdcode" value="<%#Eval("vkey") %>" name="prdcode-1">
                                                    </td>
                                                   
                                                    <td>
                                                        <input type="text" class="form-control inline prdname"  value="<%#Eval("vtitle") %>"  name="prdname-1">
                                                    </td>
                                                     <td>
                                                        <div class="input-group box-choose-collection-border">
                                                            <span class="input-group-addon input-style-collection text-price-dollar">đ</span>
                                                            <input type="text" class="form-control inline prdprice" onkeypress=" return isNumberKey(event)" value="0" name="prdprice-1">
                                                        </div>                                                
                                                    </td>
                                                    <td>
                                                        <div class="input-group box-choose-collection-border">
                                                            <span class="input-group-addon input-style-collection text-price-dollar">đ</span>
                                                            <input type="text" class="form-control inline prdpriceold" onkeypress=" return isNumberKey(event)"  value="0" name="prdpriceold-1">
                                                        </div>                                                
                                                    </td>
                                                    <td  valign="top"  align="center">
                                                        <a href="javascript:void(0)" title="Xóa"  class="lnkprddetaildelete"   id="rc-delete-1"></a>
                                                        <input type="hidden" class="rc-isub" name="rc-isub-1" value="0" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                            
                                        </table>
                                        <input type="hidden" id="hdnumprd" name="hdnumprd" value="1" />
										<input type="hidden"  id="hdnumprdtmp" name="hdnumprdtmp" value="1" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
             <asp:HiddenField ID="hdiid" runat="server" Visible="false" />
            <asp:HiddenField ID="hd_insertupdate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdimg_old" runat="server" Visible="false" />
            <asp:HiddenField ID="hdiviews" runat="server" Visible="false" />
            <asp:HiddenField ID="hdcreatedate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdupdatedate" runat="server" Visible="false" />
            <asp:HiddenField ID="hdfeature" runat="server" />
            <asp:HiddenField ID="hdtitle" runat="server" Visible="false" />
            <asp:HiddenField ID="hdalias" runat="server" Visible="false" />
             <asp:HiddenField ID="hdname" runat="server" Visible="false" />
            
              <asp:HiddenField ID="hdbrochure" runat="server" Visible="false" />
             <asp:HiddenField ID="hdgroup" runat="server" Visible="false" />
             <asp:HiddenField ID="hditemp" runat="server" Value="-1" Visible="false" />
              </div>
        <div class="clr"></div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        //Horizontal Tab
        $('#parentHorizontalTabcontent').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });

    });

    $(document).on("change", '.inputfile', function () {
        var id = $(this).parents('.record').attr('id');
        var fileUpload = $("#" + id + " .inputfile").get(0);
        var files = fileUpload.files;
        if(files.length!=0)
        {
            var test = new FormData();
            for (var i = 0; i < files.length; i++) {
                test.append(files[i].name, files[i]);
            }
            $.ajax({
                url: "upload/uploads.ashx",
                type: "POST",
                contentType: false,
                processData: false,
                data: test,
                // dataType: "json",
                success: function (result) {
                    $.ajax({
                        type: "POST",
                        url: "/webservices/webservice_common.asmx/DeleteImagePrd",
                        data: "{ img: '" + $("#" + id + " .tempimg").attr("value") + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                        },
                        error: function (data) {
                        }
                    });
                    $("#" + id + " .imgprd").attr("src", "../../uploads/products/thumbs/" + result);
                    $("#" + id + " .tempimg").attr("value", result);
                    // alert(result);
                },
                error: function (err) {
                    //   alert(err.statusText);
                }
            });
        }
    })
    $(document).on("click", '.btn-add-prdt', function () {
        idpr = $('.tabprdm');
        tr = idpr.children('tbody').children('tr:last');
        step = tr.clone();
        stt = parseInt($("#hdnumprd").val()) + 1;
        step.attr("id", "trsub-" + stt);
        step.children('td').children('div').children('input.inputfile').attr('name', 'file-' + stt);
        step.children('td').children('div').children('input.inputfile').attr('id', 'file-' + stt);
        step.children('td').children('div').children('label').children('input.tempimg').attr('name', 'tempimg-' + stt);
        step.children('td').children('div').children('label').children('input.tempimg').attr('value', '');
        step.children('td').children('div').children('label').children('input.tempimg').attr('id', 'tempimg-' + stt);
        step.children('td').children('div').children('label').children('img.imgprd').attr('src', '../../uploads/products/thumbs/default.png');
        step.children('td').children('div').children('label').children('img.imgprd').attr('id', 'imgsrc-' + stt);
        
        step.children('td').children('input.prdcode').attr('name', 'prdcode-' + stt);
        step.children('td').children('input.prdname').attr('name', 'prdname-' + stt);
        step.children('td').children('div').children('input.prdprice').attr('name', 'prdprice-' + stt);
        step.children('td').children('div').children('input.prdpriceold').attr('name', 'prdpriceold-' + stt);
        // step.children('td').children('textarea.txtcontentcn').attr('id', 'txtcontentcn-' + stt);
        //step.children('td').children('input.prdnumber').attr('name', 'prdnumber-' + stt);
        step.children('td').children('.rc-isub').attr('name', 'rc-isub-' + stt);
        step.children('td').children('.rc-isub').attr('value', -1);
        $("#hdnumprd").val(stt);
        $("#hdnumprdtmp").val(parseInt($("#hdnumprdtmp").val()) + 1);
        step.children('td').children('.lnkprddetaildelete').attr('id', 'rc-delete-' + stt);
        step.appendTo(idpr);
    })
    $(document).on("click", '.lnkprddetaildelete', function () {
        var num = $("#hdnumprdtmp").val();
        if (num <= 1) {
            alert("Bạn không được xóa");
            return;
        }
        if (confirm("Bạn có muốn xóa không?")) {
            var id = $(this).parents('.record').attr('id');
            var stt = parseInt(num) - 1;
            $("#hdnumprdtmp").val(stt);
            var img = $("#" + id + " .tempimg").attr("value");
            if (img.length > 0) {
                $.ajax({
                    type: "POST",
                    url: "/webservices/webservice_common.asmx/DeleteImagePrd",
                    data: "{ img: '" + img + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                    },
                    error: function (data) {
                    }
                });
            }
            $("#" + id).remove();
        }
    })
  
    $(document).on("click", '.nhanban', function () {
        $(".modal-backdrop").show();
        $("#ex1").show();
    })
    $(document).on("click", '.close', function () {
        $(".modal-backdrop").hide();
        $("#ex1").hide();
    })
    $(document).on("click", '.bnthuy', function () {
        $(".modal-backdrop").hide();
        $("#ex1").hide();
    })
  
</script>
<style>
    table.admintable td table td {
        padding: 0px;
    }
    .modal-backdrop {
        background: rgba(0,0,0,0.5);
    }
 
</style>