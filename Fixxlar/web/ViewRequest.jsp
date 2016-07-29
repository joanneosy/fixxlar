<%-- 
    Document   : View Request
    Created on : May 5, 2016, 10:00:14 AM
    Author     : joanne.ong.2014
--%>

<%@page import="entity.Offer"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entity.Vehicle"%>
<%@page import="entity.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="dao.VehicleDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="entity.QuotationRequest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.WebUserDAO"%>
<%@page import="dao.QuotationRequestDAO"%>
<%@page import="entity.WebUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ProtectWorkshop.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hello workshop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8" />

        <link rel="icon" type="image/ico" href="images/favicon.ico" />
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/animate.css">
        <link type="text/css" rel="stylesheet" media="all" href="css/jquery.mmenu.all.css" />
        <link rel="stylesheet" href="css/jquery.videobackground.css">
        <link rel="stylesheet" href="css/bootstrap-checkbox.css">

        <link href="css/minimal.css" rel="stylesheet">
        <link rel="stylesheet" href="css/custom.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

    </head>
    <body class="bg-3">
        <!--<h1>Welcome</h1>-->
        <%            String successChangePasswordMsg = (String) request.getAttribute("successChangePasswordMsg");
            if (successChangePasswordMsg != null) {
                out.println(successChangePasswordMsg + "<br/><br/>");
            }

        %>

        <!-- Preloader -->
        <div class="mask"><div id="loader"></div></div>
        <!--/Preloader -->

        <!-- Wrap all page content here -->
        <div id="wrap">
            <!-- Make page fluid -->
            <div class="row">

                <!-- Top and side nav bar -->
                <jsp:include page="include/topbar.jsp"/>
                <!-- Top and side nav bar -->





                <!-- Page content -->
                <div id="content" class="col-md-12">









                    <!-- page header -->
                    <div class="pageheader">


                        <h2><i class="fa fa-file-o" style="line-height: 48px;padding-left: 2px;"></i> View Request</h2>


                        <!--                        <div class="breadcrumbs">
                                                    <ol class="breadcrumb">
                                                        <li>You are here</li>
                                                        <li><a href="index.html">Minimal</a></li>
                                                        <li><a href="#">Example Pages</a></li>
                                                        <li class="active">Blank Page</li>
                                                    </ol>
                                                </div>-->


                    </div>
                    <!-- /page header -->






                    <!-- content main container -->
                    <div class="main">




                        <!-- row -->
                        <div class="row">

                            <!-- col 12 -->
                            <div class="col-md-12">
                                <!-- tile -->
                                <section class="tile color transparent-white">



                                    <!-- tile header -->
                                    <div class="tile-header">
                                        <h1><strong>View Request</strong></h1>
                                        <!--                                        <div class="search">
                                                                                    <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filter">
                                                                                </div>-->
                                        <div class="controls">
                                            <a href="#" class="minimize"><i class="fa fa-chevron-down"></i></a>
                                            <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                                            <a href="#" class="remove"><i class="fa fa-times"></i></a>
                                        </div>
                                    </div>
                                    <!-- /tile header -->

                                    <!-- tile widget -->
                                    <div class="tile-widget bg-transparent-white-2">
                                        <div class="row">

                                            <div class="col-sm-2 col-xs-6">
                                                <div class="search" id="requestSearch">
                                                    <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filter">
                                                </div>
                                                <!--                                                <div class="input-group table-options">
                                                                                                    <select class="chosen-select form-control">
                                                                                                        <option>Bulk Action</option>
                                                                                                        <option>Delete Selected</option>
                                                                                                        <option>Copy Selected</option>
                                                                                                        <option>Archive Selected</option>
                                                                                                    </select>
                                                                                                    <span class="input-group-btn">
                                                                                                        <button class="btn btn-default" type="button">Apply</button>
                                                                                                    </span>
                                                                                                </div>-->
                                            </div>

                                            <div class="col-sm-10 col-xs-6 text-right">

                                                <!--                                                <div class="btn-group btn-group-xs table-options">
                                                                                                    <button type="button active" class="btn btn-default" href="#New">New</button>
                                                                                                    <button type="button" class="btn btn-default" href="#Ongoing">Ongoing</button>
                                                                                                    <button type="button" class="btn btn-default" href="#Completed">Completed</button>
                                                                                                    <button type="button" class="btn btn-default" href="#All">All</button>
                                                                                                </div>-->


                                                <div class="btn-group btn-group-xs table-options desktopOnly">
                                                    <ul class="nav nav-pills">
                                                        <li class="active"><a href="#New" data-toggle="pill">New Request</a></li>
                                                        <li><a href="#Waiting_for_Response" data-toggle="pill">Waiting for Response</a></li>
                                                        <li><a href="#Send_Final_Quote" data-toggle="pill">Send Final Quote</a></li>
                                                        <li><a href="#Awaiting_Final_Confirmation" data-toggle="pill">Awaiting Final Confirmation</a></li>
                                                        <li><a href="#Final_Quote_Accepted" data-toggle="pill">Final Quote Accepted</a></li>
                                                        <!--<li><a href="#All" data-toggle="pill">All</a></li>-->
                                                    </ul>
                                                </div>
                                                <div class="btn-group mobileOnly" style="float:right">
                                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id='select'>
                                                        Select <span class="caret"></span>
                                                    </button>

                                                    <ul class="dropdown-menu" id="requestDropdown" role="menu" >
                                                        <li class="active"><a href="#New" data-toggle="pill">New Request</a></li>
                                                        <li><a href="#Waiting_for_Response" data-toggle="pill">Waiting for Response</a></li>
                                                        <li><a href="#Send_Final_Quote" data-toggle="pill">Send Final Quote</a></li>
                                                        <li><a href="#Awaiting_Final_Confirmation" data-toggle="pill">Awaiting Final Confirmation</a></li>
                                                        <li><a href="#Final_Quote_Accepted" data-toggle="pill">Final Quote Accepted</a></li>
                                                        <!--<li><a href="#All" data-toggle="pill">All</a></li>-->
                                                    </ul>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <!-- /tile widget -->


                                    <!-- tile body -->
                                    <div class="tile-body no-vpadding">
                                        <div class="tab-content">
                                            <%                                                int i = 1;
                                                QuotationRequestDAO qDAO = new QuotationRequestDAO();
                                                HashMap<Integer, QuotationRequest> qList = qDAO.retrieveAllQuotationRequests(user.getStaffId(), user.getToken(), 0, 1, "requested_datetime", "desc");


                                            %>



                                            <div class="tab-pane fade active in" id="New" >
                                                <div class="table-responsive">
                                                    <table class="table table-custom1 table-sortable1 tablesorter order-table " id="myTable1">
                                                        <thead>
                                                            <tr>
                                                                <th class="sortable">ID</th>
                                                                <th class="sortable">DateTime</th>
                                                                <th class="sortable">Name</th>
                                                                <th class="sortable">No. Plate</th>
                                                                <th class="sortable">Services</th>
                                                                <th class="sortable">Email</th>
                                                                <th class="sortable">Phone</th>
                                                                <th>Attachment</th>
                                                                <th>Quote</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <!--Loop per new request-->
                                                            <%                                                                Iterator it = qList.entrySet().iterator();
                                                                while (it.hasNext()) {
                                                                    Map.Entry pair = (Map.Entry) it.next();
                                                                    QuotationRequest qr = (QuotationRequest) pair.getValue();
                                                                    int id = qr.getId();
                                                                    Timestamp timeStamp = qr.getRequestedDate();
                                                                    String dateTime = "01-01-1990 00:00:00";
                                                                    if (timeStamp != null) {
                                                                        dateTime = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(timeStamp);
                                                                    }
                                                                    String serviceName = qr.getName();

                                                                    String address = qr.getAddress();
                                                                    String serviceAmenities = qr.getAmenities();
                                                                    String serviceDescription = qr.getDescription();
                                                                    String serviceDetails = qr.getDetails();
                                                                    int serviceId = qr.getId();
                                                                    String serviceMileage = qr.getMileage();
                                                                    String carPhoto = qr.getPhotos();
                                                                    int serviceStatus = qr.getOffer().getStatus();
                                                                    String serviceUrgency = qr.getUrgency();

                                                                    Customer cust = qr.getCustomer();
                                                                    String custName = cust.getName();
                                                                    String custEmail = cust.getEmail();
                                                                    String custPhone = cust.getHandphone();

                                                                    Vehicle vehicle = qr.getVehicle();
                                                                    String carPlate = vehicle.getPlateNumber();
                                                                    String carModel = vehicle.getModel();
                                                                    String carMake = vehicle.getMake();
                                                                    int carYear = vehicle.getYear();
                                                                    String carColor = vehicle.getColour();
                                                                    String carControl = vehicle.getControl();


                                                            %>
                                                            <tr>
                                                                <td><% out.print(serviceId);%></td>
                                                                <td><% out.print(dateTime);%></td>
                                                                <td><% out.print(custName);%></td>
                                                                <td><% out.print(carPlate);%></td>
                                                                <td><% out.print(serviceName);%></td>
                                                                <td><% out.print(custEmail);%></td>
                                                                <td><% out.print(custPhone);%></td>
                                                                <!--Picture Attachment-->
                                                                <td class="text-center"><a href="<% out.print("#myModal" + i);%>" id="myBtn" data-toggle="modal"><img src="images/file.png"/></a></td>

                                                                <!-- Modal -->
                                                        <div class="modal fade" id="<% out.print("myModal" + i);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog-img">
                                                                <div class="modal-content">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                    <div class="modal-header">
                                                                        <h4 class="modal-title"><% out.print(carMake + " " + carModel + " - " + carYear);%></h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <img class="img-responsive"src="<%="http://119.81.43.85/uploads/" + carPhoto%>"/>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                                                    </div>
                                                                </div> <!--/.modal-content--> 
                                                            </div><!-- /.modal-dialog -->
                                                        </div><!-- /.modal -->
                                                        <% i++; %>
                                                        <!--Quote-->
                                                        <td class="text-center"><button href="<% out.print("#myModal" + i);%>" class="btn btn-default btn-xs" data-toggle="modal" id="quoteBtn" type="button"><span>Quote</span></button></td>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="<% out.print("myModal" + i);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                        <h4 class="modal-title">New Request - <% out.print(custName);%></h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div class="text-center">
                                                                            <img class="img-thumbnail-small"src="<%="http://119.81.43.85/uploads/" + carPhoto%>"/>
                                                                        </div>
                                                                        <div class="line-across"></div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Name: </b><% out.print(custName);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Date & Time: </b><% out.print(dateTime);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Email: </b><% out.print(custEmail);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Contact No: </b><% out.print(custPhone);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Vehicle Model: </b><% out.print(carMake + " " + carModel);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Vehicle Year: </b><% out.print(carYear);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>License Plate: </b><% out.print(carPlate);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Vehicle Color: </b><% out.print(carColor);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Vehicle Type: </b><% out.print(carControl);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Mileage: </b><% out.print(serviceMileage);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Service Request: </b><% out.print(serviceName);%></p>
                                                                        </div>

                                                                        <div class="col-xs-6">
                                                                            <p><b>Urgency: </b><% out.print(serviceUrgency);%></p>
                                                                        </div>

                                                                        <div>
                                                                            <p><b>Service Description: </b><% out.print(serviceDescription);%></p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <div>
                                                                            <div class="text-left border-bottom">
                                                                                <button class="accordion"><b>Quotation Amount</b></button>
                                                                                <div class="panel">
                                                                                    <form action="AddInitialQuotation" method="post">
                                                                                        <div>
                                                                                            Min Price: $ <input type="number" name="minPrice" required/>
                                                                                            Max Price: $ <input type="number" name="maxPrice" required/>
                                                                                        </div>
                                                                                        <div>
                                                                                            Description: <input type="text" name="description" />
                                                                                        </div>

                                                                                        <input type="hidden" name="id" value="<%=id%>">
                                                                                        <button type="submit" class="btn btn-primary">Submit Quote</button>
                                                                                    </form>
                                                                                </div>
                                                                                
                                                                                        <button class="accordion"><b>Diagnostic Price</b></button>
                                                                                <div class="panel">
                                                                                    <form action = "AddDiagnosticPrice" method= "post">
                                                                                        <div>Price: <input type="number" name="price" required/></div>
                                                                                        <div>Description: <input type="text" name="description" /></div>
                                                                                        <input type="hidden" name="id" value="<%=id%>">
                                                                                        <button type="submit" class="btn btn-primary">Add Diagnostic Price</button>
                                                                                    </form>
                                                                                </div>


                                                                            </div>
                                                                        </div>
                                                                        <!--                                                                        <form name="quote" action="quote">
                                                                                                                                                    Quotation Amount: <input type="text"/>
                                                                                                                                                    <button type="submit" class="btn btn-primary">Submit Quote</button>
                                                                                                                                                </form>-->
                                                                        <div>
                                                                            <button type="button" class="btn btn-default">Chat</button>
                                                                        </div>
                                                                        <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.modal-content -->
                                                        </div><!-- /.modal-dialog -->
                                                </div><!-- /.modal -->
                                                </tr>

                                                <%
                                                        i++;
                                                    }
                                                %>

                                                </tbody>

                                                </table>
                                            </div>
                                        </div><!--New-->



                                        <div class="tab-pane fade" id="Waiting_for_Response" >
                                            <div class="table-responsive">
                                                <table class="table table-custom1 table-sortable1 tablesorter order-table " id="myTable2">
                                                    <thead>
                                                        <tr>
                                                            <th class="sortable">ID</th>
                                                            <th class="sortable">DateTime</th>
                                                            <th class="sortable">Name</th>
                                                            <th class="sortable">No. Plate</th>
                                                            <th class="sortable">Services</th>
                                                            <th class="sortable">Email</th>
                                                            <th class="sortable">Phone</th>
                                                            <th>Attachment</th>
                                                            <th>Quote</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <!--Loop per new request-->
                                                        <%
                                                            qList = qDAO.retrieveAllQuotationRequests(user.getStaffId(), user.getToken(), 0, 2, "requested_datetime", "desc");
                                                            it = qList.entrySet().iterator();
                                                            while (it.hasNext()) {
                                                                Map.Entry pair = (Map.Entry) it.next();
                                                                QuotationRequest qr = (QuotationRequest) pair.getValue();
                                                                int id = qr.getId();
                                                                Timestamp timeStamp = qr.getRequestedDate();
                                                                String dateTime = "01-01-1990 00:00:00";
                                                                if (timeStamp != null) {
                                                                    dateTime = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(timeStamp);
                                                                }
                                                                String serviceName = qr.getName();
                                                                String address = qr.getAddress();
                                                                String serviceAmenities = qr.getAmenities();
                                                                String serviceDescription = qr.getDescription();
                                                                String serviceDetails = qr.getDetails();
                                                                int serviceId = qr.getId();
                                                                String serviceMileage = qr.getMileage();
                                                                String carPhoto = qr.getPhotos();
                                                                int serviceStatus = qr.getOffer().getStatus();
                                                                String serviceUrgency = qr.getUrgency();

                                                                Customer cust = qr.getCustomer();
                                                                String custName = cust.getName();
                                                                String custEmail = cust.getEmail();
                                                                String custPhone = cust.getHandphone();

                                                                Vehicle vehicle = qr.getVehicle();
                                                                String carPlate = vehicle.getPlateNumber();
                                                                String carModel = vehicle.getModel();
                                                                String carMake = vehicle.getMake();
                                                                int carYear = vehicle.getYear();
                                                                String carColor = vehicle.getColour();
                                                                String carControl = vehicle.getControl();

                                                                Offer offer = qr.getOffer();
                                                                double min = offer.getInitialMinPrice();
                                                                double max = offer.getInitialMaxPrice();

                                                        %>
                                                        <tr>
                                                            <td><% out.print(serviceId);%></td>
                                                            <td><% out.print(dateTime);%></td>
                                                            <td><% out.print(custName);%></td>
                                                            <td><% out.print(carPlate);%></td>
                                                            <td><% out.print(serviceName);%></td>
                                                            <td><% out.print(custEmail);%></td>
                                                            <td><% out.print(custPhone);%></td>
                                                            <!--Picture Attachment-->
                                                            <td class="text-center"><a href="<% out.print("#myModal" + i);%>" id="myBtn" data-toggle="modal"><img src="images/file.png"/></a></td>

                                                            <!-- Modal -->
                                                    <div class="modal fade" id="<% out.print("myModal" + i);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog-img">
                                                            <div class="modal-content">
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title"><% out.print(carMake + " " + carModel + " - " + carYear);%></h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <img class="img-responsive"src="<%="http://119.81.43.85/uploads/" + carPhoto%>"/>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                                                </div>
                                                            </div> <!--/.modal-content--> 
                                                        </div><!-- /.modal-dialog -->
                                                    </div><!-- /.modal -->
                                                    <% i++; %>
                                                    <!--Quote-->
                                                    <td class="text-center"><button href="<% out.print("#myModal" + i);%>" class="btn btn-default btn-xs" data-toggle="modal" id="quoteBtn" type="button"><span>More Info</span></button></td>

                                                    <!-- Modal -->
                                                    <div class="modal fade" id="<% out.print("myModal" + i);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                    <h4 class="modal-title">New Request - <% out.print(custName);%></h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="text-center">
                                                                        <img class="img-thumbnail-small"src="<%="http://119.81.43.85/uploads/" + carPhoto%>"/>
                                                                    </div>
                                                                    <div class="line-across"></div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Name: </b><% out.print(custName);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Date & Time: </b><% out.print(dateTime);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Email: </b><% out.print(custEmail);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Contact No: </b><% out.print(custPhone);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Vehicle Model: </b><% out.print(carMake + " " + carModel);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Vehicle Year: </b><% out.print(carYear);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>License Plate: </b><% out.print(carPlate);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Vehicle Color: </b><% out.print(carColor);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Vehicle Type: </b><% out.print(carControl);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Mileage: </b><% out.print(serviceMileage);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Service Request: </b><% out.print(serviceName);%></p>
                                                                    </div>

                                                                    <div class="col-xs-6">
                                                                        <p><b>Urgency: </b><% out.print(serviceUrgency);%></p>
                                                                    </div>

                                                                    <div>
                                                                        <p><b>Service Description: </b><% out.print(serviceDescription);%></p>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <div class="text-left">Quoted Amount: $<%=min%> - $<%=max%></div>
                                                                    <div>
                                                                        <button type="button" class="btn btn-default">Chat</button>
                                                                    </div>
                                                                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                                                </div>
                                                            </div>
                                                        </div><!-- /.modal-content -->
                                                    </div><!-- /.modal-dialog -->
                                            </div><!-- /.modal -->
                                            </tr>

                                            <%
                                                    i++;
                                                }
                                            %>

                                            </tbody>

                                            </table>
                                        </div>
                                    </div><!--Waiting_for_Response-->

                                    <div class="tab-pane fade" id="Send_Final_Quote" >
                                        <div class="table-responsive">
                                            <table class="table table-custom1 table-sortable1 tablesorter order-table " id="myTable3">
                                                <thead>
                                                    <tr>
                                                        <th class="sortable">ID</th>
                                                        <th class="sortable">DateTime</th>
                                                        <th class="sortable">Name</th>
                                                        <th class="sortable">No. Plate</th>
                                                        <th class="sortable">Services</th>
                                                        <th class="sortable">Email</th>
                                                        <th class="sortable">Phone</th>
                                                        <th>Attachment</th>
                                                        <th>Quote</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!--Loop per new request-->
                                                    <%
                                                        qList = qDAO.retrieveAllQuotationRequests(user.getStaffId(), user.getToken(), 0, 3, "requested_datetime", "desc");
                                                        it = qList.entrySet().iterator();

                                                        while (it.hasNext()) {
                                                            Map.Entry pair = (Map.Entry) it.next();
                                                            QuotationRequest qr = (QuotationRequest) pair.getValue();
                                                            int id = qr.getId();
                                                            Timestamp timeStamp = qr.getRequestedDate();
                                                            String dateTime = "01-01-1990 00:00:00";
                                                            if (timeStamp != null) {
                                                                dateTime = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(timeStamp);
                                                            }
                                                            String serviceName = qr.getName();
                                                            String address = qr.getAddress();
                                                            String serviceAmenities = qr.getAmenities();
                                                            String serviceDescription = qr.getDescription();
                                                            String serviceDetails = qr.getDetails();
                                                            int serviceId = qr.getId();
                                                            String serviceMileage = qr.getMileage();
                                                            String carPhoto = qr.getPhotos();
                                                            int serviceStatus = qr.getOffer().getStatus();
                                                            String serviceUrgency = qr.getUrgency();

                                                            Customer cust = qr.getCustomer();
                                                            String custName = cust.getName();
                                                            String custEmail = cust.getEmail();
                                                            String custPhone = cust.getHandphone();

                                                            Vehicle vehicle = qr.getVehicle();
                                                            String carPlate = vehicle.getPlateNumber();
                                                            String carModel = vehicle.getModel();
                                                            String carMake = vehicle.getMake();
                                                            int carYear = vehicle.getYear();
                                                            String carColor = vehicle.getColour();
                                                            String carControl = vehicle.getControl();

                                                            Offer offer = qr.getOffer();
                                                            double min = offer.getInitialMinPrice();
                                                            double max = offer.getInitialMaxPrice();


                                                    %>
                                                    <tr>
                                                        <td><% out.print(serviceId);%></td>
                                                        <td><% out.print(dateTime);%></td>
                                                        <td><% out.print(custName);%></td>
                                                        <td><% out.print(carPlate);%></td>
                                                        <td><% out.print(serviceName);%></td>
                                                        <td><% out.print(custEmail);%></td>
                                                        <td><% out.print(custPhone);%></td>
                                                        <!--Picture Attachment-->
                                                        <td class="text-center"><a href="<% out.print("#myModal" + i);%>" id="myBtn" data-toggle="modal"><img src="images/file.png"/></a></td>

                                                        <!-- Modal -->
                                                <div class="modal fade" id="<% out.print("myModal" + i);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog-img">
                                                        <div class="modal-content">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                            <div class="modal-header">
                                                                <h4 class="modal-title"><% out.print(carMake + " " + carModel + " - " + carYear);%></h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <img class="img-responsive"src="<%="http://119.81.43.85/uploads/" + carPhoto%>"/>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                                            </div>
                                                        </div> <!--/.modal-content--> 
                                                    </div><!-- /.modal-dialog -->
                                                </div><!-- /.modal -->
                                                <% i++; %>
                                                <!--Quote-->
                                                <td class="text-center"><button href="<% out.print("#myModal" + i);%>" class="btn btn-default btn-xs" data-toggle="modal" id="quoteBtn" type="button"><span>Quote</span></button></td>

                                                <!-- Modal -->
                                                <div class="modal fade" id="<% out.print("myModal" + i);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                                <h4 class="modal-title">New Request - <% out.print(custName);%></h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="text-center">
                                                                    <img class="img-thumbnail-small"src="<%="http://119.81.43.85/uploads/" + carPhoto%>"/>
                                                                </div>
                                                                <div class="line-across"></div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Name: </b><% out.print(custName);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Date & Time: </b><% out.print(dateTime);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Email: </b><% out.print(custEmail);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Contact No: </b><% out.print(custPhone);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Vehicle Model: </b><% out.print(carMake + " " + carModel);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Vehicle Year: </b><% out.print(carYear);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>License Plate: </b><% out.print(carPlate);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Vehicle Color: </b><% out.print(carColor);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Vehicle Type: </b><% out.print(carControl);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Mileage: </b><% out.print(serviceMileage);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Service Request: </b><% out.print(serviceName);%></p>
                                                                </div>

                                                                <div class="col-xs-6">
                                                                    <p><b>Urgency: </b><% out.print(serviceUrgency);%></p>
                                                                </div>

                                                                <div>
                                                                    <p><b>Service Description: </b><% out.print(serviceDescription);%></p>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">

                                                                <div class="text-left border-bottom">
                                                                    <b>Final Quotation Amount</b>

                                                                    <form action="AddFinalQuotation" method="post">
                                                                        <div>
                                                                            Final Price: $ <input type="number" name="price" placeholder="<%=min%> - <%=max%>" required/>
                                                                        </div>
                                                                        <div>
                                                                            Description: <input type="text" name="description" />
                                                                        </div>

                                                                        <input type="hidden" name="id" value="<%=id%>">
                                                                        <button type="submit" class="btn btn-primary">Submit Quote</button>
                                                                    </form>
                                                                </div>
                                                                <div>
                                                                    <button type="button" class="btn btn-default">Chat</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--                                                                        <form name="quote" action="quote">
                                                                                                                                    Quotation Amount: <input type="text"/>
                                                                                                                                    <button type="submit" class="btn btn-primary">Submit Quote</button>
                                                                                                                                </form>-->

                                                        <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                                    </div>
                                                </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->
                            </tr>

                            <%
                                    i++;
                                }
                            %>

                            </tbody>

                            </table>
                        </div>
                    </div><!--Send Final Quote-->

                    <div class="tab-pane fade" id="Awaiting_Final_Confirmation" >
                        <div class="table-responsive">
                            <table class="table table-custom1 table-sortable1 tablesorter order-table " id="myTable4">
                                <thead>
                                    <tr>
                                        <th class="sortable">ID</th>
                                        <th class="sortable">DateTime</th>
                                        <th class="sortable">Name</th>
                                        <th class="sortable">No. Plate</th>
                                        <th class="sortable">Services</th>
                                        <th class="sortable">Email</th>
                                        <th class="sortable">Phone</th>
                                        <th>Attachment</th>
                                        <th>Quote</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!--Loop per new request-->
                                    <%
                                        qList = qDAO.retrieveAllQuotationRequests(user.getStaffId(), user.getToken(), 0, 3, "requested_datetime", "desc");
                                        it = qList.entrySet().iterator();

                                        while (it.hasNext()) {
                                            Map.Entry pair = (Map.Entry) it.next();
                                            QuotationRequest qr = (QuotationRequest) pair.getValue();
                                            int id = qr.getId();
                                            Timestamp timeStamp = qr.getRequestedDate();
                                            String dateTime = "01-01-1990 00:00:00";
                                            if (timeStamp != null) {
                                                dateTime = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(timeStamp);
                                            }
                                            String serviceName = qr.getName();
                                            String address = qr.getAddress();
                                            String serviceAmenities = qr.getAmenities();
                                            String serviceDescription = qr.getDescription();
                                            String serviceDetails = qr.getDetails();
                                            int serviceId = qr.getId();
                                            String serviceMileage = qr.getMileage();
                                            String carPhoto = qr.getPhotos();
                                            int serviceStatus = qr.getOffer().getStatus();
                                            String serviceUrgency = qr.getUrgency();

                                            Customer cust = qr.getCustomer();
                                            String custName = cust.getName();
                                            String custEmail = cust.getEmail();
                                            String custPhone = cust.getHandphone();

                                            Vehicle vehicle = qr.getVehicle();
                                            String carPlate = vehicle.getPlateNumber();
                                            String carModel = vehicle.getModel();
                                            String carMake = vehicle.getMake();
                                            int carYear = vehicle.getYear();
                                            String carColor = vehicle.getColour();
                                            String carControl = vehicle.getControl();

                                            Offer offer = qr.getOffer();
                                            double finalPrice = offer.getFinalPrice();
                                    %>
                                    <tr>
                                        <td><% out.print(serviceId);%></td>
                                        <td><% out.print(dateTime);%></td>
                                        <td><% out.print(custName);%></td>
                                        <td><% out.print(carPlate);%></td>
                                        <td><% out.print(serviceName);%></td>
                                        <td><% out.print(custEmail);%></td>
                                        <td><% out.print(custPhone);%></td>
                                        <!--Picture Attachment-->
                                        <td class="text-center"><a href="<% out.print("#myModal" + i);%>" id="myBtn" data-toggle="modal"><img src="images/file.png"/></a></td>

                                        <!-- Modal -->
                                <div class="modal fade" id="<% out.print("myModal" + i);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog-img">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                            <div class="modal-header">
                                                <h4 class="modal-title"><% out.print(carMake + " " + carModel + " - " + carYear);%></h4>
                                            </div>
                                            <div class="modal-body">
                                                <img class="img-responsive"src="<%="http://119.81.43.85/uploads/" + carPhoto%>"/>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                            </div>
                                        </div> <!--/.modal-content--> 
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                                <% i++; %>
                                <!--Quote-->
                                <td class="text-center"><button href="<% out.print("#myModal" + i);%>" class="btn btn-default btn-xs" data-toggle="modal" id="quoteBtn" type="button"><span>More Info</span></button></td>

                                <!-- Modal -->
                                <div class="modal fade" id="<% out.print("myModal" + i);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                <h4 class="modal-title">New Request - <% out.print(custName);%></h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="text-center">
                                                    <img class="img-thumbnail-small"src="<%="http://119.81.43.85/uploads/" + carPhoto%>"/>
                                                </div>
                                                <div class="line-across"></div>

                                                <div class="col-xs-6">
                                                    <p><b>Name: </b><% out.print(custName);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>Date & Time: </b><% out.print(dateTime);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>Email: </b><% out.print(custEmail);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>Contact No: </b><% out.print(custPhone);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>Vehicle Model: </b><% out.print(carMake + " " + carModel);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>Vehicle Year: </b><% out.print(carYear);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>License Plate: </b><% out.print(carPlate);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>Vehicle Color: </b><% out.print(carColor);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>Vehicle Type: </b><% out.print(carControl);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>Mileage: </b><% out.print(serviceMileage);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>Service Request: </b><% out.print(serviceName);%></p>
                                                </div>

                                                <div class="col-xs-6">
                                                    <p><b>Urgency: </b><% out.print(serviceUrgency);%></p>
                                                </div>

                                                <div>
                                                    <p><b>Service Description: </b><% out.print(serviceDescription);%></p>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div>
                                                    <div class="quotation text-left">
                                                        Agreed Amount: $<%=finalPrice%>
                                                    </div>
                                                </div>
                                                <div>
                                                    <button type="button" class="btn btn-default">Chat</button>
                                                </div>
                                                <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                            </div>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                        </tr>

                        <%
                                i++;
                            }
                        %>

                        </tbody>

                        </table>
                    </div>
                </div><!--Awaiting Final Confirmation-->

                <div class="tab-pane fade" id="Final_Quote_Accepted" >
                    <div class="table-responsive">
                        <table class="table table-custom1 table-sortable1 tablesorter order-table " id="myTable5">
                            <thead>
                                <tr>
                                    <th class="sortable">ID</th>
                                    <th class="sortable">DateTime</th>
                                    <th class="sortable">Name</th>
                                    <th class="sortable">No. Plate</th>
                                    <th class="sortable">Services</th>
                                    <th class="sortable">Email</th>
                                    <th class="sortable">Phone</th>
                                    <th>Attachment</th>
                                    <th>Quote</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--Loop per new request-->
                                <%
                                    qList = qDAO.retrieveAllQuotationRequests(user.getStaffId(), user.getToken(), 0, 3, "requested_datetime", "desc");
                                    it = qList.entrySet().iterator();

                                    while (it.hasNext()) {
                                        Map.Entry pair = (Map.Entry) it.next();
                                        QuotationRequest qr = (QuotationRequest) pair.getValue();
                                        int id = qr.getId();
                                        Timestamp timeStamp = qr.getRequestedDate();
                                        String dateTime = "01-01-1990 00:00:00";
                                        if (timeStamp != null) {
                                            dateTime = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(timeStamp);
                                        }
                                        String serviceName = qr.getName();
                                        String address = qr.getAddress();
                                        String serviceAmenities = qr.getAmenities();
                                        String serviceDescription = qr.getDescription();
                                        String serviceDetails = qr.getDetails();
                                        int serviceId = qr.getId();
                                        String serviceMileage = qr.getMileage();
                                        String carPhoto = qr.getPhotos();
                                        int serviceStatus = qr.getOffer().getStatus();
                                        String serviceUrgency = qr.getUrgency();

                                        Customer cust = qr.getCustomer();
                                        String custName = cust.getName();
                                        String custEmail = cust.getEmail();
                                        String custPhone = cust.getHandphone();

                                        Vehicle vehicle = qr.getVehicle();
                                        String carPlate = vehicle.getPlateNumber();
                                        String carModel = vehicle.getModel();
                                        String carMake = vehicle.getMake();
                                        int carYear = vehicle.getYear();
                                        String carColor = vehicle.getColour();
                                        String carControl = vehicle.getControl();

                                        Offer offer = qr.getOffer();
                                        double finalPrice = offer.getFinalPrice();
                                %>
                                <tr>
                                    <td><% out.print(serviceId);%></td>
                                    <td><% out.print(dateTime);%></td>
                                    <td><% out.print(custName);%></td>
                                    <td><% out.print(carPlate);%></td>
                                    <td><% out.print(serviceName);%></td>
                                    <td><% out.print(custEmail);%></td>
                                    <td><% out.print(custPhone);%></td>
                                    <!--Picture Attachment-->
                                    <td class="text-center"><a href="<% out.print("#myModal" + i);%>" id="myBtn" data-toggle="modal"><img src="images/file.png"/></a></td>

                                    <!-- Modal -->
                            <div class="modal fade" id="<% out.print("myModal" + i);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog-img">
                                    <div class="modal-content">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                        <div class="modal-header">
                                            <h4 class="modal-title"><% out.print(carMake + " " + carModel + " - " + carYear);%></h4>
                                        </div>
                                        <div class="modal-body">
                                            <img class="img-responsive"src="<%="http://119.81.43.85/uploads/" + carPhoto%>"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div>
                                    </div> <!--/.modal-content--> 
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->
                            <% i++; %>
                            <!--Quote-->
                            <td class="text-center"><button href="<% out.print("#myModal" + i);%>" class="btn btn-default btn-xs" data-toggle="modal" id="quoteBtn" type="button"><span>More Info</span></button></td>

                            <!-- Modal -->
                            <div class="modal fade" id="<% out.print("myModal" + i);%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                            <h4 class="modal-title">New Request - <% out.print(custName);%></h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <img class="img-thumbnail-small"src="<%="http://119.81.43.85/uploads/" + carPhoto%>"/>
                                            </div>
                                            <div class="line-across"></div>

                                            <div class="col-xs-6">
                                                <p><b>Name: </b><% out.print(custName);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>Date & Time: </b><% out.print(dateTime);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>Email: </b><% out.print(custEmail);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>Contact No: </b><% out.print(custPhone);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>Vehicle Model: </b><% out.print(carMake + " " + carModel);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>Vehicle Year: </b><% out.print(carYear);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>License Plate: </b><% out.print(carPlate);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>Vehicle Color: </b><% out.print(carColor);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>Vehicle Type: </b><% out.print(carControl);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>Mileage: </b><% out.print(serviceMileage);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>Service Request: </b><% out.print(serviceName);%></p>
                                            </div>

                                            <div class="col-xs-6">
                                                <p><b>Urgency: </b><% out.print(serviceUrgency);%></p>
                                            </div>

                                            <div>
                                                <p><b>Service Description: </b><% out.print(serviceDescription);%></p>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <div>
                                                <div class="quotation text-left">
                                                    Agreed Amount: $<%=finalPrice%>
                                                </div>
                                            </div>
                                            <div>
                                                <button type="button" class="btn btn-default">Chat</button>
                                            </div>
                                            <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                        </div>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                    </tr>

                    <%
                            i++;
                        }
                    %>

                    </tbody>

                    </table>
                </div>
            </div><!--Final Quotation Accepted-->




        </div>
        <!--tab-content-->


    </div>
    <!-- /tile body -->


    <!-- tile footer -->
    <div class="tile-footer bg-transparent-white-2 rounded-bottom-corners">
        <div class="row">  

            <div class="col-sm-4">
                <!--                                                <div class="input-group table-options">
                                                                    <select class="chosen-select form-control">
                                                                        <option>Bulk Action</option>
                                                                        <option>Delete Selected</option>
                                                                        <option>Copy Selected</option>
                                                                        <option>Archive Selected</option>
                                                                    </select>
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-default" type="button">Apply</button>
                                                                    </span>
                                                                </div>-->
            </div>

            <div class="col-sm-4 text-center">
                <small class="inline table-options paging-info">showing 1-3 of 24 items</small>
            </div>

            <div class="col-sm-4 text-right sm-center">
                <ul class="pagination pagination-xs nomargin pagination-custom">
                    <li class="disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
                </ul>
            </div>

        </div>
    </div>
    <!-- /tile footer -->




</section>
<!-- /tile -->






</div>
<!-- /col 12 -->



</div>
<!-- /row -->






</div>
<!-- /content container -->






</div>
<!-- Page content end -->




<!-- Right slider bar -->
<jsp:include page="include/rightbar.jsp"/>
<!-- Right slider bar -->






</div>
<!-- Make page fluid-->




</div>
<!-- Wrap all page content end -->



<section class="videocontent" id="video"></section>

</body>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-dropdown-multilevel.js"></script>
<script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=css&amp;skin=sons-of-obsidian"></script>
<script type="text/javascript" src="js/jquery.mmenu.min.js"></script>
<script type="text/javascript" src="js/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/jquery.animateNumbers.js"></script>
<script type="text/javascript" src="js/jquery.videobackground.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.js"></script>
<!--<script type="text/javascript" src="js/sorttable.js"></script>-->
<script src="js/minimal.min.js"></script>
<!--<script type="text/javascript" src="js/jquery-latest.js"></script>--> 
<script type="text/javascript" src="js/jquery.tablesorter.js"></script> 

<!--        <script>
            $(function () {

                //check all checkboxes
                $('table thead input[type="checkbox"]').change(function () {
                    $(this).parents('table').find('tbody input[type="checkbox"]').prop('checked', $(this).prop('checked'));
                });

                // sortable table
                $('.table.table-sortable1 th.sortable').click(function () {
                    var o = $(this).hasClass('sort-asc') ? 'sort-desc' : 'sort-asc';
                    $(this).parents('table').find('th.sortable').removeClass('sort-asc').removeClass('sort-desc');
                    $(this).addClass(o);
                });

                //chosen select input
                $(".chosen-select").chosen({disable_search_threshold: 10});

                //check toggling
                $('.check-toggler').on('click', function () {
                    $(this).toggleClass('checked');
                });
            });

        </script>-->
<script>
    //        $(function(){
    //            $('.table.table-sortable1 th.sortable').click(function () {
    //                var o = $(this).hasClass('sort-asc') ? 'sort-desc' : 'sort-asc';
    //                $(this).parents('table').find('th.sortable').removeClass('sort-asc').removeClass('sort-desc');
    //                $(this).addClass(o);
    //            });
    //        });


</script>
<script>
    $(document).ready(function ()
    {
        $("#myTable1").tablesorter();
        $("#myTable2").tablesorter();
        $("#myTable3").tablesorter();
        $("#myTable4").tablesorter();
        $("#myTable5").tablesorter();

    }
    );
</script>
<script>
    //Script to load tab and data based on the href #
    $(window).load(function () {
        var url = document.URL;
        if (url.includes('#')) {
            url = url.substring(url.indexOf('#'));
            console.log(url);
        }
        $('.nav-pills li a').each(function () {
            var link = $(this).attr("href");
            console.log(link);
            if (link === url) {
                $(this).parent().siblings().removeClass('active');
                $(this).parent().addClass('active');
            }
        });
        url = url.substring(1);
        console.log(url);

        $(".tab-pane").each(function () {
            var tab = $(this).attr('id');
            if (tab === url) {
                $(this).siblings().removeClass('active in');
                $(this).addClass('active in');
            }
        });
    });


</script>
<script>
    $('.dropdown-menu li').on('click', function () {
        $(this).siblings().removeClass('active');
        var link = $(this).text();
        document.getElementById("select").innerHTML = link + " <span class='caret'></span>";
    });

</script>
<script>
    (function (document) {
        'use strict';

        var LightTableFilter = (function (Arr) {

            var _input;

            function _onInputEvent(e) {
                _input = e.target;
                var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                Arr.forEach.call(tables, function (table) {
                    Arr.forEach.call(table.tBodies, function (tbody) {
                        Arr.forEach.call(tbody.rows, _filter);
                    });
                });
            }

            function _filter(row) {
                var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
            }

            return {
                init: function () {
                    var inputs = document.getElementsByClassName('light-table-filter');
                    Arr.forEach.call(inputs, function (input) {
                        input.oninput = _onInputEvent;
                    });
                }
            };
        })(Array.prototype);

        document.addEventListener('readystatechange', function () {
            if (document.readyState === 'complete') {
                LightTableFilter.init();
            }
        });

    })(document);
</script>
<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].onclick = function () {
            this.classList.toggle("active");
            this.nextElementSibling.classList.toggle("show");
        }
    }
</script>
<script type="text/javascript">
    var msg = '<%=session.getAttribute("isSuccess")%>';
    if (msg != "null") {
        function alertName() {
            alert(msg);
        }
    <%session.setAttribute("isSuccess", "null");%>
    }
</script> 
<script type="text/javascript"> window.onload = alertName;</script>
</html>
