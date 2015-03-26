<!--#include file="config.asp"-->
<!--#include file="data_base.asp"-->
<%
Dim table_odd_index
table_odd_index = 1
Dim table_index
table_index = 1
%>
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
    
    <body>
	<div class="div_main_body">
		<div class="pure-g div_list_body">
			<div class="pure-u-1-1"><p class="antenna_title">天线暗室配置清单</p></div>
			<div class="pure-u-1-1">暗室尺寸:长<%=room_length%>米;宽<%=room_width%>米;高<%=room_hight%>米</div>
			<div class="pure-u-1-1">暗室频率:
				<%=Request.Form("arg_freq_min")%>~<%=Request.Form("arg_freq_max")%>
				<%
				select case freq_unit
				case "GHz"
					response.write("GHz")
				case "MHz"
					response.write("MHz")
				case "KHz"
					response.write("KHz")
				case "Hz"
					response.write("Hz")
				end select
				%>
			</div>
			<div class="pure-u-1-1">低频静区反射电平-<%=flat_db%>dB</div>	
		</div>
		<div class="div_list_body">
			<div class="pure-g">
				<div class="pure-u-1-1">
					<table class="pure-table" style="width:100%">
						<thead>
							<tr>
								<th nowrap="nowrap">序号</th>
								<th nowrap="nowrap">项目</th>
								<th nowrap="nowrap">详细</th>
								<th nowrap="nowrap">说明</th>
								<th nowrap="nowrap">详细参数</th>
								<th nowrap="nowrap">厂家</th>
							</tr>
						</thead>

						<tbody>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">结构框架</td>
								<td nowrap="nowrap">
									<%
									'输出结构详细情况
									if frame_type = frame_kuangjia then
										response.write("框架结构")
									else
										'frame_hangjia
										response.write("桁架结构")
									end if
									if frame_layout_type = frame_layout_yifu then
										response.write("依附式")
									else
										response.write("独立式")
									end if
									%>
								</td>
								<td>
									<%
									'输出结构说明
									response.write("暗室上部建筑主体结构吊挂荷载，有电磁屏蔽要求的暗室不应小于1.5KN/㎡，无电磁屏蔽要求的暗室不应小于1.2kN/㎡。以相邻柱基中心距LK为计算跨度，暗室上部建筑主体结构挠度不应大于LK/400。对于采用铁氧体复合吸波材料的暗室吊顶结构，挠度不应大于LK/1000。")
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算结构用钢总价frame_iron_total, frame_price_lv, 
									'select case frame_price_lv
									'	case price_lv1
									'		response.write(frame_iron_total*iron_price_lv1)
									'	case price_lv2
									'		response.write(frame_iron_total*iron_price_lv2)
									'	case price_lv3
									'		response.write(frame_iron_total*iron_price_lv3)
									'end select
									'因为无报价，暂时输出用钢量
									response.write("用钢量:")
									response.write(frame_iron_total)
									response.write("方")
									%>
									<br>等级:
									<%
									'计算报价
									select case frame_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普钢架厂1")
									%>
								</td>
							</tr>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">屏蔽壳体</td>
								<td nowrap="nowrap">
									<%
									'输出结构详细情况
									if is_pingbi then
										response.write("屏蔽")
									else
										'非屏蔽
										response.write("非屏蔽")
									end if
									%>
								</td>
								<td>
									<%
									'输出屏蔽壳体说明
									if sheld_type = 1 then
										'拼接式屏蔽
										response.write("（四壁和顶棚屏蔽模块屏蔽壁板层厚度不应小于1.5mm。 地面屏蔽层厚度不应小于3mm。）一般地面3mm，其余2mm")
									elseif sheld_type = 2 then
										'焊接式屏蔽
										response.write("四壁和顶棚屏蔽层厚度不应小于2mm。地面屏蔽层厚度不应小于3mm。一般地面3mm，其余2mm")
									else
										'非屏蔽
										response.write("非屏蔽壳体说明")
									end if
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算屏蔽壳体用钢量sheld_iron_total, sheld_price_lv
									'select case sheld_price_lv
									'	case price_lv1
									'		response.write(sheld_iron_total*iron_price_lv1)
									'	case price_lv2
									'		response.write(sheld_iron_total*iron_price_lv2)
									'	case price_lv3
									'		response.write(sheld_iron_total*iron_price_lv3)
									'end select
									'因为无报价，暂时输出用钢量
									response.write("用钢量:")
									response.write(sheld_iron_total)
									response.write("方")
									%>
									<br>等级:
									<%
									'计算报价
									select case sheld_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普屏蔽钢厂1")
									%>
								</td>
							</tr>

							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">暗室检修系统</td>
								<td nowrap="nowrap">
									<%
									'输出检修系统详细情况
									%>
								</td>
								<td>
									<%
									'输出检修系统说明
									%>
									含有防火门2樘，维修爬梯1套，照明灯一套，检修马道一套
								</td>
								<td nowrap="nowrap">
									<%
									'计算报价
									select case room_repair_price_lv
										case price_lv1
											response.write("高级检修系统报价")
										case price_lv2
											response.write("中级检修系统报价")
										case price_lv3
											response.write("低级检修系统报价")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普检修厂1")
									%>
								</td>
							</tr>
							<%
							'1维门信息输出开始
							if door1_count > 0 then
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">一维旋转门</td>
								<td nowrap="nowrap">
									尺寸:
									<%
									select case door1_size
										case door1_size_09_19
											response.write("0.9m×1.9m")
										case door1_size_12_20
											response.write("1.2m×2m")
										case door1_size_15_20
											response.write("1.5m×2m")
									end select
									%>
									<br>
									结构:
									<%
									select case door1_dao_huang
										case door_2dao_4huang
											response.write("双刀四簧")
										case door_1dao_3huang
											response.write("单刀三簧")
										case door_1dao_2huang
											response.write("单刀双簧")
										case door_3dao_5huang
											response.write("三刀五簧")
									end select
									%>
									<br>
									控制类型:
									<%if door1_option = door1_hand then response.write("手动") else response.write("电动") end if%>
								</td>
								<td>
									<%
									'输出一维旋转门说明
									%>
									<%
									select case door1_dao_huang
										case door_2dao_4huang
											response.write("双刀四簧(屏蔽效能90dB)")
										case door_1dao_3huang
											response.write("单刀三簧(屏蔽效能70dB)")
										case door_1dao_2huang
											response.write("单刀双簧(屏蔽效能60dB)")
										case door_3dao_5huang
											response.write("三刀五簧(屏蔽效能100dB)")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									数量
									<%
									'计算一维旋转门
									response.write(door1_count)
									%>
									<br>等级:
									<%
									'计算报价
									select case door_price_lv
										case price_lv1
											response.write("高级门")
										case price_lv2
											response.write("中级门")
										case price_lv3
											response.write("低级门")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普屏蔽门1")
									%>
								</td>
							</tr>
							<%
							'1维门信息输出结束
							end if
							%>

							<%
							'2维门信息输出开始
							if door2_count > 0 then
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">二维平移门</td>
								<td nowrap="nowrap">
									尺寸:
									<%
									select case door2_size
										case door2_size_50_60
											response.write("5m×6m")
										case door2_size_45_45
											response.write("4.5m×4.5m")
										case door2_size_30_30
											response.write("3m×3m")
										case door2_size_20_20
											response.write("2m×2m")
									end select
									%>
									<br>
									结构:
									<%
									select case door2_dao_huang
										case door_2dao_4huang
											response.write("双刀四簧")
										case door_1dao_3huang
											response.write("单刀三簧")
										case door_1dao_2huang
											response.write("单刀双簧")
										case door_3dao_5huang
											response.write("三刀五簧")
									end select
									%>
									<%if door2_squit_lift then%>
									<br>
									包含液压平台
									<%end if%>
								</td>
								<td>
									<%
									'输出二维平移门说明
									%>
									<%
									select case door1_dao_huang
										case door_2dao_4huang
											response.write("双刀四簧(屏蔽效能90dB)")
										case door_1dao_3huang
											response.write("单刀三簧(屏蔽效能70dB)")
										case door_1dao_2huang
											response.write("单刀双簧(屏蔽效能60dB)")
										case door_3dao_5huang
											response.write("三刀五簧(屏蔽效能100dB)")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									数量
									<%
									'计算二维平移门
									response.write(door2_count)
									%>
									<br>等级:
									<%
									'计算报价
									select case door_price_lv
										case price_lv1
											response.write("高级门")
										case price_lv2
											response.write("中级门")
										case price_lv3
											response.write("低级门")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普屏蔽门厂2")
									%>
								</td>
							</tr>
							<%
							'2维门信息输出结束
							end if
							%>
							<%
							'信号转接板输出开始
							if through_wall_sig_tran_count > 0 then
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">信号转接板</td>
								<td nowrap="nowrap">
									尺寸:
									<%
									select case through_wall_sig_tran
										case sig_tran_300_300
											response.write("300mm×300mm")
										case sig_tran_400_400
											response.write("400mm×400mm")
									end select
									%>
								</td>
								<td>
									<%
									'输出信号转接板说明
									%>
								</td>
								<td nowrap="nowrap">
									数量
									<%
									'计算信号转接板
									response.write(through_wall_sig_tran_count)
									%>
									<br>等级:
									<%
									'计算报价
									select case through_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普开关厂2")
									%>
								</td>
							</tr>
							<%
							'信号转接板输出结束
							end if
							%>
							
							<%
							'U型过壁管输出开始
							if u_through_wall_count > 0 then
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">U型过壁管</td>
								<td nowrap="nowrap">
									尺寸:
									<%
									select case u_through_wall
										case u_through_100_150
											response.write("100mm×150mm")
										case u_through_150_200
											response.write("150mm×200mm")
									end select
									%>
								</td>
								<td>
									<%
									'输出U型过壁管说明
									%>
								</td>
								<td nowrap="nowrap">
									数量
									<%
									'计算U型过壁管
									response.write(u_through_wall_count)
									%>
									<br>等级:
									<%
									'计算报价
									select case through_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普开关厂2")
									%>
								</td>
							</tr>
							<%
							'U型过壁管输出结束
							end if
							%>

							<%
							'电缆沟输出开始
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">电缆沟</td>
								<td nowrap="nowrap">
									尺寸:
									<%
									select case line_hole
										case line_hole_200_300
											response.write("200mm×300mm")
										case line_hole_300_300
											response.write("300mm×300mm")
									end select
									%>
								</td>
								<td>
									<%
									'输出电缆沟说明
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算电缆沟
									%>
									等级:
									<%
									'计算报价
									select case through_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普电缆厂2")
									%>
								</td>
							</tr>
							<%
							'电缆沟输出结束
							%>
							
							<%
							'滤波器输出开始
							if is_pingbi then
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">滤波器</td>
								<td nowrap="nowrap">
									<%
									if filter_total_100_count > 0 then
									%>
									100A滤波器数量:<%=filter_total_100_count%>个<br>
									<%
									end if
									%>
									<%
									if filter_total_63_count > 0 then
									%>
									63A滤波器数量:<%=filter_total_63_count%>个<br>
									<%
									end if
									%>
									<%
									if filter_total_32_count > 0 then
									%>
									32A滤波器数量:<%=filter_total_32_count%>个<br>
									<%
									end if
									%> 
									<%
									if filter_total_16_count > 0 then
									%>
									16A滤波器数量:<%=filter_total_16_count%>个
									<%
									end if
									%>
								</td>
								<td>
									<%
									'输出滤波器说明
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算滤波器
									%>
									等级:
									<%
									'计算报价
									select case room_power_suply_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普滤波器厂2")
									%>
								</td>
							</tr>
							<%
							'滤波器输出结束
							end if
							%>			
							
							<%
							'照明系统输出开始
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">照明系统</td>
								<td nowrap="nowrap">
									<%If lamp_type = lamp_type_normal Then
										response.write("节能灯")
									else 
										response.write("LED灯")
									end if%><br>
									功率<%=lamp_power%>W<br>
									数量:<%=lamp_count_total%>个
								</td>
								<td>
									<%
									'输出照明系统说明
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算照明系统
									%>
									等级:
									<%
									'计算报价
									select case lamp_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普灯厂2")
									%>
								</td>
							</tr>
							<%
							'照明系统输出结束
							%>			

							<%
							'空调系统输出开始
							If air_supply_kongtiao Then 
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">空调系统</td>
								<td nowrap="nowrap">
									换风频率:<%=air_refresh_count%>次/小时
									空调通风量:<%=air_refresh_total%>方/小时<br>
									通风管道长度:<%=air_pipe_len_total%>米<br>
									波导窗规格:孔径<%If freq_max <= 18*10^9 Then Response.write("0.5") Else Response.write("0.32") End if%>mm<br>
									排风口数量:<%=kongtiao_pipe_port_out_count%><br>
									进风口数量:<%=kongtiao_pipe_port_in_count%>
								</td>
								<td>
									<%
									'输出空调系统说明
									If freq_max >= 50*10^9 Then Response.write("频率大于50G，波导窗上需增补Z型管屏蔽处理") End if
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算空调系统
									%>
									等级:
									<%
									'计算报价
									select case air_system_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普空调厂2")
									%>
								</td>
							</tr>
							<%
							'空调系统输出结束
							End if
							%>		

							<%
							'新风系统输出开始
							If air_supply_new Then 
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">新风系统</td>
								<td nowrap="nowrap">
									通风管道长度:<%=air_pipe_len_total%>米<br>
									波导窗规格:孔径<%If freq_max <= 18*10^9 Then Response.write("0.5") Else Response.write("0.32") End if%>mm<br>
									排风口数量:<%=air_pipe_port_out_count%><br>
									进风口数量:<%=air_pipe_port_in_count%>
								</td>
								<td>
									<%
									'输出新风系统说明
									If freq_max >= 50*10^9 Then Response.write("频率大于50G，波导窗上需增补Z型管屏蔽处理") End if
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算新风系统
									%>
									等级:
									<%
									'计算报价
									select case air_system_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普空调厂2")
									%>
								</td>
							</tr>
							<%
							'新风系统输出结束
							End if
							%>		

							<%
							'监控系统输出开始
							If camera_count > 0 Then 
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">监控系统</td>
								<td nowrap="nowrap">
									摄像头分辨率:
									<%
									If camera_pixal = camera_1080p Then
										Response.write("1080P") 
									ElseIf camera_pixal = camera_720p Then 
										Response.write("720P")
									End If
									%><br>
									监控主机容量:
									<%
									If camera_capbility = camera_storage_4t Then
										Response.write("4T")
									ElseIf camera_capbility = camera_storage_2t Then
										Response.write("2T")
									End if
									%><br>
									监视器尺寸:
									<%
									If camera_monitor_size = monitor_size_40 Then
										Response.write("40寸")
									ElseIf camera_monitor_size = monitor_size_55 Then
										Response.write("55寸")
									End if
									%><br>
									附件:
									<%
									Select Case camera_tran_type
										Case camera_tran_light
											Response.write("光纤传输")
										Case camera_tran_line_light
											Response.write("网络线+光端机传输")
										Case camera_tran_line
											Response.write("网络线传输")
									End Select 
									%><br>
								</td>
								<td>
									<%
									'监控系统说明
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算监控系统
									%>
									等级:
									<%
									'计算报价
									select case camera_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普监控厂2")
									%>
								</td>
							</tr>
							<%
							'监控系统输出结束
							End if
							%>		

							<%
							'语音对讲系统输出开始
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">语音对讲系统</td>
								<td nowrap="nowrap">
									<%
									Select Case p2p_voice_type
										Case voice_1_2
											Response.write("一对二")
										Case voice_1_4
											Response.write("一对四")
									End Select 
									%>
								</td>
								<td>
									<%
									'语音对讲系统说明
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算语音对讲系统
									%>
									等级:
									<%
									'计算报价
									select case p2p_voice_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普对讲机厂2")
									%>
								</td>
							</tr>
							<%
							'语音对讲系统输出结束
							%>
							
							<%
							'消防系统输出开始
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">消防系统</td>
								<td nowrap="nowrap">
									<%
									If room_hight >= 12 Then
										Response.write("吸气式火灾感烟探测器<br>")
										Response.write("火焰探测器")
									ElseIf room_hight >= 8 Then
										Response.write("点型感烟火灾探测器<br>")
										Response.write("点型感温探测器")
									Else
										Response.write("点型感烟火灾探测器<br>")
										Response.write("火焰探测器")
									End if
									%>
								</td>
								<td>
									<%
									'消防系统说明
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算消防系统
									%>
									等级:
									<%
									'计算报价
									select case fire_safe_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普消防厂2")
									%>
								</td>
							</tr>
							<%
							'消防系统输出结束
							%>		

							<%
							'接地系统输出开始
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">接地系统</td>
								<td nowrap="nowrap">
									<%
									If groud_system_build Then
										Response.write("需要接地系统搭建")
									End if
									%>
								</td>
								<td>
									<%
									'接地系统说明
									%>
									接地电阻不大于1欧姆
								</td>
								<td nowrap="nowrap">
									<%
									'计算接地系统
									%>
									等级:
									<%
									'计算报价
									select case groud_system_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普接地厂2")
									%>
								</td>
							</tr>
							<%
							'接地系统输出结束
							%>		

							<%
							'吸波材料输出开始
							%>
							<tr <%If 0 = (table_odd_index Mod 2) then%>class="pure-table-odd"<%End if%><%table_odd_index=table_odd_index+1%>>
								<td><%=table_index%><%table_index=table_index+1%></td>
								<td nowrap="nowrap">吸波材料</td>
								<td nowrap="nowrap">
									<%
									%>
								</td>
								<td>
									<%
									'吸波材料说明
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'计算吸波材料
									%>
									等级:
									<%
									'计算报价
									select case wave_sorb_price_lv
										case price_lv1
											response.write("高级")
										case price_lv2
											response.write("中级")
										case price_lv3
											response.write("低级")
									end select
									%>
								</td>
								<td nowrap="nowrap">
									<%
									'输出厂家信息
									response.write("洛普接地厂2")
									%>
								</td>
							</tr>
							<%
							'吸波材料输出结束
							%>		

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div id="body_bottom">
	<br><br>
	</div>
    </body>
</html>

