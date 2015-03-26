<!--#include file="conn.asp"-->
<%
dim iron_price_lv1
dim iron_price_lv2
dim iron_price_lv3
iron_price_lv1 = 8000
iron_price_lv2 = 6000
iron_price_lv3 = 5000

'部分常量定义
dim frame_kuangjia
frame_kuangjia = 1
dim frame_hangjia
frame_hangjia = 2
dim frame_layout_yifu
frame_layout_yifu = 1
dim frame_layout_duli
frame_layout_duli=2
dim sheld_pinjie
sheld_pinjie = 1
dim sheld_hanjie
sheld_hanjie = 2
dim sheld_none
sheld_none = 3

dim price_lv1
price_lv1 = 1
dim price_lv2
price_lv2 = 2
dim price_lv3
price_lv3 = 3



'暗室长宽高
dim room_length
dim room_width
dim room_hight
room_length = CDbl(Request.Form("arg_long"))
room_width  = CDbl(Request.Form("arg_width"))
room_hight  = CDbl(Request.Form("arg_high"))


'频率
dim freq_min
dim freq_max
dim freq_unit
freq_min = CDbl(Request.Form("arg_freq_min"))
freq_max = CDbl(Request.Form("arg_freq_max"))
freq_unit = Request.Form("arg_freq_unit")
select case freq_unit
	case "GHz"
		freq_min = freq_min*10^9
		freq_max = freq_max*10^9
	case "MHz"
		freq_min = freq_min*10^6
		freq_max = freq_max*10^6
	case "KHz"
		freq_min = freq_min*10^3
		freq_max = freq_max*10^3
	case "Hz"
end select

'反射电平
dim flat_db
flat_db = Abs(CDbl(Request.Form("arg_low_flat_db")))

'是否屏蔽
dim is_pingbi
is_pingbi = Request.Form("arg_is_quiet")
if is_pingbi = "arg_is_quiet_true" then
	is_pingbi = true
else
	is_pingbi = false
end if

'框架形式
dim frame_type
frame_type = Request.Form("arg_frame_type")
if frame_type = "arg_frame_type_kuang" then
	frame_type = frame_kuangjia
else
	frame_type = frame_hangjia
end if
'构架类型
dim frame_layout_type
frame_layout_type = Request.Form("arg_frame_type_calc")
if frame_layout_type = "arg_frame_type_calc_yifu" then
	frame_layout_type = frame_layout_yifu
else
	frame_layout_type = frame_layout_duli
end if
'框架选材等级
dim frame_price_lv
frame_price_lv = CInt(Request.Form("arg_frame_lv"))
if frame_price_lv<1 or frame_price_lv>3 then
	frame_price_lv = price_lv2
end if

'屏蔽壳体 
dim sheld_type
sheld_type = CInt(Request.Form("arg_sheld"))
'屏蔽壳体选材等级
dim sheld_price_lv
sheld_price_lv = CInt(Request.Form("arg_sheld_lv"))
if sheld_price_lv<1 or sheld_price_lv>3 then
	sheld_price_lv = price_lv2
end if

'暗室检修系统
dim room_repair_price_lv
room_repair_price_lv = CInt(Request.Form("arg_repair_lv"))
if room_repair_price_lv<1 or room_repair_price_lv>3 then
	room_repair_price_lv = price_lv2
end if

'屏蔽门一维
dim door1_size_09_19
door1_size_09_19 = 1
dim door1_size_12_20
door1_size_12_20 = 2
dim door1_size_15_20
door1_size_15_20 = 3
dim door1_hand
door1_hand = 1
dim door1_auto
door1_auto = 2

dim door_2dao_4huang
door_2dao_4huang = 1
dim door_1dao_3huang
door_1dao_3huang = 2
dim door_1dao_2huang
door_1dao_2huang = 3
dim door_3dao_5huang
door_3dao_5huang = 4

dim door1_size
door1_size = CInt(Request.Form("arg_door_size_1ax"))
dim door1_count
door1_count = CInt(Request.Form("arg_door_count_1ax"))
dim door1_dao_huang
door1_dao_huang = CInt(Request.Form("arg_door_dao_1ax"))
dim door1_option
door1_option = CInt(Request.Form("arg_door_auto"))

'屏蔽门二维
dim door2_size_50_60
door2_size_50_60 = 1
dim door2_size_45_45
door2_size_45_45 = 2
dim door2_size_30_30
door2_size_30_30 = 3
dim door2_size_20_20
door2_size_20_20 = 4

dim door2_size
door2_size = CInt(Request.Form("arg_door_size_2ax"))
dim door2_count
door2_count = CInt(Request.Form("arg_door_count_2ax"))
dim door2_dao_huang
door2_dao_huang = CInt(Request.Form("arg_door_dao_2ax"))
dim door2_squit_lift
door2_squit_lift = Request.Form("arg_door_tool")
if door2_squit_lift then
	door2_squit_lift = true
else
	door2_squit_lift = false
end if

'屏蔽门选材等级
dim door_price_lv
door_price_lv = CInt(Request.Form("arg_door_lv"))

'过壁系统
dim sig_tran_300_300
sig_tran_300_300 = 1
dim sig_tran_400_400
sig_tran_400_400 = 2
dim u_through_100_150
u_through_100_150 = 1
dim u_through_150_200
u_through_150_200 = 2
dim line_hole_200_300
line_hole_200_300 = 1
dim line_hole_300_300
line_hole_300_300 = 2

'信号转接板
dim through_wall_sig_tran
through_wall_sig_tran = CInt(Request.Form("arg_signal_tran"))
Dim through_wall_sig_tran_count
through_wall_sig_tran_count = CInt(Request.Form("arg_signal_tran_count"))
'U型过壁管
dim u_through_wall
u_through_wall = CInt(Request.Form("arg_U_through"))
Dim u_through_wall_count
u_through_wall_count = CInt(Request.Form("arg_U_through_count"))
'电缆沟
dim line_hole
line_hole = CInt(Request.Form("arg_line_through"))
'过壁系统选材等级
dim through_price_lv
through_price_lv = CInt(Request.Form("arg_through_lv"))

'配电系统
dim room_power_suply
room_power_suply = CDbl(Request.Form("arg_signal_filter"))
room_power_suply = room_power_suply*10^3
'配电系统选材等级
dim room_power_suply_price_lv
room_power_suply_price_lv = CInt(Request.Form("arg_electric_lv"))

'照明系统
dim lamp_type_normal
lamp_type_normal = 1
dim lamp_type_led
lamp_type_led = 2
dim lamp_60w
lamp_60w = 1
dim lamp_100w
lamp_100w = 2
dim lamp_150w
lamp_150w = 3

'LED 节能灯 
dim lamp_type
lamp_type = CInt(Request.Form("arg_light_type"))
'照度
dim lamp_lux
lamp_lux = CDbl(Request.Form("arg_light_lux"))
'规格
dim lamp_power
lamp_power = CInt(Request.Form("arg_light_mode"))
select case lamp_power
	case lamp_60w
		lamp_power = 60
	case lamp_100w
		lamp_power = 100
	case lamp_150w
		lamp_power = 150
end select

'照明选材等级
dim lamp_price_lv
lamp_price_lv = CInt(Request.Form("arg_light_lv"))

'通风系统
'空调
dim air_supply_kongtiao
air_supply_kongtiao = Request.Form("arg_air_refresh_type1")
if air_supply_kongtiao then
	air_supply_kongtiao = true
else
	air_supply_kongtiao = false
end if
'新风系统
dim air_supply_new
air_supply_new = Request.Form("arg_air_refresh_type2")
if air_supply_new then
	air_supply_new = true
else
	air_supply_new = false
end if
'换风次数
dim air_refresh_count
air_refresh_count = CInt(Request.Form("arg_air_refresh_cnt"))
'通风系统选材等级 
dim air_system_price_lv
air_system_price_lv = CInt(Request.Form("arg_air_refresh_lv"))

'监控系统
dim camera_1080p
camera_1080p = 1
dim camera_720p
camera_720p = 2
dim camera_storage_4t
camera_storage_4t = 1
dim camera_storage_2t
camera_storage_2t = 2
dim monitor_size_40
monitor_size_40 = 1
dim monitor_size_55
monitor_size_55 = 2
dim camera_tran_light
camera_tran_light = 1
dim camera_tran_line_light
camera_tran_line_light = 2
dim camera_tran_line
camera_tran_line = 3

dim camera_count
camera_count = CInt(Request.Form("arg_camera_count"))
dim camera_pixal
camera_pixal = CInt(Request.Form("arg_camera_type"))
dim camera_capbility
camera_capbility = CInt(Request.Form("arg_camera_capbility"))
Dim camera_monitor_size
camera_monitor_size = CInt(Request.Form("arg_monitor_size"))
dim camera_tran_type
camera_tran_type = CInt(Request.Form("arg_attachment"))
dim camera_price_lv
camera_price_lv = CInt(Request.Form("arg_monitor_sys_lv"))


'语音对讲系统
dim voice_1_2
voice_1_2 = 1
dim voice_1_4
voice_1_4 = 2

dim p2p_voice_type
p2p_voice_type = CInt(Request.Form("arg_p2p_talk"))
dim p2p_voice_price_lv
p2p_voice_price_lv = CInt(Request.Form("arg_p2p_talk_lv"))

'消防系统
dim fire_safe_price_lv
fire_safe_price_lv = CInt(Request.Form("arg_fire_hole_lv"))

'接地系统
dim groud_system_build
groud_system_build = Request.Form("arg_ground_system")
if groud_system_build then
	groud_system_build = true
else
	groud_system_build = false
end if
dim groud_system_price_lv
groud_system_price_lv = CInt(Request.Form("arg_ground_system_lv"))

'吸波材料
dim wave_sorb_type_nanran
wave_sorb_type_nanran = 1
dim wave_sorb_type_haimian
wave_sorb_type_haimian = 2

dim wave_sorb_type
wave_sorb_type = CInt(Request.Form("arg_wave_sorb_type"))
dim wave_sorb_price_lv
wave_sorb_price_lv = CInt(Request.Form("arg_wave_sorb_lv"))


'计算
'结构用钢量
dim frame_iron_total
'框架结构
if frame_type = frame_kuangjia Then
'用钢量：=28*（L+W）*H*2+23*L*W+0.8*L*W
	frame_iron_total = 28*(room_length+room_width)*room_hight*2 + 23*room_length*room_width + 0.8*room_length*room_width
else
'桁架结构
'用钢量：=（28*（L+W）*H*2+23*L*W+0.8*L*W）*0.98
	frame_iron_total = (28*(room_length+room_width)*room_hight*2 + 23*room_length*room_width + 0.8*room_length*room_width)*0.98
end if

'屏蔽壳体
'用钢量：=0.3*（L*W*2+W*H*2+2*L*H）
Dim sheld_iron_total
sheld_iron_total = 0.3*(room_length*room_width*2 + room_width*room_hight*2 + 2*room_length*room_hight)

'电缆沟
'(L-2m)+W/2
Dim line_hole_total
line_hole_total = (room_length-2)+(room_width/2)

'滤波器
'非屏蔽没有滤波器和波导窗
'filter_total_count使用的滤波器数量
Dim filter_total_100_count
Dim filter_total_63_count
Dim filter_total_32_count
Dim filter_total_16_count
filter_total_100_count= 0
filter_total_63_count = 0
filter_total_32_count = 0
filter_total_16_count = 0
'filter_total_mode使用的滤波器规格
If is_pingbi Then
'滤波器额定电流A=P*1000/1.732/380 （或A=P*1000/3/220 ）   有16.32.63.100几种规格
	Dim filter_a
	filter_a = room_power_suply / 1.732 / 380
	do while filter_a >= 100
		filter_total_100_count = filter_total_100_count + 1
		filter_a = filter_a - 100
	Loop
	If filter_a > 63 Then
		filter_total_100_count = filter_total_100_count + 1
	ElseIf filter_a > 32 Then
		filter_total_63_count = 1
	ElseIf filter_a > 16 Then
		filter_total_32_count = 1
	Else
		filter_total_16_count = 1
	End if
Else
	filter_total_100_count = 0
	filter_total_63_count = 0
	filter_total_32_count = 0
	filter_total_16_count = 0
End If

'照明系统
Dim lamp_count_total
If lamp_type = lamp_type_normal Then
'节能灯多少W值为X(lamp_power)
'N=200lux*L*W/(X*0.7*100)/0.8/0.6(H<10m)
'N=200lux*L*W/(X*0.6*100)/0.8/0.6(H>10m)
	If room_hight < 10 Then
		lamp_count_total = lamp_lux * room_length * room_width / (lamp_power * 70) / 0.8 / 0.6
	Else 
		lamp_count_total = lamp_lux * room_length * room_width / (lamp_power * 60) / 0.8 / 0.6
	End If
Else
'led灯
'N=200lux*L*W/(X*0.9*100)/0.8/0.6(H<10m)
'N=200lux*L*W/(X*0.8*100)/0.8/0.6(H>10m)
	If room_hight < 10 Then
		lamp_count_total = lamp_lux * room_length * room_width / (lamp_power * 90) / 0.8 / 0.6
	Else
		lamp_count_total = lamp_lux * room_length * room_width / (lamp_power * 80) / 0.8 / 0.6
	End if
End If
lamp_count_total = Int(lamp_count_total) + 1


'空调系统通风量K=Y*L*W*H  Y:换风次数
'通风量
Dim air_refresh_total
air_refresh_total = air_refresh_count * room_length * room_width * room_hight
'通风管道长度=（Y/2）*W+L
Dim air_pipe_len_total
air_pipe_len_total = (air_refresh_count/2) * room_width + room_length
'频率<18G，采用孔径为0.5mm波导窗,排风口数量：=K/3600/0.3/0.3/0.75/3=进风口数量
'18G<频率<50G,采用孔径为0.32mm波导窗,排风口数量=进风口数量=K/3600/0.3/0.3/0.65/3
'频率>50G时，波导窗上增补Z型管屏蔽处理
Dim kongtiao_pipe_port_out_count
Dim kongtiao_pipe_port_in_count
Dim air_pipe_port_out_count
Dim air_pipe_port_in_count
'新风循环系统 进风口数量=排风口数量*1.5
If freq_max <= 18*10^9 Then
	kongtiao_pipe_port_out_count = Int(air_refresh_total/3600/0.3/0.3/0.75/3) + 1
Else
	kongtiao_pipe_port_out_count = Int(air_refresh_total/3600/0.3/0.3/0.65/3) + 1
End If
kongtiao_pipe_port_in_count = kongtiao_pipe_port_out_count
air_pipe_port_out_count = kongtiao_pipe_port_out_count
air_pipe_port_in_count = air_pipe_port_out_count * 1.5
air_pipe_port_in_count = Int(air_pipe_port_in_count) + 1


'吸波材料
Dim wave_sorb_iron_total
Dim wave_sorb_wood_total
Dim wave_sorb_area
If wave_sorb_type = wave_sorb_type_nanran Then
'难燃型
'用钢量=4.42*[L*W+(L+W)*H*2]
wave_sorb_iron_total = 4.42 * (room_length * room_width + (room_length+room_width) * room_hight * 2)
Else
'海绵型
'木板面积=L*W+(L+W)*H*2
wave_sorb_wood_total = room_length * room_width + (room_length+room_width) * room_hight * 2
End If
'吸波材料面积=（L*W+(L+W)*H）*2
wave_sorb_area = (room_length * room_width + (room_length+room_width)*room_hight) * 2

Dim wave_sorb_product_modal
Dim wave_sorb_product_price
Dim wave_sorb_product_bottom
Dim wave_sorb_product_size
Dim wave_sorb_niddle_count

set rs=server.createobject("adodb.recordset")

sql = "select * from wavesorb"

rs.open sql,conn,1,1

if rs.bof and rs.eof Then

Response.write("找不到合适的吸波材料")

Else

do while not rs.eof
'Response.write(rs("product_price"))
'Response.write("<br>")
rs.movenext
Loop

rs.close
set rs=Nothing

End if

CloseConn()

%>