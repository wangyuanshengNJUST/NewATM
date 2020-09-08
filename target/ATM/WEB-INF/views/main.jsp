<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

%>
<head>
    <meta charset="UTF-8">
    <title>系统主界面</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>easyui/themes/icon.css">
    <script type="text/javascript" src="<%=basePath %>easyui/jquery.min.js">
    </script>
    <script type="text/javascript" src="<%=basePath %>easyui/jquery.easyui.min.js">
    </script>
</head>
</html>
<body>
<div style="color:Red; font-size:50px;background-color:whitesmoke;width:1500px;height:1500px;
        background-size: 100%,100%;
        background-image:url('${pageContext.request.contextPath}/12.jpg');
        background-repeat:no-repeat;">
    <body>
    <div class="wrapper">
        <span>W</span>
        <span>E</span>
        <span>L</span>
        <span>C</span>
        <span>O</span>
        <span>M</span>
        <span>E</span>
    </div>
    </body>
    <div class="social-btns">
        <div id="panel1">
            <button id="btn_1" onclick="select()">查询余额</button>
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <button id="btn_2" onclick="save_money()">存钱</button>
            <br>
        </div>
        <div id="panel2">
            <button id="btn_3" onclick="test()">历史记录</button>
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <button id="btn_4" onclick="draw_money()">取钱</button>
            <br>
        </div>
        <div id="panel3">
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
            <button id="btn_5" onclick="quit()">注销</button>
        </div>

    </div>
</div>

<div id="win" class="easyui-window" title="查询金额界面" style="display: none;width:300px;height:180px;"
     data-options="closed:true">
    <form style="padding:10px 20px 10px 40px;">
        <p id="select_result"></p>
    </form>
</div>

<div id="win4" class="easyui-window" title="查询用户历史记录" style="display: none;width:600px;height:400px;" data-options="closed:true">
    <table id="dg"></table>
</div>

<div id="win1" class="easyui-window" title="存钱界面" style="width:300px;height:180px;" data-options="closed:true">
    <form style="padding:10px 20px 10px 40px;">
        <p>存款金额: <input type="text" id="save"></p>
        <div style="padding:5px;text-align:center;">
            <a onclick="onsave_money()" class="easyui-linkbutton" icon="icon-ok">Ok</a>
            <a onclick="close1()" class="easyui-linkbutton" icon="icon-cancel">Cancel</a>
        </div>
    </form>
</div>

<div id="win2" class="easyui-window" title="取款界面" style="width:300px;height:180px;" data-options="closed:true">
    <form style="padding:10px 20px 10px 40px;">
        <p>取款金额: <input type="text" id="draw"></p>
        <div style="padding:5px;text-align:center;">
            <a onclick="ondraw_money()" class="easyui-linkbutton" icon="icon-ok">Ok</a>
            <a onclick="close2()" class="easyui-linkbutton" icon="icon-cancel">Cancel</a>
        </div>
    </form>
</div>

<div id="win3" class="easyui-window" title="注销" style="width:300px;height:180px;" data-options="closed:true">
    <form style="padding:10px 20px 10px 40px;">
        <p>确定注销此账户？</p>
        <div style="padding:5px;text-align:center;">
            <a onclick="quit1()" class="easyui-linkbutton" icon="icon-ok">Ok</a>
            <a onclick="close3()" class="easyui-linkbutton" icon="icon-cancel">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
<script>
    $('#pp').pagination({
        total: 2000,
        pageSize: 10,
        onSelectPage: function (pageNumber, pageSize) {
            $(this).pagination('loading');
            alert('pageNumber:' + pageNumber + ',pageSize:' + pageSize);
            $(this).pagination('loaded');
        }
    });

    function close1() {
        $('#win1').dialog('close');
    }
    function close2() {
        $('#win2').dialog('close');
    }

    function close3() {
        $('#win3').dialog('close');
    }

    function select_history() {
        $('#win4').dialog('open');
        $('#dg').datagrid({
            width: "100%",
            iconCls: 'icon-more',
            loadFilter: pagerFilter,
            border: true,
            collapsible: false,
            method: "get",
            url: 'History?userid=${userid}',
            pagination: true,
            rownumbers: true,
            columns: [[
                {field: 'username', title: "ID", width: "60px", align: "center"},
                {field: 'type', title: "操作类型", width: "150px", align: "center"},
                {field: 'money', title: "操作金额", width: "150px", align: "center"},
                {field: 'time', title: "操作时间", width: "150px", align: "center"},
            ]
            ]

        })
        /**
         * 分页过滤器
         * @param data 全部数据
         * @returns {*}
         */

        function pagerFilter(data) {
            if (typeof data.length == 'number' && typeof data.splice == 'function') {	// is array
                data = {
                    total: data.length,
                    rows: data
                }
            }
            var dg = $(this);
            var opts = dg.datagrid('options');
            var pager = dg.datagrid('getPager');
            pager.pagination({
                onSelectPage: function (pageNum, pageSize) {
                    opts.pageNumber = pageNum;
                    opts.pageSize = pageSize;
                    pager.pagination('refresh', {
                        pageNumber: pageNum,
                        pageSize: pageSize
                    });
                    dg.datagrid('loadData', data);
                }
            });
            if (!data.originalRows) {
                data.originalRows = (data.rows);
            }
            var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
            var end = start + parseInt(opts.pageSize);
            data.rows = (data.originalRows.slice(start, end));
            return data;
        }


    }
function test() {
    $('#win4').dialog('open');
    $.post("History","userid=" +${userid}, function (data) {
        $("#dg").html(data.length);
    })
}
    function select() {
        $('#win').dialog('open');
        $.post("Check", "userid=" +${userid}, function (data) {
            $("#select_result").html("当前账户余额为：" + data);
        })
        // xhr.onreadystatechange = function (){
        //     if (xhr.readyState ===4){
        // if (xhr.status >=200&&xhr.status<300){
        //     result.innerHTML = xhr.response;
        // }
        // }
        // }
    }

    function save_money() {
        $('#win1').dialog('open');
    }

    function onsave_money() {
        const savemoney = $('#save').val();
        $.post("save",
            "userid="+${userid}+
        "&money=" + savemoney, function (data) {
            $('#win1').dialog('close');
            alert("已成功存入：" + data)
        }
    )
    }

    function draw_money() {
        $('#win2').dialog('open');
    }

    function ondraw_money() {
        const drawmoney = $('#draw').val();
        $.post("draw",
            "userid="+${userid}+
        "&money=" + drawmoney, function (data) {
            if (data == drawmoney) {
                $('#win2').dialog('close');
                alert("已成功取出：" + data)
            } else {
                alert("您当前账户余额不足，现有余额：" + data)
            }

        }
    )
    }
function quit() {
    $('#win3').dialog('open');
}
    function quit1() {
        $.post("logout", "userid=" +${userid}, function (data) {
                if (data == "exit") {
                    $('#win3').dialog('close');
                    window.location.href = "${pageContext.request.contextPath}/exit";
                    alert("注销成功")
                }
            }
        )
    }
</script>
<style>
    @import url("https://fonts.googleapis.com/css2?family=Titan+One&display=swap");

    .wrapper {
        width: 100vw;
        text-align: center;
    }

    .wrapper span {
        -webkit-text-stroke-width: 1.25px;
        -webkit-text-stroke-color: #000;
        font-size: 100px;
        text-shadow: 0 0px #3582cf, 0 0px #4bd0f3;
        transform: translate(0, 100%) rotate(4deg);
        animation: jump 4s ease-in-out infinite;
        display: inline-block;
        font-family: "Titan One", cursive;
        color: #fff;
    }

    .wrapper span:nth-child(1) {
        animation-delay: 120ms;
    }

    .wrapper span:nth-child(2) {
        animation-delay: 240ms;
    }

    .wrapper span:nth-child(3) {
        animation-delay: 360ms;
    }

    .wrapper span:nth-child(4) {
        animation-delay: 480ms;
    }

    .wrapper span:nth-child(5) {
        animation-delay: 600ms;
    }

    .wrapper span:nth-child(6) {
        animation-delay: 720ms;
    }

    .wrapper span:nth-child(7) {
        animation-delay: 840ms;
    }

    @keyframes jump {
        33% {
            text-shadow: 0 60px #3582cf, 0 150px #4bd0f3;
        }
        50% {
            transform: translate(0, 0) rotate(-4deg);
            text-shadow: 0 0px #8fc0a9, 0 0px #84a9ac;
        }
        66.67% {
            text-shadow: 0 -60px #6598d5, 0 -150px #8fc0a9;
        }
    }

    html {
        width: 100%;
        height: 100vh;
    }

    body {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100vh;
        box-sizing: border-box;
        display: grid;
        place-items: center;
        overflow: hidden;
        background: #000;
    }

    @media screen and (max-height: 200px) {
        .wrapper {
            transform: scale(0.3, 0.3);
        }
    }

    @media screen and (max-width: 576px) {
        .wrapper span {
            font-size: 50px;
        }
    }

    button {
        width: 200px;
        padding: 20px;
        margin: 30px;
        background: #7bbfed;
        background-image: -webkit-linear-gradient(top, #7bbfed, #16689e);
        background-image: -moz-linear-gradient(top, #7bbfed, #16689e);
        background-image: -ms-linear-gradient(top, #7bbfed, #16689e);
        background-image: -o-linear-gradient(top, #7bbfed, #16689e);
        background-image: linear-gradient(to bottom, #7bbfed, #16689e);
        border-radius: 28px;
        -webkit-box-shadow: 1px 1px 3px 0px #ede7e7;
        -moz-box-shadow: 1px 1px 3px 0px #ede7e7;
        box-shadow: 1px 1px 3px 0px #ede7e7;
        font-family: 黑体;
        color: #ffffff;
        font-size: 18px;
        padding: 20px;
        text-decoration: none;
    }

</style>
</html>
