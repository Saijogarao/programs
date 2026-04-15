<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags"%>
<custom:commonElements />

<c:if test="${not empty msg}">
	<input type="text" name="msg" id="msg" value="${msg}" />
</c:if>
<main id="main" class="main">
	<spring:form name="role_mst" id="role_mst" action="role_mstAction"
		method='POST' modelAttribute="role_mstCMD">
		<div class="container-fluid">
			<div class="card">
				<div class="card-header">
					<h5 id="mod_mast_name">Create Role</h5>
				</div>
				<div class="card-body cue_text">
					<div class="row g-3">
						<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
							<div class="form-group">
								<label> <span class="required">*</span> Unit
								</label> <select class="form-select" id="unit_code" name="unit_code">
									<option value="">--Select--</option>
									<c:forEach var="item" items="${unitlist}" varStatus="num">
										<option Value="${item.unit_code}">${item.short_desc}</option>
									</c:forEach>

								</select>
							</div>
						</div>
						<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
							<div class="form-group">
								<label> <span class="required">*</span> Branch
								</label> <select class="form-select" id="branch_code" name="branch_code">
									<option value="">--Select--</option>
									<c:forEach var="item" items="${branchlist}" varStatus="num">
										<option Value="${item.type_code}">${item.type_shrt_desc}
										</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-md-3">
							<label for="module_name" class="form-label"> <span
								class="required">*</span> Role Name
							</label> <input type="text" class="form-control  text-uppercase"
								id="role_name" name="role_name" placeholder="Role Name"
								autocomplete="off" maxlength="20"> <input
								id="old_role_id" name="old_role_id" type="hidden"
								class="form-control" autocomplete="off">
						</div>
					</div>
					<div class="">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value=""
								name="is_admin" id="is_admin"> <label
								class="form-check-label" for="checkDefault"> Is Admin </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" value="Y" type="checkbox"
								name="is_active" id="is_active"> <label
								class="form-check-label" for="checkDefault"> Is Active </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="Y"
								name="approve" id="approve"> <label
								class="form-check-label" for="checkDefault"> Approve </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="Y"
								name="forward" id="forward"> <label
								class="form-check-label" for="checkDefault"> Forword </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="Y"
								name="reject" id="reject"> <label
								class="form-check-label" for="checkDefault"> Reject </label>
						</div>

						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="Y"
								name="return" id="return"> <label
								class="form-check-label" for="checkDefault"> Return </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="Y"
								name="head_of_office" id="head_of_office"> <label
								class="form-check-label" for="checkDefault"> Head of
								office </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="Y"
								name="branch_head" id="branch_head"> <label
								class="form-check-label" for="checkDefault"> Branch Head
							</label>
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
					<button type="button" class="btn btn-outline-secondary"
						id="search_btn">Search</button>
				</div>
			</div>
		</div>
	</spring:form>

	<div class="container-fluid" id="divPrint">
		<div class="card d-block">
			<div class="card-body">
				<div class="">
					<table id="rolelist"
						class="table table-hover table-responsive-sm table-bordered">
						<thead class="bg-color">
							<tr class="font-size">
								<th class="no-asc-dsc">Ser No</th>
								<th>Role ID</th>
								<th>Unit</th>
								<th>Branch</th>
								<th>Role Name</th>
								<th>Created Date</th>
								<th>Updated Date</th>
								<th class='lastCol text-center'>Action</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<!--     <h5> Module Master Reorder </h5> -->
		<div class="modal fade" id="exampleModalToggle" aria-hidden="true"
			aria-labelledby="exampleModalToggleLabel" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalToggleLabel">
							Rearrange Order</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">
						<table id="Modulereorder"
							class="table table-hover table-responsive-sm table-bordered">
							<thead class="bg-color">
								<tr class="font-size">
									<th>Module Name</th>
									<th>Order By</th>
									<th>New Order By</th>
								</tr>
							</thead>
							<tbody id="moduleBody">
								<c:forEach var="item" items="${list}" varStatus="num">
									<tr>
										<td class="wid72 module">${item.module_name}</td>
										<td class="wid72">${item.seq_no}</td>
										<td class="wid72"><input type="text" name="new_secuance"
											value="${item.seq_no}" class="form-control" /> <!-- Hidden input for ID -->
											<input type="hidden" name="divyang_id"
											value="${item.divyang_id}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- Save Button inside form -->
						<!--                         <button type="submit" class="btn btn-rounded btn-outline-success" id="save_btnmodel">Save</button> -->
					</div>

					<div class="modal-footer">
						<button class="btn btn-outline-success" data-bs-toggle="update"
							id="updatemodal">Update</button>
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
				<%-- </spring:form> --%>
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
					let flageser = "0";
					window.history.forward();
					function noBack() {
						window.history.forward();
					}
					document.getElementById('save_btn').onclick = async function () {
						const isValidResult = await isValid();
						if (isValidResult) {
							document.getElementById('role_mst').submit();
						} else {
							return false;
						}
					};
					$(document).ready(function () {
						$("#preview_btn").hide();
						$("#update_btn").hide();
						var isvalidurl = '';
						mockjax1('rolelist');
						table = dataTable('rolelist');
						$("#search_btn").on("click", function () {
							flageser = "1";
							table.ajax.reload();
						});

					});
					function mockjax1(tableName) {
						$.mockjax({
							url: '/Data',
							responseTime: 1000,
							response: function (settings) {
								$.ajaxSetup({
									async: false
								});
								data(tableName);
								this.responseText = {
									draw: settings.data.draw,
									data: jsondata,
									recordsTotal: jsondata.length,
									recordsFiltered: FilteredRecords
								};
								//setTimeout(CSPDEfine, 1000);
							}
						});
					}

					function data(tableName) {
						jsondata = [];
						var table = $('#rolelist').DataTable();
						var info = table.page.info();
						var currentPage = info.page;
						var pageLength = info.length;
						var startPage = info.start;
						var endPage = info.end;
						var Search = table.search();
						var order = table.order();
						var orderColunm = order[0][0] + 1;
						var orderType = order[0][1];
						var unit_code = "";
						var branch_code = "";
						var role_name = "";
						if (flageser === "1") {
							unit_code = $('#unit_code').val();
							branch_code = $('#branch_code').val();
							role_name = $('#role_name').val();
						}
						$.post("getRoldedataUrl", { unit_code: unit_code, branch_code: branch_code, role_name: role_name, startPage: startPage, pageLength: pageLength, Search: Search, orderColunm: orderColunm, orderType: orderType }, function (j) {
							for (var i = 0; i < j.length; i++) {
								jsondata.push([j[i].serno, j[i].role_id, j[i].short_desc, j[i].type_shrt_desc, j[i].role_name, j[i].created_date, j[i].modified_date, j[i].action]);
							}
						});
						$.post("getRoldedataCountUrl?" + key + "=" + value, { unit_code: unit_code, branch_code: branch_code, role_name: role_name, startPage: startPage, pageLength: pageLength, Search: Search, orderColunm: orderColunm, orderType: orderType }, function (j) {
							FilteredRecords = j;
						});
					}
					$(document).on('click', '.updaterole', function () {
						$("#save_btn").hide();
						$("#update_btn").show();
						var role_id = $(this).data('index'); // cleaner than attr()
						$.post('getroledata', { role_id: role_id }, function (data) {
							if (!data || !data.length) return;
							var role = data[0];
							$('#old_role_id').val(role.old_role_id);
							$('#role_name').val(role.role_name);
							$('#unit_code').val(role.unit_code);
							$('#branch_code').val(role.branch_code);
							function setCheckbox(id, value) {
								$('#' + id).prop('checked', value === 'Y');
							}
							var checkboxFields = [
								'is_admin',
								'is_active',
								'forward',
								'reject',
								'approve',
								'return',
								'branch_head',
								'head_of_office'
							];
							checkboxFields.forEach(function (field) {
								setCheckbox(field, role[field]);
							});
						});
					});
					document.getElementById('update_btn').onclick = async function () {
						const isValidResult = await isValid();
						if (isValidResult) {
							document.getElementById('role_mst').submit();
						} else {
							return false;
						}
					};
					$(document).ready(function () {
						$("#clearbtn").on("click", function () {
							if (confirm('Are you sure you want to Clear ?')) {
								$('#role_mst').find('input[type="text"], input[type="password"], input[type="email"], input[type="number"], textarea').val('');
								$('#role_mst').find('select').prop('selectedIndex', 0);
								$('#role_mst').find('input[type="checkbox"], input[type="radio"]').prop('checked', false);
								$(".card-header h5").text("Role Master");
								document.getElementById('update_btn').style.display = 'none';
								document.getElementById('save_btn').style.display = 'inline-block';
							}
						});
					});
					$(document).ready(function () {
						restrictToAlphabetsAndSpaces('role_table', 20);
						document.addEventListener('DOMContentLoaded', function () {
							document.querySelectorAll('.numberOnly').forEach(function (input) {
								input.addEventListener('keypress', function (e) {
									if (e.which < 48 || e.which > 57) {
										e.preventDefault();
									}
								});
							});
						});
						document.querySelectorAll('.updatemodule').forEach((items, index) => {
							items.addEventListener('click', event => {
								var val = parseInt(index) + 1;
								var hid = document.getElementById('shid' + val).value;
								var hname = document.getElementById('hhid' + val).value;
								var hurl = document.getElementById('huid' + val).value;
								var hsr = document.getElementById('hsr' + val).value;
								var hstatus = document.getElementById('hstatus' + val).value;
								if (confirm('Are you sure you want to update ?')) {
									Update(hid, hname, hurl, hsr, hstatus);
								} else {
									return false;
								}
							})
						});
						document.querySelectorAll('.delcls').forEach((items, index) => {
							items.addEventListener('click', event => {
								var val = parseInt(index) + 1;
								var hid = document.getElementById('shid' + val).value;
								if (confirm('Are You Sure You Want to Delete This Data ?')) {
									deleteData(hid);
								} else {
									return false;
								}
							})
						})
						$('#ModuleReport').DataTable({
							"scrollY": "400px",
							"scrollX": true,
							"scrollCollapse": true,
						});
						const form = document.getElementById('module_mst');
						const inputFields = form.querySelectorAll('input, textarea');
						inputFields.forEach(function (field) {
							field.addEventListener('paste', function (e) {
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
						document.getElementById('update_btn').style.display = 'none';
						$("html").on("contextmenu", function (e) {
							return false;
						});
						try {
							if (window.location.href.includes("msg=")) {
								var url = window.location.href.split("?msg")[0];
								window.location = url;
							}
						}
						catch (e) {
						}
						$("input[name='new_secuance']").on('keypress', function (event) {
							return isNumberKey(event, this);
						});
					});

					async function isValid() {
						if ($("#unit_code").val() == "" || $("#unit_code").val() == "0") {
							alert("Please Select Unit");
							$("#unit_code").focus();
							return false;
						}
						if ($("#branch_code").val() == "" || $("#branch_code").val() == "0") {
							alert("Please Select Branch");
							$("#branch_code").focus();
							return false;
						}
						if ($("#role_name").val() == "") {
							alert("Please Enter Role Name");
							$("#role_name").focus();
							return false;
						} 
						return true;
					}

					function Update(id, name, hurl, hsr, hstatus) {
						document.getElementById('module_name').value = name;
						document.getElementById('module_url').value = hurl;
						document.getElementById('module_old_name').value = id;
						document.getElementById('seq_no').value = hsr;
						document.getElementById('acstatus').value = hstatus;
						document.getElementById('update_btn').style.display = 'inline-block';
						$("#mod_mast_name").html("Update Module Master");
						document.getElementById('save_btn').style.display = 'none';
						window.scrollTo({ top: 0, behavior: 'smooth' });
					}

					function deleteData(id) {
						$("#id2").val(id);
						document.getElementById('deleteForm').submit();
					}
					document.addEventListener('DOMContentLoaded', function () {
						document.getElementById('module_mst').onsubmit = async function (e) {
							e.preventDefault();
							const isValidResult = await isValid();
							if (!isValidResult) {
								return false;
							}
							this.submit();
						};
					});
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
								alert("Please Select Module Url");
								$("#module_url").focus();
								resolve(false);
							} else {
								var url = $("#module_url").val();
								$.ajax({
									url: url,
									type: 'GET',
									success: function () {
										resolve(true);
									},
									error: function (xhr, status, error) {
										alert("Module URL is not accessible.");
										resolve(false);
									}
								});
							}
						});
					}
					$('#updatemodal').on('click', function () {
						var updates = [];
						var seqNoSet = new Set();
						var invalidEntries = []; // Array to collect invalid entries
						$('#moduleBody tr').each(function (index) {
							var module = $(this).find('.module').text();
							var seq_no = $(this).find('input[name="new_secuance"]').val();
							var subid = $(this).find('input[name="divyang_id"]').val();
							if (seq_no.trim() === "" || seq_no === "0") {
								invalidEntries.push("Sequence number cannot be empty or zero: " + module);
								return;
							}
							if (seq_no.trim() != "") {
								if (seqNoSet.has(seq_no)) {
									invalidEntries.push("Duplicate sequence number found: " + module);
									return;
								}
							}
							seqNoSet.add(seq_no);
							updates.push({ id: subid, seq_no: seq_no });
						});
						if (invalidEntries.length > 0) {
							alert(invalidEntries.join("\n"));
							return;
						}
						if (confirm('Are you sure you want to update?')) {
							if (updates.length > 0) {
								$.ajax({
									url: 'updateModuleData',
									type: 'POST',
									contentType: 'application/json',
									data: JSON.stringify(updates),
									success: function (response) {
										alert("Order Update successful!");
										$('#updatemodal').modal('hide');
										location.reload();
									},
									error: function (xhr, textStatus, errorThrown) {
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
				</script>