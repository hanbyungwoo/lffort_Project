<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="Search...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div> <!-- /input-group -->
					</li>
					
					<li><a href="<%=request.getContextPath()%>/jsp/main.jsp"><i class="fa fa-dashboard fa-fw"></i>
							Lffort main<span class="fa arrow"></span></a></li>
					<li><a href="<%=request.getContextPath()%>/jsp/flot.jsp"><i class="fa fa-bar-chart-o fa-fw"></i>
							Chart<span class="fa arrow"></span></a>
					<li><a href="<%=request.getContextPath()%>/DetailWork?page=1&usrid=${sessionScope.usrId}"><i class="fa fa-table fa-fw"></i>
							My work<span class="fa arrow"></span></a></li>
					<li><a href="<%=request.getContextPath()%>/jsp/RegisterSchedule.jsp"><i
							class="fa fa-edit fa-fw"></i> Register Todo<span class="fa arrow"></span></a></li>
					<li><a href="#"><i class="fa fa-wrench fa-fw"></i>
							Share Todo <span class="fa arrow"></span></a>
					<li><a href="<%=request.getContextPath()%>/jsp/FAQ.jsp"><i class="fa fa-sitemap fa-fw"></i>
							FAQ<span class="fa arrow"></span></a>
					<li><a href="#"><i class="fa fa-files-o fa-fw"></i> Sample
							Pages<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="blank.html">Blank Page</a></li>
							<li><a href="login.html">Login Page</a></li>
						</ul> <!-- /.nav-second-level --></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>