<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>OnBiz</title>
<!-- Custom fonts for this template-->
<!-- Custom fonts for this template-->
<link href="${path}/resources/vendor/fontawesome-free/css/all.min.css" 
   rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,
   400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
   
<!-- Custom styles for this template-->
<script src="${path}/settings/jquery.min.js"></script>
<script src="${path}/settings/jquery-ui.js"></script>
<script src="${path}/settings/popper.min.js"></script>
<script src="${path}/settings/bootstrap.min.js"></script>
<link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/settings/bootstrap.min.css">
<link rel="stylesheet" href="${path}/settings/jquery-ui.css">

<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${path}/resources/js/sb-admin-2.min.js"></script>

<style>
.jumbotron{
padding: 1rem 0rem;

}
.jumbotron-fluid {
padding-left:40%;
text-align:center;
}

.progress-bar{
width:50px;
}
table >tbody th {
font-size:.675rem;
text-align :center;
padding-top:10px;
padding-bottom:10px;
}
td {
font-size:.675rem;
text-align :center;
padding-top:10px;
padding-bottom:10px;
}
.no-gutters>[class*=col-] {
padding-left:30px;
}
.table-bordered {
width:100%;
}
.card {
margin-top:10px;
}
.col-lg-4 card {
height: 400px;
}
element.style {
width:200px;
width:400px;
}
</style>
</head>


<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <jsp:include page="/common/HR/sidebar2.jsp"/>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
        <jsp:include page="/common/header.jsp"/>                    

<div class="container-fluid">
<c:set var="now" value="<%=new Date()%>"/>
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h5 class ="sm-title"> ONBIZ 대시보드</h5>
    <h1><fmt:formatDate value="${now}"/> </h1>
  </div>
</div>

                    <!-- Page Heading -->
                   <!--<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
                
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                               총 프로젝트 현황</div>
                                               <c:forEach var="procnt" items="${procnt}">
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${procnt.procnt}개</div> 
                                            </c:forEach>                                      
                                             </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                              진행 작업 현황</div>
                                              <c:forEach var="taskcnt" items="${taskcnt}">
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${taskcnt.taskcnt}개</div>
                                            </c:forEach>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">리스크현황
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div >
                                                 <c:forEach var="riskcnt" items="${riskcnt}">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${riskcnt.riskcnt}개</div>
                                                    </c:forEach>
                                                </div>
                                                <br>
                                                  
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                미진프로젝트</div>
                                                 <c:forEach var="dproject" items="${dproject}">
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${dproject.dproject}개</div>
                                            </c:forEach>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                     
                  
                        
                        
                        
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                 
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">작업현황</h6>
                                </div>
                                <div class="card-body">
                                <c:forEach var="projectst" items="${projectst}">
                                    <h4 class="small font-weight-bold">${projectst.pro_name} <span
                                            class="float-right">${projectst.task2}</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width:${projectst.task2}%"
                                            aria-valuenow="${projectst.task2}" aria-valuemin="0" aria-valuemax="${projectst.tot}"></div>
                                    </div>
                                  </c:forEach>
                                </div>
                            </div>

                 

                        </div>

                        <div class="col-lg-6 mb-4">

                            <!-- Illustrations -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">10월 프로젝트 현황</h6>
                                </div>
                                <div class="card-body">
                              
                                <!-- Card Header - Dropdown -->
                                
                               
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="myBarChart" height='200'></canvas>
                                    </div>
                                   
                                </div>
                            </div>                     
                       </div>
                            </div>
       
                           <div class="row">

                        <!-- First Column -->
                        <div >

                            <!-- Custom Text Color Utilities -->
                            <div class="card shadow mb-6">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">초과된 프로젝트</h6>
                                </div>
                                <div class="card-body">
                                
                         <table class ="table-bordered dataTable">
                  <tr><th>프로젝트번호</th><th>프로젝트명</th><th>종료일</th><th>상태</th></tr>
                  <c:forEach var="pro" items="${projectlist}">
                  <tr><td>${pro.pro_no}</td><td>${pro.pro_name}</td><td> 
                  <fmt:formatDate value="${pro.pro_enddte}"/></td><td>지연</td></tr>
                  </c:forEach>
                  </table>
                                </div>
                            </div>      
                        </div>

                        <!-- Second Column -->
                        <div class="col-lg-8">

                            <!-- Background Gradient Utilities -->
                            <div class="card shadow mb-14">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">최근리스크
                                    </h6>
                                </div>
                                <div class="card-body">
                        <table class ="table-bordered dataTable" width='100%'>
                  <tr><th>실시간이슈</th><th>프로젝트</th><th>날짜</th><th>상태</th></tr>
                  <c:forEach var ="risktab" items="${risktab}">
                  <tr><td>${risktab.risk_name}</td><td>${risktab.risk_no}</td><td><fmt:formatDate value="${risktab.risk_regdte}"/></td><td>${risktab.risk_state}</td></tr>
                  </c:forEach>
                  </table>
                                </div>
                            </div>
                            <c:forEach var="riskst" items="${riskst}">
                            <input id = "complete" type="hidden" ${riskst.complete}/>
                            <input id = "fixing" type="hidden" ${riskst.fixing}/>
                            <input id = "holding"  type="hidden" ${riskst.holding}/>
                            <input id = "opening"  type="hidden" ${riskst.opening}/>
                            </c:forEach>

                        </div>

                        <!-- Third Column -->
                        <div class="col-lg-4">

                            <!-- Grayscale Utilities -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">리스크현황
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <input type ="hidden" value ="${graph_complete.graph_complete}" id="graph_complete">
                         <input type ="hidden" value ="${graph_delay.graph_delay}" id="graph_delay">
                         <input type ="hidden" value ="${graph_graphgoing.graph_graphgoing}" id="graph_graphgoing">
                         <input type ="hidden" value ="${graph_ready.graph_ready}" id="graph_ready">
                    </div>              
                        </div>
                    </div>

                </div>
       
 </div>
			<!-- End of Main Content -->	
            <!-- Footer -->
            <jsp:include page="/common/footer.jsp"/>
 </div>
	<!-- End of Content Wrapper -->
      
</div>
<!-- End of Page Wrapper -->
    <script src="${path}/resources/vendor/chart.js/Chart.min.js"></script>
<script src="${path}/resources/js/demo/chart-bar-demo.js"></script>
     
    <script type="text/javascript">
      
      var ctx = document.getElementById("myBarChart");
      var datas = [];
      var myBarChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ["시작전", "진행중", "미완료", "완료"],
          datasets: [{
            label: "Revenue",
            backgroundColor: "#4e73df",
            hoverBackgroundColor: "#2e59d9",
            borderColor: "#4e73df",
            
            data:[${graph_delay.graph_delay},${graph_complete.graph_complete},${graph_ready.graph_ready},${graph_graphgoing.graph_graphgoing}],
            
          }],
        },
        options: {
          maintainAspectRatio: false,
          layout: {
            padding: {
              left: 10,
              right: 25,
              top: 25,
              bottom: 0
            }
          },
          scales: {
            xAxes: [{
              time: {
                unit: 'month'
              },
              gridLines: {
                display: false,
                drawBorder: false
              },
              ticks: {
                maxTicksLimit: 6
              },
              maxBarThickness: 25,
            }],
            yAxes: [{
              ticks: {
                min: 0,
                max: 30,
                maxTicksLimit: 5,
                padding: 10,
                // Include a dollar sign in the ticks
                callback: function(value, index, values) {
                  return number_format(value);
                }
              },
              gridLines: {
                color: "rgb(234, 236, 244)",
                zeroLineColor: "rgb(234, 236, 244)",
                drawBorder: false,
                borderDash: [2],
                zeroLineBorderDash: [2]
              }
            }],
          },
          legend: {
            display: false
          },
          tooltips: {
            titleMarginBottom: 10,
            titleFontColor: '#6e707e',
            titleFontSize: 14,
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 1,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
            callbacks: {
              label: function(tooltipItem, chart) {
                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
              }
            }
          },
        }
   
      });

</script>
<script type="text/javascript">
//Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var fixing = document.getElementById("fixing");
var opening = document.getElementById("opening");
var holding = document.getElementById("holding");
var complete = document.getElementById("complete");
var ctx = document.getElementById("myPieChart");
var datas = []; 
//<c:forEach items = "${riskst}" var = "riskst">
//datas.push(${riskst});
//</c:forEach>
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["조치중", "조치완료", "홀드","오픈"],
    datasets: [{
       <c:forEach items = "${riskst}" var = "riskst">
       data: [${riskst.fixing},${riskst.opening},${riskst.complete},${riskst.holding}],
       </c:forEach>
     // data: [fixing, opening, 15,16],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

</script>  

</body>
</html>