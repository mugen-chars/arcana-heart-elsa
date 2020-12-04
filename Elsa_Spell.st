
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ランケオラ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2000]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2000
SprPriority = 2

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2000, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -1000

[State 2000, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = time = 0
value    = s5, 0

[State a, 効果音]; 共通ボイス
type     = playsnd
trigger1 = time = 0
value    = s410, 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = time = 0
darken   = 0
anim     = -1
sound    = -1
time     = 49
movetime = 49
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Time <= 49	;暗転+1F
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

;--------------------------------------------------[エフェクト]

[State a, 暗転時クルクス]
type     = Explod
trigger1 = Animelemtime(3) = 0
anim     = 1910
postype  = P1
pos      = 0, 0
scale    = 0.5, 0.5
id       = 1910
bindtime = -1
removetime     = 25
sprpriority    = 1
IgnoreHitPause = 1
removeongethit = 1
SuperMoveTime  = 99999
PauseMoveTime  = 99999

[State a];カットイン
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 0, -55
PosType = P1
StateNo = 8800
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1


;=================================================================
;  |ここから攻撃ステート|
;=================================================================


[State 2000]
type     = VelSet
trigger1 = Animelem = 7,>=0
trigger1 = Animelem = 19,<0
X        = 10

[State 2000]
type     = VelSet
trigger1 = Animelem = 19
X        = 5

[state 2000, エフェクト];(槍)
type     = Explod
trigger1 = AnimelemTime(7) = 0
anim     = 12000
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12000
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 2000, エフェクト];(きらきら)
type     = Explod
trigger1 = AnimelemTime(8) = 0
anim     = 12010
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12000
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 2000, エフェクト];(衝撃波)
type     = Explod
trigger1 = AnimelemTime(8) = 0
anim     = 12020
pos      = 0, 0
Scale    = 1, 1
id       = 12000
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[連続ヒット制御]

[State a, 変数] ;セイフティ 解除
type     = null
trigger1 = !Time
trigger1 = var(2) := 0
trigger1 = var(3) := 0
Persistent = 0

[State a, 変数] ;セイフティ [回数カウント]
Type           = VarAdd
Trigger1       = Time < 73
Trigger1       = MoveContact = 1
var(2)         = 1
Persistent     = 1
IgnoreHitPause = 1

[State a, 変数] ;セイフティ [連続ヒット間隔]
Type     = VarSet
Trigger1 = MoveContact = 1
var(3)   = 2

[State a, 変数] ;セイフティ [連続ヒット間隔]
Type     = VarAdd
Trigger1 = var(3) > 0
var(3)   = -1

[State a, フラグリセット]
Type     = MoveHitReset
;Trigger1 = var(2) < 9
trigger1 = var(3) <= 0

;-------------------------------------------------[ヒット定義]

[State 2000, HitDef]
type                = HitDef
trigger1            = Time = 55
trigger2            = Time = 57
trigger3            = Time = 59
trigger4            = Time = 61
trigger5            = Time = 63
trigger6            = Time = 65
trigger7            = Time = 67
trigger8            = Time = 69
trigger9            = Time = 71
trigger10           = Time = 73
trigger11           = Time = 75
attr                = S, HA
hitflag             = MAF
guardflag           = MA
damage              = Floor(30*Fvar(0)),5
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = 3, 3;5, 4
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s200, 11
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -5
guard.velocity      = -5.5
air.velocity        = -2, -2
airguard.velocity   = -2, -3
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+3
yaccel              = 0.48
guard.kill          = 0
P2Facing            = 1
Ground.CornerPush.VelOff   = -1
Air.CornerPush.VelOff      = -1
Down.CornerPush.VelOff     = -1
Guard.CornerPush.VelOff    = -1


[State 2000, HitDef]
type                = HitDef
trigger1            = Time = 77
attr                = S, HA
hitflag             = MAF
guardflag           = MA
damage              = Floor(42*Fvar(0)),5
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(15*(1+0.5*var(7))), floor(14*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 10
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -9.5
guard.velocity      = -8
air.velocity        = -9.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(26*FVar(3))+(floor(15*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
P2Facing            = 1
ID = 8010
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
trigger1 = Time < 73
Trigger1 = MoveHit = 1
Trigger1 = P2Movetype = H
Name     = "hit"
Stateno  = 7005
ID       = 7000 ;簡略化する
Pos      = 100, -55
PosType  = P1
OwnPal   = 1
size.xscale = 1.2
size.yscale = 1.2
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 1

[State a];ヒットスパーク
Type     = Helper
trigger1 = Time >= 73
Trigger1 = MoveHit = 1
Trigger1 = P2Movetype = H
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10, -55
PosType  = P2
OwnPal   = 1
size.xscale = 1.2
size.yscale = 1.2
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Trigger1 = P2Movetype = H
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 1

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
TriggerAll     = Time < 76
Trigger1       = MoveHit = 1
Persistent     = 3
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.94,0.91))

[State a, VarSet];連続ヒット補正
Type           = VarSet
TriggerAll     = Time >= 76
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.95,0.70))

[State a, VarSet];復帰不能補正
Type           = VarSet
TriggerAll     = Time < 76
Trigger1       = MoveHit=1
Persistent     = 3
IgnoreHitPause = 1
fvar(3)        = FVar(3) * 0.96

[State a, VarSet];復帰不能補正
Type           = VarSet
TriggerAll     = Time >= 76
Trigger1       = MoveHit=1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 10

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[相手制御]

[state a, ステート奪取]
type       = targetstate
triggerAll = animelemtime(19) >= 0
trigger1   =  MoveHit = 1
trigger1   = (NumTarget>0)&&(target,IsHelper=0)
trigger1   =  enemy,stateno != 8010
trigger1   =  P2statetype != L && !var(9)
value      =  8010

;----------------------------------------------[追加入力補助]

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "236AB"
trigger1    = StateNo != 5120
var(30)     = 2000

[State -3, 変数]
Type        = VarSet
TriggerAll  = !Var(59)
TriggerAll  = !Ctrl
Trigger1    = command = "236AB" 
var(31)     = 15


;----------------------------------------------[終了]

[State 2000 , 7]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ランケオラ / 追加入力
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2050]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2050
SprPriority = 2

;-----------------------------------------------------[ゲージ管理]

[State 2050, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -1000

[State 2050, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 150
IgnoreHitPause = 1
fvar(22)       = 150

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = time = 0
value    = s5, 0

[State a, 効果音]; 共通ボイス
type     = playsnd
trigger1 = time = 0
value    = s410, 14

[State a, 暗転処理]
type     = SuperPause
trigger1 = time = 0
darken   = 0
anim     = -1
sound    = -1
time     = 30
movetime = 30
P2DefMul = 1

;--------------------------------------------------[エフェクト]

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 35, -55
PosType = P1
StateNo = 8800
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

;=================================================================
;  |ここから攻撃ステート|
;=================================================================

[State 2050] ;槍を消す
type     = RemoveExplod
trigger1 = !time
ID       = 12000
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[弾幕展開]

[State 2050]
type        = Helper
trigger1    = time = 0
name        = "EX-Spell"
ID          = 12050
postype     = P1
pos         = 25, -60
Stateno     = 12050
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
SuperMoveTime = 99999
PauseMoveTime = 99999
ignorehitpause = 1

[State 2000 , 7]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [Helper] ランケオラ / 槍
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 12050]
Type        = A
MoveType    = A
Physics     = N
Anim        = 12050
SprPriority = 6

[State 12050]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 12050]
type = Angledraw
trigger1 = 1
scale = 0.5,0.5

[State 12050]
type = trans
trigger1 = 1
trans = add

;-------------------------------------------[速度設定]

[State 12050]
type     = Velset
trigger1 = Root,StateNo = 2050
Trigger1 = root,Animelemtime(2) = 1
Trigger2 = Time > 35
X        = 10

[State 2100]
type     = TargetBind
trigger1 = MoveHit = 1
pos      = 60, 50
ID       = 2050
IgnoreHitPause = 1

;-------------------------------------------------[ヒット定義]

[State 12050, HitDef]
type                = HitDef
trigger1            = (MoveType = A) && (!MoveContact) && (!MoveReversed)
trigger1            = time > 30
attr                = A, HP
hitflag             = MAF
guardflag           = MA
damage              = Floor(208*root,Fvar(0)), 5
animtype            = Hard
ground.type         = high
priority            = 3, Hit
pausetime           = 0, 5
Guard.PauseTime     = 0, 5
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = -1;s0, 2
guardsound          = -1;s1, 0
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15

ground.velocity     = -10
guard.velocity      = -10
air.velocity        = -10, -3
airguard.velocity   = -5, -3
fall                = 1
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
guard.kill          = 0
Persistent          = 0
IgnoreHitPause      = 1
ID = 2050
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードサウンド]

[State a];ヒットサウンド
Type           = PlaySnd
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
value          = s0, 10
channel        = 0
Persistent     = 0
IgnoreHitPause = 1

[State a];ヒットサウンド
Type           = PlaySnd
Trigger1       = MoveGuarded
Trigger1       = P2Movetype = H
value          = s1, 2
channel        = 0
Persistent     = 0
IgnoreHitPause = 1


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7030
ID       = 7000
Pos      = 0, -40
PosType  = P2
OwnPal   = 1
size.xscale = 1.5
size.yscale = 1.5
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[相手制御]

[state a, ステート奪取]
type       = targetstate
trigger1   = MoveHit = 1
trigger1   = (NumTarget>0)&&(target,IsHelper=0)
trigger1   = enemy,stateno != 8016
value      = 8016

;-------------------------------------------------[終了]

[State 12050]
type     = ChangeState
trigger1 = FrontedgeDist < -20
value    = 12051

[State 12050]
type     = DestroySelf
trigger1 = FrontedgeDist < -40


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [Helper] ランケオラ / 槍 / 消滅
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 12051]
Type        = A
MoveType    = A
Physics     = N
velset      = 0, 0
Anim        = 12051
SprPriority = 6

[State 12051]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 12051]
type = Angledraw
trigger1 = 1
scale = 0.5, 0.5

[state 12051, エフェクト]
type     = Explod
trigger1 = !time
anim     = 12055
pos      = -30, 0
Scale    = 2, 2
id       = 12055
bindtime = -1
Persistent = 0
sprpriority    = 6
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

[State 12051, エフェクト]
Type     = Helper
Trigger1 = !time
Name     = "hit"
Stateno  = 12056
ID       = 12056
Pos      = -30, 0
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 12051]
type = trans
trigger1 = 1
trans = add

;-------------------------------------------------[終了]

[State 12050]
type     = DestroySelf
trigger1 = Animtime = 0



;==============================================
; [エフェクト] ランケオラ
;==============================================

[statedef 12056]
Physics     = N
Anim        = 12056
SprPriority = 5

[state a]
type     = AssertSpecial
trigger1 = 1
flag     = noshadow

[state a]
type     = Trans
Trigger1 = 1
trans    = addalpha
alpha    = 256 - (6*time), 256

;-------------------------------[角度設定]

[State 7021]
Type     = AngleDraw
Trigger1 = 1
value    = 90
Scale    = 0.5+0.1*(time), .25+0.05*(time)

;--------------------------------[終了]

[State 7021]
Type     = DestroySelf
Trigger1 = Time > 40








;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; グラディウス
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2100]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2100
SprPriority = 2

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2100, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -1000

[State 2100, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = time = 0
value    = s5, 0

[State a, 効果音]; 共通ボイス
type     = playsnd
trigger1 = time = 0
value    = s410, 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = time = 0
darken   = 0
anim     = -1
sound    = -1
time     = 45
movetime = 45
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Time <= 45+7	;暗転+7F
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

;--------------------------------------------------[エフェクト]

[State a, 暗転時クルクス]
type     = Explod
trigger1 = Animelemtime(3) = 0
anim     = 1910
postype  = P1
pos      = 0, 0
scale    = 0.5, 0.5
id       = 1910
bindtime = -1
removetime     = 23
sprpriority    = 1
IgnoreHitPause = 1
removeongethit = 1
SuperMoveTime  = 99999
PauseMoveTime  = 99999

[State a];カットイン
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 0, -55
PosType = P1
StateNo = 8801
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1



;=================================================================
;  |ここから攻撃ステート|
;=================================================================


[State 2100]
type      = StateTypeSet
trigger1  = Animelem = 8
Statetype = A
physics   = N

[State 2100]
type     = VelSet
trigger1 = Animelem = 8
X        = 2
Y        = -10

[State 2100]
type     = Velmul
trigger1 = Vel Y < 0
trigger1 = Animelem = 14,<0
y = 0.92

[State 2100]
type     = VelAdd
trigger1 = Animelem = 14,>=0
y        = 0.45

[State 2100]
type     = PlaySnd
trigger1 = Animelem = 8
value    = s2,1

;-----------------------------------------------------[エフェクト]

[state 2100, エフェクト]
type     = Explod
trigger1 = AnimelemTime(8) = 0
anim     = 12100
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12100
bindtime = -1
Persistent = 0
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

[state 2100, エフェクト]
type     = Explod
trigger1 = AnimelemTime(9) = 0
anim     = 12105
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12105
bindtime = -1
Persistent = 0
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

[state 2100, エフェクト]
type     = Explod
trigger1 = AnimelemTime(12) = 0
anim     = 12106
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12106
bindtime = -1
Persistent = 0
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

[state 2100, エフェクト]
type     = Explod
trigger1 = AnimelemTime(12) = 0
anim     = 12105
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12105
bindtime = -1
Persistent = 0
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

[state 2100, エフェクト];光
type     = Explod
trigger1 = AnimelemTime(11) = 0
anim     = 12110
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12110
bindtime = 3
Persistent = 0
sprpriority    = 4
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

;-------------------------------------------------[ヒット定義]

[State 2100, HitDef]
type                = HitDef
triggerAll          = Animelemtime(12)<0
trigger1            = Animelem = 8
attr                = A, HA
hitflag             = MAF
guardflag           = MA
damage              = Floor(83*Fvar(0)), 10
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(12*(1+0.5*var(7))), floor(11*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = 0, 0
guard.velocity      = -8
air.velocity        = 0, 0
airguard.velocity   = -4, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(20*FVar(3))+(floor(12*(1+0.5*var(7))))
yaccel              = 0.48
kill                = 0
guard.kill          = 0
P2Facing            = 1
Id                  = 2100

;-------------------------------------------------[ヒット定義-2]

[State 2100, HitDef]
type                = HitDef
triggerAll          = Animelemtime(12)>=0
trigger1            = Animelem = 12
attr                = A, HA
hitflag             = MAF
guardflag           = MA
damage              = Floor(167*Fvar(0)), 10
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(12*(1+0.5*var(7))), floor(11*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 5
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 24
guard.hittime       = 24
guard.ctrltime      = 26
air.guard.slidetime = 29
air.guard.hittime   = 29
air.guard.ctrltime  = 31

ground.velocity     = 5.0, 12.5
guard.velocity      = -8
air.velocity        = 5.0, 12.5
airguard.velocity   = -4, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(20*FVar(3))+(floor(12*(1+0.5*var(7))))
yaccel              = 0.48
kill                = 0
guard.kill          = 0
P2Facing            = 1

;-------------------------------------------------[相手制御]

[State a, 床バウンド(グラカス)]
type           = TargetState
TriggerAll     = (NumTarget > 0)
triggerAll     = (Animelemtime(12)>=0)
trigger1       = (MoveHit=1) && target,ishelper = 0
value          = 2162
persistent     = 0
ignorehitpause = 1


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
trigger1 = Animelemtime(7)= [0,2]
Name     = "hit"
Stateno  = 7030
ID       = 7000
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.3
size.yscale = 1.3
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
trigger1 = Animelemtime(12)= [0,4]
Name     = "hit"
Stateno  = 7030
ID       = 7000
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.3
size.yscale = 1.3
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
trigger1 = Animelemtime(7)= [0,2]
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
trigger1 = Animelemtime(12)= [0,4]
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit=1
trigger1       = Animelemtime(12)= [0,4]
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.5, 0.61))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit=1
trigger1       = Animelemtime(12)= [0,4]
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.10

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

;====================================[初段ヒット時]

[State 2101]
type     = RemoveExplod
trigger1 = Movehit
ID       = 12000
IgnoreHitPause = 1
Persistent = 0

[State 2100]
type     = TargetBind
trigger1 = MoveHit = 1
trigger1 = AnimElemtime(8) = [0,2]
pos      = 32,-165
ID       = 2100
IgnoreHitPause = 1

[State 2100]
type     = TargetState
trigger1 = MoveHit = 1
trigger1 = AnimElemtime(8) = [0,2]
trigger1 = !Target,IsHelper
value    = 2160
ID       = 2100
IgnoreHitPause = 1
persistent = 0

[State 2100]
type     = ChangeState
trigger1 = MoveHit = 1
trigger1 = AnimElemtime(8) = [0,2]
trigger1 = !Target,IsHelper
trigger1 = P2MoveType = H
value    = 2101

;====================================[カス当たり]

[State 2100]
type     = ChangeState
trigger1 = ((vel y > 0) && (Pos Y >= 0))
value    = 2105

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; グラディウス / 着地
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2105]
type     = S
movetype = A
physics  = S
velset   = 0, 0
anim     = 2105
ctrl     = 0
sprpriority = 2

[State 52, 振り向き]
type = Turn
trigger1 = Animtime = 0
trigger1 = P2dist X < 0

[State 2105]
type = posset
trigger1 = !time
Y = 0

[State 2105, 着地終了]
Type     = ChangeState
trigger1 = AnimTime = 0
Value    = 0
Ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; グラディウス / ロック演出
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2101]
Type     = A
MoveType = A
Physics  = N
Ctrl     = 0
Anim     = 2101
SprPriority = 2

[State 2101]
type     = NotHitBy
trigger1 = time <= 87
value    = SCA,AA,AT,AP

[State 2101]
type     = RemoveExplod
trigger1 = !time
ID       = 12000
IgnoreHitPause = 1
Persistent = 0

[State a]
type     = null;AssertSpecial
trigger1 = 1
flag     = noBG
IgnoreHitPause = 1

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 0, -55
PosType = P1
StateNo = 12100
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

;--------------------------------------------[演出]

[State 2101]
type     = VelSet
trigger1 = FrontEdgeDist < 35
X        = 0

[State 2101]
type     = PosAdd
trigger1 = time = 0
trigger1 = FrontEdgeDist < 35
X        = -35

[State 2101]
type     = Velmul
trigger1 = AnimelemTime(8) < 0
X        = 0.94
Y        = 0.94

[State 2101]
type     = Velmul
trigger1 = AnimelemTime(8) = 0
X        = 0.1
Y        = 0.1

[State 2101]
type     = VelAdd
trigger1 = AnimelemTime(20) > 0
Y        = 0.45

;--------------------------------------------[エフェクト]

[state 2101, エフェクト]
type     = Explod
trigger1 = !time
anim     = 12107
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12100
bindtime = -1
sprpriority    = 6
IgnoreHitPause = 1
removeongethit = 0
PauseMoveTime  = 9999

[state 2100, エフェクト]
type     = Explod
trigger1 = !time
anim     = 12120
pos      = 0, 0
Scale    = const(size.xscale)*2,const(size.yscale)*2
id       = 12100
bindtime = -1
sprpriority    = 8
IgnoreHitPause = 1
removeongethit = 0
PauseMoveTime  = 9999

[state 2101, エフェクト]
type     = Explod
trigger1 = AnimelemTime(3) = 0
anim     = 12110
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12100
bindtime = -1
sprpriority    = 4
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[ヒット定義]

[State 2101, HitDef]
type                = HitDef
trigger1            = Animelem = 8
attr                = A, HA
hitflag             = MAF
guardflag           = MA
damage              = Floor(167*Fvar(0)), 10
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(12*(1+0.5*var(7))), floor(11*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 5
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 24
guard.hittime       = 24
guard.ctrltime      = 26
air.guard.slidetime = 29
air.guard.hittime   = 29
air.guard.ctrltime  = 31

ground.velocity     = 5.0, 12.5
guard.velocity      = -8
air.velocity        = 5.0, 12.5
airguard.velocity   = -4, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(20*FVar(3))+(floor(12*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
P2Facing            = -1
ID                  = 2101

;-------------------------------------------------[相手制御]

[State a, 床バウンド(専用)]
type           = TargetState
TriggerAll     = NumTarget > 0
trigger1       =(MoveHit) && target,ishelper = 0
value          = 2161
persistent     = 0
ignorehitpause = 1

[State 2101]
type     = TargetBind
trigger1 = time <= 42
Pos      = 52,-165
ID       = 2100
IgnoreHitPause = 1

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7030
ID       = 7000
Pos      = 0, 0
PosType  = P2
OwnPal   = 1
size.xscale = 1.5
size.yscale = 1.5
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0.7

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.10

;----------------------------------------------[追加入力補助]

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "623AB"
trigger1    = StateNo != 5120
var(30)     = 2100

[State -3, 変数]
Type        = VarSet
TriggerAll  = !Var(59)
TriggerAll  = !Ctrl
Trigger1    = command = "623AB" 
var(31)     = 15

;----------------------------------------------[終了]

[State 2101]
type     = ChangeState
trigger1 = ((vel y > 0) && (Pos Y >= 0))
value    = 2105



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; グラディウス / 空中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2110]
Type     = A
MoveType = A
Physics  = N
Ctrl     = 0
velset   = 0, 0
Anim     = 2110
SprPriority = 2

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2110, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -1000

[State 2110, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = time = 0
value    = s5, 0

[State a, 効果音]; 共通ボイス
type     = playsnd
trigger1 = time = 0
value    = s410, 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = time = 0
darken   = 0
anim     = -1
sound    = -1
time     = 45
movetime = 45
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Time <= 45
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

;--------------------------------------------------[エフェクト]

[State a];カットイン
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 0, -55
PosType = P1
StateNo = 8801
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1


;=================================================================
;  |ここから攻撃ステート|
;=================================================================


[State 2110]
type     = VelSet
trigger1 = Animelem = 4
X        = 2
Y        = -10

[State 2110]
type     = Velmul
trigger1 = Vel Y < 0
trigger1 = Animelem = 10,<0
y = 0.92


[State 2110]
type     = VelAdd
trigger1 = Animelem = 10,>=0
y        = 0.45

[State 2110]
type     = PlaySnd
trigger1 = Animelem = 6
value    = s2, 1

;-----------------------------------------------------[エフェクト]

[state 2110, エフェクト]
type     = Explod
trigger1 = AnimelemTime(6) = 0
anim     = 12100
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12100
bindtime = -1
Persistent = 0
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

[state 2110, エフェクト]
type     = Explod
trigger1 = AnimelemTime(7) = 0
anim     = 12105
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12105
bindtime = -1
Persistent = 0
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

[state 2100, エフェクト]
type     = Explod
trigger1 = AnimelemTime(8) = 0
anim     = 12110
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12110
bindtime = 3
Persistent = 0
sprpriority    = 4
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

;-------------------------------------------------[ヒット定義]

[State 2110, HitDef]
type                = HitDef
triggerAll          = Animelemtime(9)<0
trigger1            = Animelem = 6
attr                = A, HA
hitflag             = MAF
guardflag           = MA
damage              = Floor(83*Fvar(0)), 10
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(12*(1+0.5*var(7))), floor(11*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = 0, 0
guard.velocity      = -8
air.velocity        = 0, 0
airguard.velocity   = -4, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(20*FVar(3))+(floor(12*(1+0.5*var(7))))
yaccel              = 0.48
kill                = 0
guard.kill          = 0
P2Facing            = 1
Id                  = 2100

;-------------------------------------------------[ヒット定義-2]

[State 2100, HitDef]
type                = HitDef
triggerAll          = Animelemtime(9)>=0
trigger1            = Animelem = 9
attr                = A, HA
hitflag             = MAF
guardflag           = MA
damage              = Floor(167*Fvar(0)), 10
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(12*(1+0.5*var(7))), floor(11*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 5
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 24
guard.hittime       = 24
guard.ctrltime      = 26
air.guard.slidetime = 29
air.guard.hittime   = 29
air.guard.ctrltime  = 31

ground.velocity     = 5.0, 12.5
guard.velocity      = -8
air.velocity        = 5.0, 12.5
airguard.velocity   = -4, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(20*FVar(3))+(floor(12*(1+0.5*var(7))))
yaccel              = 0.48
kill                = 0
guard.kill          = 0
P2Facing            = 1

;-------------------------------------------------[相手制御]

[State a, 床バウンド(グラカス)]
type           = TargetState
TriggerAll     = (NumTarget > 0)
triggerAll     = (Animelemtime(9)>=0)
trigger1       = (MoveHit=1) && target,ishelper = 0
value          = 2162
persistent     = 0
ignorehitpause = 1


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
trigger1 = Animelemtime(4)= [0,2]
Name     = "hit"
Stateno  = 7030
ID       = 7000
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.3
size.yscale = 1.3
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
trigger1 = Animelemtime(9)= [0,4]
Name     = "hit"
Stateno  = 7030
ID       = 7000
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.3
size.yscale = 1.3
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
trigger1 = Animelemtime(4)= [0,2]
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
trigger1 = Animelemtime(9)= [0,4]
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit=1
trigger1       = Animelemtime(9)= [0,4]
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.5, 0.61))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit=1
trigger1       = Animelemtime(9)= [0,4]
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.10

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

;====================================[初段ヒット時]

[State 2110]
type     = RemoveExplod
trigger1 = Movehit
ID       = 12000
IgnoreHitPause = 1
Persistent = 0

[State 2110]
type     = TargetBind
trigger1 = MoveHit = 1
trigger1 = AnimElemtime(4) = [0,2]
pos      = 32,-165
ID       = 2100
IgnoreHitPause = 1

[State 2110]
type     = TargetState
trigger1 = MoveHit = 1
trigger1 = AnimElemtime(4) = [0,2]
trigger1 = !Target,IsHelper
value    = 2160
ID       = 2100
IgnoreHitPause = 1
persistent = 0

[State 2110]
type     = ChangeState
trigger1 = MoveHit = 1
trigger1 = AnimElemtime(4) = [0,2]
trigger1 = !Target,IsHelper
trigger1 = P2MoveType = H
value    = 2101

;====================================[カス当たり]

[State 2110]
type     = ChangeState
trigger1 = ((vel y > 0) && (Pos Y >= 0))
value    = 2105



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; グラディウス / 追加入力
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2150]
Type     = A
MoveType = A
Physics  = N
Ctrl     = 0
velset   = 0, 0
Anim     = 2150
SprPriority = 2

;-----------------------------------------------------[ゲージ管理]

[State 2150, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -1000

[State 2150, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 150
IgnoreHitPause = 1
fvar(22)       = 150

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = time = 0
value    = s5, 0

[State a, 効果音]; 共通ボイス
type     = playsnd
trigger1 = time = 0
value    = s410, 14

[State a, 暗転処理]
type     = SuperPause
trigger1 = time = 0
darken   = 0
anim     = -1
sound    = -1
time     = 22
movetime = 22
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 2, -55
PosType = P1
StateNo = 8801
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 0, -55
PosType = P1
StateNo = 12150
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

;=================================================================
;  |ここから攻撃ステート|
;=================================================================

[State 2150]
type     = NotHitBy
trigger1 = time <= 62
value    = SCA,AA,AT,AP

[State 2150]
type     = RemoveExplod
trigger1 = !time
ID       = 12000
IgnoreHitPause = 1
Persistent = 0

[State 2150]
type     = RemoveExplod
trigger1 = !time
ID       = 12100
IgnoreHitPause = 1
Persistent = 0

[State a]
type     = null;AssertSpecial
trigger1 = 1
flag     = noBG
IgnoreHitPause = 1

;--------------------------------------------[演出]

[State 2150]
type     = VelAdd
trigger1 = AnimelemTime(9) > 0
Y        = 0.42

[state 2150, エフェクト]
type     = Explod
trigger1 = Animelemtime(5) = 0
anim     = 12150
pos      = 0, 0
Scale    = 0.5, 0.5
id       = 12150
bindtime = -1
sprpriority    = 8
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

[state 2150, エフェクト]
type     = Explod
trigger1 = Animelem = 6
anim     = 12155
pos      = 0, 0
Scale    = 0.5, 0.5
id       = 12155
bindtime = -1
sprpriority    = 8
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

[state 2150, エフェクト]
type     = Explod
trigger1 = Animelemtime(5) = 0
anim     = 12160
pos      = 0, 0
Scale    = 0.5, 0.5
id       = 12160
bindtime = -1
sprpriority    = 8
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime  = 9999

;-------------------------------------------------[ヒット定義]

[State 2150, HitDef]
type                = HitDef
trigger1            = Animelem = 6
attr                = A, HA
hitflag             = MAF
guardflag           = MA
damage              = Floor(167*Fvar(0)), 10
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(12*(1+0.5*var(7))), floor(20*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 10
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 24
guard.hittime       = 24
guard.ctrltime      = 26
air.guard.slidetime = 29
air.guard.hittime   = 29
air.guard.ctrltime  = 31

ground.velocity     = -6.0, 12.5
guard.velocity      = -8
air.velocity        = -6.0, 12.5
airguard.velocity   = -4, -4
fall                = 1
air.fall            = 1
p2facing            = 1
fall.recovertime    = Ceil(6000*FVar(3))+(floor(12*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
ID                  = 2101

;-------------------------------------------------[相手制御]

[State a, 床バウンド(専用)]
type           = TargetState
TriggerAll     = NumTarget > 0
trigger1       =(MoveHit) && target,ishelper = 0
value          = 2161
persistent     = 0
ignorehitpause = 1

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7030
ID       = 7000
Pos      = 0, 0
PosType  = P2
OwnPal   = 1
size.xscale = 1.5
size.yscale = 1.5
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0.5

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.20

[State 2150]
type     = ChangeState
trigger1 = ((vel y > 0) && (Pos Y >= 0))
value    = 2105



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[helper] グラディウス / 発動時背景エフェクト
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 12100]
Physics     = N
Anim        = 9999
SprPriority = 4

[State 12100]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

;-------------------------------------------------[暗転処理]

[state 8886, 変数] ;暗転用
type     = VarSet
trigger1 = !time
var(50)  = 256

[State 8886, 変数] ;暗転用
type     = VarAdd
trigger1 = var(59) = 1
var(50)  = -12

[State 8886, フェードアウト処理]
Type     = BGPalFx
Trigger1 = 1
Time     = 1
Mul      = 256-Var(50),256-Var(50),256-Var(50)

;---------------------------------------------------[透過処理]

[State 12100, 透過用]
type     = VarSet
Trigger1 = !time
var(0)   = 20

[State 12100, 透過用]
type     = Varadd
Trigger1 = Var(59) = 1   ;終了フラグ
trigger1 = Var(0) > 0
var(0)   = -1

[State 12100, 透過用];本体ステート
type     = Varset
trigger1 = !time
var(5)   = (Root,Stateno)

[State 12100, 終了フラグ]
type     = Varset
Trigger1 = (var(5)=2101) && (Time = 70)
Trigger2 = root,StateNo !=[2100,2160]
Trigger3 = root,Movetype = H
var(59)  = 1

[State 12100];背景色
type      = PalFX
trigger1  = 1
time      = 1
add       = 0,0,0
mul       = ceil(Var(0)*2.5),ceil(Var(0)*2.5),ceil(Var(0)*4.5)
invertall = 0
color     = 256

;---------------------------------------------------[表示処理]

[State 12100, 文字エフェクト];グラ
Type       = Helper
Trigger1   = Time%8 = 0 && Time < 70
Pos        = (Random%320), 100
PosType    = back
ID         = 2
StateNo    = 8825
Name       = "Spell"
OwnPal     = 1
SuperMoveTime=99999
PauseMoveTime=99999

[State 12100, ヘルパー消滅]
Type     = DestroySelf
Trigger1 = Time != 0
trigger1 = Var(0) = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[helper] グラディウス(追加) / 発動時背景エフェクト
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 12150]
Physics     = N
Anim        = 9999
SprPriority = 4

[State 12150]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

;-------------------------------------------------[暗転処理]

[state 8886, 変数] ;暗転用
type     = VarSet
trigger1 = !time
var(50)  = 256

[State 8886, 変数] ;暗転用
type     = VarAdd
trigger1 = var(59) = 1
var(50)  = -12

[State 8886, フェードアウト処理]
Type     = BGPalFx
Trigger1 = 1
Time     = 1
Mul      = 256-Var(50),256-Var(50),256-Var(50)

;---------------------------------------------------[透過処理]

[State 12150, 透過用]
type     = VarSet
Trigger1 = !time
var(0)   = 20

[State 12150, 透過用]
type     = Varadd
Trigger1 = Var(59) = 1   ;終了フラグ
trigger1 = Var(0) > 0
var(0)   = -1

[State 12150, 透過用];本体ステート
type     = Varset
trigger1 = !time
var(5)   = (Root,Stateno)

[State 12150, 終了フラグ]
type     = Varset
Trigger1 = (var(5)=2150) && (Time = 70)
Trigger2 = root,StateNo !=[2100,2160]
Trigger3 = root,Movetype = H
var(59)  = 1

[State 12150];背景色
type      = PalFX
trigger1  = 1
time      = 1
add       = 0,0,0
mul       = ceil(Var(0)*2.5),ceil(Var(0)*2.5),ceil(Var(0)*4.5)
invertall = 0
color     = 256

;---------------------------------------------------[表示処理]

[State 12150, 文字エフェクト];グラ
Type       = Helper
Trigger1   = Time%8 = 0 && Time < 60
Pos        = (Random%320), 100
PosType    = back
ID         = 2
StateNo    = 8825
Name       = "Spell"
OwnPal     = 1
SuperMoveTime=99999
PauseMoveTime=99999

[State 12150, ヘルパー消滅]
Type     = DestroySelf
Trigger1 = Time != 0
trigger1 = Var(0) = 0










;---------------------------------------------------------------------------
; グラディウス喰らった相手
;---------------------------------------------------------------------------

[Statedef 2160]
type     = A
movetype = H
physics  = N
VelSet   = 0,0
ctrl     = 0

[State 2160]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2160

[State 2160]
type     = PlayerPush
trigger1 = 1
value    = 0

[State 2160]
type     = NotHitBy
trigger1 = time < 30
value    = SCA

[State 2160, ステート変更]  ;異常時
Type       = SelfState
Trigger1   = Time > 200
Value      = 5050


;---------------------------------------------------------------------------
; グラディウス喰らった相手 / ２段目くらい
;---------------------------------------------------------------------------

[Statedef 2161]
type     = A
movetype = H
physics  = N
VelSet   = 0,0
ctrl     = 0

[State 2161]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2161

[State 2161]
type     = PlayerPush
trigger1 = 1
value    = 0

[State 2161]
type     = NotHitBy
trigger1 = time < 10
value    = SCA

;------------------------------------------[速度処理]

[State 2161, HitVelSet]
Type     = HitVelSet
Trigger1 = Time >= 13
X        = 1
Y        = 1

[State 2161, 速度]  ;Y加速度
Type     = VelAdd
Trigger1 = time >= 13
Y        = GetHitVar(YAccel)

[State 2161]
type     = PlayerPush
trigger1 = 1
value    = 0

;------------------------------------------[ステート変更]

[State 2161, ステート復帰]  ;地上復帰
Type       = SelfState
TriggerAll = Pos Y >= -10 && Vel Y > 0
TriggerAll = Alive
Trigger1   = Command = "recovery"
Value      = 5200

[State 2161, ステート復帰]  ;バウンドへ
Type     = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 5
Value    = 8062

[State 2161, ステート変更]  ;異常時
Type       = SelfState
TriggerAll = Time > 0
Trigger1   = Time > 100
Value      = 5050


;---------------------------------------------------------------------------
; グラディウス喰らった相手(グラカス)
;---------------------------------------------------------------------------

[Statedef 2162]
type     = A
movetype = H
physics  = N
VelSet   = 0,0
ctrl     = 0

[State 2162]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2160

[State 2162]
type     = PlayerPush
trigger1 = 1
value    = 0

[State 2162]
type     = NotHitBy
trigger1 = time < 30
value    = SCA

[State 2162, ステート変更]  ;異常時
Type       = changeState
Trigger1   = Time > 15
Value      = 2161





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; セキュリス
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2200]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2200
SprPriority = 2

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2200, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -1000

[State 2200, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = time = 0
value    = s5, 0

[State a, 効果音]; 共通ボイス
type     = playsnd
trigger1 = time = 0
value    = s410, 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = time = 0
darken   = 0
anim     = -1
sound    = -1
time     = 49
movetime = 49
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Time <= 49	;暗転+1F
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

;--------------------------------------------------[エフェクト]

[State a, 暗転時クルクス]
type     = Explod
trigger1 = Animelemtime(3) = 0
anim     = 1910
postype  = P1
pos      = 0, 0
scale    = 0.5, 0.5
id       = 1910
bindtime = -1
removetime     = 25
sprpriority    = 1
IgnoreHitPause = 1
removeongethit = 1
SuperMoveTime  = 99999
PauseMoveTime  = 99999

[State a];カットイン
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 0, -55
PosType = P1
StateNo = 8802
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

;=================================================================
;  |ここから攻撃ステート|
;=================================================================


[state 2200, エフェクト] ;斧
type     = Explod
trigger1 = AnimelemTime(6) = 0
anim     = 12220
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12200
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 2200, エフェクト] ;波紋
type     = Explod
trigger1 = AnimelemTime(11) = 0
anim     = 12210
pos      = 40, 0
Scale    = const(size.xscale)*3,const(size.yscale)*3
id       = 12200
sprpriority    = 6
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime = 999999
SuperMoveTime = 999999


[state 2200, エフェクト] ;光
type     = Explod
trigger1 = AnimelemTime(10) = 0
anim     = 12230
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12200
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1
PauseMoveTime = 999999
SuperMoveTime = 999999

[state 2200, エフェクト] ;軌道
type     = Explod
trigger1 = AnimelemTime(10) = 0
anim     = 12200
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12200
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[State a, 効果音]
type     = playsnd
trigger1 = AnimelemTime(11) = 0
value    = s200, 3
channel  = 3

[State a, 効果音]
type     = playsnd
trigger1 = AnimelemTime(11) = 0
value    = s200, 4

[State a, 効果音]
type     = playsnd
trigger1 = AnimelemTime(11) = 0
value    = s200, 5
channel  = 3

[State 2200, EnvShake];画面振動
Type     = EnvShake
Trigger1 = Animelem = 11
Time     = 10
Freq     = 40
Ampl     = 5
Phase    = 0

;-------------------------------------------------[ヒット定義]

[State 2200, HitDef]
type                = HitDef
trigger1            = Animelem = 9
attr                = S, HA
hitflag             = MAF
guardflag           = H
damage              = Floor(333*Fvar(0)), 50
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(12*(1+0.5*var(7))), floor(11*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 10
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 24
guard.hittime       = 24
guard.ctrltime      = 26
air.guard.slidetime = 29
air.guard.hittime   = 29
air.guard.ctrltime  = 31

ground.velocity     = 0, 12.5
guard.velocity      = -8
air.velocity        = 0, 12.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
fallrecover         = 0
fall.recovertime    = Ceil(26*FVar(3))+(floor(12*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
P2Facing            = 1
ID = 8010

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 10, -55
PosType  = P2
OwnPal   = 1
size.xscale = 1.5
size.yscale = 1.5
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0


;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.5, 0.61))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.20

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[state a, ステート奪取]
type     = targetstate
trigger1 = MoveHit = 1
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 = enemy,stateno != 852
value    = 852

;----------------------------------------------[追加入力補助]

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "214AB"
trigger1    = StateNo != 5120
var(30)     = 2200

[State -3, 変数]
Type        = VarSet
TriggerAll  = !Var(59)
TriggerAll  = !Ctrl
Trigger1    = command = "214AB" 
var(31)     = 15

;----------------------------------------------[終了]

[State 2200 , 7]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; セキュリス / 追加入力
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2250]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2250
SprPriority = 2

[State 2250, 効果音消去]
type     = StopSnd
Trigger1 = !time
channel  = 3

;-----------------------------------------------------[ゲージ管理]

[State 2250, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -1000

[State 2250, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 150
IgnoreHitPause = 1
fvar(22)       = 150


;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = time = 0
value    = s5, 0

[State a, 効果音]; 共通ボイス
type     = playsnd
trigger1 = time = 0
value    = s410, 14

[State a, 暗転処理]
type     = SuperPause
trigger1 = time = 0
darken   = 0
anim     = -1
sound    = -1
time     = 30
movetime = 30
P2DefMul = 1

;--------------------------------------------------[エフェクト]

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 20, -35
PosType = P1
StateNo = 8802
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

;=================================================================
;  |ここから攻撃ステート|
;=================================================================

[state 2250, nothitby]
type     = nothitby
trigger1 = 1
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 2250, HitDef]
type                = HitDef
trigger1            = AnimElem = 2
attr                = S, HA
hitflag             = MAF
guardflag           = 
damage              = 12, 0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 3, 2
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 2
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15
ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -3, -4
airguard.velocity   = -3, -2
yaccel              = 0.4
fall                = 1
air.fall            = 1
fall.recovertime    = 6000
getpower            = 0, 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

[State 2250, 相手ステート奪取]  ;壁吹き飛びやられへ
Type       = TargetState
TriggerAll = NumTarget > 0
Trigger1   = MoveHit
Value      = 2260
Persistent = 0
IgnoreHitPause = 1

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7030
ID       = 7000
Pos      = 10, 0
PosType  = P2
OwnPal   = 1
size.xscale = 1.3
size.yscale = 1.3
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -70, -60)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 2250]
type     = RemoveExplod
trigger1 = Time = 39
ID       = 12200
IgnoreHitPause = 1
Persistent = 0


[state 2250, エフェクト] ;斧
type     = Explod
trigger1 = AnimelemTime(2) = 0
anim     = 12270
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12250
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 2200, エフェクト] ;波紋
type     = Explod
trigger1 = AnimelemTime(7) = 0
anim     = 12260
pos      = -60, 0
Scale    = const(size.xscale)*2.5,const(size.yscale)*2.5
id       = 12200
sprpriority    = 6
IgnoreHitPause = 0
removeongethit = 1

[state 2200, エフェクト] ;光
type     = Explod
trigger1 = AnimelemTime(6) = 0
anim     = 12280
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12200
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 2200, エフェクト] ;軌道
type     = Explod
trigger1 = AnimelemTime(6) = 0
anim     = 12250
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12250
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[State 2200, EnvShake];画面振動
Type     = EnvShake
Trigger1 = Animelem = 7
Time     = 10
Freq     = 40
Ampl     = 5
Phase    = 0

[State a, 効果音];疑似ヒット音
type     = playsnd
trigger1 = AnimelemTime(7) = 0
value    = s0, 10

[State a, 効果音]
type     = playsnd
trigger1 = AnimelemTime(7) = 0
value    = s200, 3

[State a, 効果音]
type     = playsnd
trigger1 = AnimelemTime(7) = 0
value    = s200, 4

[State a, 効果音]
type     = playsnd
trigger1 = AnimelemTime(7) = 0
value    = s200, 8

;--------------------------------------[相手制御]

[State a]
type     = TargetBind
trigger1 = animelem = 1
Pos      = 80, 0

[State a]
type     = TargetBind
trigger1 = animelem = 2
Pos      = 75, -85

[State a]
type     = TargetBind
trigger1 = animelem = 3
Pos      = 45, -115

[State a, 相手アニメ変更]
Type     = TargetState
Trigger1 = AnimElem = 3
value    = 2262

[State a]
type     = TargetBind
trigger1 = animelem = 4
Pos      = 40, -115

[State a]
type     = TargetBind
trigger1 = animelem = 5
Pos      = 37, -118

[State a]
type     = TargetBind
trigger1 = animelem = 6
Pos      = -22, -150

[State a, 相手アニメ変更]
Type     = TargetState
Trigger1 = AnimElem = 6
value    = 2261

[State a]
type     = TargetBind
trigger1 = animelem = 7
Pos      = -63, -10

[State a]
Type     = HitAdd
Trigger1 = AnimElem = 7
value    = 1

[State a, 相手ダメージ]
Type     = TargetLifeAdd
Trigger1 = AnimElem = 7
absolute = 1			;防御力を反映する
value    = -floor(250*fvar(0))

[State a, 相手を解放する]
Type     = TargetState
Trigger1 = AnimElem = 7
value    = 2263

[State a];ヒットスパーク
Type     = Helper
Trigger1 = AnimelemTime(7) = 1
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 0, -30
PosType  = P2
OwnPal   = 1
size.xscale = 1.5
size.yscale = 1.5
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 2250]
type     = Turn
trigger1 = AnimTime = 0

[State 2250]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] セキュリス追加入力 / ヒット中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2260]
type     = A
movetype = H
physics  = N
velset   = 0,0
sprpriority = -1

[state a]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 2260]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 2261

;---------------------------[表示角度]

[state a]
type     = Selfstate
trigger1 = time = 150
value    = 5050
ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] セキュリス追加入力 / ヒット中-2
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2261]
type     = A
movetype = H
physics  = N
velset   = 0,0
sprpriority = -1

[state a]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 2260]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 2261

;---------------------------[表示角度]

[state 2260]
type     = Angledraw
trigger1 = 1
value    = -90

;---------------------------[表示角度]

[state a]
type     = Selfstate
trigger1 = time = 150
value    = 5050
ctrl     = 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] セキュリス追加入力 / ヒット中-3
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2262]
type     = A
movetype = H
physics  = N
velset   = 0,0
sprpriority = -1

[State 2262]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 2262

[state 2262, nothitby]
type     = nothitby
trigger1 = 1
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

;---------------------------[表示角度]

[state a]
type     = Selfstate
trigger1 = time = 150
value    = 5050
ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] セキュリス追加入力 / 再度叩きつけられる(硬直)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2263]
Type     = S
MoveType = H
Physics  = N
Ctrl     = 0
VelSet   = 0, 0

[State 8010, 0] ;ヘルパー対策
type     = DestroySelf
trigger1 = ishelper

[State a]
type     = PosSet
Trigger1 = !time
Y = 0

[state a]
type     = turn
trigger1 = p2dist x < 0
trigger1 = time = 0

[state a]
type     = playerpush
trigger1 = 1
value    = 0

[State 2263]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 2263

[state 2263, nothitby]
type     = nothitby
trigger1 = 1
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

[State 2263, ステート変更]
Type     = ChangeState
Trigger1 = Time > 24
Value    = 2264


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] セキュリス追加入力 / 再度叩きつけられる(落下)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2263]
Type     = A
MoveType = H
Physics  = N
Anim     = IfElse(SelfAnimExist(5035), 5035, 5050)

[state a]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 2263, アニメ変更]
Type     = ChangeAnim
Trigger1 = Anim = 5035
Trigger1 = AnimTime = 0
Value    = 5050

;------------------------------------------[速度処理]

[State 2263, HitVelSet]
Type     = HitVelSet
Trigger1 = Time = 0
X        = 1
Y        = 1

[State 2263, 速度]
Type     = VelSet
Trigger1 = 1
X        = 0
Y        = 12.5

[State 2263, 速度]  ;Y加速度
Type     = VelAdd
Trigger1 = 1
Y        = 0.45

[State 2263]
type     = PlayerPush
trigger1 = 1
value    = 0

;------------------------------------------[ステート変更]

[State 2263, ステート復帰]  ;バウンドへ
Type     = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value    = 2264

[State 8061, ステート変更]  ;異常時
Type       = SelfState
TriggerAll = Time > 0
Trigger1   = Time > 100
Value      = 5050

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] セキュリス追加入力 / 再度叩きつけられる(床に激突)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2264]
Type     = A
MoveType = H
Physics  = N
Anim     = 5100

[State 2264, アニメ変更]
Type     = ChangeAnim
Trigger1 = !Time
Value    = 5100

[State 2264, 速度]
Type     = VelSet
Trigger1 = !Time
Y        = 0

[State 2264, 速度]
Type     = PosSet
Trigger1 = !Time
Y        = 0

[State 2264, 座標固定]
Type     = PosFreeze
Trigger1 = 1

[State 2264, 画面振動]
type     = EnvShake
trigger1 = time = 5
time     = 10
ampl     = -6
freq     = 120
phase    = 120

[State 2264, ステート変更]
type     = ChangeState
trigger1 = Time = 15
Trigger2 = Animtime = 0
value    = 2265


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] セキュリス追加入力 / 再度叩きつけられる(バウンド)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[StateDef 2265]
Type     = A
MoveType = H
Physics  = N

[State 2265, 相手アニメ変更]
Type     = ChangeAnim
Trigger1 = Time = 2
Value    = IfElse(SelfAnimExist(5035), 5035, 5050)

[State 2265, ChangeAnim]
Type     = ChangeAnim
Trigger1 = Anim = 5035
Trigger1 = AnimTime = 0
Value    = 5050

[state 2265, 速度]
type     = velset
trigger1 = !time
X        = 0
Y        = -3

[state 8063, 速度]
type     = veladd
;Trigger1 = GetHitvar(xvel) != 0
trigger1 = time >= 2
Y        = 0.35

[State 8063, 接触判定]
type     = playerpush
Trigger1 = Time < 10
value    = 0

;------------------------------------------[ステート変更]

[State 8063, ステート復帰]  ;着地
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= -0.5*Const(Size.Mid.Pos.Y)
Trigger2 = time = 7
Value    = 5100



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; レクイエム
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2300]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2300
SprPriority = 2

[State 2300, スロー演出]
type     = Pause
trigger1 = Animelemtime(1) = 0
trigger2 = Animelemtime(1) = 1
trigger3 = Animelemtime(1) = 2
trigger4 = Animelemtime(1) = 3
trigger5 = Animelemtime(1) = 4
Anim     = -1
time     = 2
;Movetime = 1
P2DefMul = 1
Darken = 0
Persistent = 1

[State 2300, スロー演出]
type     = Pause
trigger1 = Animelemtime(2) = 0
trigger2 = Animelemtime(2) = 1
trigger3 = Animelemtime(2) = 2
trigger4 = Animelemtime(2) = 3
trigger5 = Animelemtime(2) = 4
trigger6 = Animelemtime(2) = 5
trigger7 = Animelemtime(2) = 6
Anim     = -1
time     = 3
;Movetime = 1
P2DefMul = 1
Darken = 0
Persistent = 1

[state a, Nothitby]
type     = nothitby
trigger1 = time < 14
value    = SCA
time     = 1

[State 2160]
type     = PlayerPush
trigger1 = time < 14
value    = 0

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2300, ゲージ減少]
Type           = varAdd
Trigger1       = Animelem = 4
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -3000

[State 2300, ゲージ回復抑制]
Type           = varset
Trigger1       = AnimelemTime(4) >= 0
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = Animelem = 4
value    = s5, 1

[State a, 暗転処理]
type     = SuperPause
trigger1 = Animelem = 4
darken   = 0
anim     = -1
sound    = -1
time     = 57
movetime = 57
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Animelem = 4
value    = SCA,AA,AT,AP
time     = 57
ignorehitpause = 1

;-----------------------------------------------------[エフェクト]

[State a];カットイン
Type = Helper
Trigger1 = Animelem = 4
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = Animelem = 4
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 0, -55
PosType = P1
StateNo = 8805
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1


;=================================================================
;  |ここから攻撃ステート|
;=================================================================


[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 3
value    = s200, 7

[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 7
value    = s200, 8

[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 7
value    = s200, 5

[State 2300]
type     = VelSet
trigger1 = Animelem = 9
X        = -20

[state 2300, エフェクト] ;マズルフラッシュ
type     = Explod
trigger1 = AnimelemTime(7) = 0
anim     = 12300
pos      = 0, 0
Scale    = const(size.xscale)*2,const(size.yscale)*2
id       = 12300
bindtime = -1
sprpriority    = 6
Persistent     = 0
IgnoreHitPause = 1
removeongethit = 1

[State 2300, エフェクト]
Type     = Helper
Trigger1 = AnimelemTime(8) = 0
OwnPal   = 1
PosType  = P1
Pos      = 90, -95
ID       = 12320
StateNo  = 12320
Name     = "effect"
Persistent    = 0
IgnoreHitPause = 1
PauseMoveTime = 999999
SuperMoveTime = 999999

[state 2300, 着弾エフェクト]
type     = Explod
trigger1 = MoveHit = 1
anim     = 12310
Postype  = P2
pos      = 0, -55
Scale    = const(size.xscale)*2.5,const(size.yscale)*2.5
id       = 12310
bindtime = 1
Persistent     = 0
sprpriority    = 9
IgnoreHitPause = 1

[state 2300, 着弾エフェクト]
Type     = Helper
Trigger1 = MoveHit = 1
OwnPal   = 1
PosType  = P2
Pos      = 0, -55
ID       = 12315
StateNo  = 12315
Name     = "effect"
size.xscale = 1
size.yscale = 1
Persistent     = 0
IgnoreHitPause = 1
PauseMoveTime  = 999999
SuperMoveTime  = 999999

;-------------------------------------------------[ヒット定義]

[State 2300, HitDef]
type                = HitDef
trigger1            = Animelem = 7
attr                = , HA
hitflag             = MAF
guardflag           = M
damage              = Floor(533*Fvar(0)), 5
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(20*(1+0.5*var(7))), floor(19*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = -1
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -8, -2.5
guard.velocity      = -8
air.velocity        = -8, -2.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(6000*FVar(3))+(floor(20*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
ID = 8010
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.91,0.5))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit=1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 20

;=======================================[ヒット、ガードエフェクト]

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[相手制御]

[state a, ステート奪取]
type       = targetstate
trigger1   =  MoveHit = 1
trigger1   = (NumTarget>0)&&(target,IsHelper=0)
trigger1   =  enemy,stateno != 8010
value      =  8010

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 2300, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;---------------------------------------------------------------------------
; [Helper] レクイエム / エフェクト
;---------------------------------------------------------------------------
[Statedef 12320]
type     = A
Movetype = I
physics  = N
Anim     = 12320
SprPriority = 7

[state a]
type     = AssertSpecial
trigger1 = 1
flag     = noshadow

;----------------------------------------[透過処理]

[state a]
type     = Trans
trigger1 = 1
trans    = addalpha
alpha    = var(0), 256

[state a]
type     = VarSet
trigger1 = !time
var(0)   = 56

[state a]
type = varadd
trigger1 = var(0) < 256
var(0) = 25

[state a]
type = VarSet
trigger1 = time = 0
fvar(0) = 0.75

[state a]
type = VarSet
trigger1 = time = 0
fvar(1) = 3

[state a]
type = varadd
trigger1 = 1
fvar(0) = 0.1

[state a]
type = varadd
trigger1 = 1
fvar(1) = -0.075

[state a]
type = angledraw
trigger1 = 1
Scale = fvar(0),fvar(1)

[State a]
type     = Destroyself
trigger1 = Time > 20


;---------------------------------------------------------------------------
; [Helper] レクイエム / エフェクト2
;---------------------------------------------------------------------------

[statedef 12315]
Physics     = N
Anim        = 12315
SprPriority = 5

[State a]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

;-------------------------------------------------[サイズ設定]

[State a, サイズ用変数]
type     = Varset
trigger1 = !Time
fvar(1)   = 0

[State a, サイズ用変数]
type     = VarAdd
trigger1 = time = [1,10]
fvar(1)   = 0.5

[State a, 透過用変数]
type     = VarAdd
trigger1 = time = [11,25]
fvar(1)   = 0.1

[State a, サイズ変更]
Type     = Angleset
Trigger1 = !time
value    = (random%360)

[State a, サイズ変更]
Type     = AngleDraw
Trigger1 = 1
value    = -40
Scale    = 0.5+fvar(1)/2 , 0.5+fvar(1)/3

;-------------------------------------------------[透過設定]
[State a, 透過]
Type     = Trans
Trigger1 = 1
Trans    = AddAlpha
Alpha    = 256-Var(2),256

[State a, 透過用変数]
type     = Varset
trigger1 = !Time
var(2)   = 0

[State a, 透過用変数]
type     = VarAdd
trigger1 = 1
var(2)   = 22

[State a, ヘルパー消滅]
type     = DestroySelf
trigger1 = Time >= 21
trigger2 = var(2) > 256





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; レクイエム(EF) / 一段目
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2400]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2300
SprPriority = 2

[State 2400, スロー演出]
type     = Pause
trigger1 = Animelemtime(1) = 0
trigger2 = Animelemtime(1) = 1
trigger3 = Animelemtime(1) = 2
trigger4 = Animelemtime(1) = 3
trigger5 = Animelemtime(1) = 4
Anim     = -1
time     = 2
;Movetime = 1
P2DefMul = 1
Darken = 0
Persistent = 1

[State 2400, スロー演出]
type     = Pause
trigger1 = Animelemtime(2) = 0
trigger2 = Animelemtime(2) = 1
trigger3 = Animelemtime(2) = 2
trigger4 = Animelemtime(2) = 3
trigger5 = Animelemtime(2) = 4
trigger6 = Animelemtime(2) = 5
trigger7 = Animelemtime(2) = 6
Anim     = -1
time     = 3
;Movetime = 1
P2DefMul = 1
Darken = 0
Persistent = 1

[state a, Nothitby]
type     = nothitby
trigger1 = time < 14
value    = SCA
time     = 1

[State 2400]
type     = PlayerPush
trigger1 = time < 14
value    = 0

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2400, ゲージ減少]
Type           = varAdd
Trigger1       = Animelem = 4
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -3000

[State 2400, ゲージ回復抑制]
Type           = varset
Trigger1       = AnimelemTime(4) >= 0
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = Animelem = 4
value    = s5, 1

[State a, 暗転処理]
type     = SuperPause
trigger1 = Animelem = 4
darken   = 0
anim     = -1
sound    = -1
time     = 57
movetime = 57
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Animelem = 4
value    = SCA,AA,AT,AP
time     = 57
ignorehitpause = 1


;-----------------------------------------------------[エフェクト]

[State a];カットイン
Type = Helper
Trigger1 = Animelem = 4
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = Animelem = 4
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 0, -55
PosType = P1
StateNo = 8806
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1



;=================================================================
;  |ここから攻撃ステート|
;=================================================================

[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 3
value    = s200, 7

[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 7
value    = s200, 8

[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 7
value    = s200, 5

[State 2400]
type     = VelSet
trigger1 = Animelem = 9
X        = -20

[state 2400, エフェクト] ;マズルフラッシュ
type     = Explod
trigger1 = AnimelemTime(7) = 0
anim     = 12300
pos      = 0, 0
Scale    = const(size.xscale)*2,const(size.yscale)*2
id       = 12300
bindtime = -1
sprpriority    = 6
Persistent     = 0
IgnoreHitPause = 1
removeongethit = 1

[State 2400, エフェクト]
Type     = Helper
Trigger1 = AnimelemTime(8) = 0
OwnPal   = 1
PosType  = P1
Pos      = 90, -95
ID       = 12320
StateNo  = 12320
Name     = "effect"
Persistent    = 0
IgnoreHitPause = 1
PauseMoveTime = 999999
SuperMoveTime = 999999

[state 2400, 着弾エフェクト]
type     = Explod
trigger1 = MoveHit = 1
anim     = 12310
Postype  = P2
pos      = 0, -55
Scale    = const(size.xscale)*2.5,const(size.yscale)*2.5
id       = 12310
bindtime = 1
Persistent     = 0
sprpriority    = 9
IgnoreHitPause = 1

[state 2400, 着弾エフェクト]
Type     = Helper
Trigger1 = MoveHit = 1
OwnPal   = 1
PosType  = P2
Pos      = 0, -55
ID       = 12315
StateNo  = 12315
Name     = "effect"
size.xscale = 1
size.yscale = 1
Persistent     = 0
IgnoreHitPause = 1
PauseMoveTime  = 999999
SuperMoveTime  = 999999

;-------------------------------------------------[ヒット定義]

[State 2400, HitDef]
type                = HitDef
trigger1            = Animelem = 7
attr                = , HA
hitflag             = MAF
guardflag           = M
damage              = Floor(533*Fvar(0)), 5
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(20*(1+0.5*var(7))), floor(19*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = -1
guardsound          = s1, 3
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -8, -2.5
guard.velocity      = -8
air.velocity        = -8, -2.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(6000*FVar(3))+(floor(10*(2+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
ID = 8010
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.91,0.5))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit=1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 20

;=======================================[ヒット、ガードエフェクト]

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7110
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[相手制御]

[state a, ステート奪取]
type       = targetstate
trigger1   =  MoveHit = 1
trigger1   = (NumTarget>0)&&(target,IsHelper=0)
trigger1   =  enemy,stateno != 2450
value      =  2450

[state a, ステート奪取]
type       = targetstate
trigger1   =  MoveGuarded = 1
trigger1   = (NumTarget>0)&&(target,IsHelper=0)
trigger1   =  enemy,stateno != 8020
value      =  8020

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 2400, ステート変更] ;追撃
type     = ChangeState
trigger1 = Movecontact
trigger1 = AnimelemTime(8)=5
value    = 2410
ctrl     = 0

[State 2400, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; レクイエム(EF) / 追撃演出
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2410]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
Anim     = 2400
SprPriority = 2

[state a];無理矢理
type = AssertSpecial
trigger1 = AnimelemTime(4) < 0
flag = NoBG

[State a, エフェクト] ;背景
Type     = Helper
Trigger1 = time = 0
OwnPal   = 1
PosType  = P1
Pos      = 0, 0
ID       = 9985
StateNo  = 9985
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State 2410]
type     = VelSet
trigger1 = Animelem = 2
X        = -15

[state a, nothitby]
type     = nothitby
trigger1 = 1
value    = SCA
time     = 1

[State 2410, エフェクト];相手に付属
Type     = Helper
Trigger1 = !Time
OwnPal   = 1
PosType  = P2
Pos      = 0, -65
ID       = 12400
StateNo  = 12400
Name     = "effect"
Persistent    = 0
size.xscale = 1
size.yscale = 1
PauseMoveTime = 99999
SuperMoveTime = 99999

[State 2410, エフェクト];相手に付属
Type     = Helper
Trigger1 = !Time
OwnPal   = 1
PosType  = P2
Pos      = 0, -65
ID       = 12402
StateNo  = 12400
Name     = "effect"
Persistent    = 0
size.xscale = 1
size.yscale = 1
PauseMoveTime = 99999
SuperMoveTime = 99999

[State 2410, エフェクト];相手に付属
Type     = Helper
Trigger1 = !Time
OwnPal   = 1
PosType  = P2
Pos      = 0, -65
ID       = 12401
StateNo  = 12400
Name     = "effect"
Persistent    = 0
size.xscale = 1
size.yscale = 1
PauseMoveTime = 99999
SuperMoveTime = 99999

[State 2410, エフェクト];相手に付属
Type     = Helper
Trigger1 = !Time
OwnPal   = 1
PosType  = P2
Pos      = 0, -65
ID       = 12400
StateNo  = 12401
Name     = "effect"
Persistent    = 0
size.xscale = 1
size.yscale = 1
PauseMoveTime = 99999
SuperMoveTime = 99999

[State 2410, エフェクト];相手に付属
Type     = Helper
Trigger1 = !Time
OwnPal   = 1
PosType  = P2
Pos      = 0, -65
ID       = 12402
StateNo  = 12401
Name     = "effect"
Persistent    = 0
size.xscale = 1
size.yscale = 1
PauseMoveTime = 99999
SuperMoveTime = 99999

[State 2410, エフェクト];相手に付属
Type     = Helper
Trigger1 = !Time
OwnPal   = 1
PosType  = P2
Pos      = 0, -65
ID       = 12401
StateNo  = 12401
Name     = "effect"
Persistent    = 0
size.xscale = 1
size.yscale = 1
PauseMoveTime = 99999
SuperMoveTime = 99999

[State 2410, エフェクト];相手に付属
Type     = Helper
Trigger1 = !Time
OwnPal   = 1
PosType  = P2
Pos      = 0, 0
ID       = 12402
StateNo  = 12402
Name     = "effect"
Persistent    = 0
size.xscale = 1
size.yscale = 1
PauseMoveTime = 99999
SuperMoveTime = 99999

;-----------------------------------------------------[ゲージ管理]

[State 2410, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = Animelem = 9
value    = s5, 2

[State a, 暗転処理]
type     = SuperPause
trigger1 = !time
darken   = 0
anim     = -1
sound    = -1
time     = 90
movetime = 90
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a];暗転処理
Type = Helper
Trigger1 = Animelem = 4
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 0, -55
PosType = P1
StateNo = 8806
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];カットイン
Type = Helper
Trigger1 = Animelem = 4
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

;=================================================================
;  |ここから攻撃ステート|
;=================================================================

[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 8
value    = s200, 7

[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 13
value    = s200, 8

[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 13
value    = s200, 5

[State 2410]
type     = VelSet
trigger1 = Animelem = 15
X        = -20

[state 2410, エフェクト] ;マズルフラッシュ
type     = Explod
trigger1 = AnimelemTime(13) = 0
anim     = 12300
pos      = 0, 0
Scale    = const(size.xscale)*2,const(size.yscale)*2
id       = 12300
bindtime = -1
sprpriority    = 6
Persistent     = 0
IgnoreHitPause = 1
removeongethit = 1

[State 2410, エフェクト]
Type     = Helper
Trigger1 = AnimelemTime(13) = 0
OwnPal   = 1
PosType  = P1
Pos      = 90, -95
ID       = 12320
StateNo  = 12320
Name     = "effect"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[state 2410, 着弾エフェクト]
type     = Explod
Trigger1 = AnimelemTime(13)=[0,4]
trigger1 = MoveHit = 1
anim     = 12310
Postype  = P2
pos      = 0, -55
Scale    = const(size.xscale)*2.5,const(size.yscale)*2.5
id       = 12310
bindtime = 1
Persistent     = 0
sprpriority    = 6
IgnoreHitPause = 1

[state 2300, 着弾エフェクト]
Type     = Helper
Trigger1 = AnimelemTime(13)=[0,4]
Trigger1 = MoveHit = 1
OwnPal   = 1
PosType  = P2
Pos      = 0, -55
ID       = 12315
StateNo  = 12315
Name     = "effect"
Persistent    = 0
size.xscale = 1
size.yscale = 1
Persistent     = 0
IgnoreHitPause = 1
PauseMoveTime = 999999
SuperMoveTime = 999999

;-------------------------------------------------[ヒット定義]

[State 2410, HitDef]
type                = HitDef
trigger1            = Animelem = 13
attr                = , HA
hitflag             = MAF
guardflag           = M
damage              = Floor(255*Fvar(0)), 5
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(20*(1+0.5*var(7))), floor(19*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 5
guardsound          = s1, 3
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -8, -2.5
guard.velocity      = -8
air.velocity        = -8, -2.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(6000*FVar(3))+(floor(20*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
ID = 8010
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.5)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit=1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 20

;=======================================[ヒット、ガードエフェクト]

;-------------------------------------------------[相手制御]

[state a, ステート奪取]
type       = targetstate
trigger1   =  MoveHit = 1
trigger1   = (NumTarget>0)&&(target,IsHelper=0)
trigger1   =  enemy,stateno != 8010
value      =  8010

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 2410, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;	[相手] レクイエム / ヒット硬直
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2450]
Type     = A
MoveType = H
Physics  = N
Ctrl     = 0
VelSet   = 0, 0

[State 2450, 0] ;ヘルパー対策
type     = DestroySelf
trigger1 = ishelper

[State 2450, HitVelSet]
Type     = VelSet
Trigger1 = 1
X        = 0
Y        = 0

[state a]
type     = turn
trigger1 = p2dist x < 0
trigger1 = time = 0

[state a]
type     = playerpush
trigger1 = 1
value    = 0

[State 2450, アニメ変更]
Type     = ChangeAnim2
Trigger1 = Time > 0
Value    = 2260

[State 2450, ステート返却]
Type     = SelfState
Trigger1 = Time > 150
Value    = 5050


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[helper] レクイエム 演出ヘルパー
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 12400]
Physics     = N
Anim        = 12420
SprPriority = 9

[State 12400]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

[State 12400]
type = trans
trigger1 = 1
trans = Add

;---------------------------------------------

[State 12400]
type = Angleset
trigger1 = IsHelper(12400)
value = 0

[State 12400]
type = Angleset
trigger1 = IsHelper(12401)
value = 45

[State 12400]
type = Angleset
trigger1 = IsHelper(12402)
value = -45

[State 12400]
type = Angledraw
trigger1 = 1
scale = 1, 1

;---------------------------------------------

[State 12400, ヘルパー消滅]
Type     = DestroySelf
Trigger1 = root,MoveType = H
trigger2 =(root,StateNo = 2410)&&(time > 90)
trigger3 =(root,StateNo!= 2410)


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[helper] レクイエム 演出ヘルパー (裏)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 12401]
Physics     = N
Anim        = 12410
SprPriority = 7

[State 12401]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

[State 12401]
type = trans
trigger1 = 1
trans = Add

;---------------------------------------------

[State 12401]
type = Angleset
trigger1 = IsHelper(12400)
value = 0

[State 12401]
type = Angleset
trigger1 = IsHelper(12401)
value = 45

[State 12401]
type = Angleset
trigger1 = IsHelper(12402)
value = -45

[State 12401]
type = Angledraw
trigger1 = 1
scale = 1, 1

;---------------------------------------------

[State 12401, ヘルパー消滅]
Type     = DestroySelf
Trigger1 = root,MoveType = H
trigger2 =(root,StateNo = 2410)&&(time > 90)
trigger3 =(root,StateNo!= 2410)




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[helper] レクイエム 演出ヘルパー (足下)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 12402]
Physics     = N
Anim        = 9999
SprPriority = 7

[State 12402]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

[State a]
type     = posset
trigger1 = 1
Y = 0

[state a] ;足下
type           = explod
Trigger1       = 1
anim           = 12400
ID             = 12400
Pos            = 0 , 0
postype        = P1
SprPriority    = 5
ownpal         = 1
bindtime       = -1
pausemovetime = 99999
supermovetime = 99999
ignorehitpause = 1
scale          = 1.2, 0.25

[state a] ;足下
type           = explod
Trigger1       = 1
anim           = 12401
ID             = 12400
Pos            = 0 , 0
postype        = P1
SprPriority    = 5
ownpal         = 1
bindtime       = -1
pausemovetime = 99999
supermovetime = 99999
ignorehitpause = 1
scale          = 1, 0.25

;---------------------------------------------

[State 12401, ヘルパー消滅]
Type     = DestroySelf
Trigger1 = root,MoveType = H
trigger2 =(root,StateNo = 2410)&&(time > 90)
trigger3 =(root,StateNo!= 2410)