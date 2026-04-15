<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
	<custom:commonElements/>
<style nonce="${cspNonce}" type="text/css">
    .textarea-container {
      position: relative;
      display: block;
}

.textareabox {
      height: 100px;
      padding: 10px;
      font-size: 16px;
}

#clearButton{
      position: absolute;
      bottom: 5px;
      right: 10px;
      padding: 5px 10px;
      font-size: 14px;
      cursor: pointer;
      border:0;
}


</style>
<main id="main" class="main">
<spring:form name="module_mst" id="module_mst" action="screen_mstAction" method='POST' modelAttribute="screen_mstCMD">

	<div class="container-fluid">
		<div class="card">
			<div class="card-header">
				<h5>Screen Master</h5>
			</div>
			<div class="card-body cue_text">
			<div class="row g-3">
                  
                  <div class="col-md-3">
                    <span class="required">*</span><label for="module_name" class="form-label">Module</label>
                    <select class="form-select" id="module_id" name="module_id">
						<option value="0">--Select--</option>
						<c:forEach var="item" items="${list}" varStatus="num">
							<option value="${item.module_id}">${item.module_name}</option>
						</c:forEach>
					</select>
     </div> 
                  <div class="col-md-3">
                   <span class="required">*</span> <label for="module_name" class="form-label">Sub Module</label>
                    <select class="form-select" id="submodule_id" name="submodule_id">
						<option value="-1">--Select--</option>
					</select>
                  </div> 
                     
                  <div class="col-md-3">
                    <span class="required">*</span><label for="module_name" class="form-label">Screen Type</label>
                    <select class="form-select" id="screen_type" name="screen_type">
						<option value="N">None</option>
						<option value="Forms">Forms</option>	
						<option value="Master">Master</option>	
						<option value="Program">Program</option>
						<option value="Pay Roll Report">Pay Roll Report</option>	
						<option value="Reports">Report</option>
						<option value="SSRS Reports">SSRS Reports</option>	
						<option value="Other">Other</option>	
					</select> 
				  </div> 
                  
                  <div class="col-md-3">
                   <span class="required">*</span> <label for="module_name" class="form-label">Screen Name</label>
                    <input type="text" class="form-control" id="screen_name" name="screen_name" placeholder="Screen Name" 
                    autocomplete="off" maxlength="80">
                    <input id="screen_old_name" name="screen_old_name" type="hidden" class="form-control" value="0">
                  </div>   
                  <div class="col-md-3">
                  <span class="required">*</span>  <label for="module_name" class="form-label">Screen Url</label>
                    <input type="text" class="form-control" id="screen_url" name="screen_url" placeholder="Screen Url" autocomplete="off" 
                    maxlength="80">
                  </div>  
                   <div class="col-md-3">
                  <span class="required">*</span>  <label for="module_name" class="form-label">Order By</label>
                    <input type="number" class="form-control" id="seq_no" name="seq_no" placeholder="Order By" autocomplete="off" maxlength="10" value="0">
                  </div>
                  <div class="col-md-3">
	                  <span class="required">*</span>  <label for="module_name" class="form-label">Serial No</label>
	                    <input type="text" class="form-control" id="serial_no" name="serial_no" value="${LastSrNo}" placeholder="" readonly autocomplete="off" 
	                    maxlength="10">
                  </div> 
                  
                     <div class="col-md-3">
							<div class="form-group">
								<label> <span class="required">*</span> Status</label> <select class="form-select"
									id="acstatus" name="acstatus">
									<option value="0">--Select--</option>
									<option Value="N">Active</option>
									<option Value="I">Inactive</option>
								</select>
							</div>
						</div>
                   
					<div class="col-md-3">
						<div class="form-group" data-tooltip="description">
							<label for="description" class="form-label"><span
								class="required">*</span> Description</label>
							<div class="textarea-container">
								<textarea class="form-control textareabox" id="description"
									name="description" placeholder="Description"
									maxlength="255" autocomplete="off"></textarea>
								<button type="button" id="clearButton">
									<i class="fas fa-trash-alt text-danger"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group" data-tooltip="description">
							<label for="description" class="form-label"><span
								class="required">*</span>Functionality</label>
							<div class="border rounded p-3">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" name="s_mode" value="C" id="create">
            <label class="form-check-label" for="create">Create</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" name="s_mode" value="R" id="read">
            <label class="form-check-label" for="read">Read</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" name="s_mode" value="U" id="update">
            <label class="form-check-label" for="update">Update</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" name="s_mode" value="D" id="delete">
            <label class="form-check-label" for="delete">Delete</label>
        </div>
    </div>
						</div>
					</div>
                </div>
			</div>
			<div class="card-footer" align="center">
				<a type="button" id="clearbtn" class="btn btn-rounded btn-outline-danger">Clear</a>
				<button type="button" class="btn btn-rounded btn-outline-success" id="save_btn" >Save</button>
				<button type="button" class="btn btn-rounded btn-outline-warning" id="update_btn" >Update</button>
				<button type="button" class="btn btn-rounded btn-outline-info d-none" id="rearrange_btn" >Rearrange Order</button>
				<button type="button" class="btn btn-outline-secondary" id="search_btn">Search</button>
				<button type="button" class="btn btn-rounded btn-outline-warning" id="preview_btn" >Preview</button>
			</div>
		</div>
	</div>
</spring:form>

<div class="container-fluid" id="divPrint">
	<div class="card d-block">
		<div class="card-body">
				<table id="ScreenReport" class="table table-hover table-responsive-sm table-bordered">
					<thead class="bg-color">
						<tr class="font-size">
							<th class="no-asc-dsc">Ser No</th>
							<th>Serial No</th>
							<th>Module Name</th>
							<th>Sub Module Name</th>
							<th>Screen Name</th>
							<th>Screen Url</th>
							<th>Order By</th>
							<th>Description</th>
							<th>Functionality </th>							
							<th>Status</th>		
							<th class='lastCol text-center'>Action</th>
						</tr>
					</thead>
 
				</table>
		</div>
	</div>
</div>

<div class="modal fade" id="rearrangeModal" aria-hidden="true" aria-labelledby="rearrangeModalLabel" tabindex="-1">
					  <div class="modal-dialog modal-dialog-centered modal-lg">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalToggleLabel">Rearrange Order</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					      <div class="row">
					      <div class="col-md-6">
					      <div class="form-group">
					       	<label><span class="required">*</span> Module Name</label>
						<select name="module_id2" class="form-control" id ="module_id2" >
		                 	<option value="0">--Select--</option>
		               			<c:forEach var="item" items="${list}" varStatus="num">
							<option value="${item.module_id}">${item.module_name}</option>
						</c:forEach>
		                 </select>
		                 </div>
		                 </div>
		                 <div class="col-md-6">
		                      <div class="form-group">
                   <span class="required">*</span> <label for="module_name" class="form-label">Sub Module</label>
                    <select class="form-select" id="submodule_id2" name="submodule_id2">
						<option value="-1">--Select--</option>

					</select>
                  </div> 
		                 </div>
		                     <input type="hidden" value="1" id="count_exp" name="count_exp">
			                <div class="table-responsive">
			                <table class="table" id="screenTable">
			                    <thead>
			                        <tr>
			                            <th>Screen Name</th>
			                            <th>Old Order</th>
			                            <th>New Order</th>
			                        </tr>
			                    </thead>
			                    <tbody id="screenBody">
			                        <!-- Submodule rows will be populated here -->
			                    </tbody>
			                </table>
			                </div>
		                 
					      </div>
					      <div class="modal-footer">
					        <button class="btn btn-outline-success"  data-bs-toggle="update" id="updatemodal">Update</button>
					        <button class="btn btn-outline-danger"  data-bs-toggle="modal">Close</button>
					      </div>
					    </div>
					  </div>
				</div>
				</div>

</main>


<c:url value="delete_screensurl" var="deleteUrl" />
<spring:form action="${deleteUrl}" method="post" id="deleteForm" name="deleteForm" modelAttribute="id1">
	<input type="hidden" name="screenid" id="screenid" value="0"/> 
</spring:form>

<script nonce="${cspNonce}" type="text/javascript">

let flageser="0";

window.history.forward();
function noBack() {
	window.history.forward();
}
function getBasePath(fullUrl, depth = null) {
	  const url = new URL(fullUrl);
	  if (depth === null) {
	    depth = (url.hostname === 'localhost' || url.hostname === '127.0.0.1') ? 0 : 1;
	  }
	  
	  if (depth === 0) {
	    return url.origin;
	  }
	  
	  const pathParts = url.pathname.split('/').filter(Boolean);
	  const selectedParts = pathParts.slice(0, depth);
	  const result = url.origin+'/'+selectedParts.join('/')
	  return selectedParts.length >= 1
	    ? result : url.origin;
	}
$(document).ready(function (){
	 $("#preview_btn").hide();
	var isvalidurl = '';
	mockjax1('ScreenReport');
	table = dataTable('ScreenReport');
	$("#search_btn").on("click", function() {
		flageser="1";
		table.ajax.reload();
	});
	document.getElementById('update_btn').style.display='none'; 
	document.getElementById('clearButton').addEventListener('click', function() {
	      document.getElementById('description').value = '';
	});

	restrictToAlphabetsNumbersAndSpaces('screen_name',80);
	restrictToAlphabetsNumbersSpacesAndSpecialChars('screen_url',80);
	restrictToAlphabetsNumbersSpacesAndSpecialChars('description',255);
	$("#screen_url").on("change",function() {debugger
		fn_ValidationUrl();
	});
	
	 $('#screen_url').on('paste', function(e){
		 fn_ValidationUrl();
	});

$("#preview_btn").on("click", function() {
    var preview = $("#screen_url").val().trim();
    if (!preview) {
        alert("Please enter a screen URL.");
        return;
    }
    
    var baseUrl = getBasePath(window.location.href);
    var previewUrl = baseUrl + "/admin/" + encodeURIComponent(preview) + "?mode=view";

    var maxWidth = screen.width - 40;  // 20px borders on both sides
    var maxHeight = screen.height - 40;
    
    // Preferred window dimensions
    var preferredWidth = 1740;
    var preferredHeight = 768;
    
    // Minimum acceptable dimensions
    var minWidth = 1024;
    var minHeight = 600;

    // Calculate final dimensions
    var windowWidth = Math.min(preferredWidth, maxWidth);
    var windowHeight = Math.min(preferredHeight, maxHeight);
    
    // Enforce minimum sizes without breaking borders
    windowWidth = Math.max(minWidth, windowWidth);
    windowHeight = Math.max(minHeight, windowHeight);
    windowWidth = Math.min(windowWidth, maxWidth);
    windowHeight = Math.min(windowHeight, maxHeight);

    // Smart positioning
    var leftPosition = Math.max(20, (screen.width - windowWidth) / 2);
    var topPosition = Math.max(20, (screen.height - windowHeight) / 2);

    var previewWindow = window.open(
        previewUrl,
        "previewWindow",
        "width=" + windowWidth + 
        ",height=" + windowHeight + 
        ",top=" + topPosition + 
        ",left=" + leftPosition + 
        ",resizable=yes,scrollbars=yes"
    );

    if (previewWindow) {
        previewWindow.onload = function() {
            try {
                // Create watermark container
                var watermark = previewWindow.document.createElement("div");
                watermark.style.cssText = `
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    z-index: 999999;
                    pointer-events: none;
                    overflow: hidden;
                `;
                
                // Create watermark text element
                var watermarkText = previewWindow.document.createElement("div");
                watermarkText.style.cssText = `
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%) rotate(-45deg);
                    font-size: 48px;
                    font-weight: bold;
                    color: rgba(0, 0, 0, 0.15);
                    text-align: center;
                    white-space: nowrap;
                `;
                watermarkText.textContent = "PREVIEW SCREEN";
                
                // Create cross pattern overlay
                var crossOverlay = previewWindow.document.createElement("div");
                crossOverlay.style.cssText = `
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: 
                        linear-gradient(90deg, rgba(0,0,0,0.03) 1px, transparent 1px),
                        linear-gradient(0deg, rgba(0,0,0,0.03) 1px, transparent 1px);
                    background-size: 20px 20px;
                    pointer-events: none;
                `;
                
                // Create interaction blocker
                var overlay = previewWindow.document.createElement("div");
                overlay.style.cssText = `
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    z-index: 1000000;
                    background: rgba(255, 255, 255, 0);
                    cursor: not-allowed;
                `;
                
                // Assemble elements
                watermark.appendChild(watermarkText);
                watermark.appendChild(crossOverlay);
                previewWindow.document.body.appendChild(watermark);
                previewWindow.document.body.appendChild(overlay);
                
            } catch (e) {
                console.warn("Unable to apply watermark:", e);
            }
        };
    }
});

	$("html").on("contextmenu",function(e){
        return false;
    }); 
   
    
    $("#clearbtn").on("click", function() {
    	
		if (confirm('Are you sure you want to Clear ?')) {
    	
			$('#module_mst').find('input[type="text"], input[type="password"], input[type="email"], input[type="number"], textarea').val('');
			$('#module_mst').find('select').prop('selectedIndex', 0); 
			$('#module_mst').find('input[type="checkbox"], input[type="radio"]').prop('checked', false); 
			
    	$("#serial_no").val('${LastSrNo}');
    	$(".card-header h5").text("Screen Master");
    	
    	document.getElementById('update_btn').style.display='none'; 
    	document.getElementById('save_btn').style.display='inline-block'; 
		}
	});
    
 
    $('#module_name').keyup(function() {
        this.value = this.value.toUpperCase();
    }); 
    $("#module_id").on("change", function() {
		return getSubmodule(this.value, "0");
	});
 

$("#save_btn").on("click", async function() {
    await saveScreen();
});
    $("#update_btn").on("click", async function() {
    	await saveScreen();
	});
	$.ajaxSetup({
		async : false
	});
    try{
		   if(window.location.href.includes("msg="))
			{
				var url = window.location.href.split("?msg")[0];
				window.location = url;
			} 	
		}
		catch (e) {
		} 
	
		 $('#rearrange_btn').on('click', function() {
		        $('#rearrangeModal').modal('show'); // Show the modal
		        $("#screenTable").hide();   
		        $("#updatemodal").hide();   
		        
		    });
		    $("#module_id2").on("change", function() {
				return getSubmodule2(this.value, "0");
			});
		    $("#submodule_id2").on("change",function(e){   			 
			  rearrange_order();
		    });
});

function getSubmodule(did, submodule) {
	var id = did;
	$.ajax({
		type : 'POST',
		url : 'subModule',
		data : {
			id : id
		},
		headers : {
			'X-CSRF-TOKEN' : $('meta[name="_csrf"]').attr('content')
		},
		success : function(data) {
			var html = '<option value="-1">--Select--</option>';
			data.forEach(item => {
				html += '<option value="'+item.submodule_id+'">'+item.submodule_name+'</option>';
			});
			$("#submodule_id").html(html);
			
			if(submodule != "0"){
				document.getElementById('submodule_id').value=submodule;
			}
		}
	});
}


function getSubmodule2(did, submodule) {
	var id = did;
	$.ajax({
		type : 'POST',
		url : 'subModule',
		data : {
			id : id
		},
		headers : {
			'X-CSRF-TOKEN' : $('meta[name="_csrf"]').attr('content')
		},
		success : function(data) {

			var html = '<option value="-1">--Select--</option>';
			data.forEach(item => {
				html += '<option value="'+item.submodule_id+'">'+item.submodule_name+'</option>';
			});
			$("#submodule_id2").html(html);
			
			if(submodule != "0"){
				document.getElementById('submodule_id2').value=submodule;
			}
		}
	});

}
 

async function saveScreen() {
//    if (isValid() === true) {
       const isUrlValid = await fn_ValidationUrl();
   if (isUrlValid) {
	var formData = new FormData($("#module_mst")[0]);
	
	$.ajax({
		url : $("#module_mst").attr("action"),
		type : "POST",
		data : formData,
		contentType : false,
		processData : false,
		success : function(data) {

			if (data.status === "1") {
				alert("Data Saved Successfully");
				location.href = "screen_mstUrl";
			} else if (data.status === "2") {
				alert("Data Updated Successfully");
				location.href = "screen_mstUrl";
			} else if (data.status === "-1") {
				alert(data.message);
			} else {
				alert(data.message);
			}
		},
		error : function(xhr, textStatus, errorThrown) {
			e.preventDefault();
		}
	});
		}
// }

}
	
function isValid(){
	if($("#module_id").val() == "0"){
		alert("Please Select Module");
		$("#module_id").focus();
		return false;
	}
	if($("#submodule_id").val() == "-1"){
		alert("Please Select Sub Module");
		$("#submodule_id").focus();
		return false;
	}
	
	
	if($("#screen_type").val() == "0"){
		alert("Please Select Screen Type");
		$("#screen_type").focus();
		return false;
	}
	if($("#screen_name").val() == ""){
		alert("Please Select Screen Name");
		$("#screen_name").focus();
		return false;
	}

	if($("#screen_url").val().trim() == ""){
			alert("Please Select Screen Url");
			$("#screen_url").focus();
			return false;
		}
	
	if($("#seq_no").val() == "0"){
		alert("Please Enter Order By");
		$("#seq_no").focus();
		return false;
	}
	
	 if($("#acstatus").val() == "0"){
			alert("Please Select Active Status.");
			$("#acstatus").focus();
			return false;
		}
	
	if($("#description").val().trim() == ""){
		alert("Please Enter Description");
		$("#description").focus();
		return false;
	}
	
	return true;
}

function Update(id,name,url,module,submodule,seq,screen_type,description,serial_no,hstatus){	
	document.getElementById('module_id').value=module;
	document.getElementById('screen_old_name').value=id;	
	document.getElementById('screen_type').value=screen_type;
	document.getElementById('screen_name').value=name;
	document.getElementById('screen_url').value=url;
	document.getElementById('seq_no').value=seq;
	document.getElementById('description').value=description;
	document.getElementById('serial_no').value=serial_no; 
	
	document.getElementById('acstatus').value=hstatus; 
	
	getSubmodule(module, submodule);
// 	document.getElementById('screen_old_name').value=id;
	document.getElementById('update_btn').style.display='inline-block'; 
	document.getElementById('save_btn').style.display='none'; 
	
	$(".card-header h5").text("Update Screen Master");
	window.scrollTo({ top: 0, behavior: 'smooth' });
}

function deleteData(id) {
	$("#screenid").val(id);
	document.getElementById('deleteForm').submit();
}


function CSPDEfine(){

	 $(document).off('click', '.updatescreen').on('click', '.updatescreen', function(event) {
			var val = $(this).data('index');
			var id = document.getElementById('schid'+val).value;//id			
			var screen_type = document.getElementById('screen_type'+val).value;//name
			var name = document.getElementById('scsid'+val).value;//name
			var url = document.getElementById('schhid'+val).value;//url
			var module = document.getElementById('scdhid'+val).value;//module
			var submodule = document.getElementById('scrid'+val).value;//submodule
			var seq = document.getElementById('seqhid'+val).value;//submodule
			var description = document.getElementById('description'+val).value;
			var serial_no = document.getElementById('serial_no'+val).value;
			
			var hstatus = document.getElementById('hstatus'+val).value;
			//submodule
			if (confirm('Are you sure you want to update ?')) {
				Update(id,name,url,module,submodule,seq,screen_type,description,serial_no,hstatus);
			} else {
				return false;
			}
	});
	
	 $(document).off('click', '.delcls').on('click', '.delcls', function(event) {
			var val = $(this).data('index');
			var id = document.getElementById('schid'+val).value;//id	
			if (confirm('Are you sure you want to Delete ?')) {
				deleteData(id);
			} else {
				return false;
			}
	});
}



function mockjax1(tableName){
	$.mockjax({
	    url: '/Data',
	    responseTime: 1000,
	    response: function(settings){
	    	$.ajaxSetup({
				async : false
			});
			data(tableName);
			this.responseText = {
	    		draw: settings.data.draw,
				data: jsondata,
				recordsTotal: jsondata.length,
	            recordsFiltered: FilteredRecords
			};
			setTimeout(CSPDEfine, 1000);
	     }
	});
}

function data(tableName){
	jsondata = [];
	var table = $('#ScreenReport').DataTable();
	var info = table.page.info();
	var currentPage = info.page;
    var pageLength = info.length;
	var startPage = info.start;
	var endPage = info.end;
	var Search = table.search();
	var order = table.order();
	var orderColunm = order[0][0] + 1;
	var orderType = order[0][1];

// 	var m_id =  $('#module_id').val();
// 	var sm_id =  $('#submodule_id').val();
	var screen_type =  "0";
	var screen_name =  "";
	var screen_url = "";
	
	
	
	var m_id ="0";
	var sm_id = "-1";
	
	if (flageser ==="1") {
		m_id = $('#module_id').val();
		sm_id = $('#submodule_id').val();
		 screen_type =  $('#screen_type').val();
		 screen_name =  $('#screen_name').val();
		 screen_url =  $('#screen_url').val();
	}
	
	$.post("getScreenReportdataUrl",{ m_id:m_id,sm_id:sm_id,startPage:startPage,pageLength:pageLength,Search:Search,orderColunm:orderColunm,orderType:orderType,m_id:m_id,sm_id:sm_id,screen_type:screen_type,screen_name:screen_name,screen_url:screen_url},function(j) {
		for (var i = 0; i < j.length; i++) {			
			var AC_status = "";
			if(j[i].is_deleted =='N' ){
				AC_status ="<span class='badge badge-outline-success'>Active</span>";
		}else{
			AC_status ="<span class='badge badge-outline-danger'>Inactive</span>";
		}
			jsondata.push([j[i].serno,j[i].serial_no,j[i].module_name,j[i].submodule_name,j[i].screen_name,j[i].screen_url,j[i].seq_no,j[i].description,j[i].screen_mode,AC_status,j[i].action]);
		}
	});
	$.post("getScreenReportdataCountUrl?"+key+"="+value,{m_id:m_id,sm_id:sm_id,startPage:startPage,pageLength:pageLength,Search:Search,orderColunm:orderColunm,orderType:orderType,m_id:m_id,sm_id:sm_id,screen_type:screen_type,screen_name:screen_name,screen_url:screen_url},function(j) {
		FilteredRecords = j;
	});
}

function fn_ValidationUrl() {
    return new Promise((resolve, reject) => {
        if ($("#screen_url").val().trim() == "") {
            alert("Please Select Screen Url");
            $("#screen_url").focus();
            resolve(false);
        } else {
            var url = $("#screen_url").val();
            $.ajax({
                url: url,
                type: 'GET',
                success: function() {
                    alert("URL is valid and accessible!");
                    resolve(true);
                    $("#preview_btn").show();
                },
                error: function(xhr, status, error) {
                    alert("URL is not accessible. Error: " + error);
                    resolve(false);
                    $("#screen_url").val('');
                    $("#preview_btn").hide();
                }
            });
        }
    });
}

function rearrange_order() {
    var submoduleval = $("#submodule_id2").val();
    $("#screenTable").show();   
    $("#updatemodal").show();   
    $.post("getscreendata", {
    	submoduleval: submoduleval
    }).done(function(j) {
    	
        var screenBody = $("#screenBody");
        screenBody.empty(); // Clear previous data

        if (j && Array.isArray(j) && j.length > 0) {

for (let i = 0; i < j.length; i++) {
    const x = i + 1; // This is used for row numbering if needed
    const screen_name = j[i].screen_name || ''; // Get submodule name
    const seq_no = j[i].seq_no !== null ? j[i].seq_no : '';
    const subid = j[i].screen_id || ''; // Get sequence number
    $("input#count_exp").val(x);
    
    $("#screenBody").append(
		    '<tr>'
		     + '<td class="screenname">' + screen_name + '</td>'
		     + '<td>' + seq_no + '</td>'
		    + '<td><input type="text"  class="form-control" id="seq_no' + x + '" name="seq_no" value="' + seq_no + '" />'
		    + '<input type="hidden"  class="form-control" id="subid' + x + '" name="subid" value="' + subid + '" /></td>'
		    + '</tr>'
		    
		);
}

        } else {
            screenBody.append('<tr><td colspan="2">No screen found.</td></tr>');
        }
    }).fail(function(xhr, textStatus, errorThrown) {
        console.error("Error fetching submodule data:", textStatus, errorThrown);
    });
}

//Update button click event
$('#updatemodal').on('click', function() {
    var updates = [];
    var seqNoSet = new Set(); 
    var invalidEntries = []; // Array to collect invalid entries

    $('#screenBody tr').each(function(index) {
    	   var sname = $(this).find('.screenname').text();
        var seq_no = $(this).find('input[name="seq_no"]').val();
        var subid = $(this).find('input[name="subid"]').val();
        
        // Validate seq_no: it should not be empty or zero
        if (seq_no.trim() === "" || seq_no === "0") {
            invalidEntries.push("Sequence number cannot be empty or zero: " + sname);
            return; // Skip this iteration
        }

        // Check for duplicate seq_no
           if (seq_no.trim() != ""){
        if (seqNoSet.has(seq_no)) {
            invalidEntries.push("Duplicate sequence number found: " + sname);
            return; // Skip this iteration
        }
           }
        seqNoSet.add(seq_no);
        
        // Add to updates array if valid
        updates.push({ id: subid, seq_no: seq_no }); 
    });

    // Check if there are any invalid entries
    if (invalidEntries.length > 0) {
        alert(invalidEntries.join("\n")); // Show all invalid entries in one alert
        return; // Stop further processing
    }

    // Proceed to send the updates to the server if there are valid updates
    if (updates.length > 0) {
        $.ajax({
            url: 'updateScreenData',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(updates),
            success: function(response) {
                alert("Order Update successful!");
                // Optionally, you can reload the data or close the modal here
                $('#updatemodal').modal('hide'); // Close the modal
                location.reload(); // Reload the page to reflect changes
            },
            error: function(xhr, textStatus, errorThrown) {
                console.error("Error updating data:", textStatus, errorThrown);
                alert("Failed to update data.");
            }
        });
    } else {
        alert("No valid updates to process.");
    }
});
</script>

