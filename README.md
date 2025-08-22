
vim指令，打开后用i（a）进入插入文本模式
u撤销
:w保存文件
:q退出im
:wq保存并退出

赛前检查（命令行适用在程序一级目录如：@booster:~/work/striker$ ）：

1.wifi连接与IP查询（有线？）
ssh booster@192.168.29.X
ssh booster@192.168.10.102   //有线ssh
连接成功后传文件到Workspace(如果没有sdk包就多传一个sdk包）
编译sdk包：sudo ./install.sh(确保机器人连接的网络能够连接到因特网）
配网操作：
//nmcli device wifi list   //列出为wifi
//nmcli device wifi connect 网络名 password 密码 //出现，设备x成功以 "---" 激活。说明成功更换wifi
sudo nmtui        //图形化配置网络，第2个选项：连上场地网络，退到菜单进入第一个选项设置，固定ipv4为192.168.29.X/16（3v3）,192.168.41.X/16(5v5);Gateway 设置为路由器的网关192.168.X.1(场地号)。最后ok，回到第2个选项重联一次wifi！！！；
ifconfig          // 确定机器人ip(比赛要求的网段)

2.给予整个文件夹(如stricker整个文件夹)运行权限与解决乱码。
//如在striker文件夹上层输入//
chmod -R +x ./striker
chmod -R +x ./Midfielder
chmod -R +X ./goal_keeper
sed -i 's/\r$//' scripts/build.sh
sed -i 's/\r$//' scripts/start.sh
sed -i 's/\r$//' scripts/stop.sh  

3.brain.yaml(队伍号/队员ID/入场方向/修改裁判机gamecontrollerIP/rerun)
vim ./src/brain/config/brain.yaml
白名单ID（改为ie裁判机ID）vim ./src/game_controller/launch/launch.py

4.编译启动(查看是否vision正常启动)
./build.sh     //确定有7个包finished
./start.sh
tail -f vision.log

5.若vision版本不对，修改版本
vim ./src/vision/config/vision.yaml
  model_path: "./src/vision/model/best_orin.engine"   改为best_orin_10.3
                                  ^^^^^^^^^             
改完保存并重新编译，start重新检查好：tail -f vision.log

6.操作手柄，准备比赛。
