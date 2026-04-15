<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags"%>
<custom:commonElements />
<c:if test="${not empty msg}">
	<input type="text" name="msg" id="msg" value="${msg}" />
</c:if>

<main id="main" class="main">
	<spring:form name="module_mst" id="module_mst"
		action="module_mstAction" method='POST' modelAttribute="module_mstCMD">

		<div class="container-fluid">
			<div class="card">
				<div class="card-header">
					<h5 id="mod_mast_name">Module Master</h5>
				</div>
				<div class="card-body cue_text">
					<div class="row g-3">
						<div class="col-md-3">
							<label for="module_name" class="form-label"> <span
								class="required">*</span> Module Name
							</label> <input type="text" class="form-control  text-uppercase"
								id="module_name" name="module_name" placeholder="Module Name"
								autocomplete="off" maxlength="20"> 
								<input id="module_old_name"
								name="module_old_name" type="hidden" class="form-control"
								autocomplete="off">
						</div>
						<div class="col-md-3">
							<label for="module_name" class="form-label"> <span
								class="required">*</span> Module Url
							</label> <input type="text" class="form-control" id="module_url"
								name="module_url" placeholder="Module Url" autocomplete="off"
								maxlength="30"> 
						</div>

						<div class="col-md-3">
							<label for="module_name" class="form-label"> <span
								class="required">*</span> Order By
							</label> <input type="number" class="form-control" id="seq_no"
								name="seq_no" placeholder="Order By" value="0"
								autocomplete="off" maxlength="10">
						</div>


						<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
							<div class="form-group">
								<label> <span class="required">*</span> Status
								</label> <select class="form-select" id="acstatus" name="acstatus">
									<option value="0">--Select--</option>
									<option Value="N">Active</option>
									<option Value="I">Inactive</option>
								</select>
							</div>
						</div>


					</div>
				</div>
				<div class="card-footer" align="center">
					<a type="button" id="clearbtn"
						class="btn btn-rounded btn-outline-danger">Clear</a>
					<button type="button" class="btn btn-rounded btn-outline-success"
						id="save_btn">Save</button>
					<button type="button" class="btn btn-rounded btn-outline-warning"
						id="update_btn">Update</button>
				</div>
			</div>
		</div>
	</spring:form>

	<div class="container-fluid" id="divPrint">
		<div class="card d-block">
			<div class="card-body">
				<div class="">
					<table id="ModuleReport"
						class="table table-hover table-responsive-sm table-bordered">
						<thead class="bg-color">
							<tr class="font-size">
								<th class="no-asc-dsc">Ser No</th>
								<th>Module Name</th>
								<th>Module Url</th>
								<th>Order By</th>
								<th>Created Date</th>
								<th>Updated Date</th>
								<th>Status</th>
								<th class='lastCol text-center'>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}" varStatus="num">
								<tr>
									<td class="wid72">${num.index + 1}</td>
									<td class="wid72">${item.module_name}</td>
									<td class="wid72">${item.module_url}</td>
									<td class="wid72">${item.seq_no}</td>
									<td class="wid72">${item.created_date}</td>
									<td class="wid72">${item.updated_date}</td>
									<td class="wid72"><c:choose>
											<c:when test="${item.is_deleted == 'N'}">
												<span class="badge badge-outline-success">Active</span>
											</c:when>
											<c:when test="${item.is_deleted == 'Y'}">
												<span class="badge badge-outline-danger">Soft Deleted</span>
											</c:when>
											<c:otherwise>
												<span class="badge badge-outline-danger">Inactive</span>
											</c:otherwise>
										</c:choose></td>
									<td class="text-center width">${item.id}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</main>
<c:url value="Delete_modulemast" var="Delete_modulemast" />
<spring:form action="${Delete_modulemast}" method="post" id="deleteForm"
	name="deleteForm" modelAttribute="id2">
	<input type="hidden" name="id2" id="id2" value="0" />
</spring:form>
<script nonce="${cspNonce}" type="text/javascript">
window.history.forward();
function noBack() {
	window.history.forward();
}

$(document).ready(function (){
	restrictToAlphabetsAndSpaces('module_name',20);
	restrictToAlphabetsNumbersSpacesAndSpecialChars('module_url',30);
	   document.addEventListener('DOMContentLoaded', function() {
	        document.querySelectorAll('.numberOnly').forEach(function(input) {
	            input.addEventListener('keypress', function(e) {
	                if (e.which < 48 || e.which > 57) {
	                    e.preventDefault();
	                }
	            });
	        });
	    });
	document.getElementById('save_btn').onclick = async function () {
	    const isValidResult = await isValid();
	    if (isValidResult) {
	        document.getElementById('module_mst').submit();
	    } else {
	        return false;
	    }
	};
	
	document.getElementById('update_btn').onclick = async function () {
	    const isValidResult = await isValid();
	    if (isValidResult) {
	        document.getElementById('module_mst').submit();
	    } else {
	        return false;
	    }
	};
	
	
	document.querySelectorAll('.updatemodule').forEach((items, index) => {
		items.addEventListener('click', event => {
			var val=parseInt(index)+1;
			var hid = document.getElementById('shid'+val).value;
			var hname = document.getElementById('hhid'+val).value;
			var hurl = document.getElementById('huid'+val).value;
			var hsr = document.getElementById('hsr'+val).value;
			var hstatus = document.getElementById('hstatus'+val).value;
			if (confirm('Are you sure you want to update ?')) {
				Update(hid,hname,hurl,hsr,hstatus);
			} else {
				return false;
			}
		})
	});
	document.querySelectorAll('.delcls').forEach((items, index) => {
		items.addEventListener('click', event => {
			var val=parseInt(index)+1;
			var hid = document.getElementById('shid'+val).value;
			if (confirm('Are You Sure You Want to Delete This Data ?')) {
				deleteData(hid);
			} else {
				return false;
			}
		})
	  })
	
	$('#ModuleReport').DataTable({
		"scrollY" : "400px",
		"scrollX" : true,
		"scrollCollapse" : true,
	});
	const form = document.getElementById('module_mst');
	const inputFields = form.querySelectorAll('input, textarea');
		inputFields.forEach(function(field) {
		    field.addEventListener('paste', function(e) {
		        e.preventDefault();
		        const clipboardData = e.clipboardData || window.clipboardData;
		        const pastedData = clipboardData.getData('Text');
		        const validatedText = validatePastedText(pastedData);
		        if (validatedText !== null) {
		            const cursorPos = this.selectionStart;
		            const textBefore = this.value.substring(0, cursorPos);
		            const textAfter = this.value.substring(this.selectionEnd);
		            if (textBefore.length === 0 && validatedText.charAt(0) === ' ') {
		                this.value = textBefore + validatedText.trimStart() + textAfter;
		            } else {
		                this.value = textBefore + validatedText + textAfter;
		            }
		            const newPos = cursorPos + validatedText.length;
		            this.setSelectionRange(newPos, newPos);
		        }
		    });
		});
	
	document.getElementById('update_btn').style.display='none'; 
    $("html").on("contextmenu",function(e){
        return false;
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
		 $("input[name='new_secuance']").on('keypress', function(event) {
		        return isNumberKey(event, this);
		    });
		 $("#clearbtn").on("click", function() {
				if (confirm('Are you sure you want to Clear ?')) {
					$('#module_mst').find('input[type="text"], input[type="password"], input[type="email"], input[type="number"], textarea').val('');
					$('#module_mst').find('select').prop('selectedIndex', 0); 
					$('#module_mst').find('input[type="checkbox"], input[type="radio"]').prop('checked', false); 
		    	$(".card-header h5").text("Module Master");
		    	document.getElementById('update_btn').style.display='none'; 
		    	document.getElementById('save_btn').style.display='inline-block'; 
				}
			});
		 
});
	
async function isValid(){
	
	if($("#module_name").val() == ""){
		alert("Please Enter Module Name");
		$("#module_name").focus();
		return false;
	}
	if($("#module_url").val() == ""){
		alert("Please Enter Module Url");
		$("#module_url").focus();
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
	 if($("#acstatus").val() == "0"){
			alert("Please Select Active Status.");
			$("#acstatus").focus();
			return false;
		}
	 
	 

    const isValidDiv = await fn_ValidationUrl();
    if (isValidDiv) {
        console.log("URL is valid. Proceeding...");
        return true;
    } else {
        console.log("URL validation failed.");
        return false;
    }
	return true;
}

function Update(id,name,hurl,hsr,hstatus){	
	document.getElementById('module_name').value=name;
	document.getElementById('module_url').value=hurl;
	document.getElementById('module_old_name').value=id;
	document.getElementById('seq_no').value=hsr;
	
	document.getElementById('acstatus').value=hstatus;
	
	document.getElementById('update_btn').style.display='inline-block'; 
	$("#mod_mast_name").html("Update Module Master");
	document.getElementById('save_btn').style.display='none'; 
	
	window.scrollTo({ top: 0, behavior: 'smooth' });
}

function deleteData(id) {
	$("#id2").val(id);
	document.getElementById('deleteForm').submit();
}

// document.addEventListener('DOMContentLoaded', function () {			
	
// 	document.getElementById('module_mst').onsubmit = async function (e) {
// 	    e.preventDefault(); 
// 	    const isValidResult = await isValid(); 
// 	    if (!isValidResult) {
// 	        return false;
// 	    }
// 	    this.submit();
// 	};

// });

function validatePastedText(text) {
	let validText = '';
	let hasInvalidChars = false;

     for (let i = 0; i < text.length; i++) {
         const charCode = text.charCodeAt(i);

         if (
             (charCode >= 48 && charCode <= 57) || // 0-9
             (charCode >= 65 && charCode <= 90) || // A-Z
             (charCode >= 97 && charCode <= 122) || // a-z
             charCode === 40 || // (
             charCode === 41 || // )
             charCode === 91 || // [
             charCode === 93 || // ]
             charCode === 32 || // space
             charCode === 92 || // \
             charCode === 46 || // .
             charCode === 45 || // -
             charCode === 44 || // ,
             charCode === 95 || // _
             charCode === 38    // &
         ) {
             validText += text.charAt(i);
         } else {
             hasInvalidChars = true;
         }
     }

     return hasInvalidChars ? null : validText;
 }
 
 
async function mainFunction() {
    const isValid = await fn_ValidationUrl();
    if (isValid) {
        console.log("URL is valid. Proceeding...");
        return true;
    } else {
        console.log("URL validation failed.");
        return false;
    }
}

function fn_ValidationUrl() {
    return new Promise((resolve, reject) => {
        if ($("#module_url").val().trim() == "") {
            alert("Please Enter Module Url");
            $("#module_url").focus();
            resolve(false);
        } else {
            var url = $("#module_url").val();
            $.ajax({
                url: url,
                type: 'GET',
                success: function() {
                    resolve(true);
                },
                error: function(xhr, status, error) {
                    alert("Module URL is not accessible.");
                    resolve(false);
                }
            });
        }
    });
}



</script>

