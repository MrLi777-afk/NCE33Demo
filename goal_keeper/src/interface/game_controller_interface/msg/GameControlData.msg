# Keep the structure consistent with RoboCupGameControlData in include/RoboCupGameControllData.h.

char[4] header              # header to identify the structure
uint16 version              # version of the data structure
uint8 packet_number          # number incremented with each packet sent (with wraparound)
uint8 players_per_team        # the number of players on a team
uint8 game_type              # type of the game (GAME_ROUNDROBIN, GAME_PLAYOFF, GAME_DROPIN)
uint8 state             
# STATE_INITIAL（0）：初始
# STATE_READY（1）：准备
# STATE_SET（2）：静止/就位
# STATE_PLAYING（3）：比赛进行中
# STATE_FINISHED（4）：比赛结束

uint8 first_half             # 1 = game in first half, 0 otherwise
uint8 kick_off_team           # the team number of the next team to kick off or DROPBALL
uint8 secondary_state       
# STATE2_NORMAL（0）：正常
# STATE2_PENALTYSHOOT（1）：点球大战
# STATE2_OVERTIME（2）：加时赛
# STATE2_TIMEOUT（3）：暂停
# STATE2_DIRECT_FREEKICK（4）：直接任意球
# STATE2_INDIRECT_FREEKICK（5）：间接任意球
# STATE2_PENALTYKICK（6）：点球
# STATE2_CORNER_KICK（7）：角球
# STATE2_GOAL_KICK（8）：球门球
# STATE2_THROW_IN（9）：掷界外球

char[4] secondary_state_info
# [0]：当前子状态下的开球队伍编号
# [1]：子状态阶段编号（如STOP、GET_READY、SET等）
# [2]、[3]：预留或其他用途
uint8 drop_in_team            # number of team that caused last drop in
uint16 drop_in_time           # number of seconds passed since the last drop in. -1 (0xffff) before first dropin
uint16 secs_remaining        # estimate of number of seconds remaining in the half
uint16 secondary_time        # number of seconds shown as secondary time (remaining ready, until free ball, etc)
TeamInfo[2] teams