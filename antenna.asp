<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>电磁波暗室标准化配置.power by:陈慧娟</title>
        <script src="function/cookie.js" type="text/javascript"></script>
        <script src="function/calc.js" type="text/javascript"></script>
		<!-- pure css -->
        <link rel="stylesheet" href="pure-release-0.5.0/base-min.css">
        <link rel="stylesheet" href="pure-release-0.5.0/pure-min.css">
		<!--[if lte IE 8]>
		    <link rel="stylesheet" href="pure-release-0.5.0/grids-responsive-old-ie-min.css">
		<![endif]-->
		<!--[if gt IE 8]><!-->
		    <link rel="stylesheet" href="pure-release-0.5.0/grids-responsive-min.css">
		<!--<![endif]-->
		<!-- qq css -->
		<link rel="stylesheet" href="site.css">
	</head>
    
    <body onload="func_init();">
	<div class="div_main_body">
		<div class="pure-g">
			<div class="pure-u-1-1"><p class="antenna_title">天线暗室标准化配置</p></div>
		</div>
		<div class="div_list_body">
		<form class="pure-form pure-form-aligned" method="post" action="antenna_report.asp" onsubmit="return func_checkForm();">
		    <fieldset>
		        <legend class="legend-background">暗室尺寸</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p> </p></div>
		            <div class="pure-u-1-5">
		                <label for="arg_long" class="pure-radio">
		                <input id="arg_long" type="text" name="arg_long" placeholder="长度(单位m)" class="pure-input-2-3">
		                长</label>
		            </div>
		
		            <div class="pure-u-1-5">
		                <label for="arg_width" class="pure-radio">
		                <input id="arg_width" type="text" name="arg_width" placeholder="宽度(单位m)" class="pure-input-2-3">
		                宽</label>
		            </div>
		
		            <div class="pure-u-1-5">
		                <label for="arg_high" class="pure-radio">
		                <input id="arg_high" type="text" name="arg_high" placeholder="高度(单位m)" class="pure-input-2-3">
		                高</label>
		            </div>
		        </div>
		
		    </fieldset>
		    <fieldset>
		    	<legend class="legend-background">暗室频率</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p> </p></div>
		            <div class="pure-u-1-6">
						<label for="arg_freq_min" class="pure-radio">
		                <input id="arg_freq_min" type="text" name="arg_freq_min" placeholder="频率下限" class="pure-input-2-3">
						</label>
					</div>
		            <div class="pure-u-1-8">
		                <p>&nbsp;&nbsp;~</p>
		            </div>		
		            <div class="pure-u-1-6">
						<label for="arg_freq_max" class="pure-radio">
		                <input id="arg_freq_max" type="text" name="arg_freq_max" placeholder="频率上限" class="pure-input-2-3">
						</label>
		            </div>
		            <div class="pure-u-1-6">
						<label for="arg_freq_unit" class="pure-radio">
		                <select id="arg_freq_unit" name="arg_freq_unit" class="pure-input-medium">
		                	<option>GHz</option>
		                	<option>MHz</option>
		                	<option>KHz</option>
		                	<option>Hz</option>
		                </select>
						</label>
		            </div>
		        </div>
		    </fieldset>
		    <fieldset>
		    	<legend class="legend-background">低频静区反射电平</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p> </p></div>
		            <div class="pure-u-1-2">
		                <input id="arg_low_flat_db" type="text" name="arg_low_flat_db" placeholder="反射电平">
		                <label for="arg_low_flat_db">dB</label>
		            </div>
		        </div>
		    </fieldset>
		    <fieldset>
		    	<legend class="legend-background">是否屏蔽</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p> </p></div>
		            <div class="pure-u-1-3">
					    <label for="arg_is_quiet1" class="pure-radio">
					        <input id="arg_is_quiet1" type="radio" name="arg_is_quiet" value="arg_is_quiet_true" onchange="func_quiet_change();">
					        是
					    </label>
		            </div>
		            <div class="pure-u-1-3">
					    <label for="arg_is_quiet2" class="pure-radio">
					        <input id="arg_is_quiet2" type="radio" name="arg_is_quiet" value="arg_is_quiet_false" onchange="func_quiet_change();">
					        否
					    </label>
		            </div>
		        </div>
		    </fieldset>
		    <fieldset>
		    	<legend class="legend-background">暗室结构形式</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>框架形式</p></div>
		            <div class="pure-u-1-3">
					    <label for="arg_frame_type1" class="pure-radio">
					        <input id="arg_frame_type1" type="radio" name="arg_frame_type" value="arg_frame_type_kuang">
					        框架结构
					    </label>
		            </div>
		            <div class="pure-u-1-3">
					    <label for="arg_frame_type2" class="pure-radio">
					        <input id="arg_frame_type2" type="radio" name="arg_frame_type" value="arg_frame_type_yan">
					        桁架结构
					    </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>类型</p></div>
		            <div class="pure-u-1-3">
					    <label for="arg_frame_type_calc1" class="pure-radio">
					        <input id="arg_frame_type_calc1" type="radio" name="arg_frame_type_calc" value="arg_frame_type_calc_yifu">
					        依附式
					    </label>
		            </div>
		            <div class="pure-u-1-3">
					    <label for="arg_frame_type_calc2" class="pure-radio">
					        <input id="arg_frame_type_calc2" type="radio" name="arg_frame_type_calc" value="arg_frame_type_calc_duli">
					        独立式
					    </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_frame_lv1" class="pure-radio">
					        <input id="arg_frame_lv1" type="radio" name="arg_frame_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_frame_lv2" class="pure-radio">
					        <input id="arg_frame_lv2" type="radio" name="arg_frame_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_frame_lv3" class="pure-radio">
					        <input id="arg_frame_lv3" type="radio" name="arg_frame_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
		    </fieldset>
		    <fieldset>
		    	<legend class="legend-background">屏蔽壳体</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>类型</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_sheld1" class="pure-radio">
					        <input id="arg_sheld1" type="radio" name="arg_sheld" value="1">
					        拼接式屏蔽
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_sheld2" class="pure-radio">
					        <input id="arg_sheld2" type="radio" name="arg_sheld" value="2">
					        焊接式屏蔽
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_sheld3" class="pure-radio">
					        <input id="arg_sheld3" type="radio" name="arg_sheld" value="3">
					        非屏蔽
					    </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_sheld_lv1" class="pure-radio">
					        <input id="arg_sheld_lv1" type="radio" name="arg_sheld_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_sheld_lv2" class="pure-radio">
					        <input id="arg_sheld_lv2" type="radio" name="arg_sheld_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_sheld_lv3" class="pure-radio">
					        <input id="arg_sheld_lv3" type="radio" name="arg_sheld_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
		    </fieldset>
		    <fieldset>
		    	<legend class="legend-background">暗室检修系统</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>说明</p></div>
		            <div class="pure-u-1-2 p_notice">
					    <p>含有防火门2樘，维修爬梯1套，照明灯一套，检修马道一套
					    </p>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_repair_lv1" class="pure-radio">
					        <input id="arg_repair_lv1" type="radio" name="arg_repair_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_repair_lv2" class="pure-radio">
					        <input id="arg_repair_lv2" type="radio" name="arg_repair_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_repair_lv3" class="pure-radio">
					        <input id="arg_repair_lv3" type="radio" name="arg_repair_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
		    </fieldset>
		    <fieldset>
		    	<legend class="legend-background">屏蔽门</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>一维旋转门</p></div>
		            <div class="pure-u-2-5">
		            	<label for="arg_door_size_1ax" class="pure-radio">尺寸
		                <select id="arg_door_size_1ax" name="arg_door_size_1ax" class="pure-input-medium">
		                	<option value="1">0.9m×1.9m</option>
		                	<option value="2">1.2m×2m</option>
		                	<option value="3">1.5m×2m</option>
		                </select>
		                </label>
		            </div>
		            <div class="pure-u-2-5">
		            	<label for="arg_door_count_1ax" class="pure-radio">数量
		                <select id="arg_door_count_1ax" name="arg_door_count_1ax" class="pure-input-medium">
		                	<option>0</option><option selected="selected">1</option><option>2</option>
		                	<option>3</option><option>4</option><option>5</option>
		                </select>
		                </label>
		            </div>
		            <div class="pure-u-1-5"><p></p></div>
		            <div class="pure-u-2-5" id="div_arg_door_dao_1ax">
		            	<label for="arg_door_dao_1ax" class="pure-radio">结构
		                <select id="arg_door_dao_1ax" name="arg_door_dao_1ax" class="pure-input-medium">
		                	<option value="1">双刀四簧(屏蔽效能90dB)</option>
		                	<option value="2">单刀三簧(屏蔽效能70dB)</option>
		                	<option value="3">单刀双簧(屏蔽效能60dB)</option>
		                	<option value="4">三刀五簧(屏蔽效能100dB)</option>
		                </select>
		            	</label>
		            </div>
		            <div class="pure-u-2-5">
		            	<label for="arg_door_auto" class="pure-radio">控制
		                <select id="arg_door_auto" name="arg_door_auto" class="pure-input-medium">
		                	<option value="2">电动</option>
		                	<option value="1">手动</option>
		                </select>
		                </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>二维平移门</p></div>
		            <div class="pure-u-2-5">
		            	<label for="arg_door_size_2ax" class="pure-radio">尺寸
		                <select id="arg_door_size_2ax" name="arg_door_size_2ax" class="pure-input-medium">
		                	<option value="1">5m×6m</option>
		                	<option value="2">4.5m×4.5m</option>
		                	<option value="3">3m×3m</option>
		                	<option value="4">2m×2m</option>
		                </select>
		            	</label>
		            </div>
		            <div class="pure-u-2-5">
		            	<label for="arg_door_count_2ax" class="pure-radio">数量
		                <select id="arg_door_count_2ax" name="arg_door_count_2ax" class="pure-input-medium">
		                	<option>0</option><option selected="selected">1</option><option>2</option>
		                </select>
		                </label>
		            </div>
		            <div class="pure-u-1-5"><p></p></div>
		            <div class="pure-u-2-5">
		            	<label for="arg_door_dao_2ax" class="pure-radio">结构
		                <select id="arg_door_dao_2ax" name="arg_door_dao_2ax" class="pure-input-medium">
		                	<option value="1">双刀四簧(屏蔽效能90dB)</option>
		                	<option value="2">单刀三簧(屏蔽效能70dB)</option>
		                	<option value="3">单刀双簧(屏蔽效能60dB)</option>
		                	<option value="4">三刀五簧(屏蔽效能100dB)</option>
		                </select>
		            	</label>
		            </div>
		            <div class="pure-u-2-5" id="div_arg_door_tool">
						<label for="arg_door_tool" class="pure-checkbox">
							<input id="arg_door_tool" type="checkbox" name="arg_door_tool">
							液压平台(液压平台载重10T)
						</label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_door_lv1" class="pure-radio">
					        <input id="arg_door_lv1" type="radio" name="arg_door_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_door_lv2" class="pure-radio">
					        <input id="arg_door_lv2" type="radio" name="arg_door_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_door_lv3" class="pure-radio">
					        <input id="arg_door_lv3" type="radio" name="arg_door_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
			</fieldset>
		    <fieldset>
		    	<legend class="legend-background">过壁系统</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>信号转接板</p></div>
		            <div class="pure-u-1-3">
		                <select id="arg_signal_tran" name="arg_signal_tran" class="pure-input-medium">
		                	<option value="1">300mm×300mm</option>
		                	<option value="2">400mm×400mm</option>
		                </select>
		            </div>
		            <div class="pure-u-1-3">
		            	<label for="arg_signal_tran_count" class="pure-radio">数量
		                <select id="arg_signal_tran_count" name="arg_signal_tran_count" class="pure-input-medium">
		                	<option>0</option><option>1</option><option>2</option>
		                	<option>3</option><option>4</option><option>5</option>
		                	<option>6</option><option>7</option><option>8</option>
		                	<option>9</option><option>10</option><option>11</option>
		                	<option>12</option><option>13</option><option>14</option><option>15</option>
		                </select>
		                </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>U型过壁管</p></div>
		            <div class="pure-u-1-3">
		                <select id="arg_U_through" name="arg_U_through" class="pure-input-medium">
		                	<option value="1">100mm×150mm</option>
		                	<option value="2">150mm×200mm</option>
		                </select>
		            </div>
		            <div class="pure-u-1-3">
		            	<label for="arg_U_through_count" class="pure-radio">数量
		                <select id="arg_U_through_count" name="arg_U_through_count" class="pure-input-medium">
		                	<option>0</option><option>1</option><option>2</option>
		                	<option>3</option><option>4</option><option>5</option>
		                	<option>6</option><option>7</option><option>8</option>
		                	<option>9</option><option>10</option><option>11</option>
		                	<option>12</option><option>13</option><option>14</option><option>15</option>
		                </select>
		                </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>电缆沟</p></div>
		            <div class="pure-u-1-3">
		                <select id="arg_line_through" name="arg_line_through" class="pure-input-medium">
		                	<option value="1">200mm×300mm</option>
		                	<option value="2">300mm×300mm</option>
		                </select>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_through_lv1" class="pure-radio">
					        <input id="arg_through_lv1" type="radio" name="arg_through_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_through_lv2" class="pure-radio">
					        <input id="arg_through_lv2" type="radio" name="arg_through_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_through_lv3" class="pure-radio">
					        <input id="arg_through_lv3" type="radio" name="arg_through_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
			</fieldset>
		    <fieldset>
		    	<legend class="legend-background">配电系统</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p> </p></div>
		            <div class="pure-u-1-3">
		                <label for="arg_signal_filter" class="pure-radio">暗室内用电量
						<input id="arg_signal_filter" type="text" name="arg_signal_filter" value="20" class="pure-input-1-4">KW
		                </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_electric_lv1" class="pure-radio">
					        <input id="arg_electric_lv1" type="radio" name="arg_electric_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_electric_lv2" class="pure-radio">
					        <input id="arg_electric_lv2" type="radio" name="arg_electric_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_electric_lv3" class="pure-radio">
					        <input id="arg_electric_lv3" type="radio" name="arg_electric_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
			</fieldset>
		    <fieldset>
		    	<legend class="legend-background">照明系统</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p></p></div>
		            <div class="pure-u-1-3">
					    <label for="arg_light_type1" class="pure-radio">
					        <input id="arg_light_type1" type="radio" name="arg_light_type" value="1">
					        节能灯
					    </label>
		            </div>
		            <div class="pure-u-1-3">
					    <label for="arg_light_type2" class="pure-radio">
					        <input id="arg_light_type2" type="radio" name="arg_light_type" value="2">
					        LED灯
					    </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>照度</p></div>
		            <div class="pure-u-1-4">
						<label for="arg_light_lux" class="pure-radio">
		                <input id="arg_light_lux" type="text" name="arg_light_lux" value="200">
						LUX</label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>规格</p></div>
		            <div class="pure-u-1-3">
		                <select id="arg_light_mode" name="arg_light_mode" class="pure-input-medium">
		                	<option value="1">60W</option>
		                	<option value="2">100W</option>
		                	<option value="3">150W</option>
		                </select>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_light_lv1" class="pure-radio">
					        <input id="arg_light_lv1" type="radio" name="arg_light_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_light_lv2" class="pure-radio">
					        <input id="arg_light_lv2" type="radio" name="arg_light_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_light_lv3" class="pure-radio">
					        <input id="arg_light_lv3" type="radio" name="arg_light_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
			</fieldset>
		    <fieldset>
		    	<legend class="legend-background">通风系统</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p></p></div>
		            <div class="pure-u-1-3">
					    <label for="arg_air_refresh_type1" class="pure-radio">
					    	<input id="arg_air_refresh_type1" type="checkbox" name="arg_air_refresh_type1">
					        空调系统
					    </label>
		            </div>
		            <div class="pure-u-1-3">
					    <label for="arg_air_refresh_type2" class="pure-radio">
					    	<input id="arg_air_refresh_type2" type="checkbox" name="arg_air_refresh_type2">
					        新风循环系统
					    </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p> </p></div>
		            <div class="pure-u-1-4">
						<label for="arg_air_refresh_cnt" class="pure-radio">换风
		                <input id="arg_air_refresh_cnt" type="text" name="arg_air_refresh_cnt" value="4" class="pure-input-1-4">
						次/小时</label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_air_refresh_lv1" class="pure-radio">
					        <input id="arg_air_refresh_lv1" type="radio" name="arg_air_refresh_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_air_refresh_lv2" class="pure-radio">
					        <input id="arg_air_refresh_lv2" type="radio" name="arg_air_refresh_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_air_refresh_lv3" class="pure-radio">
					        <input id="arg_air_refresh_lv3" type="radio" name="arg_air_refresh_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
			</fieldset>
		    <fieldset>
		    	<legend class="legend-background">监控系统</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>带云台枪型摄像头</p></div>
		            <div class="pure-u-1-4">
					    <label for="arg_camera_type" class="pure-radio">
							分辨率
		                <select id="arg_camera_type" name="arg_camera_type" class="pure-input-medium">
		                	<option value="1">1080P</option>
		                	<option value="2">720P</option>
		                </select>
					    </label>
		            </div>
		            <div class="pure-u-1-4">
					    <label for="arg_camera_count" class="pure-radio">
							数量(个)
		                <select id="arg_camera_count" name="arg_camera_count" class="pure-input-medium" onchange="check_camera();">
		                	<option>0</option>
		                	<option>1</option><option>2</option><option>3</option><option>4</option>
		                	<option>5</option><option>6</option><option>7</option><option>8</option>
							<option>9</option><option>10</option><option>11</option><option>12</option>
		                </select>
					    </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>监控主机</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_camera_capbility" class="pure-radio">
							总容量
		                <select id="arg_camera_capbility" name="arg_camera_capbility" class="pure-input-medium" onchange="func_camera_capbility_change();">
		                	<option value="1">4T</option>
		                	<option value="2">2T</option>
		                </select>
					    </label>
		            </div>
		            <div class="pure-u-1-3">
						<p id="arg_camera_capbility_note"><strong>可保存约15天的数据量</strong></p>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>显示屏</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_monitor_size" class="pure-radio">
							尺寸&nbsp;
		                <select id="arg_monitor_size" name="arg_monitor_size" class="pure-input-medium">
		                	<option value="1">40寸</option>
		                	<option value="2">55寸</option>
		                </select>
					    </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>附件</p></div>
		            <div class="pure-u-1-2">
					    <label for="arg_attachment" class="pure-radio">
							&nbsp;&nbsp;&nbsp;
		                <select id="arg_attachment" name="arg_attachment" class="pure-input-medium">
		                </select>
					    </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_monitor_sys_lv1" class="pure-radio">
					        <input id="arg_monitor_sys_lv1" type="radio" name="arg_monitor_sys_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_monitor_sys_lv2" class="pure-radio">
					        <input id="arg_monitor_sys_lv2" type="radio" name="arg_monitor_sys_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_monitor_sys_lv3" class="pure-radio">
					        <input id="arg_monitor_sys_lv3" type="radio" name="arg_monitor_sys_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
			</fieldset>
		    <fieldset>
		    	<legend class="legend-background">语音对讲系统</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>规格</p></div>
		            <div class="pure-u-1-2">
					    <label for="arg_p2p_talk" class="pure-radio">
		                <select id="arg_p2p_talk" name="arg_p2p_talk" class="pure-input-medium">
		                	<option value="1">一对二</option>
		                	<option value="2">一对四</option>
		                </select>
					    </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_p2p_talk_lv1" class="pure-radio">
					        <input id="arg_p2p_talk_lv1" type="radio" name="arg_p2p_talk_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_p2p_talk_lv2" class="pure-radio">
					        <input id="arg_p2p_talk_lv2" type="radio" name="arg_p2p_talk_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_p2p_talk_lv3" class="pure-radio">
					        <input id="arg_p2p_talk_lv3" type="radio" name="arg_p2p_talk_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
			</fieldset>
		    <fieldset>
		    	<legend class="legend-background">消防系统</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_fire_hole_lv1" class="pure-radio">
					        <input id="arg_fire_hole_lv1" type="radio" name="arg_fire_hole_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_fire_hole_lv2" class="pure-radio">
					        <input id="arg_fire_hole_lv2" type="radio" name="arg_fire_hole_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_fire_hole_lv3" class="pure-radio">
					        <input id="arg_fire_hole_lv3" type="radio" name="arg_fire_hole_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
			</fieldset>			
		    <fieldset>
		    	<legend class="legend-background">接地系统</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>接地配置</p></div>
		            <div class="pure-u-1-3">
					    <label for="arg_ground_put_line" class="pure-radio">
					        <input id="arg_ground_put_line" type="radio" name="arg_ground_put_line" value="arg_ground_put_line" checked>
					        接地布线
					    </label>
		            </div>
		            <div class="pure-u-1-3" id="div_arg_door_tool">
						<label for="arg_ground_system" class="pure-checkbox">
							<input id="arg_ground_system" type="checkbox" name="arg_ground_system">
							接地系统搭建
						</label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_ground_system_lv1" class="pure-radio">
					        <input id="arg_ground_system_lv1" type="radio" name="arg_ground_system_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_ground_system_lv2" class="pure-radio">
					        <input id="arg_ground_system_lv2" type="radio" name="arg_ground_system_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_ground_system_lv3" class="pure-radio">
					        <input id="arg_ground_system_lv3" type="radio" name="arg_ground_system_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
			</fieldset>			
		    <fieldset>
		    	<legend class="legend-background">吸波材料</legend>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p></p></div>
		            <div class="pure-u-1-3">
					    <label for="arg_wave_sorb_type1" class="pure-radio">
					        <input id="arg_wave_sorb_type1" type="radio" name="arg_wave_sorb_type" value="1">
					        难燃型吸波材料(LPAFA)
					    </label>
		            </div>
		            <div class="pure-u-1-3">
					    <label for="arg_wave_sorb_type2" class="pure-radio">
					        <input id="arg_wave_sorb_type2" type="radio" name="arg_wave_sorb_type" value="2">
					        海绵型吸波材料（LPPFA）
					    </label>
		            </div>
		        </div>
		        <div class="pure-g">
		        	<div class="pure-u-1-5"><p>选材等级</p></div>
		            <div class="pure-u-1-6">
					    <label for="arg_wave_sorb_lv1" class="pure-radio">
					        <input id="arg_wave_sorb_lv1" type="radio" name="arg_wave_sorb_lv" value="1">
					        高
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_wave_sorb_lv2" class="pure-radio">
					        <input id="arg_wave_sorb_lv2" type="radio" name="arg_wave_sorb_lv" value="2">
					        中
					    </label>
		            </div>
		            <div class="pure-u-1-6">
					    <label for="arg_wave_sorb_lv3" class="pure-radio">
					        <input id="arg_wave_sorb_lv3" type="radio" name="arg_wave_sorb_lv" value="3">
					        低
					    </label>
		            </div>
		        </div>
			</fieldset>			
			<div class="pure-g">
				<div class="pure-u-4-5">
				</div>
				<div class="pure-u-1-6">
					<button type="submit" class="pure-button pure-button-primary">生成配置清单</button>
				</div>
			</div>
		</form>
		</div>
	</div>
    </body>
</html>