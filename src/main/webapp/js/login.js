layui.use(['form', 'layer'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        $ = layui.jquery;
    
    layer.alert('欢迎使用中石油GPS设备管理系统', {
    	  skin: 'layui-layer-molv' //样式类名
    	  ,closeBtn: 0,
    	  offset: 't',
    	  anim: 6
    	})
    	
    //登录按钮事件
    form.on("submit(login)", function (data) {
        $.ajax({
            type: "POST",
            url: ctx+"/sys/login",
            data:$("#form").serialize(),
            success: function (result) {
                if (result.code == 0) {//登录成功
                    parent.location.href = ctx+'/sys/index';
                } else{
                    layer.msg(result.msg, {icon: 5});
                    refreshCode();
                }
            }
        });
        return false;
    })
});
function refreshCode(){
    var captcha = document.getElementById("captcha");
    captcha.src = ctx+"/sys/vcode?t=" + new Date().getTime();
}
