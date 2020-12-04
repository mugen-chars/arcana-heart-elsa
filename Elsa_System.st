
;=================================================================================
 | ホ ー ミ ン グ|
;=================================================================================


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;ニュートラルホーミング / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 900]
type     = A
movetype = I
physics  = N
ctrl     = 0
velset   = 0, 0

[State 900]
Type     = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

[State 900]
type = velset
trigger1 = time = 2
Y = -0.1

;-------------------------------------------------[アニメ変更]

[state 900]
type     = changeanim
trigger1 = !time
trigger1 = Pos Y < 0
value    = 901

[state 900]
type     = changeanim
trigger1 = !time
trigger1 = Pos Y >= 0
value    = 900

[State 900]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

;------------------------------------------[ステート変更]

[State a]
Type     = Helper
Trigger1 = !time
Name     = "Homing"
Stateno  = 8900
ID       = 8900
Pos      = 0, -50
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 0;99999
PauseMoveTime = 0;99999
IgnoreHitPause = 1
Persistent = 0

[State 900, a]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 910



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;キャンセルホーミング / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 905]
type     = A
movetype = I
physics  = N
ctrl     = 0

[State 905]
Type = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

[State 905, 速度]
type     = VelSet
Trigger1 = !time
X = 0
Y = -0.1

;-------------------------------------------------[アニメ変更]

[state 905]
type     = changeanim
trigger1 = !time
trigger1 = Pos Y < 0
value    = 901

[state 905]
type     = changeanim
trigger1 = !time
trigger1 = Pos Y >= 0
value    = 900

[State 905]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 905, 判定リセット]
type     = Varset
Trigger1 = !time
var(0)   = 0

;------------------------------------------[変数処理]

[State 905, キャンセル判定]
type       = Varset
TriggerAll = !time
trigger1 = prevstateno = [200,225]		;立ち
trigger2 = prevstateno = [400,420]		;しゃがみ
trigger3 = prevstateno = [600,620]		;空中
trigger4 = prevstateno = [300,320]		;吹っ飛ばし
trigger5 = prevstateno = [1000,1050]	;サントゥクス系統
trigger6 = prevstateno = [1100,1160]	;クレド系統
trigger7 = prevstateno = [1200,1210]	;グロリア系統
trigger8 = prevstateno = [1300,1305]	;キリエ系統
trigger9 = prevstateno = [1400,1460]	;ベネディクトゥス系統
trigger10= prevstateno = [1500,1505]	;アニュス系統
trigger11= prevstateno = [1600,1610]	;コムニオ系統
trigger12= prevstateno = [2000,2050]	;ランケオラ系統
trigger12= prevstateno = [2100,2150]	;グラディウス系統
trigger13= prevstateno = [2200,2250]	;セキュリス系統
trigger14= prevstateno = [800,850]	    ;投げ系統
var(0)   = 1

[state 905, 回復停止];キャンセル判定
type       = Varset
triggerAll = !time
TriggerAll = fvar(22) < 30
trigger1   = var(0) = 1
fVar(22)    = 30

[state 905, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = !time
trigger1 =var(0) = 1
fVar(20) = -1000

;---------------------------------------------

[State a];ホーミング補正
type       = VarAdd
TriggerAll = !Time
Trigger1   = PrevstateNo = [200, 2500]
fvar(3)    = (1.0-fvar(3))*0.3

;------------------------------------------[ステート変更]

[State a]
Type     = Helper
Trigger1 = !time
Name     = "Homing"
Stateno  = 8900
ID       = 8900 + var(0)
Pos      = 0, -50
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 0;99999
PauseMoveTime = 0;99999
IgnoreHitPause = 1
Persistent = 0

[State 905, a]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 910



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラルホーミング / 移動中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 910]
type     = A
movetype = I
physics  = N
ctrl     = 0
sprpriority = 1

[State 910, 効果音]
type     = PlaySnd
trigger1 = animelem = 1
trigger2 = gametime%18 = 0
value    = 10, 1

[State a]
Type     = Helper
trigger1 = time != 0
trigger1 = gametime % 17 = 0
Name     = "hit"
Stateno  = 8910
ID       = 8910
Pos      = 0, -60
PosType  = P1
OwnPal   = 1
size.xscale = 0.5
size.yscale = 0.5
SuperMoveTime = 999
PauseMoveTime = 999


[State -2, 相手のＸ座標]
type     = VarSet
trigger1 = 1
fvar(25) = (P2Dist X *1.01) / 10

[State -2, 相手のY座標]
type     = null;VarSet
trigger1 = 1
fvar(26) = (P2BodyDist Y + 10)/ 10

[State -2, 相手のY座標]
type     = VarSet
trigger1 = 1
fvar(26) = (P2Dist Y + enemynear(0),const(size.mid.pos.y)*0.5) / 10

;-----------------------------------------------[アニメ変更]

[State 910, アニメ変更];上
Type     = Changeanim
Trigger1 = anim != 905
Trigger1 = command != "holddown"
Trigger1 = Vel Y < -3.0
value    = 905

[State 910, アニメ変更];横
Type     = Changeanim
Trigger1 = anim != 906
Trigger1 = (command != "holdup")||(command != "holddown")
Trigger1 = (Vel Y = [-3.0, 3.0])
value    = 906

[State 910, アニメ変更];下
Type     = Changeanim
Trigger1 = anim != 907
Trigger1 = command != "holdup"
Trigger1 = Vel Y > 3.0
value    = 907

;=====================================[加速制御]

[State 910, リセット]
type     = Varset
trigger1 = !time
fvar(27) = 1.0

[State 910, リセット]
type     = Varset
Trigger1 = Command = "z"
Trigger1 = fvar(27) = 1.0
fvar(27) = 1.3

[State 910, リセット]
type     = Varset
Trigger1 = Command = "z"
Trigger1 = fvar(27) = 1.3
fvar(27) = 1.5

;=====================================[旋回パターン]

[State 910, 速度]
type       = VelAdd
trigger1   = Vel X < (9 * FVar(27))
X          = (0.9 * Cos(Atan(fvar(26)/fvar(25))))*(FVar(27))

[State 910, 速度]
type       = VelAdd
triggerAll = P2BodyDist X >= 31
trigger1   = Vel Y = [(-12 * FVar(27)),(12 * FVar(27))]
Y          = (0.9 * Sin(Atan(FVar(26)/FVar(25))))*(FVar(27)*0.9)   ;旧1.5

[state 910, 速度] ;近距離
type       = VelAdd
triggerall = Vel Y < (10 * FVar(27))
trigger1   = P2BodyDist X <= 30
trigger1   = P2Dist Y > 20
Y          = 1.5*(FVar(27))

[state 910, 速度] ;近距離
type       = VelAdd
triggerall = Vel Y > (-10 * FVar(27))
trigger1   = P2BodyDist X <= 30
trigger1   = P2Dist Y < -20
Y          = -1.5*(FVar(27))


;=====================================[レバー入力(横移動)]

[State 4100, レバー入力]
type     = VarSet
Trigger1 = !time
trigger2 = (Command != "holdup")&&(Command != "holddown")&&(Command != "holdback")&&(Command != "holdfwd")
trigger3 = abs(FVar(26)) > abs(FVar(25))
var(40)  = 0

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(25) >= abs(FVar(26))
trigger1 = Command = "holdup"
trigger1 = (Command != "holddown")&&(Command != "holdfwd")&&(Command != "holdback")
var(40)  = 8

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(25) >= abs(FVar(26))
trigger1 = Command = "holdfwd"
trigger1 = (Command != "holddown")&&(Command != "holdup")&&(Command != "holdback")
var(40)  = 6

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(25) >= abs(FVar(26))
trigger1 = Command = "holdback"
trigger1 = (Command != "holddown")&&(Command != "holdfwd")&&(Command != "holdup")
var(40)  = 4

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(25) >= abs(FVar(26))
trigger1 = Command = "holddown"
trigger1 = (Command != "holdup")&&(Command != "holdfwd")&&(Command != "holdback")
var(40)  = 2

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(25) >= abs(FVar(26))
trigger1 = (Command = "holdup") && (Command = "holdback")
trigger1 = (Command != "holddown")&&(Command != "holdfwd")
var(40)  = 7

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(25) >= abs(FVar(26))
trigger1 = (Command = "holdup") && (Command = "holdfwd")
trigger1 = (Command != "holddown")&&(Command != "holdback")
var(40)  = 9

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(25) >= abs(FVar(26))
trigger1 = (Command = "holddown") && (Command = "holdback")
trigger1 = (Command != "holdup")&&(Command != "holdfwd")
var(40)  = 1

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(25) >= abs(FVar(26))
trigger1 = (Command = "holddown") && (Command = "holdfwd")
trigger1 = (Command != "holdup")&&(Command != "holdback")
var(40)  = 3

;=====================================[レバー入力(縦移動)]

[State 4100, レバー入力]
type     = VarSet
TriggerAll = P2BodyDist Y >= 100 || P2BodyDist Y <= -100
Trigger1 = !time
trigger2 = (Command != "holdup")&&(Command != "holddown")&&(Command != "holdback")&&(Command != "holdfwd")
trigger3 = FVar(25)+10 >= abs(FVar(26))
var(41)  = 0

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(26) >= abs(FVar(25)) + 10
TriggerAll = P2BodyDist Y >= 100 || P2BodyDist Y <= -100
trigger1 = Command = "holdup"
trigger1 = (Command != "holddown")&&(Command != "holdfwd")&&(Command != "holdback")
var(41)  = 8

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(26) >= abs(FVar(25)) + 10
TriggerAll = P2BodyDist Y >= 100 || P2BodyDist Y <= -100
trigger1 = Command = "holddown"
trigger1 = (Command != "holdup")&&(Command != "holdfwd")&&(Command != "holdback")
var(41)  = 2

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(26) >= abs(FVar(25)) + 10
TriggerAll = P2BodyDist Y >= 100 || P2BodyDist Y <= -100
trigger1 = Command = "holdfwd"
trigger1 = (Command != "holddown")&&(Command != "holdup")&&(Command != "holdback")
var(41)  = 6

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(26) >= abs(FVar(25)) + 10
TriggerAll = P2BodyDist Y >= 100 || P2BodyDist Y <= -100
trigger1 = Command = "holdback"
trigger1 = (Command != "holddown")&&(Command != "holdfwd")&&(Command != "holdup")
var(41)  = 4

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(26) >= abs(FVar(25)) + 10
TriggerAll = P2BodyDist Y >= 100 || P2BodyDist Y <= -100
trigger1 = (Command = "holdup") && (Command = "holdback")
trigger1 = (Command != "holddown")&&(Command != "holdfwd")
var(41)  = 7

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(26) >= abs(FVar(25)) + 10
TriggerAll = P2BodyDist Y >= 100 || P2BodyDist Y <= -100
trigger1 = (Command = "holdup") && (Command = "holdfwd")
trigger1 = (Command != "holddown")&&(Command != "holdback")
var(41)  = 9

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(26) >= abs(FVar(25)) + 10
TriggerAll = P2BodyDist Y >= 100 || P2BodyDist Y <= -100
trigger1 = (Command = "holddown") && (Command = "holdback")
trigger1 = (Command != "holdup")&&(Command != "holdfwd")
var(41)  = 1

[State 4100, レバー操作]
type     = VarSet
triggerAll = FVar(26) >= abs(FVar(25)) + 10
TriggerAll = P2BodyDist Y >= 100 || P2BodyDist Y <= -100
trigger1 = (Command = "holddown") && (Command = "holdfwd")
trigger1 = (Command != "holdup")&&(Command != "holdback")
var(41)  = 3

;=====================================[レバー反映]

[State 4100];遠距離(後方入力)
type       = VelSet
TriggerAll = FVar(25) >= abs(FVar(26))
TriggerAll = P2BodyDist X >= 20
Trigger1 = (Var(40) = 7) || (Var(40) = 4) || (Var(40) = 1)
Trigger1 = (Var(41) != [1,8])
Trigger1 = time <= 15
X = 1.0 + FVar(12)

;[State 4100] ;(下方向修正)
;type    = VelSet
;TriggerAll = FVar(26) >= abs(FVar(25)) + 10
;TriggerAll = P2BodyDist X >= 120
;TriggerAll = P2BodyDist Y <= -100
;Trigger1 = (Var(41) = 1) ||(Var(41) = 2) ||(Var(41) = 3)
;Trigger1 = !(Vel X > 0)
;Trigger1 = time <= 13
;Y = -1.0 + FVar(12)

[State 4100, 速度] ;(遠距離:下入力)
type     = VelSet
TriggerAll = FVar(25) >= abs(FVar(26))
Trigger1 = P2BodyDist X >= 40
Trigger1 = (Var(40) = 1) || (Var(40) = 2)
Trigger1 = (Var(41) != [1,8])
Y = 4

[state 4100, 速度] ;(遠距離:上入力)
type     = VelSet
TriggerAll = FVar(25) >= abs(FVar(26))
Trigger1 = P2BodyDist X = [150, 330]
Trigger1 = (Var(40) = 7) || (Var(40) = 8)
Trigger1 = (Var(41) != [1,8])
Y = -2.5

;[state 4100, 速度] ;(近距離:下入力)
;type     = VelSet
;Trigger1 = P2BodyDist X < 60
;Trigger1 = (Var(40) = 7) || (Var(40) = 8) || (Var(41) = 7) || (Var(41) = 8)
;Trigger1 = Vel Y > 3
;Y = 3

[state 4100, 速度] ;(近距離:上入力)
type     = VelSet
Trigger1 = P2BodyDist X = [50,149]
Trigger1 = (Var(40) = 1) || (Var(40) = 2) || (Var(41) = 1) || (Var(41) = 2)
Trigger1 = Vel Y < -3
Y = -1

;--------------------------------------------------[上下]

[State 4100, 速度] ;(遠距離:前方入力)
type     = VelSet
TriggerAll = FVar(26) >= abs(FVar(25)) + 10
Trigger1 = (P2BodyDist Y >= 150) || (P2BodyDist Y <= -150)
Trigger1 = (Var(41) = 3) || (Var(41) = 6) || (Var(41) = 9) 
Trigger1 = (Var(40) != [1,8])
X = 5

[State 4100, 速度] ;(遠距離:後方入力)
type     = VelSet
TriggerAll = FVar(26) >= abs(FVar(25)) + 10
Trigger1 = (P2BodyDist Y >= 150) || (P2BodyDist Y <= -150)
Trigger1 = (Var(41) = 1) || (Var(41) = 4) || (Var(41) = 7) 
Trigger1 = (Var(40) != [1,8])
X = -5

[State 4100, 速度] ;(中距離:前方入力)
type     = VelSet
TriggerAll = FVar(26) >= abs(FVar(25)) + 10
Trigger1 = (P2BodyDist Y = [120,149]) || (P2BodyDist Y = [-149, -120])
Trigger1 = (Var(41) = 3) || (Var(41) = 6) || (Var(41) = 9) 
Trigger1 = (Var(40) != [1,8])
X = 3

[State 4100, 速度] ;(中距離:後方入力)
type     = VelSet
TriggerAll = FVar(26) >= abs(FVar(25)) + 10
Trigger1 = (P2BodyDist Y = [120,149]) || (P2BodyDist Y = [-149, -120])
Trigger1 = (Var(41) = 1) || (Var(41) = 4) || (Var(41) = 7) 
Trigger1 = (Var(40) != [1,8])
X = -3

;-------------------------------------------------[ゴールしてもいいよね]

[state 4100, 速度減速] ;停止用
type     = VelSet
trigger1 = P2bodydist X <= 20
trigger1 = P2bodydist Y = [-190,150]
X        = 0

[state 4100, 速度減速] ;停止用
type     = null;VelSet
trigger1 = P2bodydist X <= 10
trigger1 = P2bodydist Y != [-150,150]
X        = 0

[State 4100, 終了]
type     = PosSet
trigger1 = pos y > 0
Y        = 0

[State 4100, 終了]
type     = ChangeState
trigger1 = command = "holddown"
trigger1 = pos y >= 0
value    = 52


[state 4100, ステート変更]
type     = changestate
trigger1 = P2bodydist X <= 30        ;相手に接触で解除
trigger1 = P2bodydist Y = [-20,20]
trigger2 = RoundState != 2           ;ラウンド終了後に解除
value    = 915

[State 4100, 終了]
type = ChangeState
trigger1 = p2bodydist x <= 10
trigger1 = p2dist y + var(21) = [-5,5]
trigger2 = abs(P2bodyDist X) <= 20 && abs(P2bodyDist Y) <= 30;50
trigger3 = p2bodydist x < 0 && P2bodyDist Y = [-50,50]
value = 915





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラルホーミング / 終了
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 915]
type     = A
movetype = I
physics  = N
anim     = 910
ctrl     = 1

[State 915]
type     = turn
trigger1 = p2dist x < -10

[state 915]
type     = Velmul
trigger1 = 1
X        = 0.82

[state 915]
type     = velmul
trigger1 = time < 6
y        = 0.92

[state 915]
type     = veladd
trigger1 = time >= 6
y        = 0.45

[State 915]
type     = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value    = 52



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; レバー入れホーミング / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 920]
type     = A
movetype = I
physics  = N
ctrl     = 0
velset   = 0, 0

[State 920]
Type = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

;------------------------------------------[開始処理]

[State 920]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

;-------------------------------------------------[アニメ変更]

[state 920, up];上入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holdup"
trigger1 = (command != "holdfwd") && (command != "holdback")
value    = 918

[state 920, fwdup];前上入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holdup") && (command = "holdfwd")
trigger1 = (command != "holdback")
value    = 919

[state 920, backup];後上入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holdup") && (command = "holdback")
trigger1 = (command != "holdfwd")
value    = 917

[state 920, back];後入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holdback"
trigger1 = (command != "holdup") && (command != "holddown")
value    = 914

[state 920, fwd];前入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holdfwd"
trigger1 = (command != "holdup") && (command != "holddown")
value    = 916

[state 920, down];下入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holddown"
trigger1 = (command != "holdfwd") && (command != "holdback")
value    = 912

[state 920, fwddown];前下入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holddown") && (command = "holdfwd")
trigger1 = (command != "holdback")
value    = 913

[state 920, backdown];後下入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holddown") && (command = "holdback")
trigger1 = (command != "holdfwd")
value    = 912

;-------------------------------------------------[速度変更]

[state 920]
type     = VelSet
trigger1 = !time
trigger1 = (anim = 911)||(Anim = 912)||(Anim = 913)
X = ifelse(Anim=911, -5.5, ifelse(Anim=912, 0, 5.5))
Y = 5.5

[state 920]
type     = VelSet
trigger1 = !time
trigger1 = (anim = 914)||(Anim = 916)
X        = ifelse(Anim=914, -5.5, 5.5)

[state 920]
type     = VelSet
trigger1 = !time
trigger1 = (anim = 917)||(Anim = 918)||(Anim = 919)
X = ifelse(Anim=917, -5.5, ifelse(Anim=918, 0, 5.5))
Y = -5.5

[state 920, 減速]
type     = Velmul
trigger1 = vel x < 0
x        = 0.95

[state 920, 減速]
type     = Velmul
trigger1 = vel y != 0
y        = 0.95

[State 920, Nothit];完全無敵
type     = Nothitby
Trigger1 = (Anim=911)||(Anim=914)||(Anim=917)
Trigger1 = Time = [1,7]
value    = SCA,AA,AT,AP
time     = 1

;-------------------------------------------------[速度変更]

[State 920]
type     = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value    = 52

[State 920, a]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 910



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;空中 / キャンセルレバーホーミング / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 925]
type     = A
movetype = I
physics  = N
ctrl     = 0
velset   = 0,0

[State 925]
Type = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

;------------------------------------------[開始処理]

[State 925]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 925, 判定リセット]
type     = Varset
Trigger1 = !time
var(0)   = 0

;------------------------------------------[変数処理]

[State 925, キャンセル判定]
type       = Varset
TriggerAll = !time
trigger1 = prevstateno = [200,225]		;立ち
trigger2 = prevstateno = [400,420]		;しゃがみ
trigger3 = prevstateno = [600,620]		;空中
trigger4 = prevstateno = [300,320]		;吹っ飛ばし
trigger5 = prevstateno = [1000,1050]	;サントゥクス系統
trigger6 = prevstateno = [1100,1160]	;クレド系統
trigger7 = prevstateno = [1200,1210]	;グロリア系統
trigger8 = prevstateno = [1300,1305]	;キリエ系統
trigger9 = prevstateno = [1400,1460]	;ベネディクトゥス系統
trigger10= prevstateno = [1500,1505]	;アニュス系統
trigger11= prevstateno = [1600,1610]	;コムニオ系統
trigger12= prevstateno = [2000,2050]	;ランケオラ系統
trigger12= prevstateno = [2100,2150]	;グラディウス系統
trigger13= prevstateno = [2200,2250]	;セキュリス系統
trigger14= prevstateno = [800,850]	    ;投げ系統
var(0)   = 1

[state 925, 回復停止];キャンセル判定
type       = Varset
triggerAll = !time
TriggerAll = fvar(22) < 30
trigger1   = var(0) = 1
fVar(22)    = 30

[state 925, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = !time
trigger1 =var(0) = 1
fVar(20) = -1000

;---------------------------------------------

[State a];ホーミング補正
type       = VarAdd
TriggerAll = !Time
Trigger1   = PrevstateNo = [200, 2500]
fvar(3)    = (1.0-fvar(3))*0.3

;-------------------------------------------------[アニメ変更]

[state 925, up];上入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holdup"
trigger1 = (command != "holdfwd") && (command != "holdback")
value    = 918

[state 925, fwdup];前上入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holdup") && (command = "holdfwd")
trigger1 = (command != "holdback")
value    = 919

[state 925, backup];後上入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holdup") && (command = "holdback")
trigger1 = (command != "holdfwd")
value    = 917

[state 925, back];後入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holdback"
trigger1 = (command != "holdup") && (command != "holddown")
value    = 914

[state 925, fwd];前入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holdfwd"
trigger1 = (command != "holdup") && (command != "holddown")
value    = 916

[state 925, down];下入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holddown"
trigger1 = (command != "holdfwd") && (command != "holdback")
value    = 912

[state 925, fwddown];前下入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holddown") && (command = "holdfwd")
trigger1 = (command != "holdback")
value    = 913

[state 925, backdown];後下入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holddown") && (command = "holdback")
trigger1 = (command != "holdfwd")
value    = 912

;-------------------------------------------------[速度変更]

[State 925]
type     = VelSet
trigger1 = !time
trigger1 = (anim = 911)||(Anim = 912)||(Anim = 913)
X = ifelse(Anim=911, -4.5, ifelse(Anim=912, 0, 4.5))
Y = 4.5

[State 925]
type     = VelSet
trigger1 = !time
trigger1 = (anim = 914)||(Anim = 916)
X        = ifelse(Anim=914, -4.5, 4.5)

[State 925]
type     = VelSet
trigger1 = !time
trigger1 = (anim = 917)||(Anim = 918)||(Anim = 919)
X = ifelse(Anim=917, -4.5, ifelse(Anim=918, 0, 4.5))
Y = -4.5

[state 42050, 減速]
type     = Velmul
trigger1 = vel x < 0
x        = 0.95

[state 925, 減速]
type     = Velmul
trigger1 = vel y != 0
y        = 0.95

[state 925, Nothit];完全無敵
type     = Nothitby
Trigger1 = (Anim=911)||(Anim=914)||(Anim=917)
Trigger1 = Time = [1,7]
value    = SCA,AA,AT,AP
time     = 1

;-------------------------------------------------[速度変更]

[State 925]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52

[State 925, a]
type = ChangeState
trigger1 = AnimTime = 0
value = 910



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 前ホーミングダッシュ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 930]
type     = S
movetype = I
physics  = N
anim     = 920
ctrl     = 0

;-------------------------------------------------[]

[State 930]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 930]
Type     = PosSet
Trigger1 = StateType=S
y        = 0

[state 930, explod];砂煙
Type     = Explod
trigger1 = time = 1
trigger2 = gametime % 8 = 0
anim     = 8105
sprpriority = 3
pos      = -30,0
OwnPal   = 1
Scale    = 0.75, 0.75
id       = 8105

;------------------------------------------[開始処理]

[State 930]
Type     = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

[State 930]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 930, 効果音]
type     = null;PlaySnd
trigger1 = animelemtime(3) = 0
trigger2 = animelemtime(3) >0 && gametime%18 = 0
value    = s10, 0

[state 930];速度
type     = velset
trigger1 = AnimelemTime(3)>=0
X        = 5

;------------------------------------------[変数処理]

[State a];ホーミング補正
type       = VarAdd
TriggerAll = !Time
Trigger1   = PrevstateNo = [200, 1900]
fvar(3)    = (1.0-fvar(3))*0.3

[State 930, 判定リセット]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 930, キャンセル判定]
type       = Varset
TriggerAll = !time
trigger1 = prevstateno = [200,225]		;立ち
trigger2 = prevstateno = [400,420]		;しゃがみ
trigger3 = prevstateno = [600,620]		;空中
trigger4 = prevstateno = [300,320]		;吹っ飛ばし
trigger5 = prevstateno = [1000,1050]	;サントゥクス系統
trigger6 = prevstateno = [1100,1160]	;クレド系統
trigger7 = prevstateno = [1200,1210]	;グロリア系統
trigger8 = prevstateno = [1300,1305]	;キリエ系統
trigger9 = prevstateno = [1400,1460]	;ベネディクトゥス系統
trigger10= prevstateno = [1500,1505]	;アニュス系統
trigger11= prevstateno = [1600,1610]	;コムニオ系統
trigger12= prevstateno = [2000,2050]	;ランケオラ系統
trigger12= prevstateno = [2100,2150]	;グラディウス系統
trigger13= prevstateno = [2200,2250]	;セキュリス系統
trigger14= prevstateno = [800,850]	    ;投げ系統
var(0)   = 1

[state 930, 回復停止];キャンセル判定
type       = Varset
triggerAll = !time
TriggerAll = fvar(22) < 30
trigger1   = var(0) = 1
fVar(22)   = 30

[state 930, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = !time
trigger1 = var(0) = 1
fVar(20) = -1000

;---------------------------------------------

[State 930];強制終了
Type       = ChangeState
TriggerAll = AnimelemTime(3) >= 0
Trigger1   = RoundState = 3
value      = 935
Ctrl       = 1

[State 930];相手に接触後に停止
Type       = ChangeState
TriggerAll = AnimelemTime(3) >= 0
TriggerAll = command != "holdz"
Trigger1   = p2bodydist x <= 10
value      = 935
Ctrl       = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上/ホーミングダッシュ・停止
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[StateDef 935]
Type     = S
Movetype = I
Physics  = S
SprPriority = 2
anim = 940

[State 935]
type     = VelSet
trigger1 = !time
Y        = 0

[State a]
type     = Posset
trigger1 = 1
Y        = 0

[State a, AssertSpecial];特殊な状況
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoWalk		;歩けない
Flag2    = NoAutoTurn	;ターンしない

[State a, AssertSpecial];特殊な状況
Type     = AssertSpecial
Trigger1 = Time < 17
Flag     = NoStandGuard
Flag2    = NoCrouchGuard
Flag3    = NoAirGuard

[State a, VelMul]
Type     = VelMul
Trigger1 = 1
X        = 0.88

[State a, ChangeState]
Type     = ChangeState
Trigger1 = AnimTime = 0
Value    = 0
Ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 後ホーミングダッシュ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 940]
type     = S
movetype = I
physics  = N
anim     = 930
ctrl     = 0

[state a]
type      = Statetypeset
trigger1  = pos y < 0
statetype = A

[State 940, nothit];完全無敵
type     = Nothitby
Trigger1 = Time = [1,10]
value    = SCA,AA,AT,AP
time     = 1

;------------------------------------------[変数処理]

[State a];ホーミング補正
type       = VarAdd
TriggerAll = !Time
Trigger1   = PrevstateNo = [200, 1900]
fvar(3)    = (1.0-fvar(3))*0.3

[State 940, 判定リセット]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 940, キャンセル判定]
type       = Varset
TriggerAll = !time
trigger1 = prevstateno = [200,225]		;立ち
trigger2 = prevstateno = [400,420]		;しゃがみ
trigger3 = prevstateno = [600,620]		;空中
trigger4 = prevstateno = [300,320]		;吹っ飛ばし
trigger5 = prevstateno = [1000,1050]	;サントゥクス系統
trigger6 = prevstateno = [1100,1160]	;クレド系統
trigger7 = prevstateno = [1200,1210]	;グロリア系統
trigger8 = prevstateno = [1300,1305]	;キリエ系統
trigger9 = prevstateno = [1400,1460]	;ベネディクトゥス系統
trigger10= prevstateno = [1500,1505]	;アニュス系統
trigger11= prevstateno = [1600,1610]	;コムニオ系統
trigger12= prevstateno = [2000,2050]	;ランケオラ系統
trigger12= prevstateno = [2100,2150]	;グラディウス系統
trigger13= prevstateno = [2200,2250]	;セキュリス系統
trigger14= prevstateno = [800,850]	    ;投げ系統
var(0)   = 1

[state 940, 回復停止];キャンセル判定
type       = Varset
triggerAll = !time
TriggerAll = fvar(22) < 30
trigger1   = var(0) = 1
fVar(22)   = 30

[state 940, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = !time
trigger1 = var(0) = 1
fVar(20) = -1000

;-------------------------------------------------[演出]

[State 940]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 940]
Type     = PosSet
Trigger1 = StateType=S
Y        = 0

[state 940, explod];砂煙
Type = Explod
triggerall = time > 18 
trigger1 = gametime % 10 = 0
anim = 8105
sprpriority = 3
pos = 0,0
OwnPal = 1
Scale    = 0.75, 0.75
id = 8105

;------------------------------------------[開始処理]

[State 940]
Type     = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

[State 940]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 940, 効果音]
type     =null; PlaySnd
trigger1 = animelemtime(4) = 0
trigger2 = animelemtime(4) >0 && gametime%18 = 0
value    = 10, 52

[State 940, velset]
Type     = VelSet
Trigger1 = !Time
X        = -5.5

[State 940, velset]
Type     = Velmul
Trigger1 = animelem=2
X        = 0.85

[state 940];速度
type     = velset
trigger1 = AnimelemTime(4)>=0
X        = 5

[State 940];強制終了
Type       = ChangeState
TriggerAll = AnimelemTime(4) >= 0
Trigger1   = RoundState = 3
value      = 945
Ctrl       = 1

[State 940];相手に接触後に停止
Type       = ChangeState
TriggerAll = AnimelemTime(4) >= 0 
Trigger1   = p2bodydist x <= 5
value      = 935
Ctrl       = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ガードキャンセル (前)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 950]
type     = S
movetype = I
physics  = N
ctrl     = 0

[state 950]
type     = Turn
Trigger1 = (!time) && (Prevstateno != 955)
trigger1 = p2dist x < 0

;-------------------------------------------------[アニメ変更]

[State 950, アニメ]
type     = ChangeAnim
trigger1 = (!time) && (PrevStateNo != 955)
Trigger1 = Anim != 950
value    = 950

;-------------------------------------------------[演出]

[State 950]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 950]
Type     = PosSet
Trigger1 = StateType = S
Trigger2 = Pos y >= 0
Y        = 0

[State 950, 効果音];ホーミング発動
Type     = PlaySnd
Trigger1 = (!Time) && (Prevstateno != 955)
value    = s10, 0

[State 950, 速度]
type     = Velset
Trigger1 = 1
X        = 5.5

;-------------------------------------------------[キャンセル処理]

[State a];ホーミング補正
type       = VarAdd
TriggerAll = !Time
Trigger1   = (PrevstateNo = [200, 1900])&&(PrevStateNo != 955)
fvar(3)    = (1.0-fvar(3))*0.3

[state a, 回復停止];キャンセル判定
type     = Varset
trigger1 = fvar(22) < 60
trigger1 = (!time) && (PrevStateNo != 955)
fVar(22) = 60
IgnoreHitPause = 1
persistent = 0

[state a, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = (!time) && (PrevStateNo != 955)
fVar(20) = -1000
IgnoreHitPause = 1
persistent = 0

;-------------------------------------------------[エフェクト]

[State a];エフェクト
Type     = Helper
Trigger1 = NumHelper(7950) = 0
Trigger1 = Animelemtime(8) < 0
Name     = "GuardC"
Stateno  = 7950
ID       = 7950
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[state 950, explod];砂煙
Type     = Explod
trigger1 = Animelemtime(8) >= 0
trigger1 = gametime % 8 = 0
anim     = 8105
sprpriority = 5
pos      = -30,0
OwnPal   = 1
Scale    = 0.75, 0.75
id       = 8105

;-------------------------------------------------[相殺設定]

[State a]
type     = HitOverRide
trigger1 = Animelemtime(8) < 0
stateno  = 955
time     = 0
attr     = SCA,AA,AP
ignorehitpause = 1

;------------------------------------------[終了]

[State 950];相手に接触後に停止
Type       = ChangeState
trigger1   = Animelemtime(8) >= 0 
Trigger1   = P2bodydist x <= 10
Trigger1   = command != "holdz"
value      = 935
Ctrl       = 0


;============================================================
; ガードキャンセル / 硬直
;============================================================
[Statedef 955]
type     = U
movetype = H
physics  = U
ctrl     = 0

[State 955, 特殊]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 955, 無敵]
type     = NotHitBy
trigger1 = 1
value    = SCA, AA,AT,AP

[State 955, アニメ固定]
type     = Changeanim
trigger1 = 1
value    = anim
elem     = animelemno(0)
ignorehitpause = 1
persistent = 1

[State 955, 座標]
type     = PosFreeze
trigger1 = 1
value    = 1
persistent = 1

;------------------------------------------[演出]

[State 955, 画面振動]
type     = EnvShake
trigger1 = !time
time     = 15
ampl     = 4

[State 955, ダメージ調整]
type     = Lifeadd
trigger1 = !time
trigger1 = Gethitvar(damage) > 0
value    = floor((gethitvar(damage)) *ifelse(life<(lifemax*0.50),fvar(30),1))
ignorehitpause = 1
persistent = 1

[State 相殺エフェクト]
Type     = Helper
Trigger1 = !time
Name     = "Sousai"
Stateno  = 7955
ID       = 7955
Pos      = 10, -55
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;------------------------------------------[終了]

[State 955, ステート変更]
type     = ChangeState
trigger1 = Alive
trigger1 = Statetime > gethitvar(hitshaketime)
value    = 950
ctrl     = 1
ignorehitpause = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ガードキャンセル (後)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 960]
type     = S
movetype = I
physics  = N
ctrl     = 0

[State 960, アニメ]
type     = ChangeAnim
trigger1 = (!time) && (PrevStateNo != 965)
Trigger1 = Anim != 960
value    = 960

[State 960]
Type     = turn
Trigger1 = (!Time) && (prevStateNo != 965)
Trigger1 = P2Dist X < 0

[State a]
type     = NotHitBy
trigger1 = Animelemtime(1) < 17
value    = SCA,AA,AP
time     = 1

[state a]
type      = StateTypeSet
trigger1  = !time
statetype = A

[state a]
type      = StateTypeSet
trigger1  = time = 22
statetype = S

;-------------------------------------------------[演出]

[State 960]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 960]
Type     = PosSet
Trigger1 = StateType=S
Y        = 0

[State 960, 効果音]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 960, velset]
Type     = VelSet
Trigger1 = !Time
X        = -5

[State 960, velset]
Type     = Velmul
Trigger1 = Time = [10, 26]
X        = 0.91

[state 960];速度
type     = Velset
trigger1 = AnimelemTime(4) >= 0
X        = 6

;-------------------------------------------------[キャンセル処理]

[State a];ホーミング補正
type       = VarAdd
TriggerAll = !Time
Trigger1   = (PrevstateNo = [200, 1900])&&(PrevStateNo != 965)
fvar(3)    = (1.0-fvar(3))*0.3

[state a, 回復停止];キャンセル判定
type     = Varset
trigger1 = fvar(22) < 60
trigger1 = (!time) && (PrevStateNo != 965)
fVar(22) = 60
IgnoreHitPause = 1
persistent = 0

[state a, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = (!time) && (PrevStateNo != 965)
fVar(20) = -1000
IgnoreHitPause = 1
persistent = 0

;-------------------------------------------------[エフェクト]

[state 960, explod];砂煙
Type     = Explod
trigger1 = Animelemtime(3) >= 0
trigger1 = gametime % 8 = 0
anim     = 8105
sprpriority = 3
pos      = -30, 0
OwnPal   = 1
Scale    = 0.75, 0.75
id       = 8105

[State a]
Type     = Helper
Trigger1 = !time
Name     = "Homing"
Stateno  = 8900
ID       = 8901
Pos      = 0, -60
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 0;99999
PauseMoveTime = 0;99999
IgnoreHitPause = 1
Persistent = 0

;------------------------------------------[ステート変更]

[State 960];相手に接触後に停止
Type       = ChangeState
Trigger1   = AnimelemTime(3) >= 0 
Trigger1   = p2bodydist x <= 10
Trigger1   = command != "holdz"
value      = 935
Ctrl       = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;空中 / ガードキャンセル / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 970]
type     = A
movetype = I
physics  = N
ctrl     = 0

[State 970]
Type = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

[State 970, 速度]
type     = VelSet
Trigger1 = !time
X = -0.1
Y = -0.1

[State 950, nothit];完全無敵
type     = Nothitby
Trigger1 = 1
value    = ,AA,AP
time     = 1

;-------------------------------------------------[アニメ変更]

[state 970]
type     = changeanim
trigger1 = !time
trigger1 = Pos Y < 0
value    = 901

[state 970]
type     = changeanim
trigger1 = !time
trigger1 = Pos Y >= 0
value    = 900

[State 970]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 970, 判定リセット]
type     = Varset
Trigger1 = !time
var(0)   = 0

;------------------------------------------[変数処理]

[state 970, 回復停止];キャンセル判定
type       = Varset
triggerAll = fvar(22) < 60
trigger1   = !time
fVar(22)   = 60
persistent = 0
IgnoreHitPause = 1

[state 970, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = !time
fVar(20) = -1000
persistent = 0
IgnoreHitPause = 1

;------------------------------------------[ステート変更]

[State a]
Type     = Helper
Trigger1 = !time
Name     = "Homing"
Stateno  = 8900
ID       = 8901
Pos      = 0, -50
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 0;99999
PauseMoveTime = 0;99999
IgnoreHitPause = 1
Persistent = 0

[State 4005, a]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 910







