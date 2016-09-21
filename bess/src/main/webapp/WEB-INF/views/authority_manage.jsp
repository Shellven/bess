<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<title>门店导购后端支撑子系统</title>
	<!--                       CSS                       -->
	<!-- Reset Stylesheet -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css" type="text/css" media="screen" />
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css" type="text/css" media="screen" />
	<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/invalid.css" type="text/css" media="screen" />
	<!--                       Javascripts                       -->
	<!-- jQuery -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/scripts/jquery-3.0.0.min.js"></script>
	<!-- jQuery Configuration -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/scripts/simpla.jquery.configuration.js"></script>
	<!-- Facebox jQuery Plugin -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/scripts/facebox.js"></script>
	<!-- jQuery WYSIWYG Plugin -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/scripts/jquery.wysiwyg.js"></script>
	<!-- jQuery Datepicker Plugin -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/scripts/jquery.datePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/scripts/jquery.date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/scripts/bootstrap.min.js"></script>
	<style type="text/css">
		.spanl{
			display:-moz-inline-box;
						  display:inline-block;
						  width:150px; 
		}
	</style>
</head>
<body>

<script type="text/javascript">
	$(document).ready(function(){
		
		<%-- $.post("<%=request.getContextPath() %>/Authority/list",
				{ },
				function(data){
			var tbody = $("#list");
			
			for(var i=0; i< data.length; i++){
			var tr = $("<tr></tr>");
			tr.append($("<td></td>").html('<input type="checkbox"/>'));
			tr.append($("<td></td>").html(data[i].authorityName));
			tr.append($("<td></td>").html(data[i].authorityContent));
			tr.append($("<td></td>").html(data[i].authorityLevel));
			tr.append($("<td></td>").html('<button type="button" class="button" onclick="view('+data[i].authorityId+')">查看</button>&nbsp;<button type="button" class="button" onclick="edit('+data[i].authorityId+')">修改</button>&nbsp;<button type="button" class="button" onclick="del('+data[i].authorityId+')">删除</button>'));
			tbody.append(tr);
			}
			
			},
			"json");
	}); --%>
		
		$("#add1").on("click",function(e){
			 res();
		 });
	
		var current =1;
		var start=0;
		$.post("<%=request.getContextPath() %>/Authority/page",
				{ current:current,start:start},
				function(data){
			var tbody = $("#list");
			
			for(var i=0; i< data.target.length; i++){
			
			var tr = $("<tr></tr>");
			
			tr.append($("<td></td>").html('<input type="checkbox"/>'));
			tr.append($("<td></td>").html(data.target[i].authorityName));
			/* tr.append($("<td></td>").html(data.target[i].authorityContent)); */
			tr.append($("<td></td>").html(data.target[i].authorityLevel));
			tr.append($("<td></td>").html('<button type="button" class="button" onclick="view('+data.target[i].authorityId+')">查看</button>&nbsp;<button type="button" class="button" onclick="edit('+data.target[i].authorityId+')">修改</button>&nbsp;<button type="button" class="button" onclick="del('+data.target[i].authorityId+')">删除</button>'));
			tbody.append(tr);
			}
			
			},
			"json");


		$("body").on("click",'a[title="Next Page"]',function(){  
		      $("#pagespan2").empty();
		      start += 6;
		      console.log(start);
		      $.post("/bess/Authority/page",{current:current,start:start},function(data){
		    	  console.log(data.target.length);
		        if(data.target.length==0){
		          start -= 6;
		          $("#pagespan2").append('<span class="input-notification error png_bg" >已经是最后一页</span>;');
		          return;
		        }
		        var tbody = $("#list");
		      tbody.empty();
		      for (var i = 0; i < data.target.length; i++) {
		        var tr = $("<tr></tr>");
		        tr.append($("<td></td>").html('<input type="checkbox"/>'));
				tr.append($("<td></td>").html(data.target[i].authorityName));
				/* tr.append($("<td></td>").html(data.target[i].authorityContent)); */
				tr.append($("<td></td>").html(data.target[i].authorityLevel));
				tr.append($("<td></td>").html('<button type="button" class="button" onclick="view('+data.target[i].authorityId+')">查看</button>&nbsp;<button type="button" class="button" onclick="edit('+data.target[i].authorityId+')">修改</button>&nbsp;<button type="button" class="button" onclick="del('+data.target[i].authorityId+')">删除</button>'));
				tbody.append(tr);
		       }
		       current++;
		         console.log(current);
		         console.log(start);
		        $(".number").each(function() {
		        if($(this).hasClass('current')){
		          $(this).removeClass('current');
		        }
		        if($(this).text()==current){
		          $(this).addClass('current');
		        }
		      });
		     },"json");
		      
		    });

		    $("body").on("click",'a[title="Previous Page"]',function(){  
		    $("#pagespan2").empty();
		      if(current==1){
		          $("#pagespan2").append('<span class="input-notification error png_bg" >当前为第一页</span>;');
		          return;
		        }
		      start -= 6;
		      $.post("<%=request.getContextPath()%>/Authority/page",{current:current,start:start},function(data){
		        console.log(current);
		        var tbody = $("#list");
		      tbody.empty();
		      for (var i = 0; i < data.target.length; i++) {
		        var tr = $("<tr></tr>");
		        tr.append($("<td></td>").html('<input type="checkbox"/>'));
				tr.append($("<td></td>").html(data.target[i].authorityName));
				/* tr.append($("<td></td>").html(data.target[i].authorityContent)); */
				tr.append($("<td></td>").html(data.target[i].authorityLevel));
				tr.append($("<td></td>").html('<button type="button" class="button" onclick="view('+data.target[i].authorityId+')">查看</button>&nbsp;<button type="button" class="button" onclick="edit('+data.target[i].authorityId+')">修改</button>&nbsp;<button type="button" class="button" onclick="del('+data.target[i].authorityId+')">删除</button>'));
				tbody.append(tr);
		       }
		       current--;
		        $(".number1").each(function() {
		        if($(this).hasClass('current')){
		          $(this).removeClass('current');
		        }
		        if($(this).text()==current){
		          $(this).addClass('current');
		        }
		      });
		     },"json");
		    }); 
	}); 

	function search() {
		
		 if( $("#input").val() == ""){
				alert("查询输入不能为空"); 
			  }
		 else{
			 $.post("<%=request.getContextPath() %>/Authority/search",
					 {
				 		authorityName:$("#authorityname").val() 
					 },
					 
			 function(data){
					var tbody = $("#list");
					tbody.empty();
					for(var i=0; i<=data.length; i++){
					var tr = $("<tr></tr>");
					
					tr.append($("<td></td>").html('<input type="checkbox"/>'));
					tr.append($("<td></td>").html(data.target[i].authorityName));
					/* tr.append($("<td></td>").html(data.target[i].authorityContent)); */
					tr.append($("<td></td>").html(data.target[i].authorityLevel));
					tr.append($("<td></td>").html('<button type="button" class="button" onclick="view('+data.target[i].authorityId+')">查看</button>&nbsp;<button type="button" class="button" onclick="edit('+data.target[i].authorityId+')">修改</button>&nbsp;<button type="button" class="button" onclick="del('+data.target[i].authorityId+')">删除</button>'));
					tbody.append(tr);
					}
					
					},
					 "json");
		 }
		 }
	
	function sub() {
		
		var authorityName = $("#authorityname").val();
		var authorityContent = $("#authoritycontent").val();
		var pid = document.getElementById("authoritylevel");
		var authorityLevel = pid.options[pid.selectedIndex].value; 
		
		 $("#addspan1").empty();
		 $("#addspan2").empty();
		 $("#addspan3").empty();
		 
		if(authorityName == "" ){
			var str ='<span class="input-notification error png_bg">权限名称不能为空</span>';
			var tip = $("#addspan1");
			tip.append(str);
			return false;	
		}
		else if(!/^([\u4E00-\uFA29]|[\uE7C7-\uE7F3])*$/.test(authorityName)){
			var str ='<span class="input-notification error png_bg">有非中文字符</span>';
			var tip = $("#addspan1");
			tip.append(str);
			return false;
        }
		
		else if(authorityContent == "" ){
			var str ='<span class="input-notification error png_bg">权限内容不能为空</span>';
			var tip = $("#addspan2");
			tip.append(str);
			return false;
		}
		
		else{
		 $.post("<%=request.getContextPath() %>/Authority/insert",
				  {
			 		  authorityName:$("#authorityname").val(),
			 		  authorityContent:$("#authoritycontent").val(),
					  authorityLevel:authorityLevel
				 },
						  function(data) {
						if(data == "success")	
					 	{
							alert("添加成功");
						}
						else {
							alert("添加失败");
						}
						 window.location.reload();
							 },
						  "text");
		}
		
	}
	
	function res() {
		 $("#addspan1").empty();
		 $("#addspan2").empty();
		 $("#e-span1").empty();
		 $("#e-span2").empty();
		document.getElementById("addspan1").value="";
		document.getElementById("addspan2").value="";
		document.getElementById("e-span1").value="";
		document.getElementById("e-span2").value="";
		document.getElementById("authorityname").value="";
		document.getElementById("authoritycontent").value="";
	}
	
	function view(authorityId) {
		
		 $.post("<%=request.getContextPath() %>/Authority/view",
		{
			 authorityId: authorityId
		},	
		function(data) {
			$("#v-name").html(data.authorityName);
			$("#v-content").html(data.authorityContent);
			$("#v-level").html(data.authorityLevel);
		},
		"json");
		 
	$("#view").modal("show");
	}
	
	function edit(authorityId) {
		
		 $.post("<%=request.getContextPath() %>/Authority/view",
		{
			 authorityId: authorityId
		},	
		function(data) {
			console.log(data);
			$("#e-authorityid").val(data.authorityId);
			$("#e-authorityname").val(data.authorityName);
			$("#e-authorityContent").val(data.authorityContent);
			$("#e-authoritylevel").val(data.authorityLevel);
		},
		"json");
		
		 $("#edit").modal("show");
		
	}
	
	 function save(){
		    var authorityName = $("#authorityname").val();
			var authorityContent = $("#authoritycontent").val();
			var pid = document.getElementById("authoritlevel");
			var authorityLevel = pid.options[pid.selectedIndex].value; 
			//var reg=/^[-+]?\d*$/;
			//var reg1=/^[a-zA-Z]+$/;
			 $("#addspan1").empty();
			 $("#addspan2").empty();
			 $("#addspan3").empty();
			 
			if(authorityName == "" ){
				var str ='<span class="input-notification error png_bg">权限名称不能为空</span>';
				var tip = $("#addspan1");
				tip.append(str);
				return false;	
			}
			else if(!/^([\u4E00-\uFA29]|[\uE7C7-\uE7F3])*$/.test(authorityName)){
				var str ='<span class="input-notification error png_bg">有非中文字符</span>';
				var tip = $("#addspan1");
				tip.append(str);
				return false;
	        }
			
			if(authorityContent == "" ){
				var str ='<span class="input-notification error png_bg">权限内容不能为空</span>';
				var tip = $("#addspan2");
				tip.append(str);
				return false;
			}
			
			else{
				
			 $.post("<%=request.getContextPath() %>/Authority/insert",
					  {
				 		  authorityId:$("authorityId").val(),				 
				 		  authorityName:$("#authorityname").val(),
				 		  authorityContent:$("#authoritycontent").val(),
						  authorityLevel: authorityLevel
					 },
							  function(data) {
							if(data == "success")	
						 	{
								alert("修改成功");
							}
							else {
								alert("修改失败");
							}
							 window.location.reload();
								 },
							  "text");
			}
			
	 }
	 
		function del(authorityId) {
			$("#del").modal("show");
			$("#d-authorityid").val(authorityId);
		}
		
		function varify(){
			
			$.post("<%=request.getContextPath() %>/Authority/del",
			{
				authorityId:$("#d-authorityid").val()
			},	
			
			function(data) {
				if(data == "success"){
					alert("删除成功");
				}
				else {
					alert("删除失败");
				}
				window.location.reload(); 
			},
			"text");
			
	}
</script>
<div id="body-wrapper">
  <!-- Wrapper for the radial gradient background -->
  <div id="sidebar">
    <div id="sidebar-wrapper">
      <!-- Sidebar with logo and menu -->
      <h1 id="sidebar-title"><a href="#">门店导购后端支撑子系统</a></h1>
      <!-- Logo (221px wide) -->
      <a href="#"><img id="logo" src="<%=request.getContextPath() %>/resources/images/logo1.png" alt=" logo" /></a>
      <!-- Sidebar Profile links -->
      <div id="profile-links"> <!-- Hello, <a href="#" title="Edit your profile">张三</a>, you have <a href="#messages" rel="modal" title="3 Messages">3 条新信息</a><br /> -->
        <br />
        <a href="login.html" title="Login">登&nbsp;&nbsp;录</a>&nbsp; | &nbsp;<a href="#" title="Sign Out">注&nbsp;&nbsp;销</a> </div>
      <ul id="main-nav">
        <!-- Accordion Menu -->
        <li> <a href="#" class="nav-top-item current">
          <!-- Add the class "no-submenu" to menu items with no sub menu -->
          系统管理 </a> 
          <ul>
            <li><a class="current" href="authority_manage.html">权限管理</a></li>
			<li><a href="role_manage.html">角色管理</a></li>
          	<li><a href="user_manage.html">用户管理</a></li>
          </ul>
        </li>
        <li> <a href="#" class="nav-top-item">
          <!-- Add the class "current" to current menu item -->
          产品信息管理 </a>
          <ul>
            <li><a href="#">查看产品信息</a></li>
            
          </ul>
        </li>
        <li> <a href="#" class="nav-top-item"> 消息管理 </a>
          <ul>
            <li><a href="view_message/html">查看消息</a></li>
           
          </ul>
        </li>
        </ul>
  
      <!-- End #messages -->
    </div>
    </div>
  </div>
  <!-- End #sidebar -->
  <div id="main-content">
    <!-- Main Content Section with everything -->
    <noscript>
    <!-- 执行以下语句如果权限浏览器不支持javascript -->
    <div class="notification error png_bg">
      <div> Javascript is disabled or is not supported by your browser. Please <a href="http://browsehappy.com/" title="Upgrade to a better browser">upgrade</a> your browser or <a href="http://www.google.com/support/bin/answer.py?answer=23852" title="Enable Javascript in your browser">enable</a> Javascript to navigate the interface properly.
        Download From <a href="http://www.exet.tk">exet.tk</a></div>
    </div>
    </noscript>
    <!-- Page Head -->
    <h2>权限管理</h2>
    <p id="page-intro">可进行以下操作</p>
    <ul class="shortcut-buttons-set">
      <li>
	      	<a class="shortcut-button" data-toggle="modal" data-target="#add" id="add1">
	      		<span> 
	      		<img src="<%=request.getContextPath() %>/resources/images/icons/pencil_48.png" alt="icon" /><br />
	        		添&nbsp;加&nbsp;权&nbsp;限 
	      		</span>
	      	</a>
      </li>
      <li>
	      <a class="shortcut-button"  href="#tip" rel="modal">
		      <span> <img src="<%=request.getContextPath() %>/resources/images/icons/paper_content_pencil_48.png" alt="icon" /><br />
		        	删&nbsp;除&nbsp;权&nbsp;限  
		      </span>
	      </a>
      </li>
      <li>
	      <a class="shortcut-button"  href="#tip" rel="modal">
		      <span> <img src="<%=request.getContextPath() %>/resources/images/icons/image_add_48.png" alt="icon" /><br />
		        	修&nbsp;改&nbsp;权&nbsp;限 
		      </span>
	      </a>
	  </li>
      <li>
	      <a class="shortcut-button"  href="#tip" rel="modal">
		      <span> <img src="<%=request.getContextPath() %>/resources/images/icons/clock_48.png" alt="icon" /><br />
		        	查&nbsp;看&nbsp;权&nbsp;限 
		      </span>
	      </a>
      </li>
    </ul>
    <!-- End .shortcut-buttons-set -->
    <div class="clear"></div>
    <!-- End .clear -->
    <div class="content-box">
      <!-- Start Content Box -->
      <div class="content-box-header">
        <h3>权限信息列表</h3>
        
        <div class="clear"></div>
      </div>
      <!-- End .content-box-header -->
      <div class="content-box-content">
        <div class="tab-content default-tab" id="tab1">
          <!-- This is the target div. id must match the href of this div's tab -->
          <%-- <div class="notification attention png_bg"> 
          <a href="#" class="close">
          <img src="<%=request.getContextPath() %>/resources/images/icons/cross_grey_small.png" title="Close this notification" alt="close" />
          </a>
            <div> 
            操作图标  <img src="<%=request.getContextPath() %>/resources/images/icons/pencil.png" alt="修改" /> 功能为<strong>修改</strong>，
            操作图标  <img src="<%=request.getContextPath() %>/resources/images/icons/cross.png" alt="删除" /> 功能为<strong>删除</strong>，
            操作图标  <img src="<%=request.getContextPath() %>/resources/images/icons/hammer_screwdriver.png" alt="查看" />功能为<strong>查看</strong>
            </div>
          </div> --%>
         <div class="bulk-actions align-left">
                    <button>权限名称</button>
                    <input class="text-input medium-input" type="text" name="inputName" id="inputname">
                    <button class="button" onclick="search();">搜索</button> 
          </div>

          <table>
            <!--列表标题 -->
            <thead>
              <tr>
                <th>
                  <input class="check-all" type="checkbox" />
                </th>
                <th>权限名称</th>
                <th>权限等级</th>
                <th>操作图标</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <td colspan="6">
				  <!--底部分页 -->
                   <div class="pagination"> 
                  <a  title="First Page">&laquo; First</a>
                  <a  title="Previous Page">&laquo; Previous</a> 
                  <a  class="number  current" title="1">1</a> 
                  <a  class="number" title="2">2</a> 
                  <a  class="number" title="3">3</a> 
                  <a  class="number" title="4">4</a> 
                  <a  title="Next Page">Next &raquo;</a>
                  <a  title="Last Page">Last &raquo;</a> 
                  </div>
                  <span class="span1" id="pagespan2"></span>
                  <!-- End .pagination -->
                  <div class="clear"></div>
                </td>
              </tr>
            </tfoot>
            <tbody id="list">
              
            </tbody>
          </table>
        </div>
        <!-- End #tab1 -->

      <!-- 添加权限弹框 -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close1" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      		 <h3 class="modal-title">添加权限</h3>
      		 <fieldset>
      		 <div class="modal-body">
      		 <p>
      		 *&nbsp;<label>输入权限名称</label><br>
      		 <input class="text-input medium-input" type="text" id="authorityname" name="authorityName" />
			 <span id="addspan1"> </span></p>
			 <p>
      		 *&nbsp;<label>输入权限内容</label><br>
      		 <input class="text-input medium-input" type="text" id="authoritycontent" name="authorityContent" />
			 <span id="addspan2"> </span></p>
      		 <p>
      		 *&nbsp;<label>选择权限等级</label><br>
      		 <select name="authorityLevel" id="authoritylevel" class="small-input">
                <option selected value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                </select>
      		 </p>

		</div>
      		 <div class="modal-footer">
       		  <input class="button" type="submit" onclick="sub();" value="提交"  />
              <input class="button" type="reset" onclick="res();" value="重置" />
            </div>
			 </fieldset>
      </div>
    </div>
</div>
</div>    

 <div id="tip" style="display: none">
      	<fieldset>
      		 <p style="color:red">
      		 请在下面机构列表中选择对应的按钮进行操作
      		 </p>
      	</fieldset>
      </div>

      <!-- End div-insert -->
      <!-- 查看权限弹框 -->
       <div class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close1" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      		<h3>查看权限信息</h3>
      		<div class="modal-body" >
      		
      		 <p>
      		 <label>权限名称:</label>
      		 <span id="v-name"></span><br><br>
      		 
      		 <label>权限内容:</label>
      		 <span id="v-content"></span><br><br>
      		 
      		 <label>权限等级:</label>
      		 <span id="v-level"></span><br><br>
      		 </p>
      </div>
      <div class="modal-footer">
              <button type="button" class="button" data-dismiss="modal">返回</button>
      </div>
    </div>
  </div>
</div>
</div>
      <!-- End div-view -->
       <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close1" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      		<h3>修改权限信息</h3>
      		<div class="modal-body" >
			<fieldset>
			  <p>
			  <label style="display:none">权限id:</label>
			  <input style="display:none" class="text-input medium-input" type="text" id="e-authorityid" name="authorityId" /></p>
      		  <p>
      		 *&nbsp;<label>权限名称:</label><br>
      		 <input class="text-input medium-input" type="text" id="e-authorityname" name=authorityName />
			 <p>
      		 *&nbsp;<label>权限内容:</label><br>
      		 <input class="text-input medium-input" type="text" id="e-authoritycontent" name="authorityContent" />
      		 <p>
      		 *&nbsp;<label>权限等级:</label><br>
      		 <select name="authorityLevel" id="e-authoritylevel" class="small-input">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                </select>
      		 </p>
		</fieldset>
		</div>
      <div class="modal-footer">
              <button type="submit" class="button" data-dismiss="modal" onclick="save();">保存</button>
              <input class="button" type="reset" value="重置" >
      </div>
    </div>
  </div>
</div>
</div>		
			 <!-- End edit -->
		<div class="modal fade" id="del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close1" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			 <span style="font-size:15px;color:red;">
			 <strong>你确定删除此信息?</strong></span>
			 <br><br>
			  <input  style="display:none" class="text-input medium-input" type="text" id="d-authorityid" name="authorityId" />
			 <br><br>
			 
		</div>
      <div class="modal-footer">
              <button type="submit" class="button" data-dismiss="modal" onclick="varify();">确定</button>
              <button type="reset" class="button" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
</div>
    <!-- End .content-box -->
    <!-- End Notifications -->
    <div id="footer"> <small>
      <!-- Remove this notice or replace it with whatever you want -->
      &#169; Copyright 2016 Twinkle | Powered by <a href="#">admin Project 004</a> | <a href="#">Top</a>
      </small> 
      <a href="#"  target="_blank">welcome to HNNDYL</a></div>
    <!-- End #footer -->
  </div>
  <!-- End #main-content -->
</div>
</body>
<!-- Download From www.exet.tk-->
</html>
