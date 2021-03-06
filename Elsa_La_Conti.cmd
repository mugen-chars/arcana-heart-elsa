;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;[ボタンリマップ（ボタンコンフィグ)]
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

[Remap]
x = x      ;Ｘボタンの入力判定を実際に押すボタンに割り当てる。
y = y      ;Ｙボタン
z = z      ;Ｚボタン
a = a      ;Ａボタン
b = b      ;Ｂボタン
c = c      ;Ｃボタン
s = s      ;スタートボタン

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;[デフォルト設定]
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

[Defaults]
command.time = 15  ;標準のコマンド入力受付時間。
                   ;各コマンドで省略している場合に有効。
                   ;このパラメータを消した場合、デフォルトは１フレームになる。
                   ;（　M.U.G.E.Nでの１フレーム　＝　１／６０秒　）

command.buffer.time = 1  ;標準のコマンド入力記憶時間。
                         ;入力した直後にコマンドを記憶し、
                         ;指を離してもコマンドが成功している状態を
                         ;ここで設定した時間の分維持する。
                         ;１〜３０フレームまでの間で設定可能。
                         ;デフォルトは１フレーム。


;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
; コマンド定義パート（入力キーを設定する）

;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


;***********************************
[Command]
Name = "高速ジャンプ"
Command = D
Time = 1

;------------------------------------------------------------------------------
;-| 必殺技コマンド |-----------------------------------------------------------------

[Command]
name = "アルカナバースト"
command = c+z
time = 20

[Command]
name = "エクステンド"
command = a+b+c
time = 20


[Command]
name = "レクイエム"
command = ~D, B , F , a+b
time = 25

[Command]
name = "236AB"
command = ~D, DF, F , a+b
time = 20

[Command]
name = "623AB"
command = ~F, D, DF , a+b
time = 20

[Command]
name = "214AB"
command = ~D, DB, B , a+b
time = 20


[Command]
name = "623A"
command = ~F, D, DF , a
time = 15

[Command]
name = "623B"
command = ~F, D, DF , b
time = 15

[Command]
name = "623C"
command = ~F, D, DF , c
time = 15


[Command]
name = "236A"
command = ~D, DF, F , a
time = 15

[Command]
name = "236B"
command = ~D, DF, F , b
time = 15

[Command]
name = "236C"
command = ~D, DF, F , c
time = 15

[Command]
name = "214A"
command = ~D, DB, B , a
time = 15


[Command]
name = "214B"
command = ~D, DB, B , b
time = 15

[Command]
name = "214C"
command = ~D, DB, B , c
time = 15


[Command]
name = "421A"
command = ~B, D, DB, a
time = 15

[Command]
name = "421B"
command = ~B, D, DB, b
time = 15

[Command]
name = "421C"
command = ~B, D, DB, c
time = 15


[Command]
name = "22A"
command = ~D, D, a
time = 15

[Command]
name = "22B"
command = ~D, D, b
time = 15

[Command]
name = "22C"
command = ~D, D, c
time = 15


[Command]
name = "28A"
command = ~$D, U, a

[Command]
name = "28B"
command = ~$D, U, b

[Command]
name = "28C"
command = ~$D, U, c



;------------------------------------------------------------------------------
;-| キー２回連続入力 |---------------------------------------------------------

[Command]
name = "FF"       ;必須コマンド名
command = F,F
time = 15

[Command]
name = "BB"       ;必須コマンド名
command = B,B
time = 15

;------------------------------------------------------------------------------
;-| 同時押し |-----------------------------------------------------------------

[Command]
Name = "recovery"
Command = a
Time = 1

[Command]
Name = "recovery"
Command = b
Time = 1

[Command]
Name = "recovery"
Command = c
Time = 1

;------------------------------------------------------------------------------
;-| 方向キー＋ボタン |---------------------------------------------------------

;[Command]
;name = "fwd_a"
;command = /F,a

;------------------------------------------------------------------------------
;-| ボタン単発 |---------------------------------------------------------------

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

[Command]
Name = "fwd" 
Command = F
Time = 1

[Command]
Name = "back" 
Command = B
Time = 1

[Command]
Name = "up" 
Command = U
Time = 1

[Command]
Name = "down"
Command = D
Time = 1

;------------------------------------------------------------------------------
;-| 方向キー |-----------------------------------------------------------------

[Command]
name = "holdfwd"   ;必須コマンド名
command = /$F
time = 1

[Command]
name = "holdback"  ;必須コマンド名
command = /$B
time = 1

[Command]
name = "holdup"    ;必須コマンド名
command = /$U
time = 1

[Command]
name = "holddown"  ;必須コマンド名
command = /$D
time = 1

[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holda"
command = /$a
time = 1

[Command]
name = "holdb"
command = /$b
time = 1

[Command]
name = "holdc"
command = /$c
time = 1

[Command]
name = "holdz"
command = /$z
time = 1

;--------------------------------------[ホーミング用]

[Command]
name    = "hold1"
command = /DB
time    = 1

[Command]
name    = "hold2"
command = /D
time    = 1

[Command]
name    = "hold3"
command = /DF
time    = 1

[Command]
name    = "hold4"
command = /B
time    = 1

[Command]
name    = "hold6"
command = /F
time    = 1

[Command]
name    = "hold7"
command = /UD
time    = 1

[Command]
name    = "hold8"
command = /U
time    = 1

[Command]
name    = "hold9"
command = /UF
time    = 1



;============================================================================

[Statedef -1]

;============================================================================



[State -1, 2800] ;アルカナバースト
Type       = ChangeState
Value      = 2800 + ((Statetype=A)*10)
TriggerAll = !var(59)
triggerAll = (command = "アルカナバースト")
triggerAll = !ishelper
triggerAll = movetype != A
triggerAll = Fvar(10) >= 10000
trigger1   = alive = 1
trigger1   = RoundState = 2
trigger1   = StateNo != [2800,2810]


[State -1, 2900] ;エクステンドフォース/通常
Type       = ChangeState
Value      = 2900
TriggerAll = !var(59)
triggerAll = (command = "エクステンド") || (command = "y")
triggerAll = statetype != A
triggerAll = fvar(10) >= 10000
trigger1   = ctrl || (StateNo = 100 && Animelemtime(2)>0)


[State -1, 2910] ;エクステンドフォース/キャンセル
Type       = ChangeState
Value      = 2910
TriggerAll = !var(59)
triggerall = (command = "エクステンド") || (command = "y")
triggerall = statetype != A
triggerall = fvar(10) >= 10000
Trigger1   = (StateNo = [200,230]) && MoveContact  ;地上
Trigger2   = (StateNo = [400,420]) && MoveContact  ;しゃがみ
Trigger3   = (StateNo = [300,320]) && MoveContact  ;空中

Trigger4   = (StateNo = [1200,1202]) && MoveContact
Trigger5   = (StateNo = [1300,1302]) && MoveContact
Trigger6   = (StateNo = 1400) && (Statetime >= 24) ;ベネディクトゥス
Trigger7   = (StateNo = 1401) && (Statetime >= 24)

Trigger8   = StateNo = 2000 && (Animelemtime(18) >= 0) ;ランケオラ

;ランケも






;============================================================================



;■ レクイエム ■

[state -1, 2300]
type       = ChangeState
value      = 2300 + ((var(15)=1)*100)
TriggerAll = !var(59)
TriggerAll = command  = "レクイエム" || command="start"; var(30)= 2200
TriggerAll = statetype != A
TriggerAll = fvar(20) >= 3000
Trigger1   = (StateNo=1500)
Trigger1   = (Statetime = [23,25])
;trigger2   = ctrl


;■ セキュリス(追加入力) ■

[state -1, 2250]
type       = ChangeState
value      = 2250
TriggerAll = !var(59)
TriggerAll = command  = "214AB" ||  var(30)= 2200
TriggerAll = statetype != A
TriggerAll = fvar(20) >= 1000
Trigger1   = (StateNo=2200)
Trigger1   = (Animelemtime(10)=[2,12]) && (MoveHit)


;■ セキュリス ■

[state -1, 2200]
type       = ChangeState
value      = 2200
TriggerAll = !var(59)
TriggerAll = command  = "214AB" || var(30)= 2200
TriggerAll = statetype != A
TriggerAll = fvar(20) >= 1000
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = (StateNo = [200,230]) && MoveContact
Trigger3   = (StateNo = [400,420]) && MoveContact

Trigger4   = (StateNo = [1100,1102]) && MoveContact
Trigger5   = (StateNo = [1200,1202]) && MoveContact
Trigger6   = (StateNo = [1300,1302]) && MoveContact

trigger7   = StateNo = 930 && Time >= 8   ;地上D
trigger8   = StateNo = 935                ;地上D終了
trigger9   = StateNo = 940 && Time >= 19  ;地上4D
trigger10  = StateNo = 950 && Time >= 11  ;地上6Gc
trigger11  = StateNo = 960 && Time >= 25  ;地上4Gc



;■ グラディウス(追加入力) ■

[state -1, 2150]
type       = ChangeState
value      = 2150
TriggerAll = !var(59)
TriggerAll = command  = "623AB" || var(30)= 2100
TriggerAll = statetype = A
TriggerAll = fvar(20) >= 1000
Trigger1   = (StateNo=2101)
Trigger1   = (Animelemtime(8)=[1,9]) && (MoveHit)


;■ グラディウス ■

[state -1, 2100]
type       = ChangeState
value      = 2100 + ((Statetype=A)*10)
TriggerAll = !var(59)
TriggerAll = command  = "623AB" || var(30)= 2100
;TriggerAll = statetype != A
TriggerAll = fvar(20) >= 1000
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = (StateNo = [200,230]) && MoveContact
Trigger3   = (StateNo = [400,420]) && MoveContact
Trigger4   = (StateNo = [600,620]) && MoveContact

Trigger5   = (StateNo = [1100,1102]) && MoveContact
Trigger6   = (StateNo = [1150,1152]) && MoveContact
Trigger7   = (StateNo = [1200,1202]) && MoveContact
Trigger8   = (StateNo = [1300,1302]) && MoveContact

trigger9   = StateNo = 930 && Time >= 8   ;地上D
trigger10  = StateNo = 935                ;地上D終了
trigger11  = StateNo = 940 && Time >= 19  ;地上4D
trigger10  = StateNo = 950 && Time >= 11  ;地上6Gc
trigger11  = StateNo = 960 && Time >= 25  ;地上4Gc



;■ ランケオラ(追加入力) ■

[state -1, 2050]
type       = ChangeState
value      = 2050
TriggerAll = !var(59)
TriggerAll = command  = "236AB" || var(30)= 2000
TriggerAll = statetype != A
TriggerAll = fvar(20) >= 1000
Trigger1   = (StateNo=2000)&&(MoveHit)
Trigger1   = (Time>=73)


;■ ランケオラ ■

[state -1, 2000]
type       = ChangeState
value      = 2000
TriggerAll = !var(59)
TriggerAll = command  = "236AB" || var(30)= 2000
TriggerAll = statetype != A
TriggerAll = fvar(20) >= 1000
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = (StateNo = [200,230]) && MoveContact
Trigger3   = (StateNo = [400,420]) && MoveContact

Trigger4   = (StateNo = [1100,1102]) && MoveContact
Trigger5   = (StateNo = [1200,1202]) && MoveContact
Trigger6   = (StateNo = [1300,1302]) && MoveContact

trigger7   = StateNo = 930 && Time >= 8   ;地上D
trigger8   = StateNo = 935                ;地上D終了
trigger9   = StateNo = 940 && Time >= 19  ;地上4D
trigger10  = StateNo = 950 && Time >= 11  ;地上6Gc
trigger11  = StateNo = 960 && Time >= 25  ;地上4Gc




;■ コムニオC ■

[state -1, 1600]
type       = ChangeState
value      = 1602
TriggerAll = !var(59)
TriggerAll = command  = "214C" || var(30)= 1202
TriggerAll = statetype = A
TriggerAll = NumHelper(11600) = 0 ;コムニオが出ていない。
Trigger1   = Ctrl
Trigger2   = StateNo = 600 && MoveContact
Trigger3   = StateNo = 610 && MoveContact
Trigger4   = StateNo = 615 && MoveContact
Trigger5   = StateNo = 620 && MoveContact
trigger6   = StateNo = 910 && Time >= 3      ;Nホーミング


;■ コムニオB ■

[state -1, 1601]
type       = ChangeState
value      = 1601
TriggerAll = !var(59)
TriggerAll = command  = "214B" || var(30)= 1201
TriggerAll = statetype = A
TriggerAll = NumHelper(11600) = 0 ;コムニオが出ていない。
Trigger1   = Ctrl
Trigger2   = StateNo = 600 && MoveContact
Trigger3   = StateNo = 610 && MoveContact
Trigger4   = StateNo = 615 && MoveContact
Trigger5   = StateNo = 620 && MoveContact
trigger6   = StateNo = 910 && Time >= 3       ;Nホーミング


;■ コムニオA ■

[state -1, 1600]
type       = ChangeState
value      = 1600
TriggerAll = !var(59)
TriggerAll = command  = "214A" || var(30)= 1200
TriggerAll = statetype = A
TriggerAll = NumHelper(11600) = 0 ;コムニオが出ていない。
Trigger1   = Ctrl
Trigger2   = StateNo = 600 && MoveContact
Trigger3   = StateNo = 610 && MoveContact
Trigger4   = StateNo = 615 && MoveContact
Trigger5   = StateNo = 620 && MoveContact
trigger6   = StateNo = 910 && Time >= 3      ;Nホーミング




;■ キリエC ■

[state -1, 1302]
type       = ChangeState
value      = 1302
TriggerAll = !var(59)
TriggerAll = command  = "421C" || var(30)= 1302
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

trigger10  = StateNo = 930 && Time >= 8   ;地上D
trigger11  = StateNo = 935                ;地上D終了
trigger12  = StateNo = 940 && Time >= 19  ;地上4D
trigger13  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger14  = StateNo = 960 && Time >= 28  ;地上4Gc


;■ キリエB ■

[state -1, 1301]
type       = ChangeState
value      = 1301
TriggerAll = !var(59)
TriggerAll = command  = "421B" || var(30)= 1301
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

trigger10  = StateNo = 930 && Time >= 8   ;地上D
trigger11  = StateNo = 935                ;地上D終了
trigger12  = StateNo = 940 && Time >= 19  ;地上4D
trigger13  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger14  = StateNo = 960 && Time >= 28  ;地上4Gc


;■ キリエA ■

[state -1, 1300]
type       = ChangeState
value      = 1300
TriggerAll = !var(59)
TriggerAll = command  = "421A" || var(30)= 1300
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

trigger10  = StateNo = 930 && Time >= 8   ;地上D
trigger11  = StateNo = 935                ;地上D終了
trigger12  = StateNo = 940 && Time >= 19  ;地上4D
trigger13  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger14  = StateNo = 960 && Time >= 28  ;地上4Gc


;■ グロリアC ■

[state -1, 1202]
type       = ChangeState
value      = 1202
TriggerAll = !var(59)
TriggerAll = command  = "214C" || var(30)= 1202
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

trigger10  = StateNo = 930 && Time >= 8   ;地上D
trigger11  = StateNo = 935                ;地上D終了
trigger12  = StateNo = 940 && Time >= 19  ;地上4D
trigger13  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger14  = StateNo = 960 && Time >= 28  ;地上4Gc



;■ グロリアB ■

[state -1, 1201]
type       = ChangeState
value      = 1201
TriggerAll = !var(59)
TriggerAll = command  = "214B" || var(30)= 1201
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

trigger10  = StateNo = 930 && Time >= 8   ;地上D
trigger11  = StateNo = 935                ;地上D終了
trigger12  = StateNo = 940 && Time >= 19  ;地上4D
trigger13  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger14  = StateNo = 960 && Time >= 28  ;地上4Gc


;■ グロリアA ■

[state -1, 1200]
type       = ChangeState
value      = 1200
TriggerAll = !var(59)
TriggerAll = command  = "214A" || var(30)= 1200
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

trigger10  = StateNo = 930 && Time >= 8   ;地上D
trigger11  = StateNo = 935                ;地上D終了
trigger12  = StateNo = 940 && Time >= 19  ;地上4D
trigger13  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger14  = StateNo = 960 && Time >= 28  ;地上4Gc




;■ クレドC ■

[state -1, 1102]
type       = ChangeState
value      = 1102 + ((Statetype=A)*50)
TriggerAll = !var(59)
TriggerAll = command  = "623C" || var(30)= 1102
;TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

Trigger10  = StateNo = 600 && MoveContact
Trigger11  = StateNo = 610 && MoveContact
Trigger12  = StateNo = 615 && MoveContact
Trigger13  = StateNo = 620 && MoveContact

trigger14  = StateNo = 930 && Time >= 8   ;地上D
trigger15  = StateNo = 935                ;地上D終了
trigger16  = StateNo = 940 && Time >= 19  ;地上4D
trigger17  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger18  = StateNo = 960 && Time >= 28  ;地上4Gc
trigger19  = StateNo = 910 && Time >= 3   ;Nホーミング


;■ クレドB ■

[state -1, 1101]
type       = ChangeState
value      = 1101 + ((Statetype=A)*50)
TriggerAll = !var(59)
TriggerAll = command  = "623B" || var(30)= 1101
;TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

Trigger10  = StateNo = 600 && MoveContact
Trigger11  = StateNo = 610 && MoveContact
Trigger12  = StateNo = 615 && MoveContact
Trigger13  = StateNo = 620 && MoveContact

trigger14  = StateNo = 930 && Time >= 8   ;地上D
trigger15  = StateNo = 935                ;地上D終了
trigger16  = StateNo = 940 && Time >= 19  ;地上4D
trigger17  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger18  = StateNo = 960 && Time >= 28  ;地上4Gc
trigger19  = StateNo = 910 && Time >= 3   ;Nホーミング


;■ クレドA ■

[state -1, 1100]
type       = ChangeState
value      = 1100 + ((Statetype=A)*50)
TriggerAll = !var(59)
TriggerAll = command  = "623A" || var(30)= 1100
;TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

Trigger10  = StateNo = 600 && MoveContact
Trigger11  = StateNo = 610 && MoveContact
Trigger12  = StateNo = 615 && MoveContact
Trigger13  = StateNo = 620 && MoveContact

trigger14  = StateNo = 930 && Time >= 8   ;地上D
trigger15  = StateNo = 935                ;地上D終了
trigger16  = StateNo = 940 && Time >= 19  ;地上4D
trigger17  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger18  = StateNo = 960 && Time >= 28  ;地上4Gc
trigger19  = StateNo = 910 && Time >= 3   ;Nホーミング



;■ サントゥクスC ■

[state -1, 1002]
type       = ChangeState
value      = 1002 + ((Statetype=A)*50)
TriggerAll = !var(59)
TriggerAll = command  = "236C" || var(30)= 1002
;TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

Trigger10  = StateNo = 600 && MoveContact
Trigger11  = StateNo = 610 && MoveContact
Trigger12  = StateNo = 615 && MoveContact
Trigger13  = StateNo = 620 && MoveContact

trigger14  = StateNo = 930 && Time >= 8   ;地上D
trigger15  = StateNo = 935                ;地上D終了
trigger16  = StateNo = 940 && Time >= 19  ;地上4D
trigger17  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger18  = StateNo = 960 && Time >= 28  ;地上4Gc
trigger19  = StateNo = 910 && Time >= 3   ;Nホーミング


;■ サントゥクスB ■

[state -1, 1001]
type       = ChangeState
value      = 1001 + ((Statetype=A)*50)
TriggerAll = !var(59)
TriggerAll = command  = "236B" || var(30)= 1001
;TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

Trigger10  = StateNo = 600 && MoveContact
Trigger11  = StateNo = 610 && MoveContact
Trigger12  = StateNo = 615 && MoveContact
Trigger13  = StateNo = 620 && MoveContact

trigger14  = StateNo = 930 && Time >= 8   ;地上D
trigger15  = StateNo = 935                ;地上D終了
trigger16  = StateNo = 940 && Time >= 19  ;地上4D
trigger17  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger18  = StateNo = 960 && Time >= 28  ;地上4Gc
trigger19  = StateNo = 910 && Time >= 3   ;Nホーミング


;■ サントゥクスA ■

[state -1, 1000]
type       = ChangeState
value      = 1000 + ((Statetype=A)*50)
TriggerAll = !var(59)
TriggerAll = command  = "236A" || var(30)= 1000
;TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

Trigger10  = StateNo = 600 && MoveContact
Trigger11  = StateNo = 610 && MoveContact
Trigger12  = StateNo = 615 && MoveContact
Trigger13  = StateNo = 620 && MoveContact

trigger14  = StateNo = 930 && Time >= 8   ;地上D
trigger15  = StateNo = 935                ;地上D終了
trigger16  = StateNo = 940 && Time >= 19  ;地上4D
trigger17  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger18  = StateNo = 960 && Time >= 28  ;地上4Gc
trigger19  = StateNo = 910 && Time >= 3   ;Nホーミング



;■ アニュス ■

[state -1, 1500]
type       = ChangeState
value      = 1500
TriggerAll = !var(59)
TriggerAll = command  = "28A" || command  = "28B"|| command  = "28C"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = (StateNo=40)
Trigger3   = StateNo = 200 && MoveContact
Trigger4   = StateNo = 210 && MoveContact
Trigger5   = StateNo = 215 && MoveContact
Trigger6   = StateNo = 220 && MoveContact
Trigger7   = StateNo = 225 && MoveContact
Trigger8   = StateNo = 400 && MoveContact
Trigger9   = StateNo = 410 && MoveContact
Trigger10  = StateNo = 420 && MoveContact

trigger11  = StateNo = 930 && Time >= 8   ;地上D
trigger12  = StateNo = 935                ;地上D終了
trigger13  = StateNo = 940 && Time >= 19  ;地上4D
trigger14  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger15  = StateNo = 960 && Time >= 28  ;地上4Gc



;■ ベネディクトゥス ■

[state -1, 1400]
type       = ChangeState
value      = 1400 + ((Statetype=A)*50)
TriggerAll = !var(59)
TriggerAll = command  = "22A" || command  = "22B"|| command  = "22C" || var(30)= 1400
;TriggerAll = statetype != A
triggerAll = var(20) > 0
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

Trigger10  = StateNo = 600 && MoveContact
Trigger11  = StateNo = 610 && MoveContact
Trigger12  = StateNo = 615 && MoveContact
Trigger13  = StateNo = 620 && MoveContact

trigger14  = StateNo = 930 && Time >= 8   ;地上D
trigger15  = StateNo = 935                ;地上D終了
trigger16  = StateNo = 940 && Time >= 19  ;地上4D
trigger17  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger18  = StateNo = 960 && Time >= 28  ;地上4Gc
trigger19  = StateNo = 910 && Time >= 3   ;Nホーミング


;■ ベネディクトゥス(失敗) ■

[state -1, 1401]
type       = ChangeState
value      = 1401 + ((Statetype=A)*50)
TriggerAll = !var(59)
TriggerAll = command  = "22A" || command  = "22B"|| command  = "22C" || var(30)= 1400
;TriggerAll = statetype != A
triggerAll = Var(20) = 0
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 225 && MoveContact
Trigger7   = StateNo = 400 && MoveContact
Trigger8   = StateNo = 410 && MoveContact
Trigger9   = StateNo = 420 && MoveContact

Trigger10  = StateNo = 600 && MoveContact
Trigger11  = StateNo = 610 && MoveContact
Trigger12  = StateNo = 615 && MoveContact
Trigger13  = StateNo = 620 && MoveContact

trigger14  = StateNo = 930 && Time >= 8   ;地上D
trigger15  = StateNo = 935                ;地上D終了
trigger16  = StateNo = 940 && Time >= 19  ;地上4D
trigger17  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger18  = StateNo = 960 && Time >= 28  ;地上4Gc
trigger19  = StateNo = 910 && Time >= 3   ;Nホーミング

;--------------------------------------------------------

;■ 空中投げ ■

[state -1, 840]
type  = ChangeState
value = 840
TriggerAll = !var(59)
TriggerAll = command  = "a" && command  = "x"
TriggerAll = statetype = A
Trigger1   = Ctrl
trigger2   = StateNo = 910 && Time >= 3						;Nホーミング


;■ レバー入れ投げ ■

[State -1, 820]
Type  = ChangeState
Value = 820
TriggerAll = !var(59)
triggerall = command = "a" && command = "x"
triggerall = command = "holdback" || command = "holdfwd"
triggerall = statetype != A
Trigger1   = Ctrl

trigger2   = StateNo = 930 && Time >= 8   ;地上D
trigger3   = StateNo = 935                ;地上D終了
trigger4   = StateNo = 940 && Time >= 19  ;地上4D
trigger5   = StateNo = 950 && Time >= 23  ;地上6Gc
trigger6   = StateNo = 960 && Time >= 28  ;地上4Gc


;■ 投げ ■

[state -1, 800]
type  = ChangeState
value = 800
TriggerAll = !var(59)
TriggerAll = command  = "a" && command = "x"
TriggerAll = statetype != A
Trigger1   = Ctrl

trigger2   = StateNo = 930 && Time >= 8   ;地上D
trigger3   = StateNo = 935                ;地上D終了
trigger4   = StateNo = 940 && Time >= 19  ;地上4D
trigger5   = StateNo = 950 && Time >= 23  ;地上6Gc
trigger6   = StateNo = 960 && Time >= 28  ;地上4Gc




;■ JE ■

[state -1, 320]
type  = ChangeState
value = 320
TriggerAll = !var(59)
TriggerAll = command  = "x"
TriggerAll = statetype = A
Trigger1   = Ctrl
Trigger2   = StateNo = 600 && MoveContact
Trigger3   = StateNo = 610 && MoveContact
Trigger4   = StateNo = 615 && MoveContact
Trigger5   = StateNo = 620 && MoveContact

trigger6   = StateNo = 910 && Time >= 3            ;Nホーミング


;■ JC ■

[state -1, 620]
type  = ChangeState
value = 620
TriggerAll = !var(59)
TriggerAll = command  = "c"
TriggerAll = statetype = A
Trigger1   = Ctrl
Trigger2   = StateNo = 600 && MoveContact
Trigger3   = StateNo = 610 && MoveContact
Trigger4   = StateNo = 615 && MoveContact
trigger5   = StateNo = 320 && Movecontact && (var(15)=1)

trigger6   = StateNo = 910 && Time >= 3            ;Nホーミング


;■ J4B ■

[state -1, 615]
type  = ChangeState
value = 615
TriggerAll = !var(59)
TriggerAll = command  = "b"
TriggerAll = command  = "holdback"
TriggerAll = statetype = A
Trigger1   = Ctrl
Trigger2   = StateNo = 600 && MoveContact
Trigger3   = StateNo = 610 && MoveContact
trigger4   = StateNo = 620 && Movecontact && (var(15)=1)
trigger5   = StateNo = 320 && Movecontact && (var(15)=1)

trigger6   = StateNo = 910 && Time >= 3            ;Nホーミング


;■ JB ■

[state -1, 610]
type  = ChangeState
value = 610
TriggerAll = !var(59)
TriggerAll = command  = "b"
TriggerAll = statetype = A
Trigger1   = Ctrl
Trigger2   = StateNo = 600 && MoveContact
trigger3   = StateNo = 615 && Movecontact && (var(15)=1)
trigger4   = StateNo = 620 && Movecontact && (var(15)=1)
trigger5   = StateNo = 320 && Movecontact && (var(15)=1)

trigger6   = StateNo = 910 && Time >= 3            ;Nホーミング


;■ JA ■

[state -1, 600]
type  = ChangeState
value = 600
TriggerAll = !var(59)
TriggerAll = command  = "a"
TriggerAll = statetype = A
Trigger1   = Ctrl
trigger2   = StateNo = 610 && Movecontact && (var(15)=1)
trigger3   = StateNo = 615 && Movecontact && (var(15)=1)
trigger4   = StateNo = 620 && Movecontact && (var(15)=1)
trigger5   = StateNo = 320 && Movecontact && (var(15)=1)

trigger6   = StateNo = 910 && Time >= 3            ;Nホーミング



;--------------------------------------------------

;■ 2E ■

[state -1, 310]
type  = ChangeState
value = 310
TriggerAll = !var(59)
TriggerAll = command  = "x"
TriggerAll = command  = "holddown"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 400 && MoveContact
Trigger7   = StateNo = 410 && MoveContact
Trigger8   = StateNo = 420 && MoveContact

trigger9   = StateNo = 930 && Time >= 8   ;地上D
trigger10  = StateNo = 935                ;地上D終了
trigger11  = StateNo = 940 && Time >= 19  ;地上4D
trigger12  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger13  = StateNo = 960 && Time >= 28  ;地上4Gc


;■ 2C ■

[state -1, 420]
type  = ChangeState
value = 420
TriggerAll = !var(59)
TriggerAll = command  = "c"
TriggerAll = command  = "holddown"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 220 && MoveContact
Trigger5   = StateNo = 400 && MoveContact
Trigger6   = StateNo = 410 && MoveContact
trigger7   = StateNo = 215 && Movecontact && (var(15)=1)

trigger8   = StateNo = 930 && Time >= 8   ;地上D
trigger9   = StateNo = 935                ;地上D終了
trigger10  = StateNo = 940 && Time >= 19  ;地上4D
trigger11  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger12  = StateNo = 960 && Time >= 28  ;地上4Gc


;■ 2B ■

[state -1, 410]
type  = ChangeState
value = 410
TriggerAll = !var(59)
TriggerAll = command  = "b"
TriggerAll = command  = "holddown"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 400 && MoveContact
trigger4   = StateNo = 210 && Movecontact && (var(15)=1)

trigger5   = StateNo = 930 && Time >= 8   ;地上D
trigger6   = StateNo = 935                ;地上D終了
trigger7   = StateNo = 940 && Time >= 19  ;地上4D
trigger8   = StateNo = 950 && Time >= 23  ;地上6Gc
trigger9   = StateNo = 960 && Time >= 28  ;地上4Gc


;■ 2A ■

[state -1, 400]
type  = ChangeState
value = 400
TriggerAll = !var(59)
TriggerAll = command  = "a"
TriggerAll = command  = "holddown"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
trigger2   = StateNo = 400 && (Movecontact || AnimelemTime(4)>=0)
trigger3   = StateNo = 200 && Movecontact && (var(15)=1)

trigger4   = StateNo = 930 && Time >= 8   ;地上D
trigger5   = StateNo = 935                ;地上D終了
trigger6   = StateNo = 940 && Time >= 19  ;地上4D
trigger7   = StateNo = 950 && Time >= 23  ;地上6Gc
trigger8   = StateNo = 960 && Time >= 28  ;地上4Gc


;--------------------------------------------------


;■ E ■

[state -1, 300]
type  = ChangeState
value = 300
TriggerAll = !var(59)
TriggerAll = command  = "x"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 220 && MoveContact
Trigger6   = StateNo = 400 && MoveContact
Trigger7   = StateNo = 410 && MoveContact
Trigger8   = StateNo = 420 && MoveContact

trigger9   = StateNo = 930 && Time >= 8   ;地上D
trigger10  = StateNo = 935                ;地上D終了
trigger11  = StateNo = 940 && Time >= 19  ;地上4D
trigger12  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger13  = StateNo = 960 && Time >= 28  ;地上4Gc


;■ 4C ■

[state -1, 225]
type  = ChangeState
value = 225
TriggerAll = !var(59)
TriggerAll = command  = "c"
TriggerAll = command  = "holdback"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 220 && MoveContact
Trigger5   = StateNo = 400 && MoveContact
Trigger6   = StateNo = 410 && MoveContact
Trigger7   = StateNo = 420 && MoveContact
trigger8   = StateNo = 215 && Movecontact && (var(15)=1)

trigger9   = StateNo = 930 && Time >= 8   ;地上D
trigger10  = StateNo = 935                ;地上D終了
trigger11  = StateNo = 940 && Time >= 19  ;地上4D
trigger12  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger13  = StateNo = 960 && Time >= 28  ;地上4Gc


;■ C ■

[state -1, 220]
type  = ChangeState
value = 220
TriggerAll = !var(59)
TriggerAll = command  = "c"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 400 && MoveContact
Trigger5   = StateNo = 410 && MoveContact
trigger6   = StateNo = 215 && Movecontact && (var(15)=1)

trigger7   = StateNo = 930 && Time >= 8   ;地上D
trigger8   = StateNo = 935                ;地上D終了
trigger9   = StateNo = 940 && Time >= 19  ;地上4D
trigger10  = StateNo = 950 && Time >= 23  ;地上6Gc
trigger11  = StateNo = 960 && Time >= 28  ;地上4Gc


;■ 6B ■

[state -1, 215]
type  = ChangeState
value = 215
TriggerAll = !var(59)
TriggerAll = command  = "b"
TriggerAll = command  = "holdfwd"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 400 && MoveContact
Trigger5   = StateNo = 410 && MoveContact

trigger6   = StateNo = 930 && Time >= 8   ;地上D
trigger7   = StateNo = 935                ;地上D終了
trigger8   = StateNo = 940 && Time >= 19  ;地上4D
trigger9   = StateNo = 950 && Time >= 23  ;地上6Gc
trigger10  = StateNo = 960 && Time >= 28  ;地上4Gc


;■ B ■

[state -1, 210]
type  = ChangeState
value = 210
TriggerAll = !var(59)
TriggerAll = command  = "b"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 400 && MoveContact

trigger4   = StateNo = 930 && Time >= 8   ;地上D
trigger5   = StateNo = 935                ;地上D終了
trigger6   = StateNo = 940 && Time >= 19  ;地上4D
trigger7   = StateNo = 950 && Time >= 23  ;地上6Gc
trigger8   = StateNo = 960 && Time >= 28  ;地上4Gc


;■ A ■

[state -1, 200]
type  = ChangeState
value = 200
TriggerAll = !var(59)
TriggerAll = command  = "a"
TriggerAll = statetype != A
Trigger1   = Ctrl || (StateNo = 100 && Animelemtime(2)>0)
trigger2   = StateNo = 400 && MoveContact

trigger3   = StateNo = 930 && Time >= 8   ;地上D
trigger4   = StateNo = 935                ;地上D終了
trigger5   = StateNo = 940 && Time >= 19  ;地上4D
trigger6   = StateNo = 950 && Time >= 23  ;地上6Gc
trigger7   = StateNo = 960 && Time >= 28  ;地上4Gc



;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; Airガードキャンセル
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
[State -1, 970]
type  = ChangeState
value = 970
triggerall = Fvar(20) > 1000
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = statetype = A
trigger1 = stateno = 153
trigger2 = stateno = 154
trigger3 = stateno = 155

[State -1, 970]
type  = ChangeState
value = 970
triggerall = Fvar(20) > 1000
triggerall = command = "z"
triggerall = command = "holdback"
triggerall = statetype = A
trigger1 = stateno = 153
trigger2 = stateno = 154
trigger3 = stateno = 155


;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; ガードキャンセル (地上 / 前)
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
[State -1, 950]
type  = ChangeState
value = 950
triggerall = Fvar(20) >= 1000
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = stateno = 150
trigger2 = stateno = 151
trigger3 = stateno = 152
trigger4 = stateno = 153


;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; ガードキャンセル (地上 / 後)
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
[State -1, 960]
type  = ChangeState
value = 960
triggerall = Fvar(20) >= 1000
triggerall = command = "z"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = stateno = 150
trigger2 = stateno = 151
trigger3 = stateno = 152
trigger4 = stateno = 153




;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; 地上ホーミングダッシュ
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

[State -1, 930]
Type  = ChangeState
Value = 930
TriggerAll = !var(59)
triggerall = (command = "z") && (command != "c")
TriggerAll = (command = "holdfwd") && (Command != "holdup") && (Command != "holddown")
triggerall = statetype != A
trigger1   = ctrl && (StateNo != 920)

[State -1, 920] ;キャンセル版
Type  = ChangeState
Value = 930
TriggerAll = !var(59)
triggerall = (command = "z") && (command != "c")
TriggerAll = (command = "holdfwd") && (Command != "holdup") && (Command != "holddown")
triggerall = statetype != A
TriggerAll = fvar(20) >= 1000 && (StateNo != 920)
Trigger1   = StateNo = 200 && MoveContact
Trigger2   = StateNo = 210 && MoveContact
Trigger3   = StateNo = 215 && MoveContact
Trigger4   = StateNo = 220 && MoveContact
Trigger5   = StateNo = 225 && MoveContact
Trigger6   = StateNo = 400 && MoveContact
Trigger7   = StateNo = 410 && MoveContact
Trigger8   = StateNo = 420 && MoveContact

Trigger9   = StateNo = 301 && MoveContact
Trigger10  = StateNo = 302 && MoveContact
Trigger11  = StateNo = 311 && MoveContact
Trigger12  = StateNo = 312 && MoveContact
Trigger13  = StateNo = 802 && AnimelemTime(18) >= 0

Trigger14  = StateNo = 1100 && MoveContact ;クレド
Trigger15  = StateNo = 1101 && MoveContact
Trigger16  = StateNo = 1102 && MoveContact
Trigger17  = StateNo = 1200 && MoveContact ;グロリア
Trigger18  = StateNo = 1201 && MoveContact
Trigger19  = StateNo = 1202 && MoveContact
Trigger20  = StateNo = 1300 && MoveContact ;キリエ
Trigger21  = StateNo = 1301 && MoveContact
Trigger22  = StateNo = 1302 && MoveContact

Trigger23  = (StateNo = 1400) && (Animelemtime(3) > 0) ;ベネディクトゥス
Trigger24  = (StateNo = 1401) && (Animelemtime(3) > 0)
Trigger25  = StateNo = 2000 && (Animelemtime(18) > 1) ;ランケオラ



;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; 地上バックホーミングダッシュ
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

[State -1, 940]
Type  = ChangeState
Value = 940
TriggerAll = !var(59)
triggerall = (command = "z") && (command != "c")
TriggerAll = (command = "holdback") && (Command != "holdup") && (Command != "holddown")
triggerall = statetype != A
trigger1   = ctrl && (StateNo != 930)

[State -1, 940]
Type  = ChangeState
Value = 940
TriggerAll = !var(59)
triggerall = (command = "z") && (command != "c")
TriggerAll = (command = "holdback") && (Command != "holdup") && (Command != "holddown")
triggerall = statetype != A
TriggerAll = fvar(20) >= 1000 && (StateNo != 930)
Trigger1   = StateNo = 200 && MoveContact
Trigger2   = StateNo = 210 && MoveContact
Trigger3   = StateNo = 215 && MoveContact
Trigger4   = StateNo = 220 && MoveContact
Trigger5   = StateNo = 225 && MoveContact
Trigger6   = StateNo = 400 && MoveContact
Trigger7   = StateNo = 410 && MoveContact
Trigger8   = StateNo = 420 && MoveContact

Trigger9   = StateNo = 301 && MoveContact
Trigger10  = StateNo = 302 && MoveContact
Trigger11  = StateNo = 311 && MoveContact
Trigger12  = StateNo = 312 && MoveContact
Trigger13  = StateNo = 802 && AnimelemTime(18) >= 0

Trigger14  = StateNo = 1100 && MoveContact ;クレド
Trigger15  = StateNo = 1101 && MoveContact
Trigger16  = StateNo = 1102 && MoveContact
Trigger17  = StateNo = 1200 && MoveContact ;グロリア
Trigger18  = StateNo = 1201 && MoveContact
Trigger19  = StateNo = 1202 && MoveContact
Trigger20  = StateNo = 1300 && MoveContact ;キリエ
Trigger21  = StateNo = 1301 && MoveContact
Trigger22  = StateNo = 1302 && MoveContact

Trigger23  = (StateNo = 1400) && (Animelemtime(3) > 0) ;ベネディクトゥス
Trigger24  = (StateNo = 1401) && (Animelemtime(3) > 0)
Trigger25  = StateNo = 2000 && (Animelemtime(18) > 1) ;ランケオラ



;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; レバーホーミング
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

[State -1, 920] ;レバーホーミング
Type       = ChangeState
Value      = 920
TriggerAll = !var(59)
triggerall = statetype = A
triggerAll = (command = "z") && (command != "c")
triggerAll = command = "holdfwd" || command = "holdback" || command = "holdup" || command = "holddown"
TriggerAll = (StateNo != [900,910])
trigger1   = ctrl || (StateNo = 100 && Animelemtime(2)>0)

[State -1, 925] ;キャンセルレバーホーミング
Type       = ChangeState
Value      = 925
TriggerAll = !var(59)
TriggerAll = (command = "z") && (command != "c")
TriggerAll = command = "holdfwd" || command = "holdback" || command = "holdup" || command = "holddown"
TriggerAll = (StateNo != [900,910])
TriggerAll = fvar(20) >= 1000
TriggerAll = statetype = A
Trigger1   = StateNo = 600 && MoveContact
Trigger2   = StateNo = 610 && MoveContact
Trigger3   = StateNo = 615 && MoveContact
Trigger4   = StateNo = 620 && MoveContact
Trigger5   = StateNo = 320 && MoveContact && AnimelemTime(5) > 0
Trigger6   = StateNo = 841 && AnimelemTime(12) >= 0

Trigger7   = StateNo = 1100 && MoveContact ;クレド
Trigger8   = StateNo = 1101 && MoveContact
Trigger9   = StateNo = 1102 && MoveContact
Trigger10  = StateNo = 1150 && MoveContact ;クレド
Trigger11  = StateNo = 1151 && MoveContact
Trigger12  = StateNo = 1152 && MoveContact
Trigger13  = StateNo = 1200 && MoveContact ;グロリア
Trigger14  = StateNo = 1201 && MoveContact
Trigger15  = StateNo = 1202 && MoveContact
Trigger16  = (StateNo = 1450) && (Animelemtime(7) > 0) ;ベネディクトゥス
Trigger17  = (StateNo = 1451) && (Animelemtime(7) > 0)

Trigger18  = StateNo = 2100 && (Movecontact) && (Animelemtime(13) >= 0) ;グラカス
Trigger19  = StateNo = 2110 && (Movecontact) && (Animelemtime(13) >= 0) ;グラカス




;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; ニュートラルホーミング
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

[State -1, 900] ;ニュートラルホーミング
Type       = ChangeState
Value      = 900
TriggerAll = !var(59)
triggerAll = (command = "z") && (command != "c")
triggerAll = command != "holdfwd" && command != "holdback" && command != "holdup" && command != "holddown"
TriggerAll = (StateNo != [900,910])
trigger1   = ctrl || (StateNo = 100 && Animelemtime(2)>0)


[State -1, 900] ;キャンセルホーミング
Type       = ChangeState
Value      = 905
TriggerAll = !var(59)
triggerAll = (command = "z") && (command != "c")
triggerAll = command != "holdfwd" && command != "holdback" && command != "holdup" && command != "holddown"
TriggerAll = (StateNo != [900,910])
TriggerAll = fvar(20) >= 1000
Trigger1   = (StateNo = [200,230]) && MoveContact  ;地上
Trigger2   = (StateNo = [400,420]) && MoveContact  ;しゃがみ
Trigger3   = (StateNo = [600,620]) && MoveContact  ;しゃがみ
Trigger4   = StateNo = 301 && Movecontact && AnimelemTime(3) > 4
Trigger5   = StateNo = 302 && MoveContact && AnimelemTime(3) > 5
Trigger6   = StateNo = 311 && MoveContact && AnimelemTime(4) > 3
Trigger7   = StateNo = 312 && MoveContact && AnimelemTime(4) > 3
Trigger8   = StateNo = 320 && MoveContact && AnimelemTime(5) > 4

Trigger9   = (StateNo = [1100,1152]) && MoveContact
Trigger10  = (StateNo = [1200,1202]) && MoveContact
Trigger11  = (StateNo = [1300,1302]) && MoveContact
Trigger12  = (StateNo = 1400) && (Animelemtime(3) > 0) ;ベネディクトゥス
Trigger13  = (StateNo = 1401) && (Animelemtime(3) > 0)
Trigger13  = (StateNo = 1450) && (Animelemtime(7) > 0) ;ベネディクトゥス
Trigger14  = (StateNo = 1451) && (Animelemtime(7) > 0)

Trigger16  = (StateNo = 802) && AnimelemTime(17) >= 0 ;通常投げ
Trigger17  = (StateNo = 841) && AnimelemTime(12) >= 0 ;空中投げ

Trigger18  = (StateNo = 2000) && (Animelemtime(20) > 1) ;ランケオラ
Trigger19  = (StateNo = 2100) && (Movecontact) && (Animelemtime(13) >= 0) ;グラカス
Trigger20  = (StateNo = 2110) && (Movecontact) && (Animelemtime(13) >= 0) ;グラカス





;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; 地上ジャンプキャンセル
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
[State -1, 40]
Type  = ChangeState
Value = 40
TriggerAll = !var(59)
triggerAll = RoundState = 2
triggerAll = command = "holdup"||command = "up"
triggerAll = command != "holddown"
triggerAll = statetype != A
trigger1   = ctrl
Trigger2   = StateNo = 200 && MoveContact
Trigger3   = StateNo = 210 && MoveContact
Trigger4   = StateNo = 215 && MoveContact
Trigger5   = StateNo = 410 && MoveContact


;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; 空中ジャンプキャンセル
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

[State -1, 46]
Type  = ChangeState
Value = 46
TriggerAll = !var(59)
triggerAll = RoundState = 2
triggerAll = command = "holdup"||command = "up"
triggerAll = statetype = A
TriggerAll = !var(8)
Trigger1   = StateNo = 600 && MoveContact
Trigger2   = StateNo = 610 && MoveContact
Trigger3   = StateNo = 615 && MoveContact


;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; 空中前ダッシュ
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

[State -1, 110]
Type  = ChangeState
Value = 110
TriggerAll = !var(59)
TriggerAll = var(5) > 0 ;空中ダッシュ制御
TriggerAll = Command = "FF"
TriggerAll = StateType = A
triggerAll = pos y <= -40
Trigger1   = Ctrl

;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; 空中後ダッシュ
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

[State -1, 115]
Type  = ChangeState
Value = 115
TriggerAll = !var(59)
TriggerAll = var(5) > 0 ;空中ダッシュ制御
TriggerAll = Command = "BB"
TriggerAll = StateType = A
triggerAll = pos y <= -40
Trigger1   = Ctrl

;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
; 地上ダッシュ
;−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−

[State -1, 100]
Type  = ChangeState
Value = 100
TriggerAll = !var(59)
TriggerAll = Command = "FF"
TriggerAll = StateType != A
TriggerAll = stateno != 100
Trigger1   = Ctrl


[State -1, 105]
Type  = ChangeState
Value = 105
TriggerAll = !var(59)
TriggerAll = Command = "BB"
TriggerAll = StateType != A
TriggerAll = stateno != 105
Trigger1   = Ctrl
