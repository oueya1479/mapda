<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script>



$(function() {
	
	var lista = [];
	var listb = [];
	var listc = [];
	<c:forEach items="${memberCountList}" var="c">
	lista.push(Number("${c}"));
	</c:forEach>
	<c:forEach items="${postCountList}" var="c">
	listb.push(Number("${c}"));
	</c:forEach>
	<c:forEach items="${replyCountList}" var="c">
	listc.push(Number("${c}"));
	</c:forEach>
	
	$('#containers').highcharts({

			  title: {
			    text: 'Mapda 전체 통계표'
			  },

			  subtitle: {
			    text: '회원, 포스트 및 회원들의 활동'
			  },

			  yAxis: {
			    title: {
			      text: '수치'
			    }
			  },

			  xAxis: {
			    accessibility: {
			      rangeDescription: 'Range: 2020 to 2021'
			    }
			  },

			  legend: {
			    layout: 'vertical',
			    align: 'right',
			    verticalAlign: 'middle'
			  },

			  plotOptions: {
			    series: {
			      label: {
			        connectorAllowed: false
			      },
			      pointStart: 316
			    }
			  },
			  
			  series: [{
			    name: 'member',
			    data: lista.reverse()
			  }, {
			    name: 'posting',
			    data: listb.reverse()
			  }, {
			    name: 'reply',
			    data: listc.reverse()
			  }],

			  responsive: {
			    rules: [{
			      condition: {
			        maxWidth: 500
			      },
			      chartOptions: {
			        legend: {
			          layout: 'horizontal',
			          align: 'center',
			          verticalAlign: 'bottom'
			        }
			      }
			    }]
			  }
		})
})
</script>
<style>
.highcharts-figure, .highcharts-data-table table {
    min-width: 360px; 
    max-width: 800px;
    margin: 1em auto;
}
.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

</style>

  </head>

  <body>
  <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <div class="row">
                                            <!-- task, page, download counter  start -->
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-purple">${memberCount }</h4>
                                                                <h6 class="text-muted m-b-0">All member</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-bar-chart f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-purple">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">All member</p>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
            
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-green">${postCount}</h4>
                                                                <h6 class="text-muted m-b-0">All post</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-file-text-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-green">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">All post</p>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-red">${replyCount}</h4>
                                                                <h6 class="text-muted m-b-0">All reply</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-calendar-check-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                <p class="text-white m-b-0">All reply</p>
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- task, page, download counter  end -->
    
                                            <!--  sale analytics start -->
                                            <div class="col-xl-8 col-md-12">
                                                <div class="card">
                                                   <div class="card-header">
                                                        <h5>Sales Analytics</h5>
                                                        <span class="text-muted">Get 15% Off on <a href="https://www.amcharts.com/" target="_blank">amCharts</a> licences. Use code "codedthemes" and get the discount.</span>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <figure class="highcharts-figure">
														    <div id="containers"></div>
														    <p class="highcharts-description">
														        Basic line chart showing trends in a dataset. This chart includes the
														        <code>series-label</code> module, which adds a label to each line for
														        enhanced readability.
														    </p>
														</figure>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-md-12">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row">
                                                            <div class="col">
                                                                <h4>$256.23</h4>
                                                                <p class="text-muted">This Month</p>
                                                            </div>
                                                            <div class="col-auto">
                                                                <label class="label label-success">+20%</label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-8">
                                                                <canvas id="this-month" style="height: 150px;"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card quater-card">
                                                    <div class="card-block">
                                                        <h6 class="text-muted m-b-15">This Quarter</h6>
                                                        <h4>$3,9452.50</h4>
                                                        <p class="text-muted">$3,9452.50</p>
                                                        <h5>87</h5>
                                                        <p class="text-muted">Online Revenue<span class="f-right">80%</span></p>
                                                        <div class="progress"><div class="progress-bar bg-c-blue" style="width: 80%"></div></div>
                                                        <h5 class="m-t-15">68</h5>
                                                        <p class="text-muted">Offline Revenue<span class="f-right">50%</span></p>
                                                        <div class="progress"><div class="progress-bar bg-c-green" style="width: 50%"></div></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--  sale analytics end -->
    
                                            <!--  project and team member start -->
                                            <div class="col-xl-8 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Projects</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover">
                                                                <thead>
                                                                <tr>
                                                                    <th>
                                                                        <div class="chk-option">
                                                                            <div class="checkbox-fade fade-in-primary">
                                                                                <label class="check-task">
                                                                                    <input type="checkbox" value="">
                                                                                    <span class="cr">
                                                                                            <i class="cr-icon fa fa-check txt-default"></i>
                                                                                        </span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        Assigned</th>
                                                                    <th>Name</th>
                                                                    <th>Due Date</th>
                                                                    <th class="text-right">Priority</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <div class="chk-option">
                                                                            <div class="checkbox-fade fade-in-primary">
                                                                                <label class="check-task">
                                                                                    <input type="checkbox" value="">
                                                                                    <span class="cr">
                                                                                                <i class="cr-icon fa fa-check txt-default"></i>
                                                                                            </span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-inline-block align-middle">
                                                                            <img src="assets/images/avatar-4.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                                            <div class="d-inline-block">
                                                                                <h6>John Deo</h6>
                                                                                <p class="text-muted m-b-0">Graphics Designer</p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>Able Pro</td>
                                                                    <td>Jun, 26</td>
                                                                    <td class="text-right"><label class="label label-danger">Low</label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="chk-option">
                                                                            <div class="checkbox-fade fade-in-primary">
                                                                                <label class="check-task">
                                                                                    <input type="checkbox" value="">
                                                                                    <span class="cr">
                                                                                                <i class="cr-icon fa fa-check txt-default"></i>
                                                                                            </span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-inline-block align-middle">
                                                                            <img src="assets/images/avatar-5.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                                            <div class="d-inline-block">
                                                                                <h6>Jenifer Vintage</h6>
                                                                                <p class="text-muted m-b-0">Web Designer</p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>Mashable</td>
                                                                    <td>March, 31</td>
                                                                    <td class="text-right"><label class="label label-primary">high</label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="chk-option">
                                                                            <div class="checkbox-fade fade-in-primary">
                                                                                <label class="check-task">
                                                                                    <input type="checkbox" value="">
                                                                                    <span class="cr">
                                                                                                <i class="cr-icon fa fa-check txt-default"></i>
                                                                                            </span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-inline-block align-middle">
                                                                            <img src="assets/images/avatar-3.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                                            <div class="d-inline-block">
                                                                                <h6>William Jem</h6>
                                                                                <p class="text-muted m-b-0">Developer</p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>Flatable</td>
                                                                    <td>Aug, 02</td>
                                                                    <td class="text-right"><label class="label label-success">medium</label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="chk-option">
                                                                            <div class="checkbox-fade fade-in-primary">
                                                                                <label class="check-task">
                                                                                    <input type="checkbox" value="">
                                                                                    <span class="cr">
                                                                                                <i class="cr-icon fa fa-check txt-default"></i>
                                                                                            </span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-inline-block align-middle">
                                                                            <img src="assets/images/avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                                            <div class="d-inline-block">
                                                                                <h6>David Jones</h6>
                                                                                <p class="text-muted m-b-0">Developer</p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>Guruable</td>
                                                                    <td>Sep, 22</td>
                                                                    <td class="text-right"><label class="label label-primary">high</label></td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                            <div class="text-right m-r-20">
                                                                <a href="#!" class=" b-b-primary text-primary">View all Projects</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-md-12">
                                                <div class="card ">
                                                    <div class="card-header">
                                                        <h5>Team Members</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="align-middle m-b-30">
                                                            <img src="assets/images/avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                            <div class="d-inline-block">
                                                                <h6>David Jones</h6>
                                                                <p class="text-muted m-b-0">Developer</p>
                                                            </div>
                                                        </div>
                                                        <div class="align-middle m-b-30">
                                                            <img src="assets/images/avatar-1.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                            <div class="d-inline-block">
                                                                <h6>David Jones</h6>
                                                                <p class="text-muted m-b-0">Developer</p>
                                                            </div>
                                                        </div>
                                                        <div class="align-middle m-b-30">
                                                            <img src="assets/images/avatar-3.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                            <div class="d-inline-block">
                                                                <h6>David Jones</h6>
                                                                <p class="text-muted m-b-0">Developer</p>
                                                            </div>
                                                        </div>
                                                        <div class="align-middle m-b-30">
                                                            <img src="assets/images/avatar-4.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                            <div class="d-inline-block">
                                                                <h6>David Jones</h6>
                                                                <p class="text-muted m-b-0">Developer</p>
                                                            </div>
                                                        </div>
                                                        <div class="align-middle m-b-10">
                                                            <img src="assets/images/avatar-5.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                            <div class="d-inline-block">
                                                                <h6>David Jones</h6>
                                                                <p class="text-muted m-b-0">Developer</p>
                                                            </div>
                                                        </div>
                                                        <div class="text-center">
                                                            <a href="#!" class="b-b-primary text-primary">View all Projects</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--  project and team member end -->
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
</body>

</html>
