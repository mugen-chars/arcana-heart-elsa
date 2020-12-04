
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 200]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 200
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

[State 200, 効果音]
type     = PlaySnd
trigger1 = !Time
value    = s2, 0

;-------------------------------------------------[ヒット定義]
[State 200, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(25*Fvar(0)),0
animtype            = Light
ground.type         = High
priority            = 3, Hit
pausetime           = 10, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 0
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15

ground.velocity     = -3
guard.velocity      = -3
air.velocity        = -1.3, -4
airguard.velocity   = -1.3, -3.5
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+10
yaccel              = 0.4
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 45, -75
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
Pos      = 25,IfElse(EnemyNear,StateType = A, -70, -60)
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
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.95, 0.80)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 25*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 200, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 210]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 210
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

[State 210, 効果音]
type     = PlaySnd
trigger1 = !Time
value    = s2, 1

[state 210, 速度]
type     = Velset
trigger1 = !time
X        = 2

;-------------------------------------------------[ヒット定義]
[State 210, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(42*Fvar(0)),0
animtype            = Mid
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 1
ground.slidetime    = 15 + (5*var(7))
ground.hittime      = 15 + (5*var(7))
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -4, -3.5
airguard.velocity   = -4, -3.5
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(25*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.4
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7000
ID       = 7000
Pos      = 60, -50
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

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.87)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.99)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 42*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 210, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 6B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 215]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 215
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
trigger1 = Time < 2
value    = ,AT  

[State 215]
type      = StatetypeSet
trigger1  = time = 2
StateType = A
physics   = N

[State 215]
type      = StatetypeSet
trigger1  = time = 12
StateType = S
physics   = S

;-------------------------------------------------[演出]

[State 215, 効果音]
type     = PlaySnd
trigger1 = animelem = 2
value    = s2, 1

[State 215]
type     = Velset
trigger1 = time = 2
X = 5
Y = -1.5

[State 215]
type     = Veladd
trigger1 = (time > 2) && (Pos Y < 0)
Y = 0.5

[State 215]
type     = PosSet
trigger1 = Time >= 12
Y = 0

[State 215]
type     = VelMul
trigger1 = Vel X > 0
X        = 0.94

;-------------------------------------------------[ヒット定義]
[State 215, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(42*Fvar(0)),0
animtype            = Mid
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 1
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
air.velocity        = -5, -4.0
airguard.velocity   = -3, -4.0
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(25*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.43
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 35, -85
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

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.87, 0.80)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.99, 0.97)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 42*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 215, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 220]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 220
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

[state 220, エフェクト]
type     = Explod
trigger1 = AnimelemTime(4) = 0
anim     = 10220
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10220
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[State 220, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s2, 2

[state 220, 速度]
type     = Velset
trigger1 = !time
X        = 3

;-------------------------------------------------[ヒット定義]
[State 220, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(92*Fvar(0)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2+(random%2)
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -9
guard.velocity      = -9
air.velocity        = -3, 9
airguard.velocity   = -2, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(56*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.48
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 70,IfElse(EnemyNear,StateType = A, -70, -60)
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

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

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
fvar(21)       = 92*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 220, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 4C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 225]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 225
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

[state 225, エフェクト]
type     = Explod
trigger1 = AnimelemTime(7) = 0
anim     = 10225
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10225
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[State 225, 効果音]
type     = PlaySnd
trigger1 = Animelem = 6
value    = s2, 3

;-------------------------------------------------[ヒット定義]

[State 225, HitDef]
type                = HitDef
trigger1            = AnimElem = 8
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(96*Fvar(0)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -4.5,-9
guard.velocity      = -9
air.velocity        = -4.5,-9
airguard.velocity   = -2.5, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(40*FVar(3))+(floor(10*(1+0.5*var(7))))
;yaccel              = 0.48
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10,IfElse(EnemyNear,StateType = A, -70, -60)
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
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.83, 0.70)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.98, 0.95)

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
fvar(21)       = 96*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 225, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 400]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 400
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

[State 400, 効果音]
type     = PlaySnd
trigger1 = !Time
value    = s2, 0

;-------------------------------------------------[ヒット定義]
[State 400, HitDef]
type                = HitDef
trigger1            = AnimElem = 2
attr                = C, NA
hitflag             = MAFD
guardflag           = LA
damage              = Floor(20*Fvar(0)),0
animtype            = Light
ground.type         = High
priority            = 3, Hit
pausetime           = 10, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 0
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15

ground.velocity     = -4
guard.velocity      = -4
air.velocity        = -1.5, -2
airguard.velocity   = -1.5, -2
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+10
yaccel              = 0.48
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 60, -10
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

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.95, 0.70)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 20*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 400, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 410]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 410
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

[State 410, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s2, 1

[state 410, 速度]
type     = Velset
trigger1 = !time
X        = 1

;-------------------------------------------------[ヒット定義]
[State 410, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = C, NA
hitflag             = MAFD
guardflag           = LA
damage              = Floor(58*Fvar(0)),0
animtype            = Mid
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 1
ground.slidetime    = 15 + (5*var(7))
ground.hittime      = 15 + (5*var(7))
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -3.5, -4.5
airguard.velocity   = -3.5, -4.0
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(25*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.48
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 55,IfElse(EnemyNear,StateType = A, -30, -20)
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

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.87, 0.70)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.98, 0.95)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 58*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 410, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 420]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 420
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

[state 420, エフェクト]
type     = Explod
trigger1 = AnimelemTime(6) = 0
anim     = 10420
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10420
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

[State 420, 効果音]
type     = PlaySnd
trigger1 = Animelem = 6
value    = s2, 2

[state 420, 速度]
type     = Velset
trigger1 = !time
X        = 3

;-------------------------------------------------[ヒット定義]
[State 420, HitDef]
type                = HitDef
trigger1            = AnimElem = 8
attr                = C, NA
hitflag             = MAFD
guardflag           = LA
damage              = Floor(92*Fvar(0)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3+(random%2)
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -2,-3.2
guard.velocity      = -7
air.velocity        = -2, -3
airguard.velocity   = -2, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(56*FVar(3))+(floor(10*(1+0.5*var(7))))
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 70,IfElse(EnemyNear,StateType = A, -30, -20)
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

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.83, 0.70)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.98, 0.95)

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
fvar(21)       = 92*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 420, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / JA
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 600]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 600
sprpriority = 2

;-------------------------------------------------[演出]

[State 600, 効果音]
type     = PlaySnd
trigger1 = !Time
value    = s2, 0

;-------------------------------------------------[ヒット定義]
[State 600, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(20*Fvar(0)),0
animtype            = Light
ground.type         = High
priority            = 3, Hit
pausetime           = 10, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 0
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15

ground.velocity     = -3
guard.velocity      = -3
air.velocity        = -2.5, -5.0
airguard.velocity   = -2.5, -4.5
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.45
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 55,IfElse(EnemyNear,StateType = A, -30, -20)
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

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.95, 0.80)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 20*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 7
value    = 1

[State a, ChangeState];着地硬直
type     = ChangeState
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / JB
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 610]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 610
sprpriority = 2

;-------------------------------------------------[演出]

[State 610, 効果音]
type     = PlaySnd
trigger1 = Animelem = 1
value    = s2, 1

;-------------------------------------------------[ヒット定義]
[State 610, HitDef]
type                = HitDef
trigger1            = AnimElem = 2
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(63*Fvar(0)),0
animtype            = Mid
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 1
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
air.velocity        = -3, -4.5
airguard.velocity   = -3, -4.5
air.fall            = 1
fall.recovertime    = Ceil(25*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.45
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 75, IfElse(EnemyNear,StateType = A, -40, -40)
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

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.87)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 63*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 7
value    = 1

[State a, ChangeState];着地硬直
type     = ChangeState
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / J4B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 615]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 615
sprpriority = 2

;-------------------------------------------------[演出]

[State 615, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s2, 1

;-------------------------------------------------[ヒット定義]

[State 610, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(62*Fvar(0)),0
animtype            = Mid
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 1
ground.slidetime    = 15
ground.hittime      = 15
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -5.5
guard.velocity      = -5.5
air.velocity        = -2, -6.5
airguard.velocity   = -2, -3
air.fall            = 1
fall.recovertime    = Ceil(25*FVar(3))+(floor(10*(1+0.5*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 10, -50
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

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.96)


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
fvar(21)       = 62*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 7
value    = 1

[State a, ChangeState];着地硬直
type     = ChangeState
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / JC
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 620]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 620
sprpriority = 2

;-------------------------------------------------[演出]

[State 620, 効果音]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s2, 2

[state 620, エフェクト]
type     = Explod
trigger1 = AnimelemTime(2) = 0
anim     = 10620
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10620
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[ヒット定義]
[State 620, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(92*Fvar(0)),0
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(12*(1+0.5*var(7))), floor(11*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3+(random%2)
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -5
guard.velocity      = -5
air.velocity        = -3, 10
airguard.velocity   = -2, -4
air.fall            = 1
fall.recovertime    = Ceil(56*FVar(3))+(floor(12*(1+0.5*var(7))))
yaccel              = 0.48
ID                  = 8060
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 620
Pos      = 0,IfElse(EnemyNear,StateType = A, -55, -50)
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

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.83, 0.70)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.98, 0.95)

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
fvar(21)       = 92*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[相手制御]

[State a, 床バウンド]
type           = TargetState
TriggerAll     = NumTarget > 0
trigger1       =(MoveHit=1) && target,ishelper = 0
trigger1       = Enemynear,Statetype = A
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

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 10
value    = 1

[State a, ChangeState];着地硬直
type     = ChangeState
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / E攻撃 (準備)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 300]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 300
poweradd = 0

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

[State a]
type     = VelMul
Trigger1 = 1
X        = 0.85

;-------------------------------------------------[演出]

[State 300, 効果音] ;ホールド音
type     = null;PlaySnd
trigger1 = Time = 25
value    = s0, 17

;-------------------------------------------------[ステート変更]

[State 300] ;通常
type       = ChangeState
triggerAll = time >= 5
trigger1   = command != "holdx"
value      = 301

[State 300] ;最大タメ
type       = ChangeState
triggerAll = time >= 6
trigger1   = Animtime = 0
value 	   = 302


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / E攻撃 (通常)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 301]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 301
sprpriority = 2

;-------------------------------------------------[演出]

[State 301, 効果音]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s2, 4

[state 301, 速度]
type     = Velset
trigger1 = animelem = 3
X        = 5.5

;-------------------------------------------------[ヒット定義]
[State 301, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(96*Fvar(0)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -9.5
guard.velocity      = -8
air.velocity        = -9.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
ID = 8010
fall.recovertime    = Ceil(26*FVar(3))+(floor(10*(1+0.5*var(7))))
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7020
ID       = 7020
Pos      = 80, IfElse(EnemyNear,StateType = A, -70, -60)
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

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

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
fvar(21)       = 96*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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
type     = targetstate
trigger1 =  MoveHit = 1
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 =  enemy,stateno != 8010
trigger1 =  P2statetype != L
value    =  8010
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 301, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / E攻撃 (最大タメ)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 302]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 302
sprpriority = 2

;-------------------------------------------------[演出]

[State 302, 効果音]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s2, 4

[state 302, 速度]
type     = Velset
trigger1 = animelem = 3
X        = 5.8

;-------------------------------------------------[ヒット定義]
[State 302, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(100*Fvar(0)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(20*(1+0.5*var(7))), floor(19*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 24
guard.hittime       = 24
guard.ctrltime      = 26
air.guard.slidetime = 29
air.guard.hittime   = 29
air.guard.ctrltime  = 31

ground.velocity     = -9.5
guard.velocity      = -8
air.velocity        = -9.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
ID = 8010
fall.recovertime    = Ceil(26*FVar(3))+(floor(20*(1+0.5*var(7))))
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7020
ID       = 7000
Pos      = 70,IfElse(EnemyNear,StateType = A, -70, -60)
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
Stateno  = 7110
ID       = 7100
Pos      = 0,IfElse(EnemyNear,StateType = A, -50, -40)
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
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

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
fvar(21)       = 96*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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
type     = targetstate
trigger1 =  MoveHit = 1
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 =  enemy,stateno != 8010
trigger1 =  P2statetype != L
value    =  8010
IgnoreHitPause = 1
Persistent     = 0

[state a, ステート奪取]
type     = targetstate
trigger1 =  MoveGuarded
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 =  enemy,stateno != 8020
trigger1 =  P2statetype != L
value    =  8020
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 301, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2E攻撃 (準備)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 310]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 310
poweradd = 0

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

[State a]
type     = VelMul
Trigger1 = 1
X        = 0.85

;-------------------------------------------------[演出]

[State 310, 効果音] ;ホールド音
type     = null;PlaySnd
trigger1 = Time = 25
value    = s0, 17

;-------------------------------------------------[ステート変更]

[State 310] ;通常
type       = ChangeState
triggerAll = time >= 7
Trigger1   = !Var(10)
trigger1   = command != "holdx"
value      = 311

[State 310] ;最大タメ
type       = ChangeState
triggerAll = time >= 7
trigger1   = Animtime = 0
value 	   = 312


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / E攻撃 (通常)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 311]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 311
sprpriority = 2

;-------------------------------------------------[演出]

[State 311, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s2, 4

[state 311, 速度]
type     = Velset
trigger1 = animelem = 4
X        = 1.5

[state 311, エフェクト]
type     = Explod
trigger1 = AnimelemTime(4) = 0
anim     = 10310
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10310
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[ヒット定義]
[State 311, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = C, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(92*Fvar(0)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -0.5, -12
guard.velocity      = -6
air.velocity        = -0.5, -12
airguard.velocity   = -5, -3
Down.velocity 	    = -5, -2
yaccel              = 0.24
fall                = 1
air.fall            = 1
ID                  = 8030
fall.recovertime    = Ceil(66*FVar(3))+(floor(10*(1+0.5*var(7))))
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7020
ID       = 310
Pos      = 70,IfElse(EnemyNear,StateType = A, -70, -60)
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

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

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
fvar(21)       = 92*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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
type     = targetstate
trigger1 =  MoveHit
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 =  enemy,stateno != 8030
trigger1 =  P2statetype != L && !var(9)
value    =  8030
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 311, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2E攻撃 (最大タメ)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 312]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 312
sprpriority = 2

;-------------------------------------------------[演出]

[State 302, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s2, 4

[state 312, 速度]
type     = Velset
trigger1 = animelem = 4
X        = 2

[state 312, エフェクト]
type     = Explod
trigger1 = AnimelemTime(3) = 4
anim     = 10310
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10310
bindtime = -1
sprpriority    = 5
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[ヒット定義]
[State 302, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = C, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(100*Fvar(0)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(20*(1+0.5*var(7))), floor(19*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 24
guard.hittime       = 24
guard.ctrltime      = 26
air.guard.slidetime = 29
air.guard.hittime   = 29
air.guard.ctrltime  = 31

ground.velocity     = -0.5, -14.5
guard.velocity      = -6
air.velocity        = -0.5, -14.5
airguard.velocity   = -5, -3
Down.velocity 	    = -5, -2
yaccel              = 0.24
fall                = 1
air.fall            = 1
ID                  = 8030
fall.recovertime    = Ceil((66+15)*FVar(3))
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7020
ID       = 310
Pos      = 70,IfElse(EnemyNear,StateType = A, -70, -60)
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
Stateno  = 7110
ID       = 7100
Pos      = 0, IfElse(EnemyNear,StateType = A, -50, -40)
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
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

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
fvar(21)       = 96*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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
type     = targetstate
trigger1 = MoveHit
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 = enemy,stateno != 8030
trigger1 = P2statetype != L && !var(9)
value    = 8030
IgnoreHitPause = 1
Persistent     = 0

[state a, ステート奪取]
type     = targetstate
trigger1 = MoveGuarded = 1
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 = enemy,stateno != 8035
trigger1 = P2statetype != L
value    = 8035
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 311, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / JE
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 320]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 320
sprpriority = 2

;-------------------------------------------------[演出]

[State 320, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s2, 4

;-------------------------------------------------[ヒット定義]
[State 320, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(96*Fvar(0)),0
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(15*(1+0.5*var(7))), floor(14*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -3.5, 12.5
guard.velocity      = -6
air.velocity        = -3.5, 12.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(56*FVar(3))+(floor(15*(1+0.5*var(7))))
yaccel              = 0.48
ID = 8060
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7020
ID       = 320
Pos      = 65,IfElse(EnemyNear,StateType = A, -50, -40)
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

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

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
fvar(21)       = 96*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[相手制御]

[State a, 床バウンド]
type           = TargetState
TriggerAll     = NumTarget > 0
trigger1       = MoveHit
trigger1       = target,ishelper = 0
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

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 11
value    = 1

[State a, ChangeState];着地硬直
type     = ChangeState
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラル投げ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 800]
type     = S
movetype = A
physics  = S
velset   = 0,0
ctrl     = 0
anim     = 800
sprpriority = 2

[State 800, 攻撃範囲]
Type     = AttackDist
Trigger1 = 1
value    = 0

;-------------------------------------------------[ヒット定義]

[State 800, HitDef]
type          = HitDef
trigger1      = AnimElem = 2
Trigger1      = P2stateno != 150 && 151 && 152 && 153 && 130 && 131 && 140
attr          = S, NT
hitflag       = M-
guardflag     = 
damage        = 0,0
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1
guard.sparkno = -1
guardsound    = -1
P1facing      = 1
P2facing      = 1
Fall          = 0
Kill          = 0
P1stateno     = 801
P2stateno     = 810
ID = 800

;-------------------------------------------------[終了]

[State 800, ステート変更] ;失敗
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラル投げ / 投げ抜け
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 801]
type     = S
movetype = A
physics  = S
velset   = 0,0
anim     = 801
sprpriority = 2

[State 800, 投げエフェクト]
type       = Explod
trigger1   = !time
anim       = 7050
ID         = 1
postype    = P1
pos        = 45, -60
random     = 0, 0
scale      = 1, 1
vel        = 0, 0
sprpriority    = 8
bindtime       = -1
removeongethit = 1
pausemovetime = 99999
supermovetime = 99999

[State 801]
type     = Posset
trigger1 = !time
Y        = 0

[State 801]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 801]
type     = ChangeState
trigger1 = EnemyNear, StateNo = 811
value    = 805

[State 801]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 802


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラル投げ / 成功
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 802]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 802

[State 802]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 802]
type     = Velset
trigger1 = !time
trigger1 = FrontEdgeBodyDist != [20,50]
X        = 3

[State 802]
type     = VelSet
trigger1 = Animelem = 9
x        = 4

[State 802]
type     = VelSet
trigger1 = Animelem = 17
X        = 6


[State 802, 効果音]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s2, 1

[State 802, 効果音]
type     = PlaySnd
trigger1 = Animelem = 8
value    = s2, 1

[State 802, 効果音]
type     = PlaySnd
trigger1 = Animelem = 14
value    = s2, 3

[State 802]
type     = TargetBind
trigger1 = animelem = 1
Pos      = 40,0


;-------------------------------------------------[ヒット定義]
[State 802, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = S, NA
hitflag             = MAF
guardflag           = MA
damage              = Floor(20*Fvar(0)),0
animtype            = Mid
ground.type         = High
priority            = 3, Hit
pausetime           = floor(8*(1+0.5*var(7))), floor(7*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 1
ground.slidetime    = 15 + (5*var(7))
ground.hittime      = 15 + (5*var(7))
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -2
guard.velocity      = -6
air.velocity        = -3.7, -3.0
airguard.velocity   = -3.7, -3.0
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
kill                = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

[State 802, HitDef]
type                = HitDef
trigger1            = AnimElem = 9
attr                = S, NA
hitflag             = MAF
guardflag           = MA
damage              = Floor(20*Fvar(0)),0
animtype            = Mid
ground.type         = low
priority            = 3, Hit
pausetime           = floor(8*(1+0.5*var(7))), floor(7*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -3
guard.velocity      = -6
air.velocity        = -3.7, -3.0
airguard.velocity   = -3.7, -3.0
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
kill                = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

[State 301, HitDef]
type                = HitDef
trigger1            = AnimElem = 15
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(96*Fvar(0)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(20*(1+0.5*var(7))), floor(19*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -9.5
guard.velocity      = -8
air.velocity        = -9.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
ID = 8010
fall.recovertime    = Ceil(26*FVar(3))

[state a, ステート奪取]
type     = targetstate
trigger1 =  MoveHit = 1
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 =  enemy,stateno != 8010
trigger1 = animelem = 15,>=0 && animelem = 16,<0
value    =  8010
IgnoreHitPause = 1
Persistent     = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit=1
trigger1 = animelem = 4,>=0 && animelem = 5,<0
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 55,IfElse(EnemyNear,StateType = A, -55, -50)
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit=1
trigger1 = animelem = 9,>=0 && animelem = 10,<0
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 55,IfElse(EnemyNear,StateType = A, -55, -50)
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit=1
trigger1 = animelem = 15,>=0 && animelem = 16,<0
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 55,IfElse(EnemyNear,StateType = A, -55, -50)
PosType  = P1
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
trigger1       = animelem = 15,>=0 && animelem = 16,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0.5

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit=1
trigger1       = animelem = 15,>=0 && animelem = 16,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.20

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact = 1
trigger1       = animelem = 4,>=0 && animelem = 5,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 20*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact = 1
trigger1       = animelem = 9,>=0 && animelem = 10,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 20*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact = 1
trigger1       = animelem = 15,>=0 && animelem = 16,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 96*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;---------------------[ステートチェンジ]
[State 302]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラル投げ / 投げ抜けされた
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 805]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 805

[State 805]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 805]
type     = Velset
trigger1 = !time
X        = -3

[State 800]
type     = Velset
trigger1 = Animelem = 2
X        = -5

[State 805]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] ニュートラル投げ / 投げ抜けチャンス
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 810]
type     = S
movetype = H
physics  = S
ctrl     = 0
velset   = 0,0

[State 810]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 810

[State 810]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 810]
type     = ChangeState
trigger1 = command = "recovery"
value    = 811

[State 810]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 812


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] ニュートラル投げ / 投げ抜け
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 811]
type     = S
movetype = A
physics  = S
ctrl     = 0

[State 810]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 811

[State 810]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 810]
type     = Velset
trigger1 = !time
X        = -2

[State 810]
type     = Velset
trigger1 = Animelem = 2
X        = -5

[State 810]
type     = selfState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] ニュートラル投げ / ヒット中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 812]
type     = S
movetype = H
physics  = S
velset   = 0,0
sprpriority = -1

[state a]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 812]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 810

[state a]
type     = Selfstate
trigger1 = time = 100
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; レバー入れ投げ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 820]
type     = S
movetype = A
physics  = S
velset   = 0,0
ctrl     = 0
anim     = 800
sprpriority = 2

[State 820, 攻撃範囲]
Type     = AttackDist
Trigger1 = 1
value    = 0

;-------------------------------------------------[ヒット定義]

[State 820, HitDef]
type          = HitDef
trigger1      = AnimElem = 2
Trigger1      = P2stateno != 150 && 151 && 152 && 153 && 130 && 131 && 140
attr          = S, NT
hitflag       = M-
guardflag     = 
damage        = 0,0
sparkno       = -1
sparkxy       = 0,0
hitsound      = -1
guard.sparkno = -1
guardsound    = -1
P1facing      = 1
P2facing      = 1
Fall          = 0
Kill          = 0
P1stateno     = 821
P2stateno     = 830
ID = 820

;-------------------------------------------------[終了]

[State 820, ステート変更] ;失敗
type 		= ChangeState
trigger1 	= AnimTime = 0
value 		= 0
ctrl 		= 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; レバー入れ投げ / 投げ抜け
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 821]
type     = S
movetype = A
physics  = S
velset   = 0,0
anim     = 801
sprpriority = 2

[State 800, サークル]
type       = Explod
trigger1   = !time
anim       = 7050
ID         = 1
postype    = P1
pos        = 45, -60
random     = 0, 0
scale      = 1, 1
vel        = 0, 0
sprpriority    = 8
bindtime       = -1
removeongethit = 1
pausemovetime = 99999
supermovetime = 99999

[State 821]
type     = Posset
trigger1 = !time
Y        = 0

[State 821]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 821]
type     = ChangeState
trigger1 = EnemyNear, StateNo = 831
value    = 805

[State 821]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 822



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; レバー入れ投げ / 成功
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 822]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 822

[State 822]
type     = NotHitBy
trigger1 = 1
value    = SCA

;--------------------------------------[相手制御]

[State 822]
type     = TargetBind
trigger1 = animelem = 1
Pos      = 30,0

[State 822, 相手アニメ変更]
Type     = TargetState
Trigger1 = AnimElemTime(2) = 0
value    = 833

[State 822]
type     = TargetBind
trigger1 = animelem = 2
Pos      = 30, -90

[State 822]
type     = TargetBind
trigger1 = animelem = 3
Pos      = 33, -92

[State 822]
type     = TargetBind
trigger1 = animelem = 4
Pos      = 5, -125

[State 822, 相手アニメ変更]
Type     = TargetState
Trigger1 = AnimElem = 4
value    = 834

[State 822]
type     = TargetBind
trigger1 = animelem = 5
Pos      = -9, -127

[State 822, 相手を解放する]
Type     = TargetState
Trigger1 = AnimElem = 6
value    = 835

;-------------------------------------------------[数値調整]

[State 822]
Type     = HitAdd
Trigger1 = AnimElem = 6
value    = 1

[State 822, 相手ダメージ]
Type     = TargetLifeAdd
Trigger1 = AnimElem = 6
absolute = 1			;防御力を反映する
value    = -105

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
trigger1       = animelem = 6
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 105*0.66

;-------------------------------------------------[終了]

[State 822]
type     = Turn
trigger1 = AnimTime = 0

[State 822]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] ニュートラル投げ / 投げ抜けチャンス
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 830]
type     = S
movetype = H
physics  = S
ctrl     = 0
velset   = 0,0

[State 830]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 810

[State 830]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 830]
type     = ChangeState
trigger1 = command = "recovery"
value    = 831

[State 830]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 832


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] ニュートラル投げ / 投げ抜け
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 831]
type     = S
movetype = A
physics  = S
ctrl     = 0

[State 830]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 811

[State 830]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 830]
type     = Velset
trigger1 = !time
X        = -2

[State 830]
type     = Velset
trigger1 = Animelem = 2
X        = -5

[State 830]
type     = selfState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] ニュートラル投げ / ヒット中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 832]
type     = A
movetype = H
physics  = N
velset   = 0,0
sprpriority = -1

[state a]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 832]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 830

;---------------------------[表示角度]

[state a]
type     = Selfstate
trigger1 = time = 150
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] ニュートラル投げ / ヒット中-2
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 833]
type     = A
movetype = H
physics  = N
velset   = 0,0
sprpriority = -1

[State 833]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 831

;---------------------------[表示角度]

[state a]
type     = Selfstate
trigger1 = time = 150
value    = 5200
ctrl     = 1

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] ニュートラル投げ / ヒット中-3
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 834]
type     = A
movetype = H
physics  = N
velset   = 0,0
sprpriority = -1

[State 834]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 832

[State 834]
type     = Angledraw
Trigger1 = 1
value    = -90

;---------------------------[表示角度]

[state a]
type     = Selfstate
trigger1 = time = 150
value    = 5200
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] ニュートラル投げ / 放り投げられた後
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 835]
type     = A
movetype = H
physics  = N
velset   = 0,0
sprpriority = -1

[State 835]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 833

[State 835]
type     = Turn
trigger1 = time = 0

[state 835]
type     = AngleAdd
trigger1 = time = 0
value    = -180

[State 835]
type     = VelSet
trigger1 = time = 0
x        = -7
y        = -5.5

[State 835]
type     = VelAdd
trigger1 = time > 0
Y        = 0.55

[state 835]
type     = AngleSet
trigger1 = time = 5
value    = 0

[State 835]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 835]
type     = SelfState
trigger1 = ((vel Y > 0) && (Pos Y >= 0))
value    = 5100



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中投げ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 840]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 840
sprpriority = 2

[State 840, 攻撃範囲]
Type     = AttackDist
Trigger1 = 1
value    = 0

;-------------------------------------------------[ヒット定義]

[State 840, HitDef]
type          = HitDef
trigger1      = AnimElem = 2
Trigger1      = P2stateno != 150 && 151 && 152 && 153 && 130 && 131 && 140
attr          = A, NT
hitflag       = A-
guardflag     = 
damage        = 0,0
sparkno       = -1
sparkxy       = 0,0
hitsound      = -1
guard.sparkno = -1
guardsound    = -1
P1facing      = 1
P2facing      = 1
Fall          = 0
Kill          = 0
P1stateno     = 842
P2stateno     = 850
ID = 840

;-------------------------------------------------[終了]

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 7
value    = 1

[State a, 終了]
type     = ChangeState
trigger1 = (Pos Y >= 0) && (vel Y > 0)
value    = 52
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中投げ / 成功
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 842]
type     = A
movetype = A
physics  = N
ctrl     = 0
velset   = 0, 0
anim     = 841
sprpriority = 2

[State 842]
type     = NotHitBy
trigger1 = 1
value    = SCA


[State 842, 効果音]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s2, 1

[State 842, 効果音]
type     = PlaySnd
trigger1 = Animelem = 11
value    = s2, 4

;----------------------------------[移動制御]

[State 842]
type     = Velset
trigger1 = Animelem = 2
X        = 2
Y        = -3

[State 842]
type     = VelAdd
trigger1 = Animelemtime(2) >= 0
trigger1 = Animelemtime(11)<  0
Y        = 0.2

[State 842]
type     = VelAdd
trigger1 = Animelemtime(11) >= 0
Y        = 0.48

[State 842]
type     = Velset
trigger1 = Animelem = 11
x        = 1
y        = -3

[State 842, 2]
type     = TargetBind
trigger1 = animelem = 1
pos      = 40,-15


;-------------------------------------------------[ヒット定義]

[State 842, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAF
guardflag           = MA
damage              = Floor(33*Fvar(0)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 1
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = 0, -5
guard.velocity      = -6
air.velocity        = -2, -3.0
airguard.velocity   = -3, -3.0
fall                = 1
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
kill                = 0

[State 842, HitDef]
type                = HitDef
trigger1            = AnimElem = 11
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(58*Fvar(0)),0
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
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -3.5, 12.5
guard.velocity      = -6
air.velocity        = -3.5, 12.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
ID = 8010
fall.recovertime    = Ceil(26*FVar(3))

[state a, ステート奪取]
type     = targetstate
trigger1 = MoveHit = 1
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 = enemy,stateno != 852
trigger1 = animelem = 11,>=0 && animelem = 12,<0
value    = 852
IgnoreHitPause = 1
Persistent     = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit=1
trigger1 = animelem = 3,>=0 && animelem = 4,<0
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 55,IfElse(EnemyNear,StateType = A, -55, -50)
PosType  = P1
OwnPal   = 1
size.xscale = 1.2
size.yscale = 1.2
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit=1
trigger1 = animelem = 11,>=0 && animelem = 12,<0
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 55,IfElse(EnemyNear,StateType = A, -55, -50)
PosType  = P1
OwnPal   = 1
size.xscale = 1.2
size.yscale = 1.2
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit=1
trigger1       = animelem = 11,>=0 && animelem = 12,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0.5

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit=1
trigger1       = animelem = 11,>=0 && animelem = 12,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.20

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact = 1
trigger1       = animelem = 3,>=0 && animelem = 4,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 33*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact = 1
trigger1       = animelem = 11,>=0 && animelem = 12,<0
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 58*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;---------------------[ステートチェンジ]

[state a]
type     = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= 0
value    = 52



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] 空中投げ / ヒット中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 850]
type     = A
movetype = H
physics  = N
velset   = 0,0
sprpriority = -1

[state a]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 832]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 850

[state a]
type     = velmul
trigger1 = 1
x        = 0.94

;---------------------------[表示角度]

[state a]
type     = Selfstate
trigger1 = time = 150
value    = 5200
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;	[相手] 空中投げ / ２段目・硬直
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 851]
Type     = A
MoveType = H
Physics  = N
Anim     = 5030
Ctrl     = 0
VelSet   = 0, 0

[State 851, 0] ;ヘルパー対策
type     = DestroySelf
trigger1 = ishelper

[State 851, アニメ変更]
Type     = ChangeAnim
Trigger1 = Time > 0
Value    = Anim

[State 851, ステート変更]
Type     = ChangeState
Trigger1 = HitShakeOver
Value    = 852


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [相手制御] 空中投げ / ２段目・ヒット中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 852]
Type     = A
MoveType = H
Physics  = N
Anim     = IfElse(SelfAnimExist(5035), 5035, 5050)

[State 852, アニメ変更]
Type     = ChangeAnim
Trigger1 = Anim = 5035
Trigger1 = AnimTime = 0
Value    = 5050

;------------------------------------------[速度処理]

[State 852, HitVelSet]
Type     = HitVelSet
Trigger1 = Time = 0
X        = 1
Y        = 1

[State 852, 速度]  ;Y加速度
Type     = VelAdd
Trigger1 = 1
Y        = GetHitVar(YAccel)

;------------------------------------------[ステート変更]

[State 852, ステート復帰]  ;バウンドへ
Type     = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 5
Value    = 8072

[State 852, ステート変更]  ;異常時
Type       = SelfState
TriggerAll = Time > 0
Trigger1   = Time > 100
Value      = 5050





