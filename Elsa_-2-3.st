[Statedef -2]

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;常時監視-2ステート
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;補正セット・リセット
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

fvar(0) = 補正総合値
;本体FVar(1) ＝ チェーン補正
;本体FVar(2) ＝ コンボ開始判定
;本体FVar(3) ＝ 受け身不能時間補正
;本体FVar(10)＝ ゲージ量補正

;-------------------------------------------------[連続ヒット補正]

[State -2, VarSet];初期値は100％（リセット）
Type     = VarSet
Trigger1 = FVar(1) != 1.00
Trigger1 = !(P2MoveType = H && (P2StateNo != [150,159]))
fvar(1)  = 1.0
IgnoreHitPause = 1

[State -2, VarSet];最小値は１％
Type     = VarSet
Trigger1 = FVar(1) < 0.01
fvar(1)  = 0.01
IgnoreHitPause = 1

;-------------------------------------------------[連続技判定]

[state -2, コンボ開始判定] ;判定リセット
type     = VarSet
trigger1 = Numenemy > 0
trigger1 = enemy,movetype != H
fvar(2)  = 0

;-------------------------------------------------[EFキャンセル補正]

[state -2, コンボ開始判定] ;判定リセット
type     = VarSet
trigger1 = Numenemy > 0
trigger1 = enemy,movetype != H
fvar(4)  = 1.0

;-------------------------------------------------[EFアルカナ補正]

[state -2]
type     = VarSet
trigger1 = var(15) = 1 ;EF中
fvar(5)  = 1.05

[state -2]
type     = VarSet
trigger1 = var(15) = 0 ;EF中
fvar(5)  = 1.0

;-------------------------------------------------[復帰不能時間補正]

[State -2, VarSet];初期値は100％（リセット）
Type     = VarSet
Trigger1 = FVar(3) != 1.00
Trigger1 = !(P2MoveType = H && (P2StateNo != [150,159]))
fvar(3)  = 1.0
IgnoreHitPause = 1

[State -2, VarSet];最小値は１％
Type     = VarSet
Trigger1 = FVar(3) < 0.01
fvar(3)  = 0.01
IgnoreHitPause = 1

;-------------------------------------------------[アルカナゲージ量補正]

[State -2, ゲージ補正]
Type     = VarSet
Trigger1 = fvar(20) < 1000
fvar(23)  = 1.0

[State -2, ゲージ補正]
Type     = VarSet
Trigger1 = fvar(20) = [1000,1999]
fvar(23)  = 1.1

[State -2, ゲージ補正]
Type     = VarSet
Trigger1 = fvar(20) >= 2000
fvar(23)  = 1.2

;-------------------------------------------------[補正総合]

[State -2, 変数]
Type     = VarSet
Trigger1 = 1
IgnoreHitPause = 1
fvar(0)  = fvar(1)*fvar(4)*fvar(5)


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;根性値  [根性値敷居=30%,最大根性値35%]
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -2, DefenceMulSet]
Type     = DefenceMulSet
Trigger1 = Life < LifeMax*0.30
Value    = 0.65+(0.35*Life/(LifeMax*0.30))
IgnoreHitPause = 1

[state -2];debug
type = null;varset
trigger1 = Life < LifeMax*0.30
fvar(30)= 0.65+(0.35*Life/(LifeMax*0.30))



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ハイジャンプ制御
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -2, 変数]  ;高速ジャンプ 入力時間設定
Type = VarSet
Trigger1 = Command = "高速ジャンプ"
V = 4
Value = 20

[State -2, 変数]  ;高速ジャンプ 入力時間減少
Type = VarAdd
Trigger1 = Var(4) > 0
V = 4
Value = -1

[State -2, 変数]
Type = VarSet
Trigger1 = Var(4) < 0
V = 4
Value = 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中ダッシュ制御
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[state -2]
type     = VarSet
trigger1 = StateType != A
var(5)   = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;ジャンプキャンセル制御
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[state -2];リセット
type = VarSet
trigger1 = StateType != A
var(8) = 0

[state -2];リセット
type = VarSet
trigger1 = StateType != A
var(9) = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; カウンターヒット判定
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[state -2, 変数] ;カウンター判定
type       = VarSet
TriggerAll = NumEnemy >= 1
trigger1   = Enemynear,Movetype != A
var(7)     = 0

[state -2, 変数] ;カウンター判定
type       = VarSet
TriggerAll = NumEnemy >= 1
trigger1   = Enemynear,Movetype  = A
var(7)     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; KOボイス処理
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -2, ヘルパー]
type     = Helper
trigger1 = NumHelper(9970) = 0
trigger1 = LoseKO = 1
;trigger1 = !Alive
pos      = 0,0
stateno  = 9970
ID       = 9970

;================================================[変数管理]

[State -2] ;KO判定
type       = varset
triggerall = Lose
trigger1   = roundstate = 4
var(50)    = 1

;---------------------------------------

[State -2];通常技判別
type     = VarSet
trigger1 = enemy,hitdefattr = SCA, NA, NP, NT, SA, SP, ST
trigger2 = enemy,stateno < 2000
trigger2 = enemy,stateno != [5000,5999]
var(51)  = 0

[State -2];必殺技判別
type = varset
trigger1 = enemy,hitdefattr = SCA, HA, HP, HT
trigger2 = enemy,stateno >= 2000
trigger2 = enemy,stateno != [5000,5999]
var(51)  = 1

;================================================[脱衣管理]

[State -2, 脱衣判定用]
type       = Helper
triggerall = var(51) != 0
triggerall = NumHelper(9971) = 0
trigger1   = !alive
trigger1   = matchover || teammode = turns
helpertype = normal
name       = "Datui"
id         = 9971
postype    = p1
pos        = 0,0
stateno    = 9971
keyctrl    = 0
ownpal     = 1
ignorehitpause = 1

[State -2, 脱衣やられ]
type     = ChangeAnim
trigger1 = stateno = 5020
trigger1 = time >= 0
trigger1 = NumHelper(9971) = 1
trigger1 = anim != 35030
value    = 35030
ignorehitpause = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;アルカナゲージ用ヘルパー呼び出し
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[state -2, Helper];アルカナゲージ用ヘルパー
Type      = Helper
Trigger1  = NumHelper(20000) = 0
OwnPal    = 1
PosType   = P1
Pos       = 0, 0
ID        = 20000
StateNo   = 20000
PauseMoveTime = 999999
SuperMoveTime = 999999
Name      = "gage"

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; アルカナゲージの管理
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;-------------------------------------------------[霊力設定２]

[State -2, VarAdd];霊力自動回復
Type = VarAdd
Trigger1 = fVar(22) = 0						;回復抑制時間が０
Trigger1 = fVar(20) < fvar(21)				;現在の霊力 ＜ 現在の最大霊力
IgnoreHitPause = 1
fV = 20
Value = 3 * Fvar(23)

[State -2, VarAdd];霊力回復無効時間減少
Type = VarAdd
Trigger1 = fVar(22) > 0
IgnoreHitPause = 1
fV = 22
Value = -1

;-------------------------------------------------[霊力設定]

[State -2, VarSet];霊力最大
Type = VarSet
Trigger1 = fVar(20) > fvar(21)
IgnoreHitPause = 1
fV = 20
Value = fvar(21)

[State -2, VarSet];通常時:霊力最低値は0
Type = VarSet
Trigger1 = fVar(20) < 0
IgnoreHitPause = 1
fV = 20
Value = 0

[State -2, VarSet];霊力最大値設定
Type = VarSet
Trigger1 = fVar(20) > 3000
IgnoreHitPause = 1
fV = 20
Value = 3000

[State -2, VarSet];バイタル最大
Type = VarSet
Trigger1 = fVar(21) < 0
IgnoreHitPause = 1
fV = 21
Value = 0

[State -2, VarSet];バイタル最小
Type = VarSet
Trigger1 = fVar(21) > 3000
IgnoreHitPause = 1
fV = 21
Value = 3000

;-------------------------------------------------[ゲージ上昇]

[State -2, ダメージ時]
type       = VarAdd
TriggerAll = Fvar(20) >= Fvar(21)
triggerAll = Movetype = H && stateno != [120,155]
trigger1   = GetHitVar(damage) != 0
fv         = 21
Value      = Floor(GetHitVar(damage) *0.8) * ifelse(var(15)=1, 1.1, 1)
ignorehitpause = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; フォースゲージの管理
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;-------------------------------------------------[フォースゲージ設定]

[State -2, VarSet];通常時:最低値は0
Type = VarSet
Trigger1 = fVar(10) < 0
IgnoreHitPause = 1
fV = 10
Value = 0

[State -2, VarSet];通常時:最大値は10000
Type = VarSet
Trigger1 = fVar(10) > 10000
IgnoreHitPause = 1
fV = 10
Value = 10000

;-------------------------------------------------[フォースゲージ設定-2]

[State -2, 通常回復];通常時フォースゲージ回復
Type     = Varadd
TriggerAll = roundState = 2
Trigger1 = fVar(10) < 10000
Trigger1 = Var(15) != 1			;EF中でない
Trigger1 = Var(16)  = 0			;バースト後ではない
fvar(10) = floor(10000/270)

[State -2, ゆっくり回復];バースト使用後フォースゲージ回復
Type     = Varadd
TriggerAll = roundState = 2
Trigger1 = fVar(10) < 10000
Trigger1 = Var(16) = 1			;バースト後
fvar(10) = floor((10000/270)*0.15)

;-------------------------------------------------[フォースゲージ設定-3]

[State -2] ;EF中減少
Type     = Varadd
Trigger1 = fVar(10) > 0
Trigger1 = Var(15)  = 1			;EF中
fV       = 10
Value    = -floor(10000/300)*ifelse(Var(14)=1, 2, 1)


;-------------------------------------------------[各種フラグリセット]

[State -2] ;バーストフラグ初期化
Type     = VarSet
Trigger1 = !var(15)			;EF中でない
Trigger1 = fvar(10) >= 10000
var(16)  = 0

[state -2] ;エクステンドフォース終了
type     = Varset
trigger1 = fvar(10) <= 0
trigger1 = Movetype != A
var(15)  = 0

[state -2] ;フォースキャンセル判定
type     = Varset
trigger1 = fvar(10) <= 0
var(14)  = 0

[State -2, 背景グレースケール]
type      = null;BGPalFx
triggerAll= (StateNo!=2400)
trigger1  = var(15) > 0
mul       = 256,256,256
invertall = 1
color     = 0
time      = 3
ignorehitpause = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ベネディクトゥスの管理
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -2, VarSet]
Type     = VarSet
Trigger1 = 1;NumprojID(11000) > 0 ;破裂している瓶がある
IgnoreHitPause = 1
var(20)  = numhelper(11000) + numhelper(11001) + numhelper(11002)+ numhelper(11050) + numhelper(11051) + numhelper(11052)

[State -2, VarSet]
Type     = null;VarSet
Trigger1 = NumprojID(11000) = 0 ;破裂している瓶がない
IgnoreHitPause = 1
var(20)  = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; エフェクト消去
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -2, RemoveExplod] ;C
Type       = RemoveExplod
TriggerAll = NumExplod(10220) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 220
ID         = 10220

[State -2, RemoveExplod] ;4C
Type       = RemoveExplod
TriggerAll = NumExplod(10225) > 0
Trigger1   = MoveType = H
trigger2   = (StateNo != 225)
ID         = 10225

[State -2, RemoveExplod] ;JC
Type       = RemoveExplod
TriggerAll = NumExplod(10620) > 0
Trigger1   = MoveType = H
trigger2   = (StateNo != 620)
ID         = 10620

[State -2, RemoveExplod] ;2C
Type       = RemoveExplod
TriggerAll = NumExplod(10420) > 0
Trigger1   = MoveType = H
trigger2   = (StateNo != 420)
ID         = 10420

[State -2, RemoveExplod] ;2E
Type       = RemoveExplod
TriggerAll = NumExplod(10310) > 0
Trigger1   = MoveType = H
trigger2   = (StateNo != 311) && (StateNo != 312)
ID         = 10310

[State -2, RemoveExplod] ;クレド
Type       = RemoveExplod
TriggerAll = NumExplod(11100) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1100
ID         = 11100

[State -2, RemoveExplod] ;クレド
Type       = RemoveExplod
TriggerAll = NumExplod(11101) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1101
ID         = 11101

[State -2, RemoveExplod] ;クレド
Type       = RemoveExplod
TriggerAll = NumExplod(11102) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1102
ID         = 11102

[State -2, RemoveExplod] ;クレド
Type       = RemoveExplod
TriggerAll = NumExplod(11150) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1150
ID         = 11150

[State -2, RemoveExplod] ;クレド
Type       = RemoveExplod
TriggerAll = NumExplod(11151) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1151
ID         = 11151

[State -2, RemoveExplod] ;クレド
Type       = RemoveExplod
TriggerAll = NumExplod(11152) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1152
ID         = 11152

[State -2, RemoveExplod] ;グロリア
Type       = RemoveExplod
TriggerAll = NumExplod(11200) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1200
ID         = 11200

[State -2, RemoveExplod] ;グロリア
Type       = RemoveExplod
TriggerAll = NumExplod(11201) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1201
ID         = 11201

[State -2, RemoveExplod] ;グロリア
Type       = RemoveExplod
TriggerAll = NumExplod(11202) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1202
ID         = 11202

[State -2, RemoveExplod] ;キリエ
Type       = RemoveExplod
TriggerAll = NumExplod(1310) > 0
Trigger1   = MoveType = H
trigger2   =(StateNo != 1300)&&(StateNo != 1301)&&(StateNo != 1302)
ID         = 1310

[State -2, RemoveExplod] ;キリエ
Type       = RemoveExplod
TriggerAll = NumExplod(11301) > 0
Trigger1   = MoveType = H
trigger2   =(StateNo != 1301)
ID         = 11301

[State -2, RemoveExplod] ;キリエ
Type       = RemoveExplod
TriggerAll = NumExplod(11302) > 0
Trigger1   = MoveType = H
trigger2   =(StateNo != 1302)
ID         = 11302

[State -2, RemoveExplod] ;エクステンド
Type       = RemoveExplod
TriggerAll = NumExplod(12900) > 0
Trigger1   = MoveType = H
trigger2   =(StateNo != 2900)&&(StateNo != 2910)
ID         = 12900


[State -2, デバッグ管理];ホーミング
type = null;displayToClipboard
text = "Homing=%f\tVel X=%d\tArcana=%d\Input=%d\tForse=%d"
params = (fvar(15)), floor(fvar(16)), floor(fvar(20)), var(27) ,floor(fvar(10))
trigger1 = 1
ignorehitpause = 1


[State -2, デバッグ管理]
type = displayToClipboard
text = "Rate=%f\trecover=%f\tArcana=%d\ploj=%d\tBoost=%d"
params = (fvar(0)), fvar(3), floor(fvar(20)), var(20) ,floor(fvar(26))
trigger1 = 1
ignorehitpause = 1





[Statedef -3]

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
; 常時監視-3 ステート
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;効果音 再生
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


[State -2, Playsnd];ダウン時 ドサッ！
type = PlaySnd
Trigger1 = StateNo = 5110
trigger1 = Time = 1
value = 52, 1
IgnoreHitPause = 1
Persistent = 0

[State -2, Playsnd];ダウン時 ドサッ！
type = PlaySnd
Trigger1 = StateNo = 5100
trigger1 = Time = 1
value = 52, 3
IgnoreHitPause = 1
Persistent = 0

[State -2, Helper];ダウンエフェクト
type     = Helper
Trigger1 = StateNo = 5100
trigger1 = Time = 1
StateNo  = 7200
PosType  = P1
Pos      = 0, 0
Ownpal   = 1
ID       = 7200

[State -2, playsnd];受け身サウンド
type = PlaySnd
Trigger1 = (StateNo = 5201)&&(Time = 1)
trigger2 = (StateNo = 5210)&&(Time = 1)
value = S3,1
IgnoreHitPause = 1
Persistent = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ボイス管理
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;-------------------------------------[通常技]

[State -2, 攻撃];A攻撃
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 200 || stateno = 400 || stateno = 600
trigger1 = random < 800
value = S300,0+(random%3)
channel = 5

[State -2, 攻撃];B攻撃
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 210 || stateno = 410 || stateno = 610  || stateno = 215 || stateno = 615
trigger1 = random < 800
value = S300,3+(random%3)
channel = 5

[State -2, 攻撃];C攻撃
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 220 || stateno = 420 || stateno = 620  || stateno = 225
trigger1 = random < 800
value = S300,6+(random%3)
channel = 5

[State -2, 攻撃];E攻撃
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 301
value = S300,10
channel = 5

[State -2, 攻撃];E攻撃(最大タメ)
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 302
value = S300,11
channel = 5

[State -2, 攻撃];E攻撃
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 311
value = S300,12
channel = 5

[State -2, 攻撃];E攻撃(最大タメ)
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 312
value = S300,13
channel = 5

[State -2, 攻撃];E攻撃(最大タメ)
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 320
value = S300,14
channel = 5

[State -2, 攻撃];投げ失敗
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 800
value = S300,22
channel = 5

[State -2, 攻撃];レバー投げ失敗
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 820
value = S300,22
channel = 5

[State -2, 攻撃];空中投げ失敗
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 840
value = S300,22
channel = 5

[State -2, 攻撃];投げ抜け(仮)
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 805
value = S5000, 0
channel = 5

[State -2, 攻撃];投げ
type = PlaySnd
triggerall = Animelem=3 && Alive
trigger1 = stateno = 802
Trigger1 = Random < 600
value = S300, 3
channel = 5

[State -2, 攻撃];投げ
type = PlaySnd
triggerall = Animelem=8 && Alive
trigger1 = stateno = 802
Trigger1 = Random < 600
value = S300, 4
channel = 5

[State -2, 攻撃];投げ
type = PlaySnd
triggerall = Animelem=14 && Alive
trigger1 = stateno = 802
Trigger1 = Random < 600
value = S300, 21
channel = 5

[State -2, 攻撃];レバー投げ
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 822
value = S300, 21
channel = 5

;-----------------------------------------------------

[State -2, 攻撃];サントゥクス
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1000 || stateno = 1050
value = S400,0
channel = 5

[State -2, 攻撃];クレド
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1100 || stateno = 1101 || stateno = 1102
value = S400,2
channel = 5

[State -2, 攻撃];クレド (空中)
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1150 || stateno = 1151 || stateno = 1152
value = S300,15
channel = 5


[State -3] ;グロリア(発生)
type       = PlaySnd
triggerAll = Alive
trigger1   = (StateNo = 1201) && (Time=1)
trigger2   = (StateNo = 1202) && (Time=1)
value      = s400, 3
channel    = 5

[State -3] ;グロリア(攻撃)
type       = PlaySnd
triggerAll = Movetype != H
trigger1   = (StateNo = 1200) && (Animelem=7)
trigger2   = (StateNo = 1201) && (Animelem=10)
trigger3   = (StateNo = 1202) && (Animelem=10)
value      = s400, 4
channel    = 5

[State -2, 攻撃];キリエ
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1300 || stateno = 1301 || stateno = 1302
value = S400,5
channel = 5

[State -2, 攻撃];ベネディクトゥス
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1400 || stateno = 1401 || stateno = 1450 || stateno = 1451
value = S400,1
channel = 5

[State -2, 攻撃];コムニオ
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1600 || stateno = 1601 || stateno = 1602
value = S400,6
channel = 5


[State -2, 攻撃];ランケオラ
type = PlaySnd
triggerall = Animelem=7 && Alive
trigger1 = stateno = 2000
value = S410, 9
channel = 5

[State -2, 攻撃];ランケオラ(追加)
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 2050
value = S410, 10
channel = 5

[State -2, 攻撃];セキュリス
type = PlaySnd
triggerall = Animelem=9 && Alive
trigger1 = stateno = 2200
value = S410, 7
channel = 5

[State -2, 攻撃];セキュリス(追加)
type = PlaySnd
triggerall = Animelem=5 && Alive
trigger1 = stateno = 2250
value = S410, 8
channel = 5

[State -3] ;グラディウス
type       = PlaySnd
triggerAll = Animelem = 10
trigger1   = StateNo = 2100
value      = s410, 1
channel    = 5

[State -3] ;グラディウス(Air)
type       = PlaySnd
triggerAll = Animelem = 8
trigger1   = StateNo = 2110
value      = s410, 4
channel    = 5

[State -3] ;グラディウス(ロック)
type       = PlaySnd
triggerAll = Time = 1
trigger1   =(StateNo = 2101)&&(PrevStateNo=2100)
value      = s410, 2
channel    = 5

[State -3] ;グラディウス(ロック)
type       = PlaySnd
triggerAll = Animelem = 8
trigger1   =(StateNo = 2101)&&(PrevStateNo=2100)
value      = s410, 3
channel    = 5

[State -3] ;グラディウスAir(ロック)
type       = PlaySnd
triggerAll = Time = 1
trigger1   =(StateNo = 2101)&&(PrevStateNo=2110)
value      = s410, 5
channel    = 5

[State -3] ;グラディウスAir(ロック)
type       = PlaySnd
triggerAll = Animelem = 8
trigger1   =(StateNo = 2101)&&(PrevStateNo=2110)
value      = s410, 6
channel    = 5

[State -3] ;グラディウス(追加)
type       = PlaySnd
triggerAll = time = 55
trigger1   = StateNo = 2150
value      = s410, 4
channel    = 5


[State -3] ;レクイエム
type       = PlaySnd
triggerAll = time = 1 && Alive
trigger1   = StateNo = 2300
value      = s410, 11
channel    = 5

[State -3] ;レクイエム
type       = PlaySnd
triggerAll = Animelem = 8 && Alive
trigger1   = StateNo = 2300
value      = s410, 12

[State -3] ;レクイエム(EF)
type       = PlaySnd
triggerAll = Animelem = 2 && Alive
trigger1   = StateNo = 2400
value      = s410, 0

[State -3] ;レクイエム(EF)
type       = PlaySnd
triggerAll = Movehit = 5 && Alive
trigger1   = StateNo = 2400
value      = s410, 11
channel    = 5

[State -3] ;レクイエム(EF)
type       = PlaySnd
triggerAll = Time = 85 && Alive
trigger1   = StateNo = 2410
value      = s410, 13



[State -3] ;エクステンド(通常)
type       = PlaySnd
triggerAll = Time = 1
triggerAll = Movetype != H
trigger1   = (StateNo = 2900)
value      = s500, 22

[State -3] ;エクステンド(キャンセル)
type       = PlaySnd
triggerAll = Time = 1
triggerAll = Movetype != H
trigger1   = (StateNo = 2910)
value      = s500, 20

[State -3] ;バースト
type       = PlaySnd
triggerAll = Time = 1
triggerAll = Movetype != H
trigger1   = (StateNo = 2800) || (StateNo = 2810)
value      = s500, 30


[State -3, 弱ダメージ]
type       = PlaySnd
triggerAll = Alive
triggerAll = Movetype = H && stateno != [120,155]
trigger1   = GetHitVar(animtype) = 0
trigger1   = GetHitVar(damage) != 0
trigger1   = Random < 600
value      = s5000,0+(random%3)
channel    = 5

[State -3, 中ダメージ]
type       = PlaySnd
triggerAll = Alive
triggerAll = Movetype = H && stateno != [120,155]
trigger1   = GetHitVar(animtype) = 2
trigger1   = GetHitVar(damage) != 0
trigger1   = Random < 600
value      = s5000,10+(random%3)
channel    = 5

[State -3, 強ダメージ]
type       = PlaySnd
triggerAll = Alive
triggerAll = Movetype = H && stateno != [120,155]
trigger1   = GetHitVar(animtype) = [3,5]
trigger1   = GetHitVar(damage) != 0
trigger1   = Random < 600
value      = s5000,20+(random%3)
channel    = 5

[State -3, 地上受け身]
type       = PlaySnd
triggerAll = Time = 1 && Alive
trigger1   = stateno = 5201
value      = S5100, 0
channel    = 5

[State -2, 空中受け身]
type       = PlaySnd
triggerall = Time = 1 && Alive
trigger1   = stateno = 5210
value      = S5100, 0
channel    = 5

[State -2, ラウンド間]
type     = PlaySnd
trigger1 = (anim = 5140)&&(animelemtime(2)=0)
value    = s11, 10




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; | 先行入力処理 |
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;---------------------------------------------[数値リセット]

;[State -3, 変数]  ;技の種類判別リセット
;Type      = VarSet
;Trigger1  = !Var(31)        ; 入力無し
;Trigger2  = Ctrl            ; 非コンボ中
;Trigger3  = MoveType != A  ; 非コンボ中
;var(30)   = 0

[State -3, 変数]
type     = Varset
trigger1 = var(30) != 0
trigger1 = var(31) <= 0
var(30)  = 0
IgnoreHitPause = 1


;---------------------------------------------[受付時間減少]

[State -3, 変数]
type     = VarAdd
trigger1 = var(31) > 0
var(31)  = -1

[State -3, 変数]
type     = Varset
trigger1 = var(31) < 0
var(31)  = 0

;==============================================[技判別]

;----------------------------------------------[ベネティクトゥス]

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "22A"
trigger1    = StateNo != 5120
var(30)     = 1400

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "22B"
trigger1    = StateNo != 5120
var(30)     = 1401

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "22C"
trigger1    = StateNo != 5120
var(30)     = 1402

;----------------------------------------------[サンクトゥス]

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "236A"
trigger1    = StateNo != 5120
var(30)     = 1000

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "236B"
trigger1    = StateNo != 5120
var(30)     = 1001

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "236C"
trigger1    = StateNo != 5120
var(30)     = 1002

;----------------------------------------------[グロリア・コムニオ]

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "214A"
trigger1    = StateNo != 5120
var(30)     = 1200

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "214B"
trigger1    = StateNo != 5120
var(30)     = 1201

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "214C"
trigger1    = StateNo != 5120
var(30)     = 1202

;----------------------------------------------[クレド]

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "623A"
trigger1    = StateNo != 5120
var(30)     = 1100

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "623B"
trigger1    = StateNo != 5120
var(30)     = 1101

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "623C"
trigger1    = StateNo != 5120
var(30)     = 1102

;----------------------------------------------[キリエ]

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "421A"
trigger1    = StateNo != 5120
var(30)     = 1300

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "421B"
trigger1    = StateNo != 5120
var(30)     = 1301

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "421C"
trigger1    = StateNo != 5120
var(30)     = 1302

;----------------------------------------------[超必殺技]

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "236AB"
trigger1    = StateNo != 5120
var(30)     = 2000

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "623AB"
trigger1    = StateNo != 5120
var(30)     = 2100

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "214AB"
trigger1    = StateNo != 5120
var(30)     = 2200

[State -3, 先行入力]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "レクイエム"
trigger1    = StateNo != 5120
var(30)     = 2300

;---------------------------------------------[コマンド猶予時間]

[State -3, 変数]
Type        = VarSet
TriggerAll  = !Var(59)
;TriggerAll  = !Ctrl
Trigger1    = command = "a" || command = "b" || command = "c"
var(31)     = 3

[State -3, 変数]
Type        = VarSet
TriggerAll  = !Var(59)
;TriggerAll  = !Ctrl
Trigger1    = command = "236A" || command = "236B" || command = "236C"
Trigger2    = command = "214A" || command = "214B" || command = "214C"
Trigger3    = command = "623A" || command = "623B" || command = "623C"
Trigger3    = command = "421A" || command = "421B" || command = "421C"
Trigger4    = command = "22A"  || command = "22B"  || command = "22C" 
Trigger1    = command = "236AB" || command = "214AB" || command = "623AB" || command = "レクイエム"
var(31)     = 5



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 相手吹っ飛ばしやられ / エフェクト表示
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -3]  ;吹っ飛び激突
Type     = Helper
Trigger1 = NumHelper(8045) = 0
Trigger1 = NumTarget > 0
Trigger1 = Target,Time = 1
Trigger1 = Target,StateNo = 8012
StateNo  = 8045
PosType  = P2
Pos      = -5, -45
Ownpal   = 1
ID       = 8045

[State -2, Playsnd];相手ダウン時 ドサッ！
type     = PlaySnd
Trigger1 = NumTarget > 0
Trigger1 = Target,Time = 1
Trigger1 = Target,StateNo = 8052
value    = s52, 3
IgnoreHitPause = 1
Persistent = 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 叩きつけやられ / エフェクト表示
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -3]  ;地面に激突
Type     = Helper
Trigger1 = NumHelper(8047) = 0
Trigger1 = NumTarget > 0
Trigger1 = Target,Time = 1
Trigger1 = Target,StateNo = 8062
StateNo  = 8047
PosType  = P2
Pos      = 0, 5
Ownpal   = 1
ID       = 8047

[State -3]  ;地面に激突
Type     = Helper
Trigger1 = NumHelper(8047) = 0
Trigger1 = NumTarget > 0
Trigger1 = Target,Time = 1
Trigger1 = Target,StateNo = 8072
StateNo  = 8047
PosType  = P2
Pos      = 0, 5
Ownpal   = 1
ID       = 8047

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;いっしょにとれーにんぐ　ですわ♪
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[State -3, TimeStop]
type     = AssertSpecial
Trigger1 = P2name = "Training" || P4name = "Training" 
flag     = timerfreeze
ignorehitpause = 1

[State -3, 変数]
Type        = VarSet
TriggerAll  = !Var(59)
Trigger1    = P2name = "Training" || P4name = "Training" 
Trigger1    = (StateNo = [0,1]) && time = 60
fvar(10)    = 20000

[State -3, 変数]
Type        = VarSet
TriggerAll  = !Var(59)
Trigger1    = P2name = "Training" || P4name = "Training" 
Trigger1    = (StateNo = [0,1]) && time = 60
fvar(20)    = 3000

[State -3, 変数]
Type        = VarSet
TriggerAll  = !Var(59)
Trigger1    = P2name = "Training" || P4name = "Training" 
Trigger1    = (StateNo = [0,1]) && time = 60
fvar(21)    = 3000

