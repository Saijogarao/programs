<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
	<custom:commonElements/>
<main id="main" class="main">
<spring:form name="submodule_mst" id="submodule_mst"  >
	<div class="container-fluid">
		<div class="card">
			<div class="card-header">
				<h5 id="smmaster_headid">SubModule Master</h5>
			</div>
			<div class="card-body cue_text">
			<div class="row g-3"> 
               <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
				<div class="form-group">
						<label><span class="required">*</span> Module Name</label>
						<select name="module_id" class="form-control" id ="module_id" >
		                 	<option value="0">--Select--</option>
		               			<c:forEach var="item" items="${getModuleNameList}" varStatus="num">
		               				<option value="${item.module_id}">${item.module_name}</option>
		               			</c:forEach>
		                 </select>
				</div>
			</div>
             <div class="col-md-3">
                    <label for="module_name" class="form-label"> <span class="required">*</span> SubModule Name</label>
                    <input type="text" class="form-control" id="submodule_name" name="submodule_name" placeholder="SubModule Name" autocomplete="off" maxlength="50">
                  </div>  
                   <div class="col-md-3">
                    <label for="module_name" class="form-label"> <span class="required">*</span> Order By</label>
	 <input type="number" class="form-control" id="seq_no" name="seq_no" placeholder="Order By" autocomplete="off" maxlength="10">
                  </div> 
                  <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
							<div class="form-group">
								<label> <span class="required">*</span> Status</label> <select class="form-select"
									id="acstatus" name="acstatus">
									<option value="0">--Select--</option>
									<option Value="N">Active</option>
									<option Value="I">Inactive</option>
								</select>
							</div>
						</div>
               </div>
			 </div>
			<div class="card-footer" align="center">
				<button type="button" class="btn btn-rounded btn-outline-danger" id="btnclear">Clear</button>
				<button type="button" class="btn btn-rounded btn-outline-success" id="save_btn" >Save</button> 
				<button type="button" class="btn btn-rounded btn-outline-warning" id="update_btn" >Update</button>
				<button type="button" class="btn btn-rounded btn-outline-info d-none" id="rearrange_btn" >Rearrange Order</button>
				<button type="button" class="btn btn-outline-secondary" id="search_btn">Search</button>
			</div>
		</div>
	</div>
	<input type="hidden" class="form-control" id="hid" name="hid" value="0">
</spring:form>
<div class="container-fluid" id="divPrint">
	<div class="card d-block">
		<div class="card-body">
				<table id="subModuleReport" class="table table-hover table-responsive-sm table-bordered">
					<thead class="bg-color">
						<tr class="font-size">
							<th class="no-asc-dsc">Ser No</th>
							<th>Module Name</th>
							<th>SubModule Name</th>
							<th>Order By</th>
							<th>Created Date</th>	
							<th>Status</th>						
							<th class='lastCol text-center'>Action</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
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
					      
					      <div class="form-group">
					       	<label><span class="required">*</span> Module Name</label>
						<select name="module_id2" class="form-control" id ="module_id2" >
		                 	<option value="0">--Select--</option>
		               			<c:forEach var="item" items="${getModuleNameList}" varStatus="num">
		               				<option value="${item.module_id}">${item.module_name}</option>
		               			</c:forEach>
		                 </select>
		                 </div>
		                     <input type="hidden" value="1" id="count_exp" name="count_exp">
			                <div class="table-responsive">
			                <table class="table" id="submoduleTable">
			                    <thead>
			                        <tr>
			                            <th>Submodule Name</th>
			                            <th>Old Order</th>
			                            <th>New Order</th>
			                        </tr>
			                    </thead>
			                    <tbody id="submoduleBody">
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
<c:url value="deletesubmodulemstdata" var="deletesubmodulemstdata" />
	<spring:form action="${deletesubmodulemstdata}" method="post" id="deleteForm"
	name="deleteForm" modelAttribute="id2">
	<input type="hidden" name="id2" id="id2" value="0" />
</spring:form>
</main>

<script nonce="${cspNonce}" type="text/javascript">
let flageser="0";
window.history.forward();
function noBack() {
	window.history.forward();
}

$(document).ready(function (){
	
	restrictToAlphabetsAndSpaces('submodule_name',50);
	 $('#rearrange_btn').on('click', function() {
	        $('#rearrangeModal').modal('show'); // Show the modal
	        $("#submoduleTable").hide();   
	        $("#updatemodal").hide();   
	        
	    });
	mockjax1('subModuleReport');
	table = dataTable('subModuleReport');
	$("#search_btn").on("click", function() {
		flageser="1";
		table.ajax.reload();
	});
	document.getElementById('update_btn').style.display='none'; 
	
    $("html").on("contextmenu",function(e){
        return false;
    }); 
    
    $('#submodule_name').keyup(function() {
        this.value = this.value.toUpperCase();
    });
    
    $("#btnclear").on("click",function(e){
    	
    	if (confirm('Are you sure you want to Clear ?')) {
	    	
			$('#submodule_mst').find('input[type="text"], input[type="password"], input[type="email"], input[type="number"], textarea').val('');
			$('#submodule_mst').find('select').prop('selectedIndex', 0); 
			$('#submodule_mst').find('input[type="checkbox"], input[type="radio"]').prop('checked', false); 
			
    	$(".card-header h5").text("SubModule Master");
    	document.getElementById('update_btn').style.display='none'; 
    	document.getElementById('save_btn').style.display='inline-block'; 
		}
    	  
    }); 
    
    var msg = '${msg}';
	if (msg != ""){
		alert(msg);
	}
	try{
	 	if(window.location.href.includes("msg=")){
	 		var url = window.location.href.split("?")[0];
	 		window.location.href=url;
	 	} 	
	 }catch (e) {}
	 
	 setTimeout(CSPDEfine, 1000);

    
	  $("#module_id2").on("change",function(e){   			 
		  rearrange_order();
		    });
	  
	  
});

function rearrange_order() {
    var moduleval = $("#module_id2").val();
    $("#submoduleTable").show();   
    $("#updatemodal").show();   
    $.post("getsubmoduledata", {
        moduleval: moduleval
    }).done(function(j) {
        var submoduleBody = $("#submoduleBody");
        submoduleBody.empty(); // Clear previous data

        if (j && Array.isArray(j) && j.length > 0) {

for (let i = 0; i < j.length; i++) {
    const x = i + 1; // This is used for row numbering if needed
    const submodule_name = j[i].submodule_name || ''; // Get submodule name
    const seq_no = j[i].seq_no !== null ? j[i].seq_no : '';
    const subid = j[i].id || ''; // Get sequence number
    $("input#count_exp").val(x);
    
    $("#submoduleBody").append(
		    '<tr>'
		     + '<td class="subname">' + submodule_name + '</td>'
		     + '<td>' + seq_no + '</td>'
		    + '<td><input type="text"  class="form-control" id="seq_no' + x + '" name="seq_no" value="' + seq_no + '" />'
		    + '<input type="hidden"  class="form-control" id="subid' + x + '" name="subid" value="' + subid + '" /></td>'
		    + '</tr>'
		    
		);
    $("#seq_no" + x).keypress(function() {
        return isNumberKey(event, this);
  	 });
}

        } else {
            submoduleBody.append('<tr><td colspan="2">No submodules found.</td></tr>');
        }
    }).fail(function(xhr, textStatus, errorThrown) {
        console.error("Error fetching submodule data:", textStatus, errorThrown);
    });
}
	
	

// Update button click event
$('#updatemodal').on('click', function() {
    var updates = [];
    var seqNoSet = new Set(); 
    var invalidEntries = []; // Array to collect invalid entries

    $('#submoduleBody tr').each(function(index) {
    	   var subname = $(this).find('.subname').text();
        var seq_no = $(this).find('input[name="seq_no"]').val();
        var subid = $(this).find('input[name="subid"]').val();
        
        // Validate seq_no: it should not be empty or zero
        if (seq_no.trim() === "" || seq_no === "0") {
            invalidEntries.push("Sequence number cannot be empty or zero: " + subname);
            return; // Skip this iteration
        }

        // Check for duplicate seq_no
           if (seq_no.trim() != ""){
        if (seqNoSet.has(seq_no)) {
            invalidEntries.push("Duplicate sequence number found: " + subname);
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
     if (confirm('Are you sure you want to update?')) {
    if (updates.length > 0) {
        $.ajax({
            url: 'updateSubmoduleData',
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
} else {
    return false;
}
});
	
function isValid(){

	if($("select#module_id").val() == 0){
		alert("Please Select Module Name");
		$("select#module_id").focus();
		return false;
	}
	
	if($("#submodule_name").val() == ""){
		alert("Please Enter SubModule Name");
		$("#submodule_name").focus();
		return false;
	}
	
	let seq_no = $("#seq_no").val();

    if (seq_no === "") {
        alert("Please Enter Order By");
        $("#seq_no").focus();
        return false; // Prevent form submission
    } else if (isNaN(seq_no)) {
        alert("Order By must be a number");
        $("#seq_no").focus();
        return false; // Prevent form submission
    } else if (seq_no <= 0) {
        alert("Order By must be greater than 0");
        $("#seq_no").focus();
        return false; // Prevent form submission
    }
	
	
	var form_data = new FormData(document.getElementById("submodule_mst"));
	
	$.ajax({
	   url: 'submodule_mstAction?_csrf='+value,
	   type: "POST",
	   data: form_data,
	   processData: false,
	   contentType: false
	 }).done(function(data) {
		   	alert(data);
		   	if(data =="Data Updated Successfully"){
		   		window.location.reload();
		   	}else if(data="Data saved Successfully"){
		   		window.location.reload();
		   	}
		   	
// 		   	window.location.reload();
	 }).fail(function(jqXHR, textStatus) {
	     alert('Error Occured...');
	 });
}

function Update(id,name,spid,seqhid,status){	
	document.getElementById('hid').value=id;
	document.getElementById('submodule_name').value=name;
	document.getElementById('module_id').value=spid;
	document.getElementById('seq_no').value=seqhid;
	document.getElementById('acstatus').value=status;
	
	document.getElementById('update_btn').style.display='inline-block'; 
	document.getElementById('save_btn').style.display='none';
	window.scrollTo({ top: 0, behavior: 'smooth' });
}

document.addEventListener('DOMContentLoaded', function () {			

	document.getElementById('save_btn').onclick =function () {
		return isValid();
	};
	
	document.getElementById('update_btn').onclick =function () {
		return isValid();
	};

});


var i = 0;
var j = 0;
function CSPDEfine(){
	  $(document).off('click', '.updatesubmodule').on('click', '.updatesubmodule', function(event) {
			$("#smmaster_headid").text("Update Submodule Master");
			var val = $(this).data('index');
			var hid = document.getElementById('sbhid'+val).value;
			var smid = document.getElementById('smid'+val).value;
			var sphid = document.getElementById('sphid'+val).value;
			var seqhid = document.getElementById('seqhid'+val).value;
			 var status= document.getElementById('hstatus'+val).value;
			
				if (confirm('Are you sure you want to update ?')) {
					Update(hid,smid,sphid,seqhid,status);
				} else {
					return false;
				}
			
	});
	  $(document).off('click', '.delcls').on('click', '.delcls', function(event) { 
			var val = $(this).data('index');
			var hid = document.getElementById('sbhid'+val).value;
			if(j == 0){
			if (confirm('Are you sure you want to Delete ?')) {
				j = j + 1;
				DeleteData(hid);
			} else {
				return false;
			}
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
	     }
	});
}
function data(tableName){
	jsondata = [];
	var table = $('#subModuleReport').DataTable();
	var info = table.page.info();
	var currentPage = info.page;
    var pageLength = info.length;
	var startPage = info.start;
	var endPage = info.end;
	var Search = table.search();
	var order = table.order();
	var orderColunm = order[0][0] + 1;
	var orderType = order[0][1];
	
	var module_id ="0";
	var submodule_name = "";
	
	if (flageser ==="1") {
		 module_id = $('#module_id').val();
		 submodule_name = $('#submodule_name').val();
	}
	
	$.post("getsubModuleReportdataUrl",{ startPage:startPage,pageLength:pageLength,Search:Search,orderColunm:orderColunm,orderType:orderType,module_id:module_id,submodule_name:submodule_name},function(j) {
		for (var i = 0; i < j.length; i++) {	
			
			var normalDate = "";
			if(j[i].created_date != null){
			var timestamp = j[i].created_date;
			var date = new Date(timestamp);
			normalDate = date.toLocaleString().substring(0,10);
		}
		var AC_status = "";
		if(j[i].is_deleted =='N' ){
			AC_status ="<span class='badge badge-outline-success'>Active</span>";
	}else{
		AC_status ="<span class='badge badge-outline-danger'>Inactive</span>";
	}
			jsondata.push([j[i].serno,j[i].module_name,j[i].submodule_name,j[i].seq_no,normalDate,AC_status,j[i].submodule_id]);
		}
	});
	$.post("getsubModuleReportdataCountUrl?"+key+"="+value,{ startPage:startPage,pageLength:pageLength,Search:Search,orderColunm:orderColunm,orderType:orderType,module_id:module_id,submodule_name:submodule_name},function(j) {
		FilteredRecords = j;
	});
	
	 setTimeout(CSPDEfine, 1000);
}
function DeleteData(id)
{
	$("#id2").val(id);
	document.getElementById('deleteForm').submit();
}
</script>

