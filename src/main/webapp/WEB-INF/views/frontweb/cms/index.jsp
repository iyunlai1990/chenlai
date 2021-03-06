<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2017/12/27
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content="博客系统,Blade框架,Tale"/>
    <meta name="description" content="博客系统,Blade框架,Tale"/>
    <link rel="shortcut icon" href="https://tale.biezhi.me/templates/themes/default/static/img/favicon.png"/>
    <link rel="apple-touch-icon" href="https://tale.biezhi.me/templates/themes/default/static/img/apple-touch-icon.png"/>
    <title>Tale Blog</title>
    <link href="//cdn.bootcss.com/highlight.js/9.9.0/styles/xcode.min.css" rel="stylesheet">
    <link href="https://tale.biezhi.me/templates/themes/default/static/css/style.min.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>

    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body  class="bg-grey"  gtools_scp_screen_capture_injected="true">
<!--[if lt IE 8]>
<div class="browsehappy" role="dialog">
    当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href="http://browsehappy.com/" target="_blank">升级你的浏览器</a>。
</div>
<![endif]-->
<header id="header" class="header bg-white">
    <div class="navbar-container">
        <a href="https://tale.biezhi.me" class="navbar-logo">
            <img src="https://tale.biezhi.me/templates/themes/default/static/img/logo.png" alt="Tale Blog"/>
        </a>
        <div class="navbar-menu">
            <a href="https://tale.biezhi.me/archives">归档</a>
            <a href="https://tale.biezhi.me/links">友链</a>
            <a href="https://tale.biezhi.me/about">关于</a>
        </div>
        <div class="navbar-search" onclick="">
            <span class="icon-search"></span>
            <form role="search" onsubmit="return false;">
                <span class="search-box">
                    <input type="text" id="search-inp" class="input" placeholder="搜索..." maxlength="30"
                           autocomplete="off">
                </span>
            </form>
        </div>
        <div class="navbar-mobile-menu" onclick="">
            <span class="icon-menu cross"><span class="middle"></span></span>
            <ul>
                <li><a href="https://tale.biezhi.me/archives">归档</a></li>
                <li><a href="https://tale.biezhi.me/links">友链</a></li>
                <li><a href="https://tale.biezhi.me/about">关于</a></li>
            </ul>
        </div>
    </div>
</header>
<div class="main-content index-page clearfix">
    <div class="post-lists">
        <div class="post-lists-body">
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/15.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/15">
                        <div class="item-desc">
                            <p> 在网易云音乐收藏了一些还不错的歌曲。
                                ...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/15">最近听的歌</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-image"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/14.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/14">
                        <div class="item-desc">
                            <p> 一. 2014 总结 好！今天有点时间，那就来总结总结2014，顺便激情四射的憧憬一下2015。 整体上过去的一年对我来说，真是充满了机遇，充满了挑...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/14">步步向上的一年</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-code"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/13.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/13">
                        <div class="item-desc">
                            <p> 2014年总结 2014年年初刚开始Android开发，虽说之前也断断续续地在学习Android，但是一直没有真刀实枪的干过，直到14年年初开始在公...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/13">压抑的一年</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-chat"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/11.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/11">
                        <div class="item-desc">
                            <p> 一.2014 总结 2014年是结束的也是开始的一年。结束了很多的东西：包括恋爱了两年的女朋友和大学的最后的时光（大四上）等，
                                也开始了很多的东西：...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/11">结束也是开始的一年</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-game"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/10.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/10">
                        <div class="item-desc">
                            <p> 一. 2014 总结 2014年，从二线城市南宁来到了一线城市深圳，从一个大杂烩开发转向Android主程，在创业公司一个人编码的日子里，应用层开发...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/10">新环境新世界</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-book"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/9.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/9">
                        <div class="item-desc">
                            <p> 我去。我真服了自己了，二月份了，才来总结。 相信大部分同学的大学跟我一样，我大学里比较贪玩，根本不喜欢写程序，挂科是家常便饭，2014年，要写毕业设...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/9">从迷惘到定向的一年</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-lock"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/8.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/8">
                        <div class="item-desc">
                            <p> 废话：我自己很少动笔写东西，除了追女朋友的时候。这次看了大家的分享，我决定晚点回去，写完自己的总结。 一、2014 总结 2014年算是我经历最多的...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/8">经历最多的一年</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-design"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/7.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/7">
                        <div class="item-desc">
                            <p> 一. 2014 总结 我有预感这会是一篇很长的总结。
                                我有预感我每次总结都会想骂人。
                                作为一个对产品技术和美术都有追求的程序员，这一年貌似仍然真...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/7">失落的一年</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-link"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/6.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/6">
                        <div class="item-desc">
                            <p> 一. 2014 总结 2014 总体 关键词：收获，积累，学习，工作，坚持 春天的时候从广州来到这个阔别了一年的地方，还是喜欢这个漂亮，干净的城市，...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/6">不断积累的一年</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-web"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/12.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/12">
                        <div class="item-desc">
                            <p> 一. 2014 总结 2014 年总体来说还是有些波浪的。相比于前两年的风平浪静，2014年，还是做了一些重大的决定。
                                2014 年原计划是，先学...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/12">认清方向的一年</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-note"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/5.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/5">
                        <div class="item-desc">
                            <p> 一. 2014 总结 2014 总体来说来是蛮紧张的。前半年上班族，后半年加入了创业大军。 成果 2014后半年出来创业了，以前工作的时候也一直在想...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/5">紧张的一年</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-image"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="post-list-item">
                <div class="post-list-item-container">
                    <div class="item-thumb bg-deepgrey" style="background-image:url(/templates/themes/default/static/img/rand/3.jpg);"></div>
                    <a href="https://tale.biezhi.me/article/3">
                        <div class="item-desc">
                            <p> 一. 2014 总结 2014 总体还是比较满意的，好吧，我承认给自己打 80 分主要是因为跟  @Almitra  走到了一起了。 成果 跟九年前...</p>
                        </div>
                    </a>
                    <div class="item-slant reverse-slant bg-deepgrey"></div>
                    <div class="item-slant"></div>
                    <div class="item-label">
                        <div class="item-title"><a href="https://tale.biezhi.me/article/3">开源的一年</a>
                        </div>
                        <div class="item-meta clearfix">
                            <div class="item-meta-ico bg-ico-chat"
                                 style="background: url(/templates/themes/default/static/img/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                            <div class="item-meta-cat">
                                <a href="/category/%E9%BB%98%E8%AE%A4%E5%88%86%E7%B1%BB">默认分类</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="lists-navigator clearfix">
        <ol class="page-navigator">

            <li  class="current" ><a href="/page/1">1</a></li>
            <li ><a href="/page/2">2</a></li>

            <li class="next"><a href="/page/2">→</a></li>
        </ol>
    </div>
</div>
<footer id="footer" class="footer bg-white">
    <%@ include file="/WEB-INF/views/frontweb/layouts/footer.jsp"%>
</footer>

<script src="//cdn.bootcss.com/headroom/0.9.1/headroom.min.js"></script>
<script src="//cdn.bootcss.com/highlight.js/9.12.0/highlight.min.js"></script>
<script src="//cdn.bootcss.com/instantclick/3.0.1/instantclick.min.js"></script>
<script type="text/javascript">
    var header = new Headroom(document.getElementById("header"), {
        tolerance: 10,
        offset : 80,
        classes: {
            initial: "animated",
            pinned: "slideDown",
            unpinned: "slideUp"
        }
    });
    header.init();
    $('#search-inp').keypress(function (e) {
        var key = e.which; //e.which是按键的值
        if (key == 13) {
            var q = $(this).val();
            if (q && q != '') {
                window.location.href = '/search/' + q;
            }
        }
    });
</script>
<script data-no-instant>
    InstantClick.on('change', function (isInitialLoad) {
        var blocks = document.querySelectorAll('pre code');
        for (var i = 0; i < blocks.length; i++) {
            hljs.highlightBlock(blocks[i]);
        }
        if (isInitialLoad === false) {
            if (typeof ga !== 'undefined') ga('send', 'pageview', location.pathname + location.search);
        }
    });
    InstantClick.init('mousedown');
</script>
</body>
</html>
