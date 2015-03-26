function setCookie(c_name,value,expiredays)
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate()+expiredays);
	document.cookie=c_name+ "=" +escape(value)+
	((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
}

function getCookie(c_name)
{
	if (document.cookie.length > 0)
	{
		c_start=document.cookie.indexOf(c_name + "=");
		if (c_start!=-1)
		{ 
			c_start=c_start + c_name.length+1 ;
			c_end=document.cookie.indexOf(";",c_start);
			if (c_end==-1) 
				c_end=document.cookie.length;
			return unescape(document.cookie.substring(c_start,c_end));
		} 
	}
	return "";
}

function get_radio_checked_index(radio_obj)
{
	if (radio_obj)
	{
        var i;
        for(i = 0; i < radio_obj.length; i++)
		{
            if(radio_obj[i].checked)
			{
                return i;
            }
        }
	}
	return 0;
}

function load_cookies_db()
{
	var long_width_high = cookie.get('long_width_high', '');
	var long_width_high_parse;
	if (long_width_high)
	{
		long_width_high_parse = long_width_high.split(",");
	}
	var arg_long  = long_width_high_parse[0];
	var arg_width = long_width_high_parse[1];
	var arg_high  = long_width_high_parse[2];
	var freq_min_max_flat_db = cookie.get('freq_min_max_flatdb', '');
	var freq_min_max_flat_db_parse;
	if (freq_min_max_flat_db)
	{
		freq_min_max_flat_db_parse = freq_min_max_flat_db.split(",");
	}
	var freq_min = freq_min_max_flat_db_parse[0];
	var freq_max = freq_min_max_flat_db_parse[1];
	var flat_db  = freq_min_max_flat_db_parse[2];
	document.getElementById("arg_long").value = arg_long;
	document.getElementById("arg_width").value = arg_width;
	document.getElementById("arg_high").value = arg_high;
	document.getElementById("arg_freq_min").value = freq_min;
	document.getElementById("arg_freq_max").value = freq_max;
	document.getElementById("arg_freq_unit").selectedIndex = cookie.get('freq_unit', '0');
	document.getElementById("arg_low_flat_db").value = flat_db;
	document.getElementsByName("arg_is_quiet")[cookie.get('is_quiet', '0')].checked = true;
	document.getElementsByName("arg_frame_type")[cookie.get('frame_type', '0')].checked = true;
	document.getElementsByName("arg_frame_type_calc")[cookie.get('frame_type_calc', '0')].checked = true;
	document.getElementsByName("arg_frame_lv")[cookie.get('frame_lv', '1')].checked = true;
	document.getElementsByName("arg_sheld")[cookie.get('sheld', '0')].checked = true;
	document.getElementsByName("arg_sheld_lv")[cookie.get('sheld_lv', '1')].checked = true;
	document.getElementsByName("arg_repair_lv")[cookie.get('repair_lv', '1')].checked = true;
	document.getElementById("arg_door_size_1ax").selectedIndex = cookie.get('door_size_1ax', '0');
	document.getElementById("arg_door_count_1ax").selectedIndex = cookie.get('door_count_1ax', '0');
	document.getElementById("arg_door_dao_1ax").selectedIndex = cookie.get('door_dao_1ax', '0');
	document.getElementById("arg_door_auto").selectedIndex = cookie.get('door_auto', '0');
	document.getElementById("arg_door_size_2ax").selectedIndex = cookie.get('door_size_2ax', '0');
	document.getElementById("arg_door_count_2ax").selectedIndex = cookie.get('door_count_2ax', '0');
	document.getElementById("arg_door_dao_2ax").selectedIndex = cookie.get('door_dao_2ax', '0');
	document.getElementById("arg_door_tool").checked = cookie.get('door_tool') == "true" ? true : false;
	document.getElementsByName("arg_door_lv")[cookie.get('door_lv', '1')].checked = true;
	document.getElementById("arg_signal_tran").selectedIndex = cookie.get('signal_tran', '0');
	document.getElementById("arg_signal_tran_count").selectedIndex = cookie.get('signal_tran_count', '0');
	document.getElementById("arg_U_through").selectedIndex = cookie.get('U_through', '0');
	document.getElementById("arg_U_through_count").selectedIndex = cookie.get('U_through_count', '0');
	document.getElementById("arg_line_through").selectedIndex = cookie.get('line_through', '0');
	document.getElementsByName("arg_through_lv")[cookie.get('through_lv', '1')].checked = true;
	document.getElementById("arg_signal_filter").value = cookie.get('signal_filter', '20');
	document.getElementsByName("arg_electric_lv")[cookie.get('electric_lv', '1')].checked = true;
	document.getElementsByName("arg_light_type")[cookie.get('light_type', '1')].checked = true;
	document.getElementById("arg_light_lux").value = cookie.get('light_lux', '200');
	document.getElementById("arg_light_mode").selectedIndex = cookie.get('light_mode', '0');
	document.getElementsByName("arg_light_lv")[cookie.get('light_lv', '1')].checked = true;
	document.getElementById("arg_air_refresh_type1").checked = cookie.get('air_refresh_type1') == "true" ? true : false;
	document.getElementById("arg_air_refresh_type2").checked = cookie.get('air_refresh_type2') == "true" ? true : false;
	document.getElementById("arg_air_refresh_cnt").value = cookie.get('air_refresh_cnt', '4');
	document.getElementsByName("arg_air_refresh_lv")[cookie.get('air_refresh_lv', '1')].checked = true;
	document.getElementById("arg_camera_type").selectedIndex = cookie.get('camera_type', '0');
	document.getElementById("arg_camera_count").selectedIndex = cookie.get('camera_count', '0');
	document.getElementById("arg_camera_capbility").selectedIndex = cookie.get('camera_capbility', '0');
	document.getElementById("arg_monitor_size").selectedIndex = cookie.get('monitor_size', '0');
	document.getElementById("arg_attachment").selectedIndex = cookie.get('attachment', '0');
	document.getElementsByName("arg_monitor_sys_lv")[cookie.get('monitor_sys_lv', '1')].checked = true;
	document.getElementById("arg_p2p_talk").selectedIndex = cookie.get('p2p_talk', '0');
	document.getElementsByName("arg_p2p_talk_lv")[cookie.get('p2p_talk_lv', '1')].checked = true;
	document.getElementsByName("arg_fire_hole_lv")[cookie.get('fire_hole_lv', '1')].checked = true;
	document.getElementById("arg_ground_system").checked = cookie.get('ground_system') == "true" ? true : false;
	document.getElementsByName("arg_ground_system_lv")[cookie.get('ground_system_lv', '1')].checked = true;
	document.getElementsByName("arg_wave_sorb_type")[cookie.get('wave_sorb_type', '0')].checked = true;
	document.getElementsByName("arg_wave_sorb_lv")[cookie.get('wave_sorb_lv', '1')].checked = true;




	//alert(cookie.get('arg_light_lux', '200'));


	//cookie.set('arg_is_quiet', get_radio_checked_index(document.getElementsByName("arg_low_flat_db")), {expires:365});

	//if (checkCookie())
	//{
	//		alert(getCookie("arg_long"));
	//	document.getElementsByName("arg_long").value = getCookie("arg_long");
		//arg_long = getCookie("");
		//var obj = document.getElementByIdx_x(”testSelect”); //定位id

//var index = obj.selectedIndex; // 选中索引

//var text = obj.options[index].text; // 选中文本

//var value = obj.options[index].value; // 选中值
	//}
	//else
	//{
//
	//}	
}

function func_camera_capbility_change(){
	var door_type = document.getElementById("arg_camera_capbility").value;
	if (door_type == 1)
	{
		document.getElementById("arg_camera_capbility_note").innerHTML = "<strong>可保存约15天的数据量</strong>";
	}
	else
	{
		document.getElementById("arg_camera_capbility_note").innerHTML = "<strong>可保存约7天的数据量</strong>";
	}
}

function func_set_to_cookies()
{
	cookie.set('long_width_high', document.getElementById("arg_long").value + "," + document.getElementById("arg_width").value + "," + document.getElementById("arg_high").value, {expires:365});
	cookie.set('freq_min_max_flatdb', document.getElementById("arg_freq_min").value + "," + document.getElementById("arg_freq_max").value + "," + document.getElementById("arg_low_flat_db").value, {expires:365});
	cookie.set('freq_unit', document.getElementById("arg_freq_unit").selectedIndex, {expires:365});
	cookie.set('is_quiet', get_radio_checked_index(document.getElementsByName("arg_is_quiet")), {expires:365});
	cookie.set('frame_type', get_radio_checked_index(document.getElementsByName("arg_frame_type")), {expires:365});
	cookie.set('frame_type_calc', get_radio_checked_index(document.getElementsByName("arg_frame_type_calc")), {expires:365});
	cookie.set('frame_lv', get_radio_checked_index(document.getElementsByName("arg_frame_lv")), {expires:365});
	cookie.set('sheld', get_radio_checked_index(document.getElementsByName("arg_sheld")), {expires:365});
	cookie.set('sheld_lv', get_radio_checked_index(document.getElementsByName("arg_sheld_lv")), {expires:365});
	cookie.set('repair_lv', get_radio_checked_index(document.getElementsByName("arg_repair_lv")), {expires:365});
	cookie.set('door_size_1ax', document.getElementById("arg_door_size_1ax").selectedIndex, {expires:365});
	cookie.set('door_count_1ax', document.getElementById("arg_door_count_1ax").selectedIndex, {expires:365});
	cookie.set('door_dao_1ax', document.getElementById("arg_door_dao_1ax").selectedIndex, {expires:365});
	cookie.set('door_auto', document.getElementById("arg_door_auto").selectedIndex, {expires:365});
	cookie.set('door_size_2ax', document.getElementById("arg_door_size_2ax").selectedIndex, {expires:365});
	cookie.set('door_count_2ax', document.getElementById("arg_door_count_2ax").selectedIndex, {expires:365});
	cookie.set('door_dao_2ax', document.getElementById("arg_door_dao_2ax").selectedIndex, {expires:365});
	cookie.set('door_tool', document.getElementById("arg_door_tool").checked, {expires:365});
	cookie.set('door_lv', get_radio_checked_index(document.getElementsByName("arg_door_lv")), {expires:365});
	cookie.set('signal_tran', document.getElementById("arg_signal_tran").selectedIndex, {expires:365});
	cookie.set('signal_tran_count', document.getElementById("arg_signal_tran_count").selectedIndex, {expires:365});
	cookie.set('U_through', document.getElementById("arg_U_through").selectedIndex, {expires:365});
	cookie.set('U_through_count', document.getElementById("arg_U_through_count").selectedIndex, {expires:365});
	cookie.set('line_through', document.getElementById("arg_line_through").selectedIndex, {expires:365});
	cookie.set('through_lv', get_radio_checked_index(document.getElementsByName("arg_through_lv")), {expires:365});
	cookie.set('signal_filter', document.getElementById("arg_signal_filter").value, {expires:365});
	cookie.set('electric_lv', get_radio_checked_index(document.getElementsByName("arg_electric_lv")), {expires:365});
	cookie.set('light_type', get_radio_checked_index(document.getElementsByName("arg_light_type")), {expires:365});
	cookie.set('light_lux', document.getElementById("arg_light_lux").value, {expires:365});
	cookie.set('light_mode', document.getElementById("arg_light_mode").selectedIndex, {expires:365});
	cookie.set('light_lv', get_radio_checked_index(document.getElementsByName("arg_light_lv")), {expires:365});
	cookie.set('air_refresh_type1', document.getElementById("arg_air_refresh_type1").checked, {expires:365});
	cookie.set('air_refresh_type2', document.getElementById("arg_air_refresh_type2").checked, {expires:365});
	cookie.set('air_refresh_cnt', document.getElementById("arg_air_refresh_cnt").value, {expires:365});
	cookie.set('air_refresh_lv', get_radio_checked_index(document.getElementsByName("arg_air_refresh_lv")), {expires:365});
	cookie.set('camera_type', document.getElementById("arg_camera_type").selectedIndex, {expires:365});
	cookie.set('camera_count', document.getElementById("arg_camera_count").selectedIndex, {expires:365});
	cookie.set('camera_capbility', document.getElementById("arg_camera_capbility").selectedIndex, {expires:365});
	cookie.set('monitor_size', document.getElementById("arg_monitor_size").selectedIndex, {expires:365});
	cookie.set('attachment', document.getElementById("arg_attachment").selectedIndex, {expires:365});
	cookie.set('monitor_sys_lv', get_radio_checked_index(document.getElementsByName("arg_monitor_sys_lv")), {expires:365});
	cookie.set('p2p_talk', document.getElementById("arg_p2p_talk").selectedIndex, {expires:365});
	cookie.set('p2p_talk_lv', get_radio_checked_index(document.getElementsByName("arg_p2p_talk_lv")), {expires:365});
	cookie.set('fire_hole_lv', get_radio_checked_index(document.getElementsByName("arg_fire_hole_lv")), {expires:365});
	cookie.set('ground_system', document.getElementById("arg_ground_system").checked, {expires:365});
	cookie.set('ground_system_lv', get_radio_checked_index(document.getElementsByName("arg_ground_system_lv")), {expires:365});
	cookie.set('wave_sorb_type', get_radio_checked_index(document.getElementsByName("arg_wave_sorb_type")), {expires:365});
	cookie.set('wave_sorb_lv', get_radio_checked_index(document.getElementsByName("arg_wave_sorb_lv")), {expires:365});


	//document.getElementById("arg_freq_unit").selectedIndex = cookie.get('arg_freq_unit', '');
	cookie.set('data_base', 'version.3');
}

function func_checkForm(){
	// todo:检查所有用户输入数据的合法性，例如需要输入数字的地方，输入了字母等

	func_set_to_cookies();
	return true;
}

function func_quiet_change(){
	//1 把屏蔽壳体中的屏蔽类型设置开关
	var pingbi_onoff = document.getElementsByName("arg_is_quiet");
	
	if (pingbi_onoff[0].checked)
	{
		// 屏蔽，把屏蔽壳体设置正确
		document.getElementById("arg_sheld1").disabled = false;
		document.getElementById("arg_sheld2").disabled = false;
		document.getElementById("arg_sheld3").disabled = true;
		document.getElementById("arg_sheld3").checked = "";
		document.getElementById("arg_door_dao_1ax").disabled = false;
		document.getElementById("arg_door_dao_2ax").disabled = false;
		document.getElementById("arg_signal_tran").disabled = false;
		document.getElementById("arg_U_through").disabled = false;
		document.getElementById("arg_signal_tran_count").disabled = false;
		document.getElementById("arg_U_through_count").disabled = false;
		
		//把监控系统中的附件设置为光纤传输和网络线+光端机传输
		document.getElementById('arg_attachment').options.length = 0;
		document.getElementById('arg_attachment').options.add(new Option("光纤传输", "1"));
		document.getElementById('arg_attachment').options.add(new Option("网络线+光端机传输", "2"));

	}
	else
	{
		// 非屏蔽
		document.getElementById("arg_sheld1").disabled = true;
		document.getElementById("arg_sheld2").disabled = true;
		document.getElementById("arg_sheld3").disabled = false;
		document.getElementById("arg_sheld3").checked = "checked";
		document.getElementById("arg_door_dao_1ax").disabled = true;
		document.getElementById("arg_door_dao_2ax").disabled = true;
		document.getElementById("arg_signal_tran").disabled = true;
		document.getElementById("arg_U_through").disabled = true;
		document.getElementById("arg_signal_tran_count").disabled = true;
		document.getElementById("arg_U_through_count").disabled = true;
		//把监控系统中的附件设置为网络线传输
		document.getElementById('arg_attachment').options.length = 0;
		document.getElementById('arg_attachment').options.add(new Option("网络线传输", "3"));
	}
	document.getElementById("arg_attachment").selectedIndex = cookie.get('arg_attachment', '0');
}

function check_camera(){
	var came_count = document.getElementById("arg_camera_count").value;
	if (came_count == "0")
	{
		document.getElementById("arg_camera_type").disabled = true;
		document.getElementById("arg_camera_capbility").disabled = true;
		document.getElementById("arg_monitor_size").disabled = true;
		document.getElementById("arg_attachment").disabled = true;		
	}
	else
	{
		document.getElementById("arg_camera_type").disabled = false;
		document.getElementById("arg_camera_capbility").disabled = false;
		document.getElementById("arg_monitor_size").disabled = false;
		document.getElementById("arg_attachment").disabled = false;
	}
}

function func_init(){
	
	//从cookies读取已经保存的重要参数值
	if (cookie.enabled() && "version.3" == cookie.get('data_base')) {
		load_cookies_db();
	} else {
		//初始化控件默认值
		document.getElementById("arg_long").value = "";
		document.getElementById("arg_width").value = "";
		document.getElementById("arg_high").value = "";
		document.getElementById("arg_freq_min").value = "";
		document.getElementById("arg_freq_max").value = "";
		document.getElementById("arg_low_flat_db").value = "";
		document.getElementsByName("arg_is_quiet")[0].checked = true;	//屏蔽默认“是”;
		document.getElementsByName("arg_light_type")[1].checked = true;	//屏蔽默认“LED”;
		document.getElementsByName("arg_frame_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_sheld_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_repair_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_door_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_through_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_electric_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_light_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_air_refresh_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_monitor_sys_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_p2p_talk_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_fire_hole_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_ground_system_lv")[1].checked = true;	//默认选材等级“中”
		document.getElementsByName("arg_wave_sorb_lv")[1].checked = true;	//默认选材等级“中”
		
		//默认屏蔽壳体，把监控系统中的附件设置为 光纤传输 和 网络线+光端机传输
		document.getElementById('arg_attachment').options.length = 0;
		document.getElementById('arg_attachment').options.add(new Option("光纤传输", "1"));
		document.getElementById('arg_attachment').options.add(new Option("网络线+光端机传输", "2"));
		
		//接地布线默认选择
		document.getElementById("arg_ground_put_line").checked = "checked";
	
		//默认难燃型
		document.getElementsByName("arg_wave_sorb_type")[0].checked = true;
		func_set_to_cookies();
	}

	func_quiet_change();
	check_camera();
	func_camera_capbility_change();
}
