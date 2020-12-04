
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; サントゥクス / 地上A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1000]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1000
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 1000]
type     = PlaySnd
trigger1 = Animelem = 5
value    = s2, 2

;-------------------------------------------------[弾幕展開]

[State 1000, 見かけの瓶]
type        = Helper
trigger1    = Animelemtime(4) = 0
name        = "skill-236"
ID          = 11010
postype     = P1
pos         = 30, -52
Stateno     = 11010
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

[State 1000]
type        = Helper
trigger1    = Animelemtime(5) = 0
name        = "skill-236"
ID          = 11000 + ((PrevStateNo=1001)*1) + ((PrevStateNo=1002)*2)
postype     = P1
pos         = 38, -85
Stateno     = 11000
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[終了]

[state 1000, ステート変更]
type     = ChangeState
trigger1 = animtime = 0
value	 = 0
ctrl	 = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; サントゥクス / 地上B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1001]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1000
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[終了]

[state 1001, ステート変更]
type     = ChangeState
trigger1 = !Time
value	 = 1000



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; サントゥクス / 地上C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1002]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1000
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[終了]

[state 1002, ステート変更]
type     = ChangeState
trigger1 = !time
value	 = 1000


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; サントゥクス / 空中A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1050]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1050
sprpriority = 2

[State 1050]
type     = VelAdd
trigger1 = 1
Y        = 0.46

;-------------------------------------------------[演出]

[State 1050]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s2, 2

;-------------------------------------------------[弾幕展開]

[State 1050]
type        = Helper
trigger1    = time = 18
name        = "skill-236"
ID          = 11050 + ((PrevStateNo=1051)*1) + ((PrevStateNo=1052)*2)
postype     = P1
pos         = 38, -85
Stateno     = 11000
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

[State 1000, 見かけの瓶]
type        = Helper
trigger1    = Animelemtime(2) = 0
name        = "skill-236"
ID          = 11010
postype     = P1
pos         = 30, -52
Stateno     = 11010
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[終了]

[State 1050, 行動可能]
type     = null;CtrlSet
trigger1 = Animelem = 10
value    = 1

[State 1050, 着地終了]
Type     = ChangeState
trigger1 = AnimelemTime(10) < 0
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 1055
Ctrl     = 0

[State 1050, 着地終了]
Type     = ChangeState
trigger1 = AnimelemTime(10) >= 0
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; サントゥクス / 空中B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1051]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1050
sprpriority = 2

;-------------------------------------------------[終了]

[state 1051, ステート変更]
type     = ChangeState
trigger1 = !time
value	 = 1050

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; サントゥクス / 空中C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1052]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1050
sprpriority = 2

;-------------------------------------------------[終了]

[state 1052, ステート変更]
type     = ChangeState
trigger1 = !time
value	 = 1050

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; サントゥクス / 着地
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1055]
type     = S
movetype = A
physics  = S
velset   = 0, 0
anim     = 1051
ctrl     = 0
sprpriority = 2

[State 52, 振り向き]
type = Turn
trigger1 = time = 0
trigger1 = P2dist X < 0

[State 1051, 着地]
type     = Playsnd
trigger1 = !time
value    = s52,0

[State 1051, 着地終了]
Type     = ChangeState
trigger1 = AnimTime = 0
Value    = 0
Ctrl     = 1

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] サントゥクス / 瓶
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11000]
Type        = A
MoveType    = A
Physics     = N
Anim        = 11000
SprPriority = 6

[State 11000]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 10000]
type = Angledraw
trigger1 = 1
scale = 0.5,0.5

;-------------------------------------------[速度設定]

[State 11000];A
type     = velset
trigger1 = !time && IsHelper(11000)
X =  2
Y = -4

[State 11000];B
type     = velset
trigger1 = !time && IsHelper(11001)
X =  4
Y = -5

[State 11000];C
type     = velset
trigger1 = !time && IsHelper(11002)
X = 0.5
Y = -12

[State 11000];JA
type     = velset
trigger1 = !time && IsHelper(11050)
X =  1
Y = -4

[State 11000];JB
type     = velset
trigger1 = !time && IsHelper(11051)
X =  3
Y = -5

[State 11000];JC
type     = velset
trigger1 = !time && IsHelper(11052)
X =  5
Y = -6


[State 11000]
type     = veladd
trigger1 = Time > 0
Y        = 0.46


[State 11000];Bキリエからの吹っ飛ばし
type       = null;VelSet
triggerAll = Root,StateNo = 1301
triggerAll = Root,Animelem = 4; || root,Animelem = 5
trigger1   = (RootDist X = [-80,10])   && (Rootdist Y = [0,150])
trigger2   = (RootDist X = [-140,-80]) && (Rootdist Y = [0,100])
trigger3   = (RootDist X = [-190,-140])&& (Rootdist Y = [0, 40])
x = 1
y = -9

[State 11000];Bキリエからの吹っ飛ばし
type       = null;VelSet
triggerAll = Root,StateNo = 1301
triggerAll = Root,Animelem = 5
trigger1   = (RootDist X = [-180,10])  && (Rootdist Y = [50,160])
x = 4
y = -5

;-------------------------------------------[バウンド回数設定]

[State 11000]
type     = Varadd
trigger1 = ((Pos Y >= 0) && (Vel Y > 0))
var(0)   = Ifelse((IsHelper(11000)||IsHelper(11050)),1, 2)

[State 11000]
type     = VelSet
trigger1 = ((Pos Y >= 0) && (Vel Y > 0))
Y = -5

;-------------------------------------------------[ヒット定義]

[State 11000, HitDef]
type                = HitDef
triggerAll          = (MoveType = A) && (!MoveContact) && (!MoveReversed)
Trigger1            = IsHelper(11000)||IsHelper(11001)||ishelper(11050)||ishelper(11051)
Trigger2            = IsHelper(11002)||IsHelper(11052)
trigger2            = time > 5
attr                = A, SP
hitflag             = MAF
guardflag           = MA
damage              = Floor(20*root,Fvar(0)),0
animtype            = Light
ground.type         = high
priority            = 3, Hit
pausetime           = 0, 9
Guard.PauseTime     = 0, 9
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

ground.velocity     = -3
guard.velocity      = -4
air.velocity        = -2, -4.5
airguard.velocity   = -2, -3
air.fall            = 1
fall.recovertime    = Ceil(22*root,FVar(3))+9
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードサウンド]

[State a];ヒットサウンド
Type           = PlaySnd
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
value          = s0, 0
channel        = 0
Persistent     = 0
IgnoreHitPause = 1

[State a];ヒットサウンド
Type           = PlaySnd
Trigger1       = MoveGuarded
Trigger1       = P2Movetype = H
value          = s1, 0
channel        = 0
Persistent     = 0
IgnoreHitPause = 1

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 0, 0
PosType  = P1
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

;-------------------------------------------------[終了]

[State 10000]
type     = ChangeState
trigger1 = MoveContact || MoveReversed
trigger2 = var(0) >= 2
;trigger3 = Root,StateNo = 1302
;trigger3 = Root,Animelem = 4 || root,Animelem = 5
;trigger3 = RootDist X = [-190,10]
;trigger3 = Rootdist Y = [0,150]
value    = 11001

[State 11000]
type     = DestroySelf
trigger1 = FrontedgeDist < -40


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] サントゥクス / 聖水
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11001]
Type        = A
MoveType    = A
Physics     = N
Anim        = 11005
SprPriority = 6

[state 11001]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 11001]
type = Velset
trigger1 = !time
X = 0
Y = 0

[State a]
type = Trans
trigger1 = 1
trans = add

[State 10001]
type = Angledraw
trigger1 = 1
scale = 0.5,0.5

;-----------------------------------------------------
[State 11001]
Type           = PlaySnd
Trigger1       = !time && (PrevStateno = 11000)
value          = s200, 0
Persistent     = 0
IgnoreHitPause = 1

[State 11001, 瓶表示]
Type        = Explod
Trigger1    = !time && (PrevStateno = 11000)
Anim        = 11001
ID          = 11001
PosType     = P1
Pos         = 0, 0
OwnPal      = 1
Vel         = 0,0
Scale       = 0.5,0.5
SprPriority = 7
SuperMoveTime = 99999
PauseMoveTime = 99999
Persistent = 0
IgnoreHitPause = 1

[State 11001, 瓶の数カウント]
Type           = null;Projectile
Trigger1       = 1
ProjID         = 11100
ProjAnim       = 9999
ProjRemoveTime = 1
IgnoreHitPause = 1
SuperMoveTime  = 99999
PauseMoveTime  = 99999

;-----------------------------------------------------

[State 10001]
type     = ChangeState
trigger1 = (Root,StateNo = 1400) || (root,Stateno = 1450) ;ベネディクトゥス
trigger1 = (Root,Animelemtime(2) = 2)
value    = 11400

[State 10001]
type     = DestroySelf
trigger1 = time >= 315


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] サントゥクス / 瓶(見かけ)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11010]
Type        = A
MoveType    = A
Physics     = N
Anim        = 11010
SprPriority = 6

[State 11010]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 10010]
type = Angledraw
trigger1 = 1
scale = 0.5, 0.5

[State 10001]
type     = DestroySelf
trigger1 = root,Movetype = H
Trigger2 = root,StateNo != 1000 && root,StateNo != 1050
Trigger3 = time >= 5




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; クレド / 地上A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1100]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1100
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

[State a]
type     = Nothitby
trigger1 = Time <= 7
value    = ,AT

[State a]
type      = StateTypeSet
trigger1  = Time >= 8
statetype = A
physics   = N

;-------------------------------------------------[演出]

[State 1100]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s2, 0


[State 1100]
type     = VelSet
trigger1 = Time = 8
x        = 0.5
y        = -5.5

[State 1100]
type     = VelAdd
trigger1 = Animelem = 4,>0
y        = 0.46

[state 1100, エフェクト]
type     = Explod
trigger1 = AnimelemTime(3) = 0
anim     = 11100
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10110
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1100, エフェクト]
type     = Explod
trigger1 = AnimelemTime(2) = 0
anim     = 11105
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10115
bindtime = 12
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1


;-------------------------------------------------[ヒット定義]
[State 1100, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = A, SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(21*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 1
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -1.2, -9
guard.velocity      = -6
air.velocity        = -1.2, -9
airguard.velocity   = -1, -5.5
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5

[State 1100, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = A, SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(75*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(15*(1+0.5*var(7))), floor(14*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -1.2, -9
guard.velocity      = -6
air.velocity        = -1.2, -9
airguard.velocity   = -1, -5.5
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(15*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6

[State 1200, フラグリセット]
Type     = MoveHitReset
Trigger1 = MoveContact = 1
Trigger1 = AnimElem = 5 ,<0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = AnimElem = 4,<0
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = AnimElem = 5,>0
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Trigger1 = AnimElem = 4,<0
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
Trigger1 = AnimElem = 5,>0
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
Trigger1       = MoveHit && Var(7) = 0
Trigger1       = AnimElem = 4,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=1,0.95,0.8)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Trigger1       = AnimElem = 4,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=1,1.0, 0.97)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Trigger1       = AnimElem = 5,>0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Trigger1       = AnimElem = 5,>0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElem = 5,>0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83 * ifelse(var(7)=1,0.2,1))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElem = 4,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElem = 5,>0
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 4,<0
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 21*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 5,>0
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 75*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 1100]
type     = ChangeState
trigger1 = ((vel y > 0) && (Pos Y >= 0))
Trigger2 = Animtime = 0
value    = 1110


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; クレド / 地上B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1101]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1101
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

[State a]
type     = Nothitby
trigger1 = Time <= 12
value    = ,AT

[State a]
type      = StateTypeSet
trigger1  = Time >= 10
statetype = A
physics   = N

;-------------------------------------------------[演出]

[State 1101]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s2, 0


[State 1101]
type     = VelSet
trigger1 = Time = 10
x        = 2
y        = -6.5

[State 1101]
type     = VelAdd
trigger1 = Animelem = 4,>2
y        = 0.46

[state 1101, エフェクト]
type     = Explod
trigger1 = AnimelemTime(4) = 0
anim     = 11101
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10101
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1101, エフェクト]
type     = Explod
trigger1 = AnimelemTime(4) = 0
anim     = 11105
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10105
bindtime = 12
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1


;-------------------------------------------------[ヒット定義]
[State 1101, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = A, SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(25*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 1
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -1.2, -10
guard.velocity      = -6
air.velocity        = -1.2, -10
airguard.velocity   = -1, -5.5
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5

[State 1100, HitDef]
type                = HitDef
trigger1            = AnimElem = 6
attr                = A, SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(83*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(15*(1+0.5*var(7))), floor(14*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -1.2, -9
guard.velocity      = -6
air.velocity        = -1.2, -9
airguard.velocity   = -1, -5.5
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(15*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6

[State 1200, フラグリセット]
Type     = MoveHitReset
Trigger1 = MoveContact = 1
Trigger1 = AnimElem = 6 ,<0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = AnimElem = 5,<0
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = AnimElem = 6,>0
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Trigger1 = AnimElem = 5,<0
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
Trigger1 = AnimElem = 6,>0
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
Trigger1       = MoveHit && Var(7) = 0
Trigger1       = AnimElem = 5,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=1,0.95,0.8)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Trigger1       = AnimElem = 5,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=1,1.0, 0.97)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Trigger1       = AnimElem = 6,>0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Trigger1       = AnimElem = 6,>0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)


[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElem = 5,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElem = 6,>0
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 5,<0
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 25*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 6,>0
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 86*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 1101]
type     = ChangeState
trigger1 = ((vel y > 0) && (Pos Y >= 0))
Trigger2 = Animtime = 0
value    = 1110


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; クレド / 地上C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1102]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1102
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

[State a]
type     = Nothitby
trigger1 = Time <= 10
value    = SCA,AA,AT

[State a]
type      = StateTypeSet
trigger1  = Time >= 10
statetype = A
physics   = N

;-------------------------------------------------[演出]

[State 1102]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s2, 3


[State 1102]
type     = VelSet
trigger1 = Time = 10
x        = 3
y        = -8.2

[State 1102]
type     = VelAdd
trigger1 = Animelem = 4,>0
y        = 0.46

[state 1102, エフェクト]
type     = Explod
trigger1 = AnimelemTime(4) = 0
anim     = 11102
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10102
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1102, エフェクト]
type     = Explod
trigger1 = AnimelemTime(6) = 0
anim     = 11105
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10105
bindtime = 12
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1


;-------------------------------------------------[ヒット定義]
[State 1101, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
trigger2            = AnimElem = 5
trigger3            = AnimElem = 6
trigger4            = AnimElem = 7
attr                = A, SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(25*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(6*(1+0.5*var(7))), floor(5*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 1
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -1.2, -10
guard.velocity      = -6
air.velocity        = -1.2, -10
airguard.velocity   = -1, -5.5
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(6*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5

[State 1100, HitDef]
type                = HitDef
trigger1            = AnimElem = 9
attr                = A, SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(83*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(15*(1+0.5*var(7))), floor(14*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -1.2, -9
guard.velocity      = -6
air.velocity        = -1.2, -9
airguard.velocity   = -1, -5.5
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(15*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6

[State 1110, フラグリセット]
Type     = MoveHitReset
Trigger1 = MoveContact = 1
Trigger1 = AnimElem = 9 ,<0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = AnimElemTime(4)=[0,1]
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = AnimElemTime(5)=[0,1]
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = AnimElemTime(6)=[0,1]
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = AnimElemTime(7)=[0,1]
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = AnimElemTime(9) > 0
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Trigger1 = AnimElemTime(5)=[0,1]
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
Trigger1 = AnimElemTime(6)=[0,1]
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
Trigger1 = AnimElemTime(7)=[0,1]
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
Trigger1 = AnimElemTime(9) > 0
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
Trigger1       = AnimElemTime(4)=[0,1]
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (Ifelse(fvar(2)=1,0.95,0.8) * ifelse(var(7)=1,0.2,1))

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElemTime(5)=[0,1]
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (Ifelse(fvar(2)=1,0.95,0.8) * ifelse(var(7)=1,0.2,1))

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElemTime(6)=[0,1]
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (Ifelse(fvar(2)=1,0.95,0.8) * ifelse(var(7)=1,0.2,1))

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElemTime(7)=[0,1]
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (Ifelse(fvar(2)=1,0.95,0.8) * ifelse(var(7)=1,0.2,1))

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElem = 9,>0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83 * ifelse(var(7)=1,0.2,1))


[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElemTime(4)=[0,1]
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElemTime(5)=[0,1]
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElemTime(6)=[0,1]
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElemTime(7)=[0,1]
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = AnimElem = 9,>0
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElemTime(4)=[0,1]
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 25*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElemTime(5)=[0,1]
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 25*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElemTime(6)=[0,1]
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 25*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElemTime(7)=[0,1]
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 25*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 9,>0
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 86*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 1100]
type     = ChangeState
trigger1 = ((vel y > 0) && (Pos Y >= 0))
;Trigger2 = Animtime = 0
value    = 1110


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; クレド / 空中A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1150]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1150
sprpriority = 2

[State a]
type     = Velset
trigger1 = !time
Y        = 0

[State a]
type     = Nothitby
trigger1 = Time <= 9
value    = ,AT

;-------------------------------------------------[演出]

[State 1150]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s2, 1

[State 1150]
type     = VelSet
trigger1 = Time = 4
x        = 0.5
y        = -6

[State 1150]
type     = VelAdd
trigger1 = Animelem = 2,>0
y        = 0.46

[state 1150, エフェクト]
type     = Explod
trigger1 = AnimelemTime(4) = 0
anim     = 11150
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10150
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1150, エフェクト]
type     = Explod
trigger1 = AnimelemTime(3) = 0
anim     = 11105
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10115
bindtime = 12
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[ヒット定義]

[State 1100, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = A, SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(67*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
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

ground.velocity     = -1.2, -9
guard.velocity      = -6
air.velocity        = -1.2, -9
airguard.velocity   = -1, -5.5
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
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
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.98, 0.83))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 67*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 1150]
type     = ChangeState
trigger1 = ((vel y > 0) && (Pos Y >= 0))
value    = 1110


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; クレド / 空中B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1151]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1151
sprpriority = 2

[State a]
type     = Velset
trigger1 = !time
Y        = 0

[State a]
type     = Nothitby
trigger1 = Time <= 9
value    = ,AT

;-------------------------------------------------[演出]

[State 1101]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s2, 0

[State 1101]
type     = VelSet
trigger1 = Time = 4
x        = 2
y        = -6.5

[State 1101]
type     = VelAdd
trigger1 = Animelem = 2,>2
y        = 0.46

[state 1101, エフェクト]
type     = Explod
trigger1 = AnimelemTime(4) = 0
anim     = 11151
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10151
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1101, エフェクト]
type     = Explod
trigger1 = AnimelemTime(3) = 0
anim     = 11105
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10105
bindtime = 12
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1


;-------------------------------------------------[ヒット定義]

[State 1151, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = A, SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(83*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
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

ground.velocity     = -1.2, -9
guard.velocity      = -6
air.velocity        = -1.2, -9
airguard.velocity   = -1, -5.5
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
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
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.98, 0.83))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 86*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 1151]
type     = ChangeState
trigger1 = ((vel y > 0) && (Pos Y >= 0))
value    = 1110


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; クレド / 空中C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1152]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1152
sprpriority = 2

[State a]
type     = Velset
trigger1 = !time
Y        = 0

[State a]
type     = Nothitby
trigger1 = Time <= 6
value    = SCA,AT,AP,AA

;-------------------------------------------------[演出]

[State 1152]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s2, 0

[State 1152]
type     = VelSet
trigger1 = Time = 4
x        = 2
y        = -7

[State 1152]
type     = VelAdd
trigger1 = Animelem = 2,>0
y        = 0.46

[state 1152, エフェクト]
type     = Explod
trigger1 = AnimelemTime(4) = 0
anim     = 11152
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10150
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1152, エフェクト]
type     = Explod
trigger1 = AnimelemTime(3) = 0
anim     = 11105
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10115
bindtime = 12
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1


;-------------------------------------------------[ヒット定義]

[State 1152, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = A, SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(83*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
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

ground.velocity     = -1.2, -9
guard.velocity      = -6
air.velocity        = -1.2, -9
airguard.velocity   = -1, -5.5
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 1100
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -55)
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
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
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.98, 0.83))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 67*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 1152]
type       = ChangeState
triggerAll = Animelemtime(4) >= 0
trigger1   = ((vel y > 0) && (Pos Y >= 0))
value      = 1110



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; くれど / 着地
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1110]
type     = S
movetype = A
physics  = S
velset   = 0, 0
anim     = 1110
ctrl     = 0
sprpriority = 2

[State 1110]
type = posset
trigger1 = !time
Y = 0

[State 52, 振り向き]
type = Turn
trigger1 = time = 0
trigger1 = P2dist X < 0

[State 1110, 着地]
type     = Playsnd
trigger1 = !time
value    = s10, 2

[State 1110, 着地終了]
Type     = ChangeState
trigger1 = AnimTime = 0
Value    = 0
Ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; グロリア / A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1200]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1200
sprpriority = 2

[State 1200]
type      = StateTypeSet
trigger1  = Time = 4
statetype = A
physics   = N

[State 1200]
type      = StateTypeSet
trigger1  = Animelem = 8
statetype = S
physics   = S

[State 1200]
type = nothitby
trigger1 = time <= 3
value = ,At

;------------------------------------------[演出]
[State 1200, 1]
type     = VelSet
trigger1 = Animelem = 2
x =  7
y = -4

[State 1200, 1]
type     = VelAdd
trigger1 = Animelemtime(2) >=0
trigger1 = Animelemtime(7) < 0
trigger1 = Pos Y < 0
y        = 0.46

[State 1200, 1]
type     = PosSet
trigger1 = Animelem = 7
y = 0

[State 1200, 1]
type     = VelSet
trigger1 = Animelem = 7
X = 0
Y = 0

[State 1200, 1]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s40, 1

[State 1200, 1]
type     = PlaySnd
trigger1 = Animelem = 9
value    = s2, 3

[state 1200, エフェクト]
type     = Explod
trigger1 = AnimelemTime(9) = 0
anim     = 11200
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10200
ownpal   = 1
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1200, エフェクト]
type     = Explod
trigger1 = AnimelemTime(8) = 0
anim     = 11205
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10205
ownpal   = 1
bindtime = 10
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[State 1200, エフェクト]
Type     = Helper
Trigger1 = Animelemtime(10) = 0
Name     = "hit"
Stateno  = 11210
ID       = 11210
Pos      = 70, 5
PosType  = P1
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[ヒット定義]

[State 1200, HitDef]
type                = HitDef
trigger1            = AnimElem = 10
attr                = S, SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(83*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -5
guard.velocity      = -6
air.velocity        = -1.2, 10
airguard.velocity   = -1, -5.5
air.fall            = 1
fall.recovertime    = Ceil(56*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -7
Guard.CornerPush.VelOff    = -7

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 1200
Pos      = 80, -20
PosType  = P1
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
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
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.98, 0.83))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 83*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 1200, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; グロリア / B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1201]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1201
sprpriority = 2

[State 1201]
type      = StateTypeSet
trigger1  = Time = 7
statetype = A
physics   = N

[State 1201]
type      = StateTypeSet
trigger1  = Animelem = 8
statetype = S
physics   = S

;------------------------------------------[演出]
[State 1201, 1]
type     = VelSet
trigger1 = Animelem = 3
x = 8
y = -4.5

[State 1201, 1]
type     = VelAdd
trigger1 = Animelemtime(3) >=0
trigger1 = Animelemtime(8) < 0
trigger1 = Pos Y < 0
y        = 0.5

[State 1201, 1]
type     = PosSet
trigger1 = Animelem = 8
y = 0

[State 1201, 1]
type     = VelSet
trigger1 = Animelem = 8
X = 0
y = 0

[State 1200, 1]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s40, 1

[State 1201, 1]
type     = PlaySnd
trigger1 = Animelem = 9
value    = s2,4

[state 1201, エフェクト]
type     = Explod
trigger1 = AnimelemTime(9) = 0
anim     = 11200
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10201
bindtime = -1
ownpal   = 1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1200, エフェクト]
type     = Explod
trigger1 = AnimelemTime(8) = 0
anim     = 11205
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10205
bindtime = 10
ownpal   = 1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[State 1200, エフェクト]
Type     = Helper
Trigger1 = Animelemtime(10) = 0
Name     = "hit"
Stateno  = 11210
ID       = 11210
Pos      = 70, 5
PosType  = P1
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[ヒット定義]

[State 1200, HitDef]
type                = HitDef
trigger1            = AnimElem = 9
attr                = S, SA
hitflag             = MAF
guardflag           = HA
damage              = Floor(100*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -5
guard.velocity      = -6
air.velocity        = -1.2, 10
airguard.velocity   = -1, -5.5
air.fall            = 1
fall.recovertime    = Ceil(56*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -7
Guard.CornerPush.VelOff    = -7


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 1200
Pos      = 80, -20
PosType  = P1
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
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
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.98, 0.83))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 100*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[相手制御]

[State a, 床バウンド]
type           = TargetState
TriggerAll     = NumTarget > 0
trigger1       =(MoveHit) && target,ishelper = 0
value          = 8060
persistent     = 0
ignorehitpause = 1

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 1201, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; グロリア / C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1202]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1202
sprpriority = 2

[State 1202]
type      = StateTypeSet
trigger1  = Time = 7
statetype = A
physics   = N

[State 1202]
type      = StateTypeSet
trigger1  = Animelem = 11
statetype = S
physics   = S

[State 1202]
type = nothitby
trigger1 = Time < 11
value = ,AA

;------------------------------------------[演出]
[State 1202, 1]
type     = VelSet
trigger1 = Animelem = 5
x = 8
y = -6.5

[State 1202, 1]
type     = VelAdd
trigger1 = Animelemtime(5) >=0
trigger1 = Animelemtime(11) < 0
trigger1 = Pos Y < 0
y        = 0.5

[State 1202, 1]
type     = PosSet
trigger1 = Animelem = 11
y = 0

[State 1202, 1]
type     = VelSet
trigger1 = Animelem = 11
X = 0
y = 0

[State 1200, 1]
type     = PlaySnd
trigger1 = Animelem = 5
value    = s40, 1

[State 1202, 1]
type     = PlaySnd
trigger1 = Animelem = 12
value    = s2,4

[state 1202, エフェクト]
type     = Explod
trigger1 = AnimelemTime(12) = 0
anim     = 11200
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 11202
bindtime = -1
ownpal   = 1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1202, エフェクト]
type     = Explod
trigger1 = AnimelemTime(11) = 0
anim     = 11205
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 11205
bindtime = 10
ownpal   = 1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[State 1200, エフェクト]
Type     = Helper
Trigger1 = Animelemtime(13) = 0
Name     = "hit"
Stateno  = 11210
ID       = 11210
Pos      = 70, 5
PosType  = P1
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[ヒット定義]

[State 1200, HitDef]
type                = HitDef
trigger1            = AnimElem = 13
attr                = S, SA
hitflag             = MAF
guardflag           = HA
damage              = Floor(117*Fvar(0)),5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -5
guard.velocity      = -6
air.velocity        = -1.2, 10
airguard.velocity   = -1, -5.5
air.fall            = 1
fall.recovertime    = Ceil(20*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -7
Guard.CornerPush.VelOff    = -7


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 1200
Pos      = 70,IfElse(EnemyNear,StateType = A, -70, -60)
PosType  = P1
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
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
fvar(1)        = FVar(1) * (ifelse(var(7)=1,0.98, 0.83))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 117*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[相手制御]

[State a, 床バウンド(強)]
type           = TargetState
TriggerAll     = NumTarget > 0
trigger1       =(MoveHit) && target,ishelper = 0
value          = 8070
persistent     = 0
ignorehitpause = 1

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 1202, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [Helper] 衝撃波エフェクト
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 11210]
Physics     = N
Anim        = 11210
SprPriority = -1

[State 11210]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

[state 11210, エフェクト]
type        = Explod
trigger1    = !Time
anim        = 11211
sprpriority = -1
pos         = 0, 0
Scale       = 0.5, 0.5
id          = 11210
bindtime    = -1

[State a];エフェクト管理
type     = ModifyExplod
trigger1 = Numexplod(11210) = 1
ID       = 11210
Trans    = Addalpha
alpha    = 256-var(1), 256
Scale    = 0.1+0.025*(time), 0.05+0.01*(time)

[State 11210, サイズ変更]
Type     = AngleDraw
Trigger1 = 1
Scale    = 0.1+(time * 0.025) , 0.05+(time * 0.01)

;-------------------------------------------------[透過設定]

[State 11210, 透過]
Type     = Trans
Trigger1 = 1
Trans    = AddAlpha
Alpha    = 256-Var(2),256

[State 11210, 透過用変数]
type     = Varset
trigger1 = !Time
var(2)   = 0

[State 11210, 透過用変数]
type     = VarAdd
trigger1 = 1
var(2)   = 10

[State 8040, 透過用変数]
type     = VarAdd
trigger1 = 1
var(1)   = 10

[State 11210, ヘルパー終了]
Type     = DestroySelf
Trigger1 = Var(2) >= 256
Trigger2 = Animtime = 0






;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; キリエ / A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1300]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1300
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 1300, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s200, 10

[State 1300, 効果音]
type     = PlaySnd
trigger1 = Animelem = 5
value    = s200, 10

[state 1300, エフェクト]
type     = Explod
trigger1 = AnimelemTime(1) = 0
anim     = 1310
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 1310
bindtime = -1
Persistent     = 0
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[ヒット定義]

[State 1300, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = S, NA
hitflag             = MAF
guardflag           = MA
damage              = Floor(30*Fvar(0)),0
animtype            = Light
ground.type         = High
priority            = 3, Hit
pausetime           = 10, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 0
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15

ground.velocity     = 5
guard.velocity      = 6
air.velocity        = 1.5, -6.3
airguard.velocity   = 1.5, -5
air.fall            = 1
fall.recovertime    = Ceil(30+5*FVar(3))+10
yaccel              = 0.48
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4
Persistent     = 0


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 5,IfElse(EnemyNear,StateType = A, -50, -55)
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
fvar(1)        = FVar(1) * 0.91

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.04

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 30*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 1300, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; キリエ / B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1301]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1300
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 1301, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s200, 10

[State 1301, 効果音]
type     = PlaySnd
trigger1 = Animelem = 5
value    = s200, 10

[state 1301, エフェクト]
type     = Explod
trigger1 = AnimelemTime(1) = 0
anim     = 1310
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 1310
bindtime = -1
Persistent     = 0
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1301, エフェクト]
type     = Explod
trigger1 = AnimelemTime(1) = 0
anim     = 11300
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 11301
bindtime = -1
sprpriority    = 7
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[ヒット定義]

[State 1301, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = S, NA
hitflag             = MAF
guardflag           = MA
damage              = Floor(30*Fvar(0)),0
animtype            = Light
ground.type         = High
priority            = 3, Hit
pausetime           = 10, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 0
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15

ground.velocity     = 5
guard.velocity      = 6
air.velocity        = 1.5, -6.3
airguard.velocity   = 1.5, -5
air.fall            = 1
fall.recovertime    = Ceil(30+5*FVar(3))+10
yaccel              = 0.48
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4
Persistent     = 0


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 5,IfElse(EnemyNear,StateType = A, -50, -55)
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
fvar(1)        = FVar(1) * 0.91

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.04

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 30*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 1301, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; キリエ / C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1302]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1300
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 1302, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s200, 10

[State 1302, 効果音]
type     = PlaySnd
trigger1 = Animelem = 5
value    = s200, 10

[state 1302, エフェクト]
type     = Explod
trigger1 = AnimelemTime(1) = 0
anim     = 1310
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 1310
bindtime = -1
Persistent     = 0
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[state 1302, エフェクト]
type     = Explod
trigger1 = AnimelemTime(1) = 1
anim     = 11301
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 11302
bindtime = -1
sprpriority    = 7
IgnoreHitPause = 0
removeongethit = 1


;-------------------------------------------------[ヒット定義]

[State 1302, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = S, NA
hitflag             = MAF
guardflag           = MA
damage              = Floor(30*Fvar(0)),0
animtype            = Light
ground.type         = High
priority            = 3, Hit
pausetime           = 10, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 0
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15

ground.velocity     = 5
guard.velocity      = 6
air.velocity        = 1.5, -6.3
airguard.velocity   = 1.5, -5
air.fall            = 1
fall.recovertime    = Ceil(30+5*FVar(3))+10
yaccel              = 0.48
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4
Persistent     = 0


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 5,IfElse(EnemyNear,StateType = A, -50, -55)
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
fvar(1)        = FVar(1) * 0.91

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.04

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 30*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 1302, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ベネディクス / 地上 / 聖水発動有り
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1400]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1400
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 1400]
type     = PlaySnd
trigger1 = time = 5
value    = s200,2

;-------------------------------------------------[弾幕展開]

[state 1400, エフェクト]
type     = Explod
trigger1 = AnimelemTime(2) = 1
anim     = 11405
pos      = 0, 0
Scale    = const(size.xscale), const(size.yscale)
id       = 11405
bindtime = -1
sprpriority    = -1
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[終了]

[state 1400, ステート変更]
type     = ChangeState
trigger1 = animtime = 0
value	 = 0
ctrl	 = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ベネディクス / 空中 / 聖水発動有り
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1450]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1450
sprpriority = 2

[State a]
type     = Velset
trigger1 = !time
X        = 0
Y        = 0

[State a]
type     = Velset
trigger1 = time = 1
Y        = 0.3

[State a]
type     = Veladd
trigger1 = Animelemtime(8) >= 0
Y        = 0.47

;-------------------------------------------------[演出]

[State 1450]
type     = PlaySnd
trigger1 = time = 5
value    = s200,2

;-------------------------------------------------[弾幕展開]

[state 1450, エフェクト]
type     = Explod
trigger1 = AnimelemTime(2) = 1
anim     = 11405
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 11405
bindtime = -1
sprpriority    = -1
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[終了]

[State 1450, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 10
value    = 1

[State 1450, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ベネディクス / 地上 / 聖水発動なし
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1401]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1400
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[弾幕展開]

[state 1401, エフェクト]
type     = Explod
trigger1 = AnimelemTime(2) = 1
anim     = 11405
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 11405
bindtime = -1
sprpriority    = -1
IgnoreHitPause = 0
removeongethit = 1

[State 1401]
type        = Helper
trigger1    = time = 25
name        = "skill-236"
ID          = 11000
postype     = P1
pos         = 35, -90
Stateno     = 11001
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[終了]

[state 1401, ステート変更]
type     = ChangeState
trigger1 = animtime = 0
value	 = 0
ctrl	 = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ベネディクス / 空中 / 聖水発動なし
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1451]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1450
sprpriority = 2

[State a]
type     = Velset
trigger1 = !time
X        = 0
Y        = 0

[State a]
type     = Velset
trigger1 = time = 1
Y        = 0.3

[State a]
type     = Veladd
trigger1 = Animelemtime(8) >= 0
Y        = 0.47

;-------------------------------------------------[弾幕展開]

[state 1451, エフェクト]
type     = Explod
trigger1 = AnimelemTime(2) = 1
anim     = 11405
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 11405
bindtime = -1
sprpriority    = -1
IgnoreHitPause = 0
removeongethit = 1

[State 1401]
type        = Helper
trigger1    = time = 25
name        = "skill-236"
ID          = 11000
postype     = P1
pos         = 35, -90
Stateno     = 11001
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[終了]

[State 1451, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 10
value    = 1

[State 1451, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] ベネティクトゥス / 聖水
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11400]
Type        = A
MoveType    = A
Physics     = N
Anim        = 11400
SprPriority = 6

[State a]
type = Assertspecial
trigger1 = 1
flag = Noshadow

[State a]
type = SprPriority
trigger1 = 1
value = 6

[State 11400]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 14000]
type = Angledraw
trigger1 = 1
scale = 1, 1

[State a]
type = trans
trigger1 = 1
trans = add

;-------------------------------------------------[連続ヒット制御]

[State a, 変数] ;セイフティ 解除
type     = null
trigger1 = !Time
trigger1 = var(2) := 0
trigger1 = var(3) := 0
Persistent = 0

[State a, 変数] ;セイフティ [回数カウント]
Type           = VarAdd
Trigger1       = MoveContact = 1
var(2)         = 1
Persistent     = 1
IgnoreHitPause = 1

[State a, 変数] ;セイフティ [連続ヒット間隔]
Type     = VarSet
Trigger1 = MoveContact = 1
var(3)   = 4

[State a, 変数] ;セイフティ [連続ヒット間隔]
Type     = VarAdd
Trigger1 = var(3) > 0
var(3)   = -1

[State a, フラグリセット]
Type     = MoveHitReset
Trigger1 = var(2) < 4
trigger1 = var(3) <= 0

;-------------------------------------------------[ヒット定義]

[State 11400, HitDef]
type                = HitDef
Trigger1            =(MoveType = A) && (!MoveContact) && (!MoveReversed)
trigger1            = (var(2) < 4) && (var(3)<=0)
attr                = A, SP
hitflag             = MAF
guardflag           = MA
damage              = Floor(42*root,Fvar(0)), 5
animtype            = Mid
ground.type         = High
priority            = 3, Hit
pausetime           = 1, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 2
ground.slidetime    = 15 + (5*var(7))
ground.hittime      = 15 + (5*var(7))
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -5
guard.velocity      = -5
air.velocity        = -1.5, -3
airguard.velocity   = -1.5, -3
air.fall            = 1
fall.recovertime    = Ceil(25*root,FVar(3)) + 9
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit=1
Trigger1 = P2Movetype = H
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
size.xscale = 1.2
size.yscale = 1.2
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 1

[State a]
Type     = Helper
Trigger1 = MoveGuarded=1
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
Persistent = 1

;-------------------------------------------------[補正]

[State 10400, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = Movehit = 1
Trigger1       = P2Movetype = H
Persistent     = 1
IgnoreHitPause = 1
fvar(1)        = Root,FVar(1) * 0.87

[State a, VarSet];復帰不能補正
Type           = parentVarSet
Trigger1       = MoveHit=1
trigger1       = P2Movetype = H
Persistent     = 1
IgnoreHitPause = 1
fvar(3)        = root,FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = root,Fvar(20) >= root,Fvar(21)
Trigger1       = MoveContact=1
Persistent     = 1
IgnoreHitPause = 1
fvar(21)       = 92*ifelse(MoveHit, 0.66, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit
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

[State a, 変数]
type     = Varset
trigger1 = P2Movetype != A
var(7)   = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = parentVarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 11400]
type = destroyself
trigger1 = Animtime = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; コムニオ / A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1600]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 1600
sprpriority = 2

;-------------------------------------------------[演出]

[State 1600, 効果音]
type     = PlaySnd
trigger1 = Time = 9
value    = s2, 4

[state a]
type     = playerpush
trigger1 = time > 9
value    = 0

;-------------------------------------------------[弾幕展開]

[State 1600]
type        = Helper
trigger1    = time = 9
name        = "Komunio"
ID          = 11600
postype     = P1
pos         = 16, -45
Stateno     = 11600 + ((PrevStateNo=1601)*10) + ((PrevStateNo=1602)*20)
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[終了]

[State 1600, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 10
value    = 1

[State 1600, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; コムニオ / B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1601]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 1600
sprpriority = 2

[State 1601, 終了]
Type     = ChangeState
Trigger1 = !time
Value    = 1600
Ctrl     = 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; コムニオ / C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1602]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 1600
sprpriority = 2

[State 1602, 終了]
Type     = ChangeState
Trigger1 = !time
Value    = 1600
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] コムニオA / 杭
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11600]
Type        = A
MoveType    = A
Physics     = N
Anim        = 11600
SprPriority = 8

[State 11600]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 11600]
type = Angledraw
trigger1 = 1
scale = 0.5,0.5

[State 11600];エフェクト用
type        = Helper
trigger1    = time = 0
name        = "ef-komunio"
ID          = 11605
postype     = P1
pos         = 0, 0
Stateno     = 11605
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------[速度設定]

[State 11600];A
type     = velset
trigger1 = !time
X =  16*cos(80*Pi/180)
Y =  16*sin(80*Pi/180)

[State 11600];緊急停止
type     = velset
trigger1 = frontEdgeDist <= 10
trigger1 = var(5) = 1
X =  0
Y =  10

[State 11600]
type     = PlayerPush
trigger1 = Var(5) = 1
value    = 0

;-------------------------------------------------[ヒット定義]

[State 11600, HitDef]
type                = HitDef
trigger1            = (MoveType = A) && (!MoveContact) && (!MoveReversed)
attr                = A, SP
hitflag             = MAF
guardflag           = MA
damage              = Floor(42*root,Fvar(0)), 5
animtype            = light
ground.type         = high
priority            = 3, Hit
pausetime           = 0, floor(9*(1+1*var(7)))
Guard.PauseTime     = 0, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 1
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -3
guard.velocity      = -4
air.velocity        = -2, -4.5
airguard.velocity   = -2, -3
fall                = 1
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0
Persistent = 0
P2facing  = 1
P2stateno = 8090

[State 11600];ヒット確認
type     = Varset
trigger1 = MoveHit
var(5)   = 1
ignorehitpause = 1

[State 11600, 拘束]
type     = TargetBind
trigger1 = NumTarget > 0
trigger1 = time > 0
trigger1 = Var(5) = 1
time = 1
pos  = 0, -25

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 0, 0
PosType  = P1
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

[State 11600, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = Movehit = 1
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = Root,FVar(1) * 0.70

[State a, VarSet];復帰不能補正
Type           = ParentVarSet
Trigger1       = MoveHit=1
trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = root,FVar(3) - 0.10

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = root,Fvar(20) >= root,Fvar(21)
Trigger1       = MoveContact=1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 42*ifelse(MoveHit, 0.66, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit
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

[State a, 変数]
type     = Varset
trigger1 = P2Movetype != A
var(7)   = 0

;-------------------------------------------------[終了]

[State 11600, 着地];ロックしているとき
Type     = ChangeState
;Trigger1 = Var(5) = 1
Trigger1 = (Vel Y > 0) && (pos y >= -20)
Value    = 11601
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] コムニオA / 杭・着地後
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11601]
Type        = A
MoveType    = A
Physics     = N
Anim        = 11601
SprPriority = 8

[State 11601]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 11601]
type     = Angledraw
trigger1 = time > 0
scale    = 0.5,0.5

[State 11601, 拘束]
type     = TargetBind
trigger1 = NumTarget > 0
trigger1 = time = 0
trigger1 = Var(5) = 1
time = 1
pos  = 0, 0

[State 11601, 飛び出してしまったとき]
type     = TargetBind
trigger1 = NumTarget > 0
trigger1 = time = 0
trigger1 = FrontedgeDist < -10
time = 1
pos  = 0, 0

;-------------------------------------------[速度設定]

[State 11601];A
type     = velset
trigger1 = !time
X =  0
Y =  0

[State 11601]
type     = Posset
trigger1 = !time
Y =  0

[State 11601]
type     = PlayerPush
trigger1 = Var(5) = 1
value    = 0

[State 11601];エフェクト衝撃波
Type        = Explod
Trigger1    = !time
Anim        = 11625
ID          = 11625
PosType     = P1
Pos         = 10, 0
OwnPal      = 1
Vel         = 0,0
Scale       = 0.5,0.5
SprPriority = 9
SuperMoveTime = 99999
PauseMoveTime = 99999
Persistent = 0
IgnoreHitPause = 1

[State 11620];エフェクト衝撃波
type        = Helper
trigger1    = !time
name        = "ef-komunio"
ID          = 11615+var(5)
postype     = P1
pos         = 0, 0
Stateno     = 11615
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 11600, HitDef]
type                = HitDef
trigger1            = Var(5)=1 
trigger1            = (MoveType = A) && (!MoveContact) && (!MoveReversed)
attr                = S, SP
hitflag             = MAF
guardflag           = MA
damage              = Floor(5*root,Fvar(0)), 5
animtype            = light
ground.type         = high
priority            = 3, Hit
pausetime           = 0, 9
Guard.PauseTime     = 0, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 1
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -3
guard.velocity      = -4
air.velocity        = -2, 10.5
airguard.velocity   = -2, -3
fall                = 0
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0
Persistent = 0
P2facing  = 1
P2stateno = 8091

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 20, -55
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
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

[State 11601, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = Movehit = 1
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = Root,FVar(1) * 0.87

[State a, VarSet];復帰不能補正
Type           = ParentVarSet
Trigger1       = MoveHit=1
trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = root,FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = root,Fvar(20) >= root,Fvar(21)
Trigger1       = MoveContact=1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 5*ifelse(MoveHit, 0.66, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit
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

[State a, 変数]
type     = Varset
trigger1 = P2Movetype != A
var(7)   = 0

;-------------------------------------------------[終了]

[State 11601, タイムカウント]
type     = varadd
trigger1 = 1
var(59)  = 1

[State 11601, タイムカウント]
type     = varadd
trigger1 = var(59) > 332
var(30) = 8

[State a]
type = Varset
trigger1 = var(30) >= 256
var(30) = 256

[State 11601]
type     = trans
trigger1 = var(59) > 333
trans    = addalpha
alpha    = 256-(var(30)), var(30)

[State 11601, 着地];ロックしているとき
Type     = Destroyself
Trigger1 = Var(59) >= 362



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] コムニオB / 杭
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11610]
Type        = A
MoveType    = A
Physics     = N
Anim        = 11610
SprPriority = 8

[State 11610]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 11610]
type = Angledraw
trigger1 = 1
scale = 0.5,0.5

;-------------------------------------------[速度設定]

[State 11610];A
type     = velset
trigger1 = !time
X =  16*cos(60*Pi/180)
Y =  16*sin(60*Pi/180)

[State 11600];緊急停止
type     = velset
trigger1 = frontEdgeDist <= 10
trigger1 = var(5) = 1
X =  0
Y =  10

[State 11610]
type     = PlayerPush
trigger1 = Var(5) = 1
value    = 0

[State 11610];エフェクト用
type        = Helper
trigger1    = time = 0
name        = "ef-komunio"
ID          = 11606
postype     = P1
pos         = 0, 0
Stateno     = 11605
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 11610, HitDef]
type                = HitDef
trigger1            = (MoveType = A) && (!MoveContact) && (!MoveReversed)
attr                = A, SP
hitflag             = MAF
guardflag           = MA
damage              = Floor(42*root,Fvar(0)), 5
animtype            = light
ground.type         = high
priority            = 3, Hit
pausetime           = 0, floor(9*(1+1*var(7)))
Guard.PauseTime     = 0, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 1
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -3
guard.velocity      = -4
air.velocity        = -2, -4.5
airguard.velocity   = -2, -3
fall                = 1
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0
Persistent = 0
P2facing  = 1
P2stateno = 8090

[State 11610];ヒット確認
type     = Varset
trigger1 = MoveHit
var(5)   = 1
ignorehitpause = 1

[State 11610, 拘束]
type     = TargetBind
trigger1 = NumTarget > 0
trigger1 = time > 0
trigger1 = Var(5) = 1
time = 1
pos  = 0, -25

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 0, 0
PosType  = P1
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

[State 11610, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = Movehit = 1
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = Root,FVar(1) * 0.70

[State a, VarSet];復帰不能補正
Type           = parentVarSet
Trigger1       = MoveHit=1
trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = root,FVar(3) - 0.10

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = root,Fvar(20) >= root,Fvar(21)
Trigger1       = MoveContact=1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 42*ifelse(MoveHit, 0.66, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit
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

[State a, 変数]
type     = Varset
trigger1 = P2Movetype != A
var(7)   = 0

;-------------------------------------------------[終了]

[State 11610, 着地];ロックしているとき
Type     = ChangeState
;Trigger1 = Var(5) = 1
Trigger1 = (Vel Y > 0) && (pos y >= -20)
Value    = 11611
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] コムニオB / 杭・着地後
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11611]
Type        = A
MoveType    = A
Physics     = N
Anim        = 11611
SprPriority = 8

[State 11611]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 11611]
type     = Angledraw
trigger1 = 1
scale    = 0.5,0.5

[State 11611, 拘束]
type     = TargetBind
trigger1 = NumTarget > 0
trigger1 = time = 0
trigger1 = Var(5) = 1
time = 1
pos  = 0, 0

[State 11611, 飛び出してしまったとき]
type     = TargetBind
trigger1 = NumTarget > 0
trigger1 = time = 0
trigger1 = FrontedgeDist < -10
time = 1
pos  = 0, 0


;-------------------------------------------[速度設定]

[State 11611];A
type     = velset
trigger1 = !time
X =  0
Y =  0

[State 11611]
type     = Posset
trigger1 = !time
Y =  0

[State 11611]
type     = PlayerPush
trigger1 = Var(5) = 1
value    = 0

[State 11611];エフェクト衝撃波
Type        = Explod
Trigger1    = !time
Anim        = 11625
ID          = 11625
PosType     = P1
Pos         = 10, 0
OwnPal      = 1
Vel         = 0,0
Scale       = 0.5,0.5
SprPriority = 9
SuperMoveTime = 99999
PauseMoveTime = 99999
Persistent = 0
IgnoreHitPause = 1

[State 11620];エフェクト衝撃波
type        = Helper
trigger1    = !time
name        = "ef-komunio"
ID          = 11615+var(5)
postype     = P1
pos         = 0, 0
Stateno     = 11615
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 11611, HitDef]
type                = HitDef
trigger1            = Var(5)=1 
trigger1            = (MoveType = A) && (!MoveContact) && (!MoveReversed)
attr                = S, SP
hitflag             = MAF
guardflag           = MA
damage              = Floor(5*root,Fvar(0)), 5
animtype            = light
ground.type         = high
priority            = 3, Hit
pausetime           = 0, 9
Guard.PauseTime     = 0, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 1
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -3
guard.velocity      = -4
air.velocity        = -2, 10.5
airguard.velocity   = -2, -3
fall                = 0
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0
Persistent = 0
P2facing  = 1
P2stateno = 8091

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 20, -50
PosType  = P1
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

[State 11611, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = Movehit = 1
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = Root,FVar(1) * 0.87

[State a, VarSet];復帰不能補正
Type           = parentVarSet
Trigger1       = MoveHit=1
trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = root,Fvar(20) >= root,Fvar(21)
Trigger1       = MoveContact=1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 5*ifelse(MoveHit, 0.66, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit
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

[State a, 変数]
type     = Varset
trigger1 = P2Movetype != A
var(7)   = 0

;-------------------------------------------------[終了]

[State 11611, タイムカウント]
type     = varadd
trigger1 = 1
var(59)  = 1

[State a]
type = Varset
trigger1 = var(30) >= 256
var(30) = 256

[State 11601, タイムカウント]
type     = varadd
trigger1 = var(59) > 332
var(30) = 8

[State 11611]
type     = trans
trigger1 = var(59) > 333
trans    = addalpha
alpha    = 256-(var(30)), var(30)

[State 11611, 着地];ロックしているとき
Type     = Destroyself
Trigger1 = Var(59) >= 362


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] コムニオC / 杭
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11620]
Type        = A
MoveType    = A
Physics     = N
Anim        = 11620
SprPriority = 8

[State 11620]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 11620]
type = Angledraw
trigger1 = 1
scale = 0.5,0.5

;-------------------------------------------[速度設定]

[State 11620];C
type     = velset
trigger1 = !time
X =  16*cos(30*Pi/180)
Y =  16*sin(30*Pi/180)

[State 11600];緊急停止
type     = velset
trigger1 = frontEdgeDist <= 10
trigger1 = var(5) = 1
X =  0
Y =  10

[State 11620]
type     = PlayerPush
trigger1 = Var(5) = 1
value    = 0

[State 11620];エフェクト用
type        = Helper
trigger1    = time = 0
name        = "ef-komunio"
ID          = 11607
postype     = P1
pos         = 0, 0
Stateno     = 11605
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 11620, HitDef]
type                = HitDef
trigger1            = (MoveType = A) && (!MoveContact) && (!MoveReversed)
attr                = A, SP
hitflag             = MAF
guardflag           = MA
damage              = Floor(42*root,Fvar(0)), 5
animtype            = light
ground.type         = high
priority            = 3, Hit
pausetime           = 0, floor(9*(1+1*var(7)))
Guard.PauseTime     = 0, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 1
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -3
guard.velocity      = -4
air.velocity        = -2, -4.5
airguard.velocity   = -2, -3
fall                = 1
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0
Persistent = 0
P2facing  = 1
P2stateno = 8090

[State 11620];ヒット確認
type     = Varset
trigger1 = MoveHit
var(5)   = 1
ignorehitpause = 1

[State 11620, 拘束]
type     = TargetBind
trigger1 = NumTarget > 0
trigger1 = time > 0
trigger1 = Var(5) = 1
time = 1
pos  = 0, -25

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 0, 0
PosType  = P1
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

[State 11620, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = Movehit = 1
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = Root,FVar(1) * 0.70

[State a, VarSet];復帰不能補正
Type           = parentVarSet
Trigger1       = MoveHit=1
trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = root,FVar(3) - 0.10

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = root,Fvar(20) >= root,Fvar(21)
Trigger1       = MoveContact=1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 42*ifelse(MoveHit, 0.66, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit
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

[State a, 変数]
type     = Varset
trigger1 = P2Movetype != A
var(7)   = 0

;-------------------------------------------------[終了]

[State 11620, 着地];ロックしているとき
Type     = ChangeState
;Trigger1 = Var(5) = 1
Trigger1 = (Vel Y > 0) && (pos y >= -20)
Value    = 11621
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] コムニオC / 杭・着地後
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11621]
Type        = A
MoveType    = A
Physics     = N
Anim        = 11621
SprPriority = 8

[State 11621]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 11621]
type     = Angledraw
trigger1 = 1
scale    = 0.5,0.5

[State 11621, 拘束]
type     = TargetBind
trigger1 = NumTarget > 0
trigger1 = time = 0
trigger1 = Var(5) = 1
time = 1
pos  = 0, 0

[State 11621, 飛び出してしまったとき]
type     = TargetBind
trigger1 = NumTarget > 0
trigger1 = time = 0
trigger1 = FrontedgeDist < -10
time = 1
pos  = 0, 0

;-------------------------------------------[速度設定]

[State 11621];A
type     = velset
trigger1 = !time
X =  0
Y =  0

[State 11621]
type     = Posset
trigger1 = !time
Y =  0

[State 11621]
type     = PlayerPush
trigger1 = Var(5) = 1
value    = 0

[State 11621];エフェクト衝撃波
Type        = Explod
Trigger1    = !time
Anim        = 11625
ID          = 11625
PosType     = P1
Pos         = 10, 0
OwnPal      = 1
Vel         = 0,0
Scale       = 0.5,0.5
SprPriority = 9
SuperMoveTime = 99999
PauseMoveTime = 99999
Persistent = 0
IgnoreHitPause = 1

[State 11620];エフェクト衝撃波
type        = Helper
trigger1    = !time
name        = "ef-komunio"
ID          = 11615+var(5)
postype     = P1
pos         = 0, 0
Stateno     = 11615
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 11621, HitDef]
type                = HitDef
trigger1            = Var(5)=1 
trigger1            = (MoveType = A) && (!MoveContact) && (!MoveReversed)
attr                = S, SP
hitflag             = MAF
guardflag           = MA
damage              = Floor(5*root,Fvar(0)), 5
animtype            = light
ground.type         = high
priority            = 3, Hit
pausetime           = 0, 9
Guard.PauseTime     = 0, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 1
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -3
guard.velocity      = -4
air.velocity        = -2, 10.5
airguard.velocity   = -2, -3
fall                = 0
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0
Persistent = 0
P2facing  = 1
P2stateno = 8091

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 20, -50
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

[State 11621, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = Movehit = 1
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = Root,FVar(1) * 0.87

[State a, VarSet];復帰不能補正
Type           = parentVarSet
Trigger1       = MoveHit=1
trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = root,Fvar(20) >= root,Fvar(21)
Trigger1       = MoveContact=1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 5*ifelse(MoveHit, 0.66, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit
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

[State a, 変数]
type     = Varset
trigger1 = P2Movetype != A
var(7)   = 0

;-------------------------------------------------[終了]

[State 11621, タイムカウント]
type     = varadd
trigger1 = 1
var(59)  = 1

[State 11621, タイムカウント]
type     = varadd
trigger1 = var(59) > 332
var(30) = 8

[State a]
type = Varset
trigger1 = var(30) >= 256
var(30) = 256

[State 11621]
type     = trans
trigger1 = var(59) > 333
trans    = addalpha
alpha    = 256-(var(30)), var(30)

[State 11621, 着地];ロックしているとき
Type     = Destroyself
Trigger1 = Var(59) >= 362





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] コムニオ / 杭・エフェクトA
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11605]
Type        = A
MoveType    = I
Physics     = N
velset      = 0, 0
Anim        = 11605
SprPriority = 9

[State 11605]
Type     = AngleDraw
trigger1 = 1
scale    = 0.5,0.5

;-----------------------------------------[演出]

[State a]
type     = Angleset
trigger1 = IsHelper(11605) 
value    = -70

[State a]
type     = Bindtoparent
trigger1 = IsHelper(11605)
pos      = 2, 0

[State a]
type     = Angleset
trigger1 = IsHelper(11606) 
value    = -60

[State a]
type     = Bindtoparent
trigger1 = IsHelper(11606)
pos      = 3, 0

[State a]
type     = Angleset
trigger1 = IsHelper(11607) 
value    = -40

[State a]
type     = Bindtoparent
trigger1 = IsHelper(11607)
pos      = 0, 0


;-------------------------------------------[透過]

[State 11605]
Type     = Trans
Trigger1 = 1
Trans    = Add;alpha
;alpha    = 126,256

[State 11605]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

[State 11605, ヘルパー消滅]
Type     = DestroySelf
Trigger1 = Time >= 120
trigger2 = Parent,StateNo=11601 || Parent,StateNo=11611 || Parent,StateNo=11621



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] コムニオ / 衝撃波エフェクトA
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 11615]
Type        = A
MoveType    = A
Physics     = N
velset      = 0, 0
Anim        = 11615
SprPriority = 9

[State 11615]
Type     = AngleDraw
trigger1 = 1
scale    = 1,1

;-----------------------------------------[演出]

[State a]
type     = Angleset
trigger1 = 1
value    = 35

[State a]
type = trans
trigger1 = 1
trans = add

;-------------------------------------------------[ヒット定義]

[State 11615, HitDef]
type                = HitDef
Trigger1            = IsHelper(11615)
Trigger1            =(MoveType = A) && (!MoveContact) && (!MoveReversed)
attr                = A, SP
hitflag             = MAF
guardflag           = MA
damage              = Floor(20*root,Fvar(0)), 5
animtype            = Mid
ground.type         = High
priority            = 3, Hit
pausetime           = 0, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 2
ground.slidetime    = 10 + (5*var(7))
ground.hittime      = 10 + (5*var(7))
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -5
guard.velocity      = -5
air.velocity        = -1.5, 10.5
airguard.velocity   = -1.5, -3
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit=1
Trigger1 = P2Movetype = H
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 0, -55
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
Trigger1 = MoveGuarded=1
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

[State 11600]
type = destroyself
trigger1 = Animtime = 0





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; アニュス
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1500]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1500
sprpriority = 2

[State a]
type     = StopSnd
trigger1 = !time
Channel  = 3

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 1500]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s200, 12

;-------------------------------------------------[弾幕展開]

[State 1500]
type        = Helper
trigger1    = time = 5
name        = "skill-28"
ID          = 11500
postype     = P1
pos         = 35, -75
Stateno     = 11500
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
SuperMoveTime = 99999
PauseMoveTime = 99999
ignorehitpause = 1

;-------------------------------------------------[終了]

[state 1500, ステート変更]
type     = ChangeState
trigger1 = animtime = 0
value	 = 0
ctrl	 = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] アニュス / 弾丸
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 11500]
type     = A
Movetype = A
physics  = N
Anim     = 1510
SprPriority = 3

[State 11500]
type = Angledraw
trigger1 = 1
scale = 0.5,0.5

[State 11500]
type     = VelSet
trigger1 = !time
Y        = -6.8

[State 11500]
type     = VelAdd
trigger1 = 1
Y        = 0.45

[State 11500]
type     = playerpush
trigger1 = 1
value    = 0

[State 11500]
type     = Explod
trigger1 = Time = 16
anim     = 11505
pos      = 0, 0
postype  = P1
bindtime = 1
Ownpal   = 1
sprpriority = 6
scale       = 0.5,0.5
IgnoreHitPause = 0
removeongethit = 1

[State 11500]
type     = Explod
trigger1 = Time = 15
anim     = 11505
pos      = 0, 0
postype  = P1
bindtime = 1
Ownpal   = 1
sprpriority = 6
scale       = 0.5,0.5
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[ヒット定義]

[State 11500, HitDef]
type                = HitDef
trigger1            = (MoveType = A) && (!MoveContact) && (!MoveReversed)
trigger1            = Time <= 15
attr                = A, SP
hitflag             = MAF
guardflag           = MA
damage              = Floor(8*root,Fvar(0)),5
animtype            = Light
ground.type         = high
priority            = 3, Hit
pausetime           = 0, 9
Guard.PauseTime     = 0, 9
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

ground.velocity     = -3
guard.velocity      = -4
air.velocity        = -2, -4.5
airguard.velocity   = -2, -3
air.fall            = 1
fall.recovertime    = Ceil(36*root,FVar(3))
yaccel              = 0.48
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0


;=======================================[ヒット、ガードサウンド]

[State a];ヒットサウンド
Type           = PlaySnd
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
value          = s0, 0
channel        = 0
Persistent     = 0
IgnoreHitPause = 1

[State a];ヒットサウンド
Type           = PlaySnd
Trigger1       = MoveGuarded
Trigger1       = P2Movetype = H
value          = s1, 0
channel        = 0
Persistent     = 0
IgnoreHitPause = 1

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7000
ID       = 7000
Pos      = 0, 0
PosType  = P1
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

[State 111500]
type     = Destroyself
trigger1 = time >= 30
Trigger2 = (root,StateNo=1500)&&(root,Animelemtime(6)=0)
Trigger3 = Root,Movetype = H




