<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto"><a class="navbar-brand" href="/main">
                <div class="brand-logo"></div>
                <h2 class="brand-text mb-0">Mera</h2>
            </a></li>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <li class="nav-item"><a href="#"><i class="feather icon-layers"></i><span class="menu-title" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-warning badge-pill float-right mr-2">2</span></a>
                <ul class="menu-content">
                    <li <c:if test="${menu eq '/dashboard/googleReport'}">class="active"</c:if>><a href="/dashboard/googleReport"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Google Analytics</span></a>
                    </li>
                    <li <c:if test="${menu eq '/dashboard/meraReport'}">class="active"</c:if>><a href="/dashboard/meraReport"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Mera Report</span></a>
                    </li>
                </ul>
            </li>
            <li class=" navigation-header"><span>Statistic</span></li>
            <li class="nav-item"><a href="#"><i class="feather icon-bar-chart"></i><span class="menu-title" data-i18n="Dashboard">Statistics</span><span class="badge badge badge-warning badge-pill float-right mr-2">3</span></a>
                <ul class="menu-content">
                    <li <c:if test="${menu eq '/testView/list'}">class="active"</c:if>><a href="/testView/list"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">TestView</span></a>
                    </li>
                    <li <c:if test="${menu eq '/statistic/meraPageView'}">class="active"</c:if> ><a href="/statistic/meraPageView"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="eCommerce">PageView</span></a>
                    </li>
                    <li <c:if test="${menu eq '/statistic/meraDau'}">class="active"</c:if>><a href="/statistic/meraDau"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">DAU</span></a>
                    </li>
                </ul>
            </li>
            <li class=" navigation-header"><span>Setting</span></li>
            <li class="nav-item"><a href="#"><i class="feather icon-settings"></i><span class="menu-title" data-i18n="Dashboard">Setting</span></a>
                <ul class="menu-content">
                    <li <c:if test="${menu eq '/env/list'}">class="active"</c:if>><a href="/env/list"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Analytics">Env</span></a>
                    </li>
                </ul>
            </li>
            <li class=" navigation-header"><span>Wish Mobile</span>
            </li>
            <li class="<c:if test="${menu eq '/user/userList'}">active</c:if> nav-item"><a href="/user/userList"><i class="feather icon-user"></i><span class="menu-title" data-i18n="Email">User</span></a>
            </li>
            <li class=" nav-item"><a href="#"><i class="feather icon-video"></i><span class="menu-title" data-i18n="Ecommerce">Video</span></a>
                <ul class="menu-content">
                    <li <c:if test="${menu eq '/video/videoList'}">class="active"</c:if>><a href="/video/videoList"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">video list</span></a>
                    </li>
                </ul>
            </li>
            <li class=" nav-item"><a href="#"><i class="feather icon-clipboard"></i><span class="menu-title" data-i18n="Ecommerce">Board</span></a>
                <ul class="menu-content">
                    <li <c:if test="${menu eq '/board/boardList'}">class="active"</c:if>><a href="/board/boardList"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">board list</span></a>
                    </li>
                </ul>
            </li>
            <li class=" nav-item"><a href="#"><i class="feather icon-tag"></i><span class="menu-title" data-i18n="Ecommerce">Quiz</span></a>
                <ul class="menu-content">
                    <li <c:if test="${menu eq '/quiz/quizList'}">class="active"</c:if>><a href="/quiz/quizList"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">quiz list</span></a>
                    </li>
                </ul>
            </li>
            <li class=" navigation-header"><span>Web Series</span></li>
            <li class="<c:if test="${menu eq '/webs/websMainList'}">active</c:if> nav-item">
                <a href="/webs/websMainList">
                    <i class="feather icon-mail"></i>
                    <span class="menu-title" data-i18n="Email">webseries</span>
                </a>
            </li>
            <li class=" navigation-header"><span>Gyanking</span></li>
            <li class="<c:if test="${menu eq '/gyanking/gyanMainList'}">active</c:if> nav-item">
                <a href="/gyanking/gyanMainList">
                    <i class="feather icon-mail"></i>
                    <span class="menu-title" data-i18n="Email">gyanking</span>
                </a>
            </li>
    </div>
</div>
<!-- END: Main Menu-->
